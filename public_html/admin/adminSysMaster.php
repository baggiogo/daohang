<?php
session_cache_limiter('private,must-revalidate');
require("header.inc.php");
ChkAdminLogin();

$sMasterAct = $_SESSION['sMaster']['masterAct'];
if(preg_match('["viewMaster"]','"'.$sMasterAct.'"')){
	$viewMaster = "true";
}
if(preg_match('["addMaster"]','"'.$sMasterAct.'"')){
	$addMaster = "true";
}
if(preg_match('["updateMaster"]','"'.$sMasterAct.'"')){
	$updateMaster = "true";
}
if(preg_match('["delMaster"]','"'.$sMasterAct.'"')){
	$delMaster = "true";
}

$objC = new Conn();
if($act == "add" && $addMaster=="true"){
	AddAdminLog("��ӹ���Ա");
	$cDate = time();
	$mDate = time();
	$req = addSlash($_POST);
	$masterMail = $req['tbMasterMail'];
	$masterGroup = $req['tbMasterGroup'];
	$masterPwd = $req['tbMasterPwd'];
	$masterName = $req['tbMasterName'];
	$masterPhone = $req['tbMasterPhone'];
	$arrAdminGroup = $req['tbAdminGroup'];
	if(empty($arrAdminGroup)){
		AlertMsg('�Բ�����ѡ�������ڹ����飡',"-1");
	}
	if(checkValid($masterMail,'string')==false){
		AlertMsg('�Բ���������Ĺ���Ա��ʽ����',"-1");
	}
	if(checkValid($masterPwd,'string')==false){
		AlertMsg('�Բ���������������ʽ����',"-1");
	}
	if(checkValid($masterName,'string',2,20)==false){
		AlertMsg('�Բ�������������Ƹ�ʽ����',"-1");
	}
	if(checkValid($masterPhone,'phone')==false && $masterPhone != ""){
		AlertMsg('�Բ�����������ֻ������ʽ����',"-1");
	}
	$sql = 'INSERT INTO '.DBPREFIX.'admin_master (cDate,mDate,groupID,masterMail,masterPwd,masterName,masterPhone) VALUES ("'.$cDate.'","'.$mDate.'","'.$arrAdminGroup[0].'","'.$masterMail.'","'.Encrypt($masterPwd).'","'.$masterName.'","'.$masterPhone.'")';
	$objC -> RunQuery($sql);
	if($objC -> GetAffectedRows() < 0){
		AlertMsg('�Բ����������ʧ�ܣ�',"-1");
	}
	$succeed = true;
	if(count($arrAdminGroup) > 0){
		foreach($arrAdminGroup as $groupID){
			$sql = 'INSERT INTO '.DBPREFIX.'admin_mg (masterMail,groupID) VALUES ("'.$masterMail.'","'.$groupID.'")';
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
		AddAdminLog("�޸Ĺ���Ա");
		if($updateMaster=="true"){
			$req = addSlash($_POST);
			$arrMasterMail = $req['hidMasterMail'];
			$arrMasterName = $req['tbMasterName'];
			$arrMasterPhone = $req['tbMasterPhone'];
			$arrMasterState = $req['chkLockID'];
			$arrAdminGroup = $req['tbAdminGroup'];
			$mDate = time();
			$i=0;

			foreach($arrMasterMail as $masterMail){
				if(checkValid($masterMail,'string')==false){
					AlertMsg('�Բ���������Ĺ���Ա��ʽ����',"-1");
				}
				if(checkValid($arrMasterName[$i],'string',2,20)==false){
					AlertMsg('�Բ�������������Ƹ�ʽ����',"-1");
				}
				if(checkValid($arrMasterPhone[$i],'phone')==false && $arrMasterPhone[$i] != ""){
					AlertMsg('�Բ�����������ֻ������ʽ����',"-1");
				}
				if(is_array($arrMasterState) && in_array($masterMail,$arrMasterState)){
					$masterState = "0";
				}
				else{
					$masterState = "1";
				}
				$sql = 'UPDATE '.DBPREFIX.'admin_master SET groupID = "'.$arrAdminGroup[$i][0].'", mDate = "'.$mDate.'",masterName = "'.$arrMasterName[$i].'",masterPhone = "'.$arrMasterPhone[$i].'",masterState = "'.$masterState.'" WHERE md5(masterMail) = md5("'.$masterMail.'")';
				$objC -> RunQuery($sql);
				if($objC -> GetAffectedRows() < 0){
					AlertMsg('�Բ��������޸�ʧ�ܣ�',"-1");
				}
				$sql = 'DELETE FROM '.DBPREFIX.'admin_mg WHERE masterMail = "'.$masterMail.'"';
				$objC -> RunQuery($sql);
				if($objC -> GetAffectedRows() < 0){
					AlertMsg('�Բ��������޸�ʧ�ܣ�',"-1");
				}
				$succeed = true;
				if(count($arrAdminGroup) > 0){
					foreach($arrAdminGroup[$i] as $groupID){
						$sql = 'INSERT INTO '.DBPREFIX.'admin_mg (masterMail,groupID) VALUES ("'.$masterMail.'","'.$groupID.'")';
						$objC -> RunQuery($sql);
						if($objC -> GetAffectedRows() <= 0){
							$succeed = false;
							break;
						}
					}
					if($succeed == false){
						break;
					}
				}
				$i++;
			}
			if($succeed){
				AlertMsg('�����޸ĳɹ���',"?p=".$p);
			}
			else{
				AlertMsg('�Բ��������޸�ʧ�ܣ�',"-1");
			}
		}
	}
	else if($_POST['btnDelete']){
		AddAdminLog("ɾ������Ա");
		if($delMaster=="true"){
			$req = addSlash($_POST);
			$arrDelID = $req['chkDelID'];
			$strDelID = implode('","',$arrDelID);
			$sql = 'DELETE FROM '.DBPREFIX.'admin_master WHERE masterMail IN ("'.$strDelID.'")';
			$objC -> RunQuery($sql);
			if($objC -> GetAffectedRows() <= 0){
				AlertMsg('�Բ�������ɾ��ʧ�ܣ�',"-1");
			}
			$sql = 'DELETE FROM '.DBPREFIX.'admin_mg WHERE masterMail IN ("'.$strDelID.'")';
			$objC -> RunQuery($sql);
			if($objC -> GetAffectedRows() <= 0){
				AlertMsg('�Բ�������ɾ��ʧ�ܣ�',"-1");
			}
			AlertMsg('����ɾ���ɹ���',"?p=".$p);
		}
	}
}
else{
	$ct = 'SELECT COUNT(*) as ct FROM '.DBPREFIX.'admin_master WHERE masterMail != "admin@3393.com"';
	$recordCount = $objC->GetOne($ct);
	$objP = new Pager($recordCount);
	if($recordCount > 0){
		$sql = 'SELECT masterMail,masterName,masterLoginTimes,masterLastDate,masterPhone,masterState FROM '.DBPREFIX.'admin_master WHERE masterMail != "admin@3393.com"';
		$arrLimit = $objP -> GetLimit();
		$result = $objC -> SelectLimit($sql,$arrLimit[1],$arrLimit[0]);
		while($arrRow = $objC->FetchRow($result)){
			$sql = 'SELECT groupID FROM '.DBPREFIX.'admin_mg WHERE masterMail = "'.$arrRow['masterMail'].'"';
			$arrGroup = $objC -> GetAll($sql);
			if(count($arrGroup)>0){
				foreach($arrGroup as $arr){
					$arrRow['masterGroup'][] = $arr['groupID'];
				}
			}
			$arrMasterList[] = $arrRow;
		}
		$objS -> assign("arrMasterList",$arrMasterList);
		$objS -> assign("pager",$objP->ShowMain().$objP->ShowNum());
	}
	$sql = 'SELECT groupID,groupName FROM '.DBPREFIX.'admin_group WHERE groupState = 1';
	$arrAction = $objC -> GetAll($sql);
	foreach($arrAction as $arr){
		$arrAdminGroup[$arr['groupID']] = $arr['groupName'];
	}
	$objS -> assign("arrAdminGroup",$arrAdminGroup);
}

$objS -> assign("viewMaster",$viewMaster);
$objS -> assign("addMaster",$addMaster);
$objS -> assign("updateMaster",$updateMaster);
$objS -> assign("delMaster",$delMaster);

require("footer.inc.php");
$objS -> display("admin/adminSysMaster.tpl");
?>