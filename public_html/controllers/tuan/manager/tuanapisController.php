<?php
class tuanapisController extends abstractController{
	public function indexAction(){
		$voLists = array();
		if($_POST){
			$this->setWhere(array('apiname'=>'A'));
			$where = $this->getWhere(AddSlash($_POST['theform']));
		}else{
			$where = '1=1';
		}
		$sql = "SELECT * FROM ".DBPREFIX."tuan_apis WHERE ".$where;
		$ct = "SELECT count(*) AS ct FROM ".DBPREFIX."tuan_apis WHERE ".$where;
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
		$this->objS->display('tuan/manager/tuanapis.tpl');
	}

	public function editAction(){
		$result = array();
		$sql = '';
		$aid = '';

		if(isset($_GET) && !empty($_GET['aid']))
			$aid = (int)$_GET['aid'];

		if(isset($_POST) && isset($_POST['theform'])){
			// 输入验证
			$valid = array(
				'apiname'=>array('required','max'=>50,'min'=>2),
			);
			if(!$this->validate($_POST['theform'],$valid)){
				$validResult = $this->getValidResult();
				$this->objS -> assign("validResult",$validResult);
			}else{
				// 更新或插入操作
				$param = AddSlash($_POST['theform']);
				$param = $this->getParam($param);
				if($aid){
					$sql = "UPDATE ".DBPREFIX."tuan_apis SET {$param} WHERE aid=".$aid;
					$editrs = $this->objC->RunQuery($sql);
					if(!$editrs){
						AlertMsg('编辑异常',-1);
					}else{
						$this->objS->assign("operateFlag","true");
					}
				}else {
					$sql = "INSERT INTO ".DBPREFIX."tuan_apis SET {$param}";
					$editrs = $this->objC->RunQuery($sql);
					if(!$editrs){
						AlertMsg('添加异常',-1);
					}else{
						AlertMsg('添加成功','?c=tuanapis');
					}
				}
			}
		}

		if($aid){
			$result = $this->objC->GetRow("SELECT * FROM ".DBPREFIX."tuan_apis WHERE aid=".$aid);
			$this->objS -> assign("arrAPI",$result);
		}
		$this->objS->display('tuan/manager/tuanapisedit.tpl');
	}

	public function deleteAction(){
		if(isset($_GET) && !empty($_GET['aid']))
			$aid = (int)$_GET['aid'];
		$deleters = $this->objC->RunQuery("DELETE FROM ".DBPREFIX."tuan_apis WHERE aid={$aid} LIMIT 1");
		if(!$deleters){
			AlertMsg('删除异常',-1);
		}else{
			$this->indexAction();
		}
	}
}