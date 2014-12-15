<?php
session_cache_limiter('private,must-revalidate');
require("header.inc.php");
include_once('../controllers/abstractController.php');
ChkAdminLogin();

$sMasterAct = $_SESSION['sMaster']['masterAct'];
if(preg_match('["doCache"]','"'.$sMasterAct.'"')){
	$doCache = "true";
}
$objS->assign('doCache',$doCache);
$sql = 'SELECT htmlpath FROM '.DBPREFIX.'site_setting';
$htmlpath = $objC->GetOne($sql);
$ctype = isset($_GET['ctype'])?$_GET['ctype']:'';
$begin = explode(" ", microtime());
if($ctype){
$msg = <<<BOT
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>
<link href="style/css.css" type="text/css" rel="stylesheet" />
</head><div id="box">
<div class="right">
<table width="100%" border="0" cellspacing="1" cellpadding="1" class="edit">
  <tr>
    <td class="title_edit">
     <h1>��̬���ɽ�� </h1>
   </td>
  </tr>
  <tr>
    <td class="edit_main"><table width="100%" border="0" cellspacing="1" cellpadding="1">
    	<tr><td><a href="./adminCache.php">�������ɾ�̬����ҳ</a></td></tr>
      <tr><td height="26">
BOT;
flushHTML($msg);
}

