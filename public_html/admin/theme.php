<?php
include_once("header.inc.php");
ChkAdminLogin();
if($_GET && $_GET['theme'] && !empty($_GET['theme'])){
	$newTheme = $_GET['theme'];
	$dir = ROOT.'theme/'.$newTheme;
	$tpldir = TEMPLATES.'theme/'.$newTheme;
	if(!is_dir($dir)){
		$msg = '�����ⲻ���ڡ�<br />';
	}
	if(!is_dir($tpldir)){
		$msg .= '������û��ģ���ļ���';
	}
	if($msg == ''){
		$objC->RunQuery("UPDATE ".DBPREFIX."site_setting SET theme='{$newTheme}'");
		header('location:adminCache.php?ctype=forall&callor=theme');
		exit;
		/*
		set_time_limit(300);
		include_once('../controllers/abstractController.php');
		include_once('../controllers/htmlController.php');
		$index = new htmlController();
		flushHTML('Ӧ������ɹ��������������ɾ�̬ҳ�棺<br />');
		
		$rs1 = $index->indexAction($h='index','');
		if($rs1)
			flushHTML('Ĭ����ҳ index.htm ���ɳɹ���<br />');
		else
			flushHTML('Ĭ����ҳ index.htm <font style="color:red">����ʧ�ܣ�</font><br />');
		$rs2 = $index->indexAction($h='kp',$psize='kp');
		if($rs2)
			flushHTML('������ҳ kp.htm ���ɳɹ���<br />');
		else
			flushHTML('������ҳ kp.htm <font style="color:red">����ʧ�ܣ�</font><br />');
		$rs3 = $index->aboutAction();
		if($rs3)
			flushHTML('�������� about.htm ���ɳɹ���<br />');
		else
			flushHTML('�������� about.htm <font style="color:red">����ʧ�ܣ�</font><br />');
		$rs4 = $index->errorAction();
		if($rs4)
			flushHTML('404ҳ�� 404.htm ���ɳɹ���<br />');
		else
			flushHTML('404ҳ�� 404.htm <font style="color:red">����ʧ�ܣ�</font><br />');
		$rs5 = $index->allChannelAction();
		*/
	}
}
if($_GET && $_GET['delete'] && !empty($_GET['delete'])){
	if($_GET['delete'] == 'default/'){
		flushHTML('Ĭ�����ⲻ��ɾ����<br />');
		exit;
	}
	$newTheme = $_GET['delete'];
	$dir = ROOT.'theme/'.$newTheme;
	$tpldir = TEMPLATES.'theme/'.$newTheme;
	
	if(is_dir($dir)){
		$rs = DeleteDir($dir);
		if($rs)
			flushHTML('������ʽĿ¼ɾ���ɹ���<br />');
		else
			flushHTML('������ʽĿ¼<font style="color:red">ɾ��ʧ�ܣ�</font>�뵽'.$dir.'Ŀ¼�ֶ�ɾ������ļ����ļ���<br />');
	}
	if(is_dir($tpldir)){
		$rs = DeleteDir($tpldir);
		if($rs)
			flushHTML('����ģ��Ŀ¼ɾ���ɹ���<br />');
		else
			flushHTML('����ģ��Ŀ¼<font style="color:red">ɾ��ʧ�ܣ�</font>�뵽'.$dir.'Ŀ¼�ֶ�ɾ������ļ����ļ���<br />');
	}
}
if(!isset($_GET) || count($_GET) == 0){
	$path = ROOT.'theme/';
	$themearr = array();
	if(is_dir($path)){
		if($handle = opendir($path)){
			while (false !== ($file=readdir($handle))){
				if (is_dir($path.$file) && $file != '.' && $file !='..' && $file != '.svn'){
					$xml =$path.$file.'/about.xml';
					if(is_file($xml)){
						$content = simplexml_load_file($xml);
						$themearr[] = array(
							'dir' => $file.'/',
							'name' => $content->name,
							'author' => $content->author,
							'pubDate' => $content->pubDate,
							'url' => $content->url,
							'mail' => $content->mail
						);
					}
				}
			}		
		}
		/*$dirinfo = scandir($path);
		foreach($dirinfo as $dirs){
			print_r($dirs);
			if($dirs != '.' && $dirs != '..' && $dirs != '.svn'){
				$xml = ROOT.'theme/'.$dirs.'/about.xml';
				if(is_file($xml)){
					$content = simplexml_load_file($xml);
					print_r($content);
					$themearr[] = array(
						'dir' => $dirs.'/',
						'name' => $content->name,
						'author' => $content->author,
						'pubDate' => $content->pubDate,
						'url' => $content->url,
						'mail' => $content->mail
					);
				}
			}
		}
		*/
	}
	if(CHARSET == 'gbk'){
		$themearr = array_utf8_to_gbk($themearr);
	}
	$objS -> assign("themes",$themearr);
	$msg = '';
	
	$objS -> assign("msg",$msg);
	$objS -> display("admin/theme.tpl");
}else{
	echo ' <meta http-equiv="refresh" content="3; url=theme.php" /> ������ɣ�3����Զ��ص��������ҳ��';
}

?>