<?php
include('header.inc.php');
if(isset($_GET['act']) && $_GET['act'] == 'getTab'){
	$iid = addSlash($_GET['iid']);
	$sql = "SELECT iiframe FROM `".DBPREFIX."index_setting` where `iid` = ".$iid;
	$iif = $objC->GetOne($sql);
	$iif = htmlspecialchars_decode(stripslashes($iif));
	$iif = iconv("GBK","UTF-8",$iif);
	echo json_encode($iif);
}elseif(isset($_GET['act']) && $_GET['act'] == 'getsearch'){
	$sid = addSlash(isset($_GET['sid'])?$_GET['sid']:0);
    // ��������
	$sql = "SELECT * FROM `".DBPREFIX."search` WHERE `class`=$sid ORDER BY `sort` ASC";
    $search = $objC->getAll($sql);
//	echo json_encode(array_gbk_to_utf8($search));
	//Ĭ������
	$sql = "SELECT * FROM `".DBPREFIX."search` WHERE `class`=$sid and is_default=1";
    $defaultsearch = $objC->getRow($sql);
//	echo json_encode(array_gbk_to_utf8($defaultsearch));
    $search_params = explode(",",$defaultsearch['params']);
    $i=0;
    if(!empty($search_params)){
	    foreach($search_params as $p){
	    	$params[$i] = explode(":",$p);   //sort:'0', array(0=>sort,1=>'0')
	    	$i++;
	    }
    	$result['params'] = $params;
    }
    $result['i'] = $i;
    $result['search'] = $search;
    $result['def'] = $defaultsearch;
	echo json_encode(array_gbk_to_utf8($result));
}elseif(isset($_GET['act']) && $_GET['act'] == 'getcon'){
	$id = addSlash($_GET['id']);
	$sql = "SELECT * FROM `".DBPREFIX."search` WHERE `id`=$id ";
	$con = $objC->GetRow($sql);
    $search_params = explode(",",$con['params']);
    if(!empty($search_params)){
    	$i=0;
	    foreach($search_params as $p){
	    	$params[$i] = explode(":",$p);   //sort:'0', array(0=>sort,1=>'0')
	    	$i++;
	    }
	    $result['params'] = $params;
    }
    $result['i'] = $i;
    $result['con'] = $con;
	echo json_encode(array_gbk_to_utf8($result));
}
if(!file_exists(ROOT . 'data/install.lock')){
	header("location: ./install/");
}
if(count($_GET)==0){
	if(is_file('index.htm'))
		include('index.htm');
	else
		die('���ȵ�¼�����̨���ɾ�̬�ļ�');
}
