<?php
class tuancitysController extends abstractController{
	public function indexAction(){
		global $dataFlag;
		$voLists = array();
		if($_POST){
			$this->setWhere(array('city'=>'A'));
			$where = $this->getWhere(AddSlash($_POST['theform']));
		}else{
			$where = '1=1';
		}
		$sql = "SELECT cid,city,sortorder,status FROM ".DBPREFIX."tuan_citys WHERE ".$where." ORDER BY sortorder ASC";
		$ct = "SELECT count(*) AS ct FROM ".DBPREFIX."tuan_citys WHERE ".$where;
		if($recordCount = $this->objC -> GetOne($ct)){
			if($recordCount){
				$objP = new Pager($recordCount);
				$arrLimit = $objP -> GetLimit('');
				$result = $this->objC -> SelectLimit($sql,$arrLimit[1],$arrLimit[0]);
				while($arrRow = $this->objC->FetchRow($result)){
					$arrRow['status'] = $dataFlag[$arrRow['status']];
					$voLists[] = $arrRow;
				}
				$this->objS -> assign("pager",$objP->ShowMain().$objP->ShowNum().$objP->showGoTo());
				$this->objS -> assign("voLists",$voLists);
			}
		}
		$this->objS->assign('statusArr',$dataFlag);
		$this->objS->display('tuan/manager/tuancitys.tpl');
	}
	public function editAction(){
		if($_GET){
    		$req = AddSlash($_GET);
			$siteIDArr = $req['siteID'];
			$siteNameArr = $req['siteName'];
			$siteStatusArr = $req['siteStatus'];
			$siteSortArr = $req['siteSort'];
			$return = array();
			foreach($siteIDArr as $key => $sid){
				if($sid){													//update
					$sql = "update ".DBPREFIX."tuan_citys set city='".unescape($siteNameArr[$key])."',status='".unescape($siteStatusArr[$key])."',sortorder='".unescape($siteSortArr[$key])."' WHERE cid={$sid}";
					$rs = $this->objC->RunQuery($sql);
					if($rs)
						$return[]=array('flag'=>'update','siteID'=>$sid,'siteName'=>unescape($siteNameArr[$key]),'siteStatus'=>unescape($siteStatusArr[$key]),'siteSort'=>unescape($siteSortArr[$key]));
					else
						$return[]=array('flag'=>'error');
				}else{															//insert
					$sql = "insert into ".DBPREFIX."tuan_citys(city,status,sortorder) values('".unescape($siteNameArr[$key])."','".unescape($siteStatusArr[$key])."','".unescape($siteSortArr[$key])."')";
					$rs = $this->objC->RunQuery($sql);
					if($rs){
						$sid = $this->objC->GetInsertId();
						$return[]=array('flag'=>'insert','siteID'=>$sid,'siteName'=>unescape($siteNameArr[$key]),'siteStatus'=>unescape($siteStatusArr[$key]),'siteSort'=>unescape($siteSortArr[$key]));
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
				$sql = "delete from ".DBPREFIX."tuan_citys where cid = '".$sid."'";
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