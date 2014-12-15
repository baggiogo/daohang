<?php
include('../header.inc.php');

$host = $_SERVER['HTTP_HOST'];
$uri = $_SERVER['REQUEST_URI'];
//if (preg_match('/^([0-9a-z]+).taoku.com$/', $host, $matches)) {
	//$site = $matches[1];
	$site = 'tuan';
		/* 
		shop,taobao,hg,dazhe....
		*/
	if($site != '' && $site != 'www'){
		$controller = $site;
		if($uri != '' && $uri != '/'){
			// list
			if(preg_match('/^\/([0-9a-z]+)\-(\d+)\-(\d+)\.htm.*$/', $uri, $matches)){
				header("location:http://www.5w.com/404.html");
				$action = $matches[1];
				$params['cid'] = $matches[2];
				$params['page'] = $matches[3];
			}
			// detail
			if(preg_match('/^\/(\w+)\.htm.*$/', $uri, $matches)){
				$action = 'detail';
				$params['id'] = $matches[1];
			}
		}
	}
//}


$controller = isset($_GET['c']) ? $_GET['c'] : (isset($controller) ? $controller : 'index');
$action     = isset($_GET['a']) ? $_GET['a'] : (isset($action) ? $action : 'index');
$params['cid'] = isset($_GET['cid']) ? $_GET['cid']:'';

$params['controller'] = $controller;
$params['action']     = $action;

require_once CONTROLLER_PATH . 'tuan/abstractController.php';

$classname  = $controller.'Controller';
$actionName = $action.'Action';

$filePath   = CONTROLLER_PATH . 'tuan/'. $classname.'.php';
if (file_exists($filePath)){
	include_once $filePath;
	
	if (class_exists($classname, false)){
		$controllerObj = new $classname;
		if (method_exists($controllerObj, $actionName)){
		    $controllerObj->$actionName();
			$objC->Close();
		}else{
		    exit('method not exists!');
		}
	}else{
	    exit('controller class not exists!');
	}
}else{
    exit('file not exists!');
}