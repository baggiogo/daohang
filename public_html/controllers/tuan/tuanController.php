<?php
class tuanController extends abstractController{
	// 首页
	public function indexAction(){
		$sqls = "SELECT distinct sid,sitename,siteurl,wordcolor FROM ".DBPREFIX."tuan_sites WHERE commend>=1 GROUP BY sitename ORDER BY sortorder ASC";
		$arrSites = $this->objC->GetAll($sqls);
		$this->objS -> assign("arrSites",$arrSites);
		$this->objS->display('tuan/index_tuan.tpl');
	}

	public function listAction(){
		$arrPrices = array(''=>'所有价格',1=>'50元以下',2=>'50-100元',3=>'100-200元',4=>'200-300元',5=>'300元以上');
		$this->objS -> assign("arrPrices",$arrPrices);

		$sqlt = "SELECT tid,typename FROM ".DBPREFIX."tuan_types ORDER BY sortorder ASC";
		$arrTypes = $this->objC->GetAll($sqlt);
		$this->objS -> assign("arrTypes",$arrTypes);

		$sqlc = "SELECT cid,city FROM ".DBPREFIX."tuan_citys WHERE status=1 ORDER BY sortorder ASC";
		$arrCitys = $this->objC->GetAll($sqlc);
		$this->objS -> assign("arrCitys",$arrCitys);

		$where = " endtime >= ".time()." AND status = 1 ";
		$price = isset($_GET['price']) ? $_GET['price'] : 0;
		if($price == 1){
			$where .= ' AND newprice < 50';
		}elseif ($price == 2){
			$where .= ' AND newprice >= 50 AND newprice <= 100';
		}elseif ($price == 3){
			$where .= ' AND newprice >= 100 AND newprice <= 200';
		}elseif ($price == 4){
			$where .= ' AND newprice >= 200 AND newprice <= 300';
		}elseif ($price == 5){
			$where .= ' AND newprice >= 300';
		}

		if(isset($_GET['type']) && $_GET['type']){
			$where .= ' AND typeid = '.$_GET['type'];
		}
		
		if(isset($_GET['tags']) && $_GET['tags']){
			$where .= " AND title like '%".unescape($_GET['tags'])."%'";
		}

		if(!isset($_GET['city'])) {
			if(isset($_COOKIE['tuancity']) && $_COOKIE['tuancity']){
				$_GET['city'] = unescape($_COOKIE['tuancity']);
			}else {
				$ip = GetIP();
				$city ='';
				$url = "http://int.dpool.sina.com.cn/iplookup/iplookup.php?ip=".$ip;
				$rs = file_get_contents($url);
				$z_arr = explode('	',$rs);
				if(count($z_arr)>=5) $addr = $z_arr[4].$z_arr[5];
				else $addr = '本机地址';

				foreach ($arrCitys as $c) {
					if(strpos($addr,$c['city']) !== false){
						$_GET['city'] = $c['city'];
						setcookie("tuancity",$c['city'],time()+30*86400, '/', WEB_HOST);
						break;
					}
				}
			}
		}
		
		

		$quanguo = '全国';
		if(isset($_GET['city']) && $_GET['city']){
			$where .= ' AND (cityname = "'.trim($_GET['city']).'" or cityname="'.$quanguo.'")';
		}else {
			$_GET['city'] = $quanguo;
			$where .= ' AND cityname="'.$quanguo.'"';
		}

		$sql = "SELECT gid,title,goodurl,price,newprice,discount,personnum,imageurl,starttime,endtime,sitename,cityname FROM ".DBPREFIX."tuan_goods WHERE ".$where." ORDER BY sortorder ASC,(case cityname when '".$quanguo."' then 1 else 0 end),newprice ASC";
		$ct = "SELECT count(*) AS ct FROM ".DBPREFIX."tuan_goods WHERE ".$where;
		if($recordCount = $this->objC -> GetOne($ct)){
			if($recordCount){
				$objP = new Pager($recordCount,30,5);
				$arrLimit = $objP -> GetLimit('');
				$result = $this->objC -> SelectLimit($sql,$arrLimit[1],$arrLimit[0]);
				while($arrRow = $this->objC->FetchRow($result)){
					$voLists[] = $arrRow;
				}

				$caller = 'http://'.SITE_DOMAIN.'/tuan/index.php';
				$this->objS -> assign("pager",$objP->showIndexStyle($caller));
				$this->objS -> assign("voLists",$voLists);
			}
		}

		$this->objS->display('tuan/index_tuanlist.tpl');
	}
}