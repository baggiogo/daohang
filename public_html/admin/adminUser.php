<?php
session_cache_limiter('private,must-revalidate');
require("header.inc.php");
ChkAdminLogin();

$sMasterAct = $_SESSION['sMaster']['masterAct'];
if(preg_match('["lockUser"]','"'.$sMasterAct.'"')){
	$lockUser = "true";
}
if(preg_match('["delUser"]','"'.$sMasterAct.'"')){
	$delUser = "true";
}
if(preg_match('["updateUser"]','"'.$sMasterAct.'"')){
	$updateUser = "true";
}
if(preg_match('["viewUser"]','"'.$sMasterAct.'"')){
	$viewUser = "true";
}

$objC = new Conn();

if($act == "operate"){
	if($_POST['btnLock']){
		AddAdminLog("�����û�");
		$arrUserID = $_POST['hidUserID'];
		$arrLockID = $_POST['chkLockID'];
		$sql = 'UPDATE '.DBPREFIX.'members SET userStatus="1" WHERE userID IN ("'.implode('","',$arrUserID).'")';
		$objC -> RunQuery($sql);
		if(count($arrLockID)>0){
			$sLockID = implode('","',$arrLockID);
			$sql = 'UPDATE '.DBPREFIX.'members SET userStatus="0" WHERE userID IN ("'.$sLockID.'")';
			$objC -> RunQuery($sql);
		}
		if($objC -> GetAffectedRows() > 0){
			AlertMsg('�����޸ĳɹ���',"?p=".$p);
		}
		else{
			AlertMsg('�Բ��������޸�ʧ�ܣ�',"-1");
		}
	}
	else if($_POST['btnReset']){
		$arrResetID = $_POST['chkResetID'];
		if(count($arrResetID)>0){
			$sResetID = implode('","',$arrResetID);
			$sql = 'UPDATE '.DBPREFIX.'members SET userPwd="'.md5("aosoo").'" WHERE userID IN ("'.$sResetID.'")';
			$objC -> RunQuery($sql);
		}
		if($objC -> GetAffectedRows() > 0){
			AlertMsg('�����޸ĳɹ���',"?p=".$p);
		}
		else{
			AlertMsg('�Բ��������޸�ʧ�ܣ�',"-1");
		}
	}
}
else{
	//��������
	$arrSearchField = array(
							"userName"=>"�û���",
							"userLoginTimes"=>"��½����");

	$arrSearchDate = array("userRegDate"=>"ע��ʱ��",
						   "userLastDate"=>"����½ʱ��");
	$arrLockState = array("1"=>"����",
						   "0"=>"����");
	$objS -> assign("arrSearchField",$arrSearchField);

	$objS -> assign("arrUserState",$arrLockState);
	$objS -> assign("arrSearchDate",$arrSearchDate);

	//�����ж�
	$req = addSlash($_GET);
	$strSearchField = isset($req['searchField'])?$req['searchField']:''; //�û����� ����
	$strkeyWord = isset($req['keyWord'])?$req['keyWord']:'';//�û�����ֵ
	$strUserStatus = isset($req['userState'])?$req['userState']:'';//״̬
	$strSearchDate = isset($req['searchDate'])?$req['searchDate']:'';//ʱ������
	$strStartDate = isset($req['startDate'])?$req['startDate']:'';//��ʼʱ��
	$strEndDate = isset($req['endDate'])?$req['endDate']:'';//����ʱ��

	$ct = 'SELECT COUNT(*) as ct FROM '.DBPREFIX.'members WHERE 1 = 1';
	$sql = 'SELECT userID,userName,userMail,userLastDate,userRegDate,userLoginTimes,userRegIP,userStatus,`from`,`domain` FROM '.DBPREFIX.'members WHERE 1 = 1';


	$where_condition = "";
	if($strkeyWord != "" && $strSearchField != ""){
		$where_condition .= " and ".$strSearchField." = '".$strkeyWord."'";
	}

	if($strUserStatus!=""){
		$where_condition .= " and userStatus=".$strUserStatus;
	}
	if($strStartDate!=""){
		$strStartDate = strtotime($strStartDate);
		$where_condition .= " and ".$strSearchDate." >= ".$strStartDate."";
	}
	if($strEndDate!=""){
		$strEndDate = strtotime($strEndDate)+86400;
		$where_condition .= " and ".$strSearchDate." <= ".$strEndDate."";
	}
	$sql .= $where_condition;
	$ct .= $where_condition;
	//�������������������
	$strSortF= isset($req['sortf'])?$req['sortf']:'';
	$strSortB = isset($req['sortb'])?$req['sortb']:'';
	if($strSortF==""){
			$strSortF="userLastDate";
			$strSortB="DESC";
	}
	$sql .= " order by ".$strSortF." ".$strSortB;

    if($recordCount = $objC -> GetOne($ct)){

      if($recordCount){
        $objP = new Pager($recordCount);
        $arrLimit = $objP -> GetLimit();
        $result = $objC -> SelectLimit($sql,$arrLimit[1],$arrLimit[0]);
        //var_dump($sql);
        while($arrRow = $objC->FetchRow($result)){
          $arrUserList[] = $arrRow;
        }
        $objS -> assign("pager",$objP->ShowMain().$objP->ShowNum());
        $objS -> assign("arrUserList",$arrUserList);
      }
    }

}

$objS -> assign("viewUser",$viewUser);
$objS -> assign("lockUser",$lockUser);
$objS -> assign("delUser",$delUser);
$objS -> assign("updateUser",$updateUser);

require("footer.inc.php");
$objS -> display("admin/adminUser.tpl");
?>