<?php
require_once('../header.inc.php');

$req = addSlash($_GET);
$act = isset($req['act']) ? $req['act'] : '';
$p = isset($req['p']) ? $req['p'] : '';
$module = isset($req['module']) ? $req['module'] : '';

$objS->assign('sets', $sets);

function AddAdminLog($actStr){
	global $objC;
	$sql = 'INSERT INTO '.DBPREFIX.'admin_log (cDate,masterMail,actStr,actIP,actPage) VALUES ("'.time().'","'.$_SESSION['sMaster']['masterMail'].'","'.$actStr.'","'.GetIP().'","'.$_SERVER['PHP_SELF'].'")';
	$objC -> RunQuery($sql);
}
$files = array(
'index.tpl' => '��ҳ',
'index_kp.tpl' => '������ҳ',
'sub.tpl' => '���ർ��ҳ',
'apply.tpl' => '������¼',
'applyok.tpl' => '��¼�ύ�ɹ�',
'about.tpl' => '��������',
'404.tpl' => '404ҳ��',
'message.tpl' => '�û�����',
'footer.tpl' => 'ҳ��',
'tianqi.tpl' => '����Ԥ��',
);