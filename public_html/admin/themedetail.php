<?php
include_once("header.inc.php");
ChkAdminLogin();

if(isset($_POST['content'])){

	$content = stripslashes(htmlspecialchars_decode($_POST['content']));
	
	$theme = $_POST['theme'];
	$file = $_POST['file'];
	if(!array_key_exists($file,$files))die('�����ڴ�ģ���ļ�');
	if(!preg_match("/^\w+\/$/",$theme))die('ģ��·���쳣');
	$path = TEMPLATES.'theme/'.$theme.$file;
	if(is_file($path)){
		$rs = file_put_contents($path,$content);
		if($rs)
			flushHTML('ģ���޸ĳɹ���<br />');
		else
			flushHTML('ģ��<font style="color:red">�޸�ʧ�ܣ�</font>���뽫�����¸�ģ���ļ�Ȩ������Ϊ0777���ԡ���Ҳ�����ֶ��޸�ģ���ļ���'.$path.'<br />');
	}else{
		flushHTML('�޴�ģ���ļ���<br />');
	}
	echo ' <meta http-equiv="refresh" content="3; url=themedetail.php?theme='.$_POST['theme'].'&file='.$_POST['file'].'" /> ������ɣ�3����Զ��ص��������ҳ��';
}else{
	if($_GET['theme']){
		$theme = $_GET['theme'];
	}else{
		$theme = THEME_PATH;
	}
	
	$path = TEMPLATES.'theme/'.$theme.$_GET['file'];
	if(is_file($path)){
		$content = htmlspecialchars(getContent($path));
		$objS -> assign("content",$content);
		$objS -> assign("theme",$theme);
		$objS -> assign("file",$_GET['file']);
		$objS -> display("admin/themedetail.tpl");
	}else{
		die(' �������޴��ļ� ');
	}
}