if ($ctype == 'index') {								//----------------------------------fengguanxing ����������ҳ
	include_once('../controllers/htmlController.php');
	$index = new htmlController();
	flushHTML('<br />����������ҳ�� <br /><br />');
	$rs = $index->indexAction($h='index','');
	if($rs)
		flushHTML('Ĭ����ҳ index.htm ���ɳɹ���<br />');
	else
		flushHTML('Ĭ����ҳ index.htm <font style="color:red">����ʧ�ܣ�</font><br />');
	$rs = $index->indexAction($h='kp',$psize='kp');
	if($rs)
		flushHTML('������ҳ kp.htm ���ɳɹ���<br />');
	else
		flushHTML('������ҳ kp.htm <font style="color:red">����ʧ�ܣ�</font><br />');
}
elseif ($ctype == 'all') {				//----------------------------------fengguanxing ������������ҳ
	set_time_limit(300);
	$str = "<br />�������ɷ��ྲ̬ҳ�棺<font color=blue>'".$htmlpath."'&nbsp;Ŀ¼Ȩ�ޱ���Ϊ777</font><br /><br />";
    flushHTML($str);
	include_once('../controllers/htmlController.php');
	$channel = new htmlController();
	$channel->allChannelAction();
}elseif ($ctype == 'help') {            //----------------------------------------fengguanxing  �������ɰ���ҳ
	$str = "<br />��������������̬ҳ�棺 <br /><br />";
  flushHTML($str);
  include_once('../controllers/htmlController.php');
  $index = new htmlController();
  $rs = $index->aboutAction();
  if($rs)
		flushHTML('�������� about.htm ���ɳɹ���<br />');
	else
		flushHTML('�������� about.htm <font style="color:red">����ʧ�ܣ�</font><br />');
  $rs = $index->errorAction();
  if($rs)
		flushHTML('404ҳ�� 404.htm ���ɳɹ���<br />');
	else
		flushHTML('404ҳ�� 404.htm <font style="color:red">����ʧ�ܣ�</font><br />');


}elseif ($ctype == 'forall') {				//----------------------------------fengguanxing ������������ҳ
	set_time_limit(300);
	include_once('../controllers/htmlController.php');
	$index = new htmlController();
	flushHTML('<br />����������ҳ�� <br /><br />');
	$rs = $index->indexAction($h='index','');
	if($rs)
		flushHTML('Ĭ����ҳ index.htm ���ɳɹ���<br />');
	else
		flushHTML('Ĭ����ҳ index.htm <font style="color:red">����ʧ�ܣ�</font><br />');
	$rs = $index->indexAction($h='kp',$psize='kp');
	if($rs)
		flushHTML('������ҳ kp.htm ���ɳɹ���<br />');
	else
		flushHTML('������ҳ kp.htm <font style="color:red">����ʧ�ܣ�</font><br />');

	$str = "<br />��������������̬ҳ�棺 <br /><br />";
    flushHTML($str);

  $rs = $index->aboutAction();
  if($rs)
		flushHTML('�������� about.htm ���ɳɹ���<br />');
	else
		flushHTML('�������� about.htm <font style="color:red">����ʧ�ܣ�</font><br />');
  $rs = $index->errorAction();
  if($rs)
		flushHTML('404ҳ�� 404.htm ���ɳɹ���<br />');
	else
		flushHTML('404ҳ�� 404.htm <font style="color:red">����ʧ�ܣ�</font><br />');

	$str = "<br />�������ɷ��ྲ̬ҳ�棺<font color=blue>'".$htmlpath."'&nbsp;Ŀ¼Ȩ�ޱ���Ϊ777</font><br /><br />";
  flushHTML($str);

	$index->allChannelAction();
}elseif ($ctype == 'hc_self') {
	$str = "<br />����ɾ�������ļ���<br /><br />";
  	flushHTML($str);
	$cachedir = CACHE_PATH;
	if($handle = opendir($cachedir)){
		while (false !== ($file=readdir($handle))){
			if (is_dir($cachedir.$file) && preg_match("/^\d+$/i", $file) && $file != '.' && $file !='..'){
				if($handle = opendir($cachedir.$file."/")){
					while (false!==($files = readdir($handle))){
						if($files != '.' && $files !='..'){
							$rs = unlink($cachedir.$file."/".$files);
							if($rs){
								flushHTML('ɾ�������ļ�'.$files.'�ɹ���<br />');
								$return = 1;
							}else
								flushHTML('ɾ�������ļ�<font style="color:red">'.$files.'ʧ�ܣ�</font><br />');
						}
					}
				}
			}
		}
	}
	$cachedir = CACHE_PATH."data/";
	if($handle = opendir($cachedir)){
		while(false !== ($file=readdir($handle))){
			if((preg_match("/^0\.data$/i",$file)||preg_match("/^default\.data$/i",$file)||preg_match("/^ad\d+\.data$/i", $file)) && $file != '.' && $file != '..'){
				$rs = unlink($cachedir.$file);
				if($rs){
					flushHTML('ɾ�������ļ�'.$file.'�ɹ���<br />');
					$return = 1;
				}else
					flushHTML('ɾ�������ļ�<font style="color:red">'.$file.'ʧ�ܣ�</font><br />');
			}
		}
	}
	$str = isset($return)?"������":"û�ж�Ӧ����";
	flushHTML($str);
}elseif ($ctype == 'hc_weather') {
	$str = "<br />����ɾ�������ļ���<br /><br />";
  	flushHTML($str);
	$cachedir = CACHE_PATH."data/newdata/";
	if($handle = opendir($cachedir)){
//		while (false !== ($file=readdir($handle))){
//			if (is_dir($cachedir.$file) && preg_match("/^t\d+$/i", $file) && $file != '.' && $file !='..'){
//				if($handle = opendir($cachedir.$file."/")){
					while (false!==($files = readdir($handle))){
						if($files != '.' && $files !='..'){
							$rs = unlink($cachedir."/".$files);
							if($rs){
								flushHTML('ɾ�������ļ�'.$files.'�ɹ���<br />');
							$return = 1;
							}else
								flushHTML('ɾ�������ļ�<font style="color:red">'.$files.'ʧ�ܣ�</font><br />');
						}
					}
				//}
			//}
		//}
	}
	$str = isset($return)?"������":"û�ж�Ӧ����";
	flushHTML($str);
}elseif ($ctype == 'hc_sosuo') {
	$str = "<br />����ɾ�������ļ���<br /><br />";
  	flushHTML($str);
	$cachedir = CACHE_PATH."data/";
	if($handle = opendir($cachedir)){
		while(false !== ($file=readdir($handle))){
			if((preg_match("/^\d+s\.data$/i",$file)||preg_match("/^\d+c\.data$/i", $file)||preg_match("/^\d+ns\.data$/i", $file)) && $file != '.' && $file != '..'){
				$rs = unlink($cachedir.$file);
				if($rs){
					flushHTML('ɾ�������ļ�'.$file.'�ɹ���<br />');
					$return = 1;
				}else
					flushHTML('ɾ�������ļ�<font style="color:red">'.$file.'ʧ�ܣ�</font><br />');
			}
		}
	}
	$str = isset($return)?"������":"û�ж�Ӧ����";
	flushHTML($str);
}elseif($ctype == 'cq_zdyad'){
	$str = "<br />����ɾ�������ļ���<br /><br />";
  	flushHTML($str);
	$cachedir = CACHE_PATH."data/";
	if($handle = opendir($cachedir)){
		while(false !== ($file=readdir($handle))){
			if(preg_match("/^\d+m\.data$/i",$file) && $file != '.' && $file != '..'){
				$rs = unlink($cachedir.$file);
				if($rs){
					flushHTML('ɾ�������ļ�'.$file.'�ɹ���<br />');
					$return = 1;
				}else
					flushHTML('ɾ�������ļ�<font style="color:red">'.$file.'ʧ�ܣ�</font><br />');
			}
		}
	}
	$str = isset($return)?"������":"û�ж�Ӧ����";
	flushHTML($str);
}else{
	require("footer.inc.php");
	$firsttime = is_file("../index.htm");
	$objS -> assign("ft",$firsttime);
	$objS->display("admin/adminCache.tpl");
}

if($ctype){
	$end = explode(" ", microtime());
	flushHTML('<br />���β�������ʱ��'.round(($end[1]+$end[0]-$begin[0]-$begin[1]),3).' ��');
	if(isset($_GET['callor']) && $_GET['callor']=='theme'){
		flushHTML('<br /><meta http-equiv="refresh" content="3; url=theme.php" />Ӧ������ɹ���3��󷵻��������');
	}
	flushHTML('</td></tr></table></td></tr></table> ');

}