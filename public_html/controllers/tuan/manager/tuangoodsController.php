<?php
class tuangoodsController extends abstractController{
	public function indexAction(){
		$voLists = $arrTypes = $arrCitys = array();

		$sqls = "SELECT sid,sitename FROM ".DBPREFIX."tuan_sites ORDER BY sortorder ASC";
		$tmp_citys = $this->objC->GetAll($sqls);
		foreach ($tmp_citys as $row) {
			$arrSites[$row['sid']] = $row['sitename'];
		}
		$this->objS -> assign("arrSites",$arrSites);

		$sqlt = "SELECT tid,typename FROM ".DBPREFIX."tuan_types ORDER BY sortorder ASC";
		$tmp_types = $this->objC->GetAll($sqlt);
		foreach ($tmp_types as $row) {
			$arrTypes[$row['tid']] = $row['typename'];
		}
		$this->objS -> assign("arrTypes",$arrTypes);

/*		$sqlc = "SELECT cid,city FROM ".DBPREFIX."tuan_citys WHERE status=1 ORDER BY sortorder ASC";
		$tmp_citys = $this->objC->GetAll($sqlc);
		foreach ($tmp_citys as $row) {
			$arrCitys[$row['cid']] = $row['city'];
		}
		$this->objS -> assign("arrCitys",$arrCitys);*/

		global $dataFlag;
		$this->objS->assign('statusArr',$dataFlag);

		if($_POST){
			$this->setWhere(array('title'=>'A'));
			$where = $this->getWhere(AddSlash($_POST['theform']));
		}else{
			$where = '1=1';
		}
		$sql = "SELECT * FROM ".DBPREFIX."tuan_goods WHERE ".$where." ORDER BY sortorder,gid ASC";
		$ct = "SELECT count(*) AS ct FROM ".DBPREFIX."tuan_goods WHERE ".$where;
		if($recordCount = $this->objC -> GetOne($ct)){
			if($recordCount){
				$objP = new Pager($recordCount);
				$arrLimit = $objP -> GetLimit('');
				$result = $this->objC -> SelectLimit($sql,$arrLimit[1],$arrLimit[0]);
				while($arrRow = $this->objC->FetchRow($result)){
					$voLists[] = $arrRow;
				}
				$this->objS -> assign("pager",$objP->ShowMain().$objP->ShowNum().$objP->showGoTo());
				$this->objS -> assign("voLists",$voLists);
			}
		}
		$this->objS->display('tuan/manager/tuangoods.tpl');
	}

	public function editAction(){
		$arrTypes = $arrCitys = array();

		$sqls = "SELECT sid,sitename FROM ".DBPREFIX."tuan_sites ORDER BY sortorder ASC";
		$tmp_citys = $this->objC->GetAll($sqls);
		foreach ($tmp_citys as $row) {
			$arrSites[$row['sid']] = $row['sitename'];
		}
		$this->objS -> assign("arrSites",$arrSites);

		$sqlc = "SELECT cid,city FROM ".DBPREFIX."tuan_citys WHERE status=1 ORDER BY sortorder ASC";
		$tmp_citys = $this->objC->GetAll($sqlc);
		foreach ($tmp_citys as $row) {
			$arrCitys[$row['city']] = $row['city'];
		}
		$this->objS -> assign("arrCitys",$arrCitys);

		$result = array();
		$sql = '';
		$gid = '';

		if(isset($_GET) && !empty($_GET['gid']))
			$gid = (int)$_GET['gid'];

		if(isset($_POST) && isset($_POST['theform'])){
			// 输入验证
			$valid = array(
				'title'=>array('required','max'=>200,'min'=>2),
				'goodurl'=>array('required','url'),
				'imageurl'=>array('required','url'),
				'personnum'=>array('required','int'),
				'sortorder'=>array('required','int')
			);
			if(!$this->validate($_POST['theform'],$valid)){
				$validResult = $this->getValidResult();
				$this->objS -> assign("validResult",$validResult);
			}else{
				// 更新或插入操作
				$_POST['theform']['sitename'] = $arrSites[$_POST['theform']['siteid']];
				$_POST['theform']['starttime'] = strtotime($_POST['theform']['starttime']);
				$_POST['theform']['endtime'] = strtotime($_POST['theform']['endtime']);
				$param = AddSlash($_POST['theform']);
				$param = $this->getParam($param);
				if($gid){
					$sql = "UPDATE ".DBPREFIX."tuan_goods SET {$param} WHERE gid=".$gid;
					$editrs = $this->objC->RunQuery($sql);
					if(!$editrs){
						AlertMsg('编辑异常',-1);
					}else{
						$this->objS->assign("operateFlag","true");
					}
				}else {
					$sql = "INSERT INTO ".DBPREFIX."tuan_goods SET {$param}";
					$editrs = $this->objC->RunQuery($sql);
					if(!$editrs){
						AlertMsg('添加异常',-1);
					}else{
						AlertMsg('添加成功','?c=tuangoods');
					}
				}
			}
		}

		if($gid){
			$result = $this->objC->GetRow("SELECT * FROM ".DBPREFIX."tuan_goods WHERE gid=".$gid);
			$this->objS -> assign("arrGood",$result);
		}

		$sqlt = "SELECT tid,typename FROM ".DBPREFIX."tuan_types ORDER BY sortorder ASC";
		$tmp_types = $this->objC->GetAll($sqlt);
		foreach ($tmp_types as $row) {
			$arrTypes[$row['tid']] = $row['typename'];
		}
		$this->objS -> assign("arrTypes",$arrTypes);

		global $dataFlag;
		$this->objS->assign('statusArr',$dataFlag);
		$this->objS->display('tuan/manager/tuangoodsedit.tpl');
	}

	public function deleteAction(){
		if(isset($_GET) && !empty($_GET['gid']))
			$gid = (int)$_GET['gid'];
		$deleters = $this->objC->RunQuery("DELETE FROM ".DBPREFIX."tuan_goods WHERE gid={$gid} LIMIT 1");
		if(!$deleters){
			AlertMsg('删除异常',-1);
		}else{
			$this->indexAction();
		}
	}

	public function doAction(){
		if(!empty($_POST)){
			$optype = $_POST['optype'];
			$param = addSlash($_POST);
			if(in_array($optype,array('sortorder','typeid','status'))){
				$orders = explode(',',$param['orders']);
				$ids = explode(',',$param['ids']);
				foreach($ids as $key => $value){
					$sql = "UPDATE ".DBPREFIX."tuan_goods SET `".$optype."`='".$orders[$key]."' WHERE gid={$value}";
					$this->objC->RunQuery($sql);
				}
			}else {
				AlertMsg('操作异常',-1);
			}
		}
		AlertMsg('完成操作','?c=tuangoods');
	}

	public function deldeadAction(){
		$deleters = $this->objC->RunQuery("DELETE FROM ".DBPREFIX."tuan_goods WHERE endtime<=".time());
		if(!$deleters){
			AlertMsg('删除异常',-1);
		}else{
			$this->indexAction();
		}
	}
}