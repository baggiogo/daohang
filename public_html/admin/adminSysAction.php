<?php
session_cache_limiter('private,must-revalidate');
require("header.inc.php");
ChkAdminLogin();

$sMasterAct = $_SESSION['sMaster']['masterAct'];
if(preg_match('["viewAdminAction"]','"'.$sMasterAct.'"')){
	$viewAdminAction = "true";
}
if(preg_match('["addAdminAction"]','"'.$sMasterAct.'"')){
	$addAdminAction = "true";
}
if(preg_match('["updateAdminAction"]','"'.$sMasterAct.'"')){
	$updateAdminAction = "true";
}
if(preg_match('["delAdminAction"]','"'.$sMasterAct.'"')){
	$delAdminAction = "true";
}

$objC = new Conn();
if($act == "add" && $addAdminAction=="true"){
	AddAdminLog("��ӹ���Ȩ��");
	$cDate = time();
	$mDate = time();
	$arrActionName = $_POST['tbActionName'];
	$arrActionStr = $_POST['tbActionStr'];
	$arrModuleID = $_POST['tbModuleID'];
	$succeed = true;
	$ctActionName = count($arrActionName);
	for($i=0;$i<$ctActionName;$i++){
		if(checkValid($arrActionName[$i],'string',2,20)==false && $arrActionName[$i] != ""){
			AlertMsg('�Բ����������Ȩ�����Ƹ�ʽ����',"-1");
		}
		if(checkValid($arrActionStr[$i],'string',2,50)==false && $arrActionStr[$i] != ""){
			AlertMsg('�Բ����������Ȩ���ִ���ʽ����',"-1");
		}
		if(checkValid($arrModuleID[$i],'int',0,3)==false && $arrModuleID[$i] != ""){
			AlertMsg('�Բ�������ӵ�Ȩ������ģ���ʽ����',"-1");
		}
		if($arrActionName[$i]!="" && $arrActionStr[$i]!="" && $arrModuleID[$i]!=""){
			$sql = 'INSERT INTO '.DBPREFIX.'admin_action (cDate,mDate,actionName,moduleID,actionStr) VALUES ("'.$cDate.'","'.$mDate.'","'.$arrActionName[$i].'","'.$arrModuleID[$i].'","'.$arrActionStr[$i].'")';
			$objC -> RunQuery($sql);
			if($objC -> GetAffectedRows() <= 0){
				$succeed = false;
				break;
			}
		}
	}
	if($succeed){
		AlertMsg('������ӳɹ���',"?p=".$p);
	}
	else{
		AlertMsg('�Բ����������ʧ�ܣ�',"-1");
	}
}
else if($act == "operate"){
	if($_POST['btnUpdate']){
		AddAdminLog("�޸Ĺ���Ȩ��");
		if($updateAdminAction=="true"){
			$succeed = true;
			$arrActionID = $_POST['hidActionID'];
			$arrActionName = $_POST['tbActionName'];
			$arrActionStr = $_POST['tbActionStr'];
			$arrModuleID = $_POST['tbModuleID'];
			$arrActionState = $_POST['chkLockID'];
			$ctActionID = count($arrActionID);
			for($i=0;$i<$ctActionID;$i++){
				if(checkValid($arrActionName[$i],'string',2,20)==false && $arrActionName[$i] != ""){
					AlertMsg('�Բ����������Ȩ�����Ƹ�ʽ����',"-1");
				}
				if(checkValid($arrActionStr[$i],'string',2,50)==false && $arrActionStr[$i] != ""){
					AlertMsg('�Բ����������Ȩ���ִ���ʽ����',"-1");
				}
				if(checkValid($arrModuleID[$i],'int',0,3)==false && $arrModuleID[$i] != ""){
					AlertMsg('�Բ�������ӵ�Ȩ������ģ���ʽ����',"-1");
				}
				if(is_array($arrActionState) && in_array($arrActionID[$i],$arrActionState)){
					$actionState = "0";
				}
				else{
					$actionState = "1";
				}
				$sql = 'UPDATE '.DBPREFIX.'admin_action SET mDate = "'.time().'",actionName="'.$arrActionName[$i].'",moduleID="'.$arrModuleID[$i].'",actionStr="'.$arrActionStr[$i].'",actionState="'.$actionState.'" WHERE actionID = "'.$arrActionID[$i].'"';
				$objC -> RunQuery($sql);
				if($objC -> GetAffectedRows() <= 0){
					$succeed = false;
					break;
				}
			}
			$sql = 'TRUNCATE TABLE '.DBPREFIX.'admin_ag';
			$objC -> RunQuery($sql);
			$sql = 'INSERT INTO '.DBPREFIX.'admin_ag (actionStr,groupID) SELECT actionStr,"1" FROM '.DBPREFIX.'admin_action';
			$objC -> RunQuery($sql);
			if($succeed){
				AlertMsg('�����޸ĳɹ���',"?p=".$p);
			}
			else{
				AlertMsg('�Բ��������޸�ʧ�ܣ�',"-1");
			}
		}
	}
	else if($_POST['btnDelete']){
		AddAdminLog("ɾ������Ȩ��");
		if($delAdminAction=="true"){
			$arrDelID = $_POST['chkDelID'];
			$strDelID = implode('","',$arrDelID);
			$sql = 'DELETE FROM '.DBPREFIX.'admin_action WHERE actionID IN ("'.$strDelID.'")';
			$objC -> RunQuery($sql);
			if($objC -> GetAffectedRows() <= 0){
				AlertMsg('�Բ�������ɾ��ʧ�ܣ�',"-1");
			}
			AlertMsg('����ɾ���ɹ���',"?p=".$p);
		}
	}
}
else{
	$ct = 'SELECT COUNT(*) as ct FROM '.DBPREFIX.'admin_action';
	$recordCount = $objC->GetOne($ct);
	$objP = new Pager($recordCount);
	if($recordCount > 0){
		$sql = 'SELECT actionID,actionName,moduleID,actionStr,actionState FROM '.DBPREFIX.'admin_action';
		$arrLimit = $objP -> GetLimit();
		$result = $objC -> SelectLimit($sql,$arrLimit[1],$arrLimit[0]);
		while($arrRow = $objC->FetchRow($result)){
			$arrActionList[] = $arrRow;
		}
		$objS -> assign("arrActionList",$arrActionList);
		$objS -> assign("pager",$objP->ShowMain().$objP->ShowNum());
	}
	$sql = 'SELECT moduleID,moduleName FROM '.DBPREFIX.'admin_module WHERE moduleFID != 0';
	$arrModule = $objC -> GetAll($sql);
	foreach($arrModule as $arr){
		$arrModuleList[$arr['moduleID']] = $arr['moduleName'];
	}
	$objS -> assign("arrModuleList",$arrModuleList);
	$objS -> assign("arrNO",array(1,2,3,4));
}

$objS -> assign("viewAdminAction",$viewAdminAction);
$objS -> assign("addAdminAction",$addAdminAction);
$objS -> assign("updateAdminAction",$updateAdminAction);
$objS -> assign("delAdminAction",$delAdminAction);

require("footer.inc.php");
$objS -> display("admin/adminSysAction.tpl");
?>