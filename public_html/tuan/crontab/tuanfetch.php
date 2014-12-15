<?php
$begin = time();
$file_path = str_replace("\\",'/',dirname(__FILE__));
define('SITE',substr($file_path,0,strpos($file_path,'/tuan/crontab')).'/');
include(SITE.'config.php');
ini_set('display_errors', 'off');
ini_set('max_execution_time', 600);
ini_set('date.timezone', 'Asia/Shanghai');

$conn = @mysql_connect(DBHOST,DBUSER,DBPWD) or die("数据库连接失败！");
@mysql_select_db(DBNAME,$conn) or die("数据库不存在！");
mysql_query("set names gbk");


$sql = "SELECT * FROM ".DBPREFIX."tuan_fetchs f LEFT JOIN ".DBPREFIX."tuan_sites s ON f.siteid=s.sid LEFT JOIN ".DBPREFIX."tuan_apis a ON f.apiid=a.aid WHERE f.apifetch=1 AND f.apiurl!='' AND f.apiid>0 ORDER BY s.`sortorder` ASC";
$r = mysql_query($sql);
while($row = mysql_fetch_array($r)){
	$tmp_sites[]=$row;
}
foreach($tmp_sites as $row){
	if($row['sid']){
		mysql_query("DELETE FROM ".DBPREFIX."tuan_goods WHERE siteid=".$row['sid']);
	}
}
if(!$tmp_sites) exit();

$site_lists = get_site_list($tmp_sites);
unset($tmp_sites,$file_path,$r,$sql,$row);

foreach ($site_lists as $row) {
	//echo $row['apiurl'];
	//站点信息
	$cityCheckArr = array();
	$insertSql = '';
	$groupinfo_array = array();
	$groupinfo_array['sitename']=$row['sitename'];
	$groupinfo_array['siteid']=$row['sid'];
	$groupinfo_array['citymatch']=$row['citymatch'];
	$groupinfo_array['status']=1;
	$groupinfo_array['preurl'] = $row['preurl'];

	$cityname=isset($row['cityname']) ? $row['cityname'] : '';
	$row['apiurl'] = htmlspecialchars_decode($row['apiurl']);
	//API模板信息
	$tgroupname=$row['groupname'];
	$tgrouptag=$row['grouptag'];
	if($tgrouptag==""||$tgrouptag=="unknown"){//跳过无效模板
		continue;
	}
	$tprice=$row['price'];
	$tgroupurl=$row['linkurl'];
	$tnewprice=$row['newprice'];
	$tdiscount=$row['discount'];
	$tstarttime=$row['starttime'];
	$tendtime=$row['endtime'];
	$taddress=$row['address'];
	$tpersonnum=$row['personnum'];
	$tpicture=$row['picture'];
	$tdetail=$row['detail'];
	$tcity=$row['city'];
	$torder = $row['sortorder']+100;
	//$txpath = $row['xpath'];
	//if(strpos($row['apiurl'],"http://")===0)
	{
//simpleXML
			$ctx = stream_context_create(array('http'=>array('timeout'=>100)));
			$content = file_get_contents($row['apiurl'],0,$ctx);
			if($content)
				$xml = simplexml_load_string($content);
			else{
				echo "api ".$row['apiurl']." error<br/>";continue;
			}
			unset($content);
			if(!$xml)continue;
			if($row['apiurl'] == "http://t.58.com/api/products"){
				$cityArr = $xml->city;
				foreach ($cityArr as $citys){
					$cityname = $citys->name;
					$products = $citys->product;
					foreach ($products as $product){
						$count = count($product);
						if($count){
							$groupinfo_array['title']= $product->$tgroupname;
							$groupinfo_array['price']= $product->$tprice;
							$groupinfo_array['newprice']= $product->$tnewprice;
							$groupinfo_array['goodurl']= $product->$tgroupurl;
							$groupinfo_array['discount']= $product->$tdiscount;
							$groupinfo_array['starttime']= $product->$tstarttime;
							$groupinfo_array['starttime']=dealstarttime($groupinfo_array['starttime']);
							$groupinfo_array['endtime']= $product->$tendtime;
							$groupinfo_array['endtime']=dealendtime($groupinfo_array['endtime']);
							$groupinfo_array['personnum']= $product->$tpersonnum;
							$groupinfo_array['address']= $product->$taddress;
							$groupinfo_array['imageurl']= $product->$tpicture;
							$groupinfo_array['detail']= $product->$tdetail;
							$groupinfo_array['cityname']= $cityname;
							$sql = insertintogoods($groupinfo_array);
							if($sql)
									$insertSql .= $sql;							
						}
					}
				}			
			}else{
				//echo "------------fetch count: ".$row['apiurl']." count:".$grouptag_array->length." \r\n";			
				$count = count($xml->$tgrouptag);
				$stotal += $count;
				$tgroupnameArr = $xml->xpath('//'.$tgroupname);
				$tpriceArr = $xml->xpath('//'.$tprice);
				$tnewpriceArr = $xml->xpath('//'.$tnewprice);
				$tgroupurlArr = $xml->xpath('//'.$tgroupurl);
				$tdiscountArr = $xml->xpath('//'.$tdiscount);
				$tstarttimeArr = $xml->xpath('//'.$tstarttime);
				$tendtimeArr = $xml->xpath('//'.$tendtime);
				$tpersonnumArr = $xml->xpath('//'.$tpersonnum);
				$taddressArr = $xml->xpath('//'.$taddress);
				$tpictureArr = $xml->xpath('//'.$tpicture);
				$tdetailArr = $xml->xpath('//'.$tdetail);
				$tcityArr = $xml->xpath('//'.$tcity);
				for($i=0;$i<$count;$i++){
					$groupinfo_array['title']= $tgroupnameArr[$i];
					$groupinfo_array['price']= $tpriceArr[$i];
					$groupinfo_array['newprice']= $tnewpriceArr[$i];
					$groupinfo_array['goodurl']= $tgroupurlArr[$i];
					$groupinfo_array['discount']= $tdiscountArr[$i];
					$groupinfo_array['starttime']= $tstarttimeArr[$i];
					$groupinfo_array['starttime']=dealstarttime($groupinfo_array['starttime']);
					$groupinfo_array['endtime']= $tendtimeArr[$i];
					$groupinfo_array['endtime']=dealendtime($groupinfo_array['endtime']);
					$groupinfo_array['personnum']= $tpersonnumArr[$i];
					$groupinfo_array['address']= $taddressArr[$i];
					$groupinfo_array['imageurl']= $tpictureArr[$i];
					$groupinfo_array['detail']= $tdetailArr[$i];
					if(!$cityname){
						$fcity = $tcityArr[$i];
						$fcity2 = false;
						if($groupinfo_array['citymatch']) $fcity2 = array_search($fcity,$groupinfo_array['citymatch']);
						$groupinfo_array['cityname']= (!($fcity2) ? $fcity : $fcity2);
					}else {
						$groupinfo_array['cityname']= $cityname;
					}
					$sql = insertintogoods($groupinfo_array);
					if($sql)
						$insertSql .= $sql;
				}
			}
	}
	// 先插一批
	if($insertSql){
		$sql = "INSERT INTO ".DBPREFIX."tuan_goods(`title`,`price`,`newprice`,`goodurl`,`discount`,`starttime`,`endtime`,`personnum`,`siteid`,`sitename`,`address`,`imageurl`,`detail`,`status`,`cityname`,`gettime`,`sortorder`) VALUES ".substr($insertSql,1);
		@mysql_query($sql);
	}
	unset($cityCheckArr,$insertSql,$groupinfo_array,$sql);
	//$cityCheckArr = array();
}

function get_site_list($list){
	if(!$list) return array();
	$slist = array();
	foreach ($list as $srow) {
		if($srow['citymatch']) $srow['citymatch'] = unserialize($srow['citymatch']);
		if(strpos($srow['apiurl'],'{$city}') !== false){ //分城市采集
			if($srow['citymatch']){
				foreach ($srow['citymatch'] as $c_key => $c_value) {
					$cityrow = $srow;
					$cityrow['apiurl'] = str_replace('{$city}',$c_value,$cityrow['apiurl']);
					if(CHARSET=='gbk')
						$cityrow['cityname'] = iconv('gbk','utf-8//IGNORE',$c_key);
					else
						$cityrow['cityname'] = $c_key;
					$slist[] = $cityrow;
				}
			}
		}else {
			$slist[] = $srow;
		}
	}
	return $slist;
}

function insertintogoods($groupinfo_array){
	//insert good
		global $torder;
		global $firstInsert;
		global $cityCheckArr;
		$sql = '';
	
		$groupinfo_array['price']=str_replace("&yen;","",$groupinfo_array['price']);
		$groupinfo_array['price']=str_replace("￥","",$groupinfo_array['price']);
		$groupinfo_array['price']=str_replace(",","",$groupinfo_array['price']);
		$groupinfo_array['price']=str_replace("￥","",$groupinfo_array['price']);
		$groupinfo_array['newprice']=str_replace("&yen;","",$groupinfo_array['newprice']);
		$groupinfo_array['newprice']=str_replace("￥","",$groupinfo_array['newprice']);
		$groupinfo_array['newprice']=str_replace(",","",$groupinfo_array['newprice']);
		$groupinfo_array['newprice']=str_replace("￥","",$groupinfo_array['newprice']);
		if(CHARSET=='gbk'){
		$groupinfo_array['title']=addslashes(iconv("utf-8","gbk//IGNORE",$groupinfo_array['title']));
		$groupinfo_array['detail']=addslashes(iconv("utf-8","gbk//IGNORE",$groupinfo_array['detail']));
		$groupinfo_array['discount']=addslashes(iconv("utf-8","gbk//IGNORE",$groupinfo_array['discount']));
		}else{
		$groupinfo_array['title']=addslashes($groupinfo_array['title']);
		$groupinfo_array['detail']=addslashes($groupinfo_array['detail']);
		$groupinfo_array['discount']=addslashes($groupinfo_array['discount']);
		}
		$groupinfo_array['discount']=str_replace("折","",$groupinfo_array['discount']);
		if(empty($groupinfo_array['discount'])){
			if(!empty($groupinfo_array['price']) && $groupinfo_array['price']>0)
				$groupinfo_array['discount']=10*$groupinfo_array['newprice']/$groupinfo_array['price'];
			else
				$groupinfo_array['discount']=0;
		}
		if(empty($groupinfo_array['cityname'])){
			$groupinfo_array['cityname'] ='全国';
		}else{
			if(CHARSET=='gbk')
				$groupinfo_array['cityname']=addslashes(iconv("utf-8","gbk//IGNORE",$groupinfo_array['cityname']));
			else
				$groupinfo_array['cityname']=addslashes($groupinfo_array['cityname']);
		}
		$groupinfo_array['sitename']=$groupinfo_array['sitename'];
		$groupinfo_array['siteid']=$groupinfo_array['siteid'];
		$groupinfo_array['gettime']=time();

		if(isset($cityCheckArr[$groupinfo_array['cityname']])){
			$cityCheckArr[$groupinfo_array['cityname']]+=100;
			if($groupinfo_array['cityname'] == '全国')
				$groupinfo_array['sortorder']=$cityCheckArr[$groupinfo_array['cityname']]+1000;
			else
				$groupinfo_array['sortorder']=$cityCheckArr[$groupinfo_array['cityname']];
		}else{
			$cityCheckArr[$groupinfo_array['cityname']] = $torder;
			if($groupinfo_array['cityname'] == '全国')
				$groupinfo_array['sortorder']=$cityCheckArr[$groupinfo_array['cityname']]-100;
			else
				$groupinfo_array['sortorder']=$cityCheckArr[$groupinfo_array['cityname']];
		}


		if(!empty($groupinfo_array['preurl']))
			$groupinfo_array['goodurl'] = $groupinfo_array['preurl'].$groupinfo_array['goodurl'];
		$groupinfo_array['personnum'] = isset($groupinfo_array['personnum']) ? $groupinfo_array['personnum'] : 0;
		$sql = ",('".$groupinfo_array['title']."','".$groupinfo_array['price']."','".$groupinfo_array['newprice']."','".$groupinfo_array['goodurl']."','".$groupinfo_array['discount']."','".$groupinfo_array['starttime']."','".$groupinfo_array['endtime']."','".$groupinfo_array['personnum']."','".$groupinfo_array['siteid']."','".$groupinfo_array['sitename']."','".$groupinfo_array['address']."','".$groupinfo_array['imageurl']."','".$groupinfo_array['detail']."','".$groupinfo_array['status']."','".$groupinfo_array['cityname']."','".$groupinfo_array['gettime']."','".$groupinfo_array['sortorder']."')";

	return $sql;
}
function dealstarttime($starttime){
	if(strtotime($starttime))
		$starttime=strtotime($starttime);
	if(is_numeric($starttime))
	{
		if($starttime>1200000000000){
				$starttime=$starttime/1000;
		}
		else if($starttime<1200000000&&$starttime>8640000){
			$starttime=time()+$starttime/1000;
		}
		else if($starttime<8640000)
		    $starttime=time()+$starttime;

	}
	else
	{
		$starttime=date("Ymd",time())." 00:00:00";//若未采集到则默认是当天开始
		$starttime=strtotime($starttime);
	}
	return $starttime;
}

function dealendtime($endtime){
	if(is_numeric($endtime)){
		if(strlen($endtime.'')<=10)
			return $endtime;
	}
	if(strtotime($endtime))
		$endtime=strtotime($endtime);
	if(is_numeric($endtime))
	{
		if($endtime>1200000000000){
				$endtime=$endtime/1000;
		}
		else if($endtime<1200000000&&$endtime>8640000){
			$endtime=time()+$endtime/1000;
		}
		else if($endtime<8640000)
		    $endtime=time()+$endtime;

	}
	else
	{
		$endtime=date("Ymd",time())." 23:59:59";//若未采集到，则默认是当天结束
		$endtime=strtotime($endtime);
	}
	return $endtime;
}
mysql_query("OPTIMIZE TABLE ".DBPREFIX."tuan_goods");
echo '总耗时：'.(time()-$begin).'<br/>请检查error的api地址，是不是链接错误，无法打开！';
?>