<?php
require("header.inc.php");
ChkAdminLogin();
if (isset($_POST) && isset($_GET['act']) && $_GET['act'] == 'update') {
    $arr = array();
    foreach ($_POST as $key=>$value) {
    	if($key == 'countCode')
        $arr[] = $key." = '".addslashes($value)."' ";
      else
      	$arr[] = $key." = '".addSlash($value)."' ";
    }

    $str = implode(',', $arr);
    $sql = "UPDATE ".DBPREFIX."site_setting SET $str WHERE id = 1";
    if ($objC->RunQuery($sql)) {
        AlertMsg('�޸�վ�����óɹ�!\r\n\r\nע�⣺�뵽 [���ɾ�̬] ��Ŀ���������ɾ�̬ҳ��֮����ܲ鿴Ч��!', '-1');
    }
    else {
        AlertMsg('�޸�վ������ʧ��!', '-1');
    }
    exit;
}elseif (isset($_POST) && isset($_GET['act']) && $_GET['act'] == 'clear') {
	$cachedir = CACHE_PATH."data/";
	if($handle = opendir($cachedir)){
		while(false !== ($file=readdir($handle))){
			if((preg_match("/^0\.data$/i",$file)||preg_match("/^ad\d+\.data$/i", $file)) && $file != '.' && $file != '..'){
				$rs = unlink($cachedir.$file);
			}
		}
	}
	AlertMsg('�������ɹ�!', '-1');exit;
}

$sql = 'SELECT * FROM '.DBPREFIX.'site_setting';
$sets = $objC->GetRow($sql);
$sets['countCode'] = stripslashes($sets['countCode']);
$objS->assign('sets', $sets);

require("footer.inc.php");
if(isset($_GET) && isset($_GET['p']) && $_GET['p']=='mail')
	$objS->display("admin/adminMailSetting.tpl");
else if(isset($_GET) && isset($_GET['p']) && $_GET['p']=='cache')
	$objS->display("admin/adminUserCacheSetting.tpl");
else
	$objS->display("admin/adminSiteSetting.tpl");