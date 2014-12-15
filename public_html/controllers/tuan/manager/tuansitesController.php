<?php
class tuansitesController extends abstractController{
	public function indexAction(){
		global $dataFlag;
		$voLists = array();
		if($_POST){
			$this->setWhere(array('s.sitename'=>'A','s.url'=>'A'));
			$where = $this->getWhere(AddSlash($_POST['theform']));
		}else{
			$where = '1=1';
		}
		$sql = "SELECT s.*,c.city FROM ".DBPREFIX."tuan_sites s LEFT JOIN ".DBPREFIX."tuan_citys c ON s.cityid=c.cid WHERE ".$where." ORDER BY s.sortorder ASC";
		$ct = "SELECT count(*) AS ct FROM ".DBPREFIX."tuan_sites s LEFT JOIN ".DBPREFIX."tuan_citys c ON s.cityid=c.cid WHERE ".$where;

		if($recordCount = $this->objC -> GetOne($ct)){
			if($recordCount){
				$objP = new Pager($recordCount);
				$arrLimit = $objP -> GetLimit('');
				$result = $this->objC -> SelectLimit($sql,$arrLimit[1],$arrLimit[0]);
				while($arrRow = $this->objC->FetchRow($result)){
					$arrRow['commend'] = $dataFlag[$arrRow['commend']];
					$voLists[] = $arrRow;
				}
				$this->objS -> assign("pager",$objP->ShowMain().$objP->ShowNum().$objP->showGoTo());
				$this->objS -> assign("voLists",$voLists);
			}
		}
		$this->objS->assign('statusArr',$dataFlag);
		$this->objS->display('tuan/manager/tuansites.tpl');
	}

	public function editAction(){
		$result = array();
		$sql = '';
		$sid = '';

		if(isset($_GET) && !empty($_GET['sid']))
			$sid = (int)$_GET['sid'];

		if(isset($_POST) && isset($_POST['theform'])){
			// 输入验证
			$valid = array(
				'sitename'=>array('required','max'=>50,'min'=>2),
				'siteurl'=>array('required','url','max'=>100,),
				'sortorder'=>array('required','int')
			);
			if(!$this->validate($_POST['theform'],$valid)){
				$validResult = $this->getValidResult();
				$this->objS -> assign("validResult",$validResult);
				$this->objS->assign("operateFlag",-1);
			}else{
				// 更新或插入操作
				$param = AddSlash($_POST['theform']);
				$param = $this->getParam($param);
				if($sid){
					$sql = "UPDATE ".DBPREFIX."tuan_sites SET {$param} WHERE sid=".$sid;
					$editrs = $this->objC->RunQuery($sql);
					if(!$editrs){
						AlertMsg('编辑异常','-1');
					}else{
						$this->objS->assign("operateFlag",1);
					}
				}else {
					$sql = "INSERT INTO ".DBPREFIX."tuan_sites SET {$param}";
					$editrs = $this->objC->RunQuery($sql);
					if(!$editrs){
						AlertMsg('添加异常','-1');
					}else{
						AlertMsg('添加成功','?c=tuansites');
					}
				}
			}
		}

		if($sid){
			$result = $this->objC->GetRow("SELECT * FROM ".DBPREFIX."tuan_sites WHERE sid=".$sid);
			$this->objS -> assign("arrSite",$result);
		}

		global $dataFlag;
		$this->objS->assign('statusArr',$dataFlag);

		$sqlc = "SELECT cid,city FROM ".DBPREFIX."tuan_citys WHERE status=1 ORDER BY sortorder ASC";
		$tmp_citys = $this->objC->GetAll($sqlc);
		foreach ($tmp_citys as $row) {
			$arrCitys[$row['cid']] = $row['city'];
		}
		$this->objS -> assign("arrCitys",$arrCitys);

		$this->objS->display('tuan/manager/tuansitesedit.tpl');
	}

	public function deleteAction(){
		if(isset($_GET) && !empty($_GET['sid']))
			$sid = (int)$_GET['sid'];
		$deleters = $this->objC->RunQuery("DELETE FROM ".DBPREFIX."tuan_sites WHERE sid={$sid} LIMIT 1");
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
			$sql = '';
			switch($optype){
				case 'sortorder':
					$orders = explode(',',$param['orders']);
					$ids = explode(',',$param['ids']);
					foreach($ids as $key => $value){
						$sql .= ";UPDATE ".DBPREFIX."tuan_sites SET sortorder='".$orders[$key]."' WHERE sid={$value}";
					}
				break;
				default :

			}


			if($optype != 'sortorder'){
				$this->objC->RunQuery($sql);
			}else{
				$sql = substr($sql,1);
				$sqls = explode(';',$sql);
				foreach($sqls as $value){
					$this->objC->RunQuery($value);
				}
			}
		}
		AlertMsg('完成操作','?c=tuansites');
	}
}