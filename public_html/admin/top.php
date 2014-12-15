<?php
include_once("header.inc.php");
ChkAdminLogin();
$getVersion = getContent("http://download.5w.com/version.txt");
if(VERSION_5W < $getVersion){
	$objS->assign("getVersion",$getVersion);
}
$sql = 'SELECT DISTINCT m.moduleFID FROM '.DBPREFIX.'admin_module m WHERE m.moduleState = 1 AND m.moduleID IN ('.$_SESSION['sMaster']['moduleID'].')';
$objC = new Conn();
$arrRow = $objC -> GetAll($sql);

$com = "";
$moduleFID="";
foreach($arrRow as $arr){
	$moduleFID .= $com.'"'.$arr['moduleFID'].'"';
	$com = ",";
}
$sql = 'SELECT m.moduleID,m.moduleName,m.moduleLink FROM '.DBPREFIX.'admin_module m WHERE m.moduleState = 1 AND m.moduleID IN ('.$moduleFID.') ORDER BY `moduleIndex` DESC';

$arrList = $objC -> GetAll($sql);

$i=0;

foreach($arrList as $arr){
	switch ($arr['moduleName']){
		case "��վ����":
			$arrList[$i]['mainURL'] = "adminSiteSetting.php";
			break;
		case "ϵͳ����":
			$arrList[$i]['mainURL'] = "adminSysMaster.php";
			break;
		case "վ�����":
			$arrList[$i]['mainURL'] = "adminSiteType.php";
			break;
		case "���Թ���":
			$arrList[$i]['mainURL'] = "adminMessage.php";
			break;
		case "��Ա����":
			$arrList[$i]['mainURL'] = "adminStatistics.php";
			break;
		case "���Ź���":
			$arrList[$i]['mainURL'] = "adminNews.php?act=manage";
			break;
		default:
			$arrList[$i]['mainURL'] = "adminUserMessage.php";
			break;
	}
	$i++;
}
$objS -> assign("arrModule",$arrList);

require("footer.inc.php");
$objS -> display("admin/top.tpl");
?>