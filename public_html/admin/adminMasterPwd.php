<?php
session_cache_limiter('private,must-revalidate');
require("header.inc.php");
ChkAdminLogin();

$sMasterAct = $_SESSION['sMaster']['masterAct'];
if(preg_match('["updateMasterPwd"]','"'.$sMasterAct.'"')){
	$updateMasterPwd = "true";
}
$objC = new Conn();
if($act == "operate"){
	AddAdminLog("����Ա�޸�����");
	$req = addSlash($_POST);
	if($req['btnUpdate'] && $updateMasterPwd=="true"){
		$oldPwd = md5($req['tbOldPwd']);
		$newPwd = md5($req['tbNewPwd']);
		$sql = 'SELECT masterPwd FROM '.DBPREFIX.'admin_master WHERE masterMail = "'.$_SESSION['sMaster']['masterMail'].'"';
		$arrRow = $objC -> GetRow($sql);
		if($arrRow['masterPwd'] == $oldPwd){
			$sql = 'UPDATE '.DBPREFIX.'admin_master SET mDate="'.time().'",masterPwd = "'.$newPwd.'" WHERE masterMail = "'.$_SESSION['sMaster']['masterMail'].'"';
			$objC -> RunQuery($sql);
			if($objC->GetAffectedRows() <= 0){
				AlertMsg('�Բ����޸�ʧ�ܣ�',"-1");
			}
			AlertMsg('�޸ĳɹ���',"?p=".$p);
		}
		else{
			AlertMsg("�Բ��𣬾����������������ԣ�","-1");
		}
	}
}

$objS -> assign("updateMasterPwd",$updateMasterPwd);

require("footer.inc.php");
$objS -> display("admin/adminMasterPwd.tpl");
?>