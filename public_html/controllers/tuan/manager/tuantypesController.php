<?php
class tuantypesController extends abstractController{
	public function indexAction(){
		$voLists = array();
		if($_POST){
			$this->setWhere(array('typename'=>'A'));
			$where = $this->getWhere(AddSlash($_POST['theform']));
		}else{
			$where = '1=1';
		}
		$sql = "SELECT tid,typename,sortorder FROM ".DBPREFIX."tuan_types WHERE ".$where." ORDER BY sortorder ASC";
		$ct = "SELECT count(*) AS ct FROM ".DBPREFIX."tuan_types WHERE ".$where;
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
		$this->objS->display('tuan/manager/tuantypes.tpl');
	}
	public function editAction(){
		if($_GET){
    		$req = AddSlash($_GET);
			$siteIDArr = $req['siteID'];
			$siteNameArr = $req['siteName'];
			$siteSortArr = $req['siteSort'];
			$return = array();
			foreach($siteIDArr as $key => $sid){
				if($sid){													//update
					$sql = "update ".DBPREFIX."tuan_types set typename='".unescape($siteNameArr[$key])."',sortorder='".unescape($siteSortArr[$key])."' WHERE tid={$sid}";
					$rs = $this->objC->RunQuery($sql);
					if($rs)
						$return[]=array('flag'=>'update','siteID'=>$sid,'siteName'=>unescape($siteNameArr[$key]),'siteSort'=>unescape($siteSortArr[$key]));
					else
						$return[]=array('flag'=>'error');
				}else{															//insert
					$sql = "insert into ".DBPREFIX."tuan_types(typename,sortorder) values('".unescape($siteNameArr[$key])."','".unescape($siteSortArr[$key])."')";
					$rs = $this->objC->RunQuery($sql);
					if($rs){
						$sid = $this->objC->GetInsertId();
						$return[]=array('flag'=>'insert','siteID'=>$sid,'siteName'=>unescape($siteNameArr[$key]),'siteSort'=>unescape($siteSortArr[$key]));
					}else
						$return[]=array('flag'=>'error');
				}
			}
			echo json_encode(array_gbk_to_utf8($return));
			exit;
    	}
	}
	public function deleteAction(){
		if($_GET){
			$siteIDArr = $_GET['siteID'];
			foreach($siteIDArr as $sid){
				$sql = "delete from ".DBPREFIX."tuan_types where tid = '".$sid."'";
				$rs = $this->objC->RunQuery($sql);
			}
			if(!$rs){
				$result = array('flag'=>'error');
				echo json_encode($result);
				exit;
			}else{
				$result = array('flag'=>'delete','siteID'=>$sid);
				echo json_encode($result);
				exit;
			}
		}
	}
}