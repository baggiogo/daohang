<?php
session_cache_limiter('private,must-revalidate');
require("header.inc.php");
ChkAdminLogin();

$sMasterAct = $_SESSION['sMaster']['masterAct'];
if(preg_match('["viewSite"]','"'.$sMasterAct.'"')){
	$viewSite = "true";
}
if(preg_match('["addSite"]','"'.$sMasterAct.'"')){
	$addSite = "true";
}
if(preg_match('["delSite"]','"'.$sMasterAct.'"')){
	$delSite = "true";
}
if(preg_match('["updateSite"]','"'.$sMasterAct.'"')){
	$updateSite = "true";
}

$objC = new Conn();

if ($act == 'operate'){
	if($delSite && $_POST['btnDelete']){
		AddAdminLog("ɾ��վ��");

		$arrDelID = addSlash($_POST['chkDelID']);
		$strDelID = implode('","',$arrDelID);
		$sql = 'DELETE FROM '.DBPREFIX.'tag_site_url WHERE siteID IN ("'.$strDelID.'")';
		$objC -> RunQuery($sql);
		if($objC -> GetAffectedRows() <= 0){
			AlertMsg('�Բ�������ɾ��ʧ�ܣ�',"-1");
		}
		AlertMsg('����ɾ���ɹ���',"?p=".$p);
	}
}
else{
	$ct = 'SELECT count(*) as ct FROM '.DBPREFIX.'tag_site_url AS tsu  LEFT JOIN '.DBPREFIX.'members AS m ON tsu.userID = m.userID WHERE 1=1';
	$sql = 'SELECT tsu.siteID,  m.userName, tsu.siteName, tsu.siteUrl FROM '.DBPREFIX.'tag_site_url AS tsu LEFT JOIN '.DBPREFIX.'members AS m ON tsu.userID = m.userID WHERE 1=1';

	$arrSearchField = array("tsu.siteName"=>"վ������",
							"tsu.siteUrl"=>"վ��URL");

	$objS->assign("arrSearchField",$arrSearchField);


	$req = addSlash($_GET);

	$strSearchField = isset($req['searchField'])?$req['searchField']:''; //�û�����
	$strkeyWord = isset($req['keyWord'])?$req['keyWord']:'';//�û�����ֵ
	$strUserName = isset($req['userName'])?$req['userName']:'';//�û���

	$where_condition = "";
	if($strkeyWord != ""){
	    if ($strSearchField == 'tsu.siteID') {
	    	$where_condition .= " and tsu.siteID = '".$strkeyWord."'";
	    }
	    else {
		  $where_condition .= " and ".$strSearchField." like '%".$strkeyWord."%'";
	    }
	}

	if ($strUserName != '') {
	    $where_condition .= " and m.userName = '".$strUserName."'";
	}

	$sql .= $where_condition;
	$ct .= $where_condition;
$strSortF = '';
	if($strSortF==""){
		$strSortF="tsu.siteID";
		$strSortB="DESC";
	}
	$sql .= " order by ".$strSortF." ".$strSortB;
	//echo $sql;
	if($recordCount = $objC -> GetOne($ct)){
		if($recordCount){
			$objP = new Pager($recordCount);
			$arrLimit = $objP -> GetLimit();
			$result = $objC -> SelectLimit($sql,$arrLimit[1],$arrLimit[0]);
			while($arrRow = $objC->FetchRow($result)){
			    $arrSite[] = $arrRow;
			}
			$objS->assign("pager",$objP->ShowMain().$objP->ShowNum());
			$objS->assign("arrSite",$arrSite);
		}
	}
}

$objS -> assign("viewSite",$viewSite);
$objS -> assign("addSite",$addSite);
$objS -> assign("delSite",$delSite);
$objS -> assign("updateSite",$updateSite);

require("footer.inc.php");
$objS -> display("admin/adminUserSite.tpl");
?>
