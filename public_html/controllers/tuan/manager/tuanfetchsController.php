<?php
class tuanfetchsController extends abstractController{
	public function indexAction(){
		global $dataFlag;
		$voLists = array();
		if($_POST){
			$where = $this->getWhere(AddSlash($_POST['theform']));
		}else{
			$where = '1=1';
		}
		$sql = "SELECT f.*,s.sitename,s.siteurl,a.apiname FROM ".DBPREFIX."tuan_fetchs f LEFT JOIN ".DBPREFIX."tuan_sites s ON s.sid=f.siteid LEFT JOIN ".DBPREFIX."tuan_apis a ON f.apiid=a.aid WHERE ".$where." ORDER BY f.fid ASC";
		$ct = "SELECT count(*) AS ct FROM ".DBPREFIX."tuan_fetchs f LEFT JOIN ".DBPREFIX."tuan_sites s ON s.sid=f.siteid LEFT JOIN ".DBPREFIX."tuan_apis a ON f.apiid=a.aid WHERE ".$where;
		if($recordCount = $this->objC -> GetOne($ct)){
			if($recordCount){
				$objP = new Pager($recordCount);
				$arrLimit = $objP -> GetLimit('');
				$result = $this->objC -> SelectLimit($sql,$arrLimit[1],$arrLimit[0]);
				while($arrRow = $this->objC->FetchRow($result)){
					$arrRow['apifetch'] = $dataFlag[$arrRow['apifetch']];
					$voLists[] = $arrRow;
				}
				$this->objS -> assign("pager",$objP->ShowMain().$objP->ShowNum().$objP->showGoTo());
				$this->objS -> assign("voLists",$voLists);
			}
		}
		$this->objS->assign('statusArr',$dataFlag);
		$this->objS->display('tuan/manager/tuanfetchs.tpl');
	}

	public function editAction(){
		$result = array();
		$sql = '';
		$fid = '';

		if(isset($_GET) && !empty($_GET['fid']))
			$fid = (int)$_GET['fid'];

		if(isset($_POST) && isset($_POST['theform'])){
			// 输入验证
			$valid = array(
				'apiurl'=>array('required','url','max'=>100,),
			);
			if(!$this->validate($_POST['theform'],$valid)){
				$validResult = $this->getValidResult();
				$this->objS -> assign("validResult",$validResult);
				$this->objS->assign("operateFlag",-1);
			}else{
				// 更新或插入操作
				$param = AddSlash($_POST['theform']);
				if($param['citymatch']){
					$param['citymatch'] = $param['citymatch'];
					$tmp_arr = explode(',',$param['citymatch']);
					foreach ($tmp_arr as $tmp) {
						if($tmp){
							$tmp2_arr = explode('=',trim($tmp),2);
							$citymatch_array[$tmp2_arr[0]] = $tmp2_arr[1];
						}
					}
					$param['citymatch'] = serialize($citymatch_array);
				}

				$param = $this->getParam($param);

				if($fid){
					$sql = "UPDATE ".DBPREFIX."tuan_fetchs SET {$param} WHERE fid=".$fid;
					$editrs = $this->objC->RunQuery($sql);
					if(!$editrs){
						AlertMsg('编辑异常','-1');
					}else{
						$this->objS->assign("operateFlag",1);
					}
				}else {
					$sql = "INSERT INTO ".DBPREFIX."tuan_fetchs SET {$param}";
					$editrs = $this->objC->RunQuery($sql);
					if(!$editrs){
						AlertMsg('添加异常','-1');
					}else{
						AlertMsg('添加成功','?c=tuanfetchs');
					}
				}
			}
		}

		if($fid){
			$result = $this->objC->GetRow("SELECT * FROM ".DBPREFIX."tuan_fetchs WHERE fid=".$fid);
			if($result['citymatch']){
				$tmp_citymatch = '';
				$tmp = unserialize($result['citymatch']);
				foreach ($tmp as $key_c => $value_c) {
					$tmp_citymatch .= $key_c."=".$value_c.",\r\n";
				}
				$result['citymatch'] = $tmp_citymatch;
			}
			$this->objS -> assign("arrFetch",$result);
		}

		$citylist = array();
		$sqlc = "SELECT cid,city FROM ".DBPREFIX."tuan_citys WHERE status=1 ORDER BY sortorder ASC";
		$tmp_citys = $this->objC->GetAll($sqlc);
		foreach ($tmp_citys as $row) {
			$citylist[] = $row['city']."=".$row['city'];
		}
		$this->objS->assign('citylist',$citylist);

		global $dataFlag;
		$this->objS->assign('statusArr',$dataFlag);

		$sqls = "SELECT sid,sitename FROM ".DBPREFIX."tuan_sites ORDER BY sortorder ASC";
		$tmp_sites = $this->objC->GetAll($sqls);
		foreach ($tmp_sites as $row) {
			$arrSites[$row['sid']] = $row['sitename'];
		}
		$this->objS -> assign("arrSites",$arrSites);

		$sqla = "SELECT aid,apiname FROM ".DBPREFIX."tuan_apis";
		$tmp_apis = $this->objC->GetAll($sqla);
		foreach ($tmp_apis as $row) {
			$arrAPIs[$row['aid']] = $row['apiname'];
		}
		$this->objS -> assign("arrAPIs",$arrAPIs);
		$this->objS->display('tuan/manager/tuanfetchsedit.tpl');
	}

	public function deleteAction(){
		if(isset($_GET) && !empty($_GET['fid']))
			$fid = (int)$_GET['fid'];
		$deleters = $this->objC->RunQuery("DELETE FROM ".DBPREFIX."tuan_fetchs WHERE fid={$fid} LIMIT 1");
		if(!$deleters){
			AlertMsg('删除异常',-1);
		}else{
			$this->indexAction();
		}
	}

	public function closeAction(){
		if(isset($_GET) && !empty($_GET['fid']))
			$fid = (int)$_GET['fid'];
		$updates = $this->objC->RunQuery("UPDATE ".DBPREFIX."tuan_fetchs SET apifetch=!apifetch WHERE fid={$fid}");
		if(!$updates){
			AlertMsg('修改异常',-1);
		}else{
			$this->indexAction();
		}
	}
}