<?php
require("header.inc.php");
ChkAdminLogin();
require("zip.php");
require_once CONTROLLER_PATH . 'abstractController.php';
class adminUpdate extends abstractController
{
	function indexAction(){

	}
	function downloadAction(){
		$uptime = $_POST['uptime'];
		if($_POST['sub'] && $uptime){
			$file_succ = array();
			$file_fail = array();
			foreach($uptime as $upname){
				$file_name = $upname.".zip";
				$file_dir = "http://download.5w.com/update/";
				$file = @fopen($file_dir . $file_name,"rb");
				if ($file){
					//Header("Content-type: application/octet-stream");Header("Content-Disposition: attachment; filename=" . $file_name);
					$fp = @fopen("../data/update/".$file_name,"wb");
					if($fp===false){
						$file_fail[] = $file_name;
					}else{
						while (!feof($file)) {
							$content = fread($file,1024000);
							$fw = fwrite($fp,$content);
						}
						if($fw===false){
							$file_fail[] = $file_name;
						}else{
							$file_succ[] = $file_name;
						}
					}
					fclose($fp);
				}
				fclose($file);
			}
		}elseif($_POST['misssub'] && $uptime){
			$sql = "UPDATE `".DBPREFIX."site_setting` SET `misver`= ".max($uptime);
			$rs = $this->objC->RunQuery($sql);
			if($rs)
				AlertMsg('�����ɹ�','-1');
			else
				AlertMsg('����ʧ��','-1');
		}
		$this->objS->assign("file_succ",$file_succ);
		$this->objS->assign('update','1');
		if(!empty($file_fail)){$this->objS->assign("file_fail",$file_fail);}
		$this->objS->display('admin/downlist.tpl');
	}
	function downloaddataAction(){
		$updata = $_POST['updata'];
		if($_POST['submit'] && $updata){
			$data_succ = array();
			$data_fail = array();
			foreach($updata as $upname){
				$file_name = $upname.".sql";
				$file_dir = "http://download.5w.com/update/";
				$file = @fopen($file_dir . $file_name,"rb");
				if ($file){
					//Header("Content-type: application/octet-stream");Header("Content-Disposition: attachment; filename=" . $file_name);
					$fp = @fopen("../data/update/sql/".$file_name,"wb");
					if($fp===false){
						$data_fail[] = $file_name;
					}else{
						while (!feof($file)) {
							$content = fread($file,1024000);
							$fw = fwrite($fp,$content);
						}
						if($fw===false){
							$data_fail[] = $file_name;
						}else{
							$data_succ[] = $file_name;
						}
					}
					fclose($fp);
				}
				fclose($file);
			}
		}elseif($_POST['misssub'] && $updata){
			$sql = "UPDATE `".DBPREFIX."site_setting` SET `misdataver`= ".max($updata);
			$rs = $this->objC->RunQuery($sql);
			if($rs)
				AlertMsg('�����ɹ�','-1');
			else
				AlertMsg('����ʧ��','-1');
		}
		$this->objS->assign("data_succ",$data_succ);
		$this->objS->assign('update','2');
		if(!empty($data_fail)){$this->objS->assign("data_fail",$data_fail);}
		$this->objS->display('admin/downlist.tpl');
	}
	function applyAction(){
		if($_POST['sub'] && $_POST['upfiles']){
			$upfiles = $_POST['upfiles'];
			foreach($upfiles as $upfile){
				$version[] = substr($upfile,0,8);
				$filepath='../data/update/'.$upfile;

				$z = new Zip;
				$r = $z-> Extract($filepath,"../");
				clearstatcache();
				if($r == -1){
					$url = "http://".SITE_DOMAIN."/admin/main.php";
					AlertMsg('��ѹʧ�ܣ����ֶ���ѹ�ϴ�����!',$url);
				}
//				$zip = new ZipArchive();
//				$rs = $zip->open($filepath);
//				if($rs){
//					$r = $zip->extractTo('../');
//					$zip->close();
//				}
//				if(!$r || !$rs){
//					$url = "http://".SITE_DOMAIN."/admin/main.php";
//					AlertMsg('�Բ��𣬰�װʧ�ܣ����ֶ���ѹ����!',$url);
//				}
			}
			$sqlpath = "../data/update/";
			if($handle = opendir($sqlpath)){
				while(false !== ($file = readdir($handle))){
					if(preg_match("/(.*)\.sql$/i",$file,$match) && $file != '.' && $file != '..'){
						$sqlfile[] = $file;
					}elseif(preg_match("/(.*)\.php/i",$file,$match) && $file != '.' && $file != '..'){
						$phpfile[] = $file;
					}
				}
			}
			if(!empty($sqlfile)){
				$sqldata = '';
				foreach($sqlfile as $sfile){
					$sfile = $sqlpath.$sfile;
					if(!is_readable($sfile)) {
						echo '���ݿ��ļ���ȡ<font color="red">ʧ��</font>,���ֶ�ִ��data/update/��sql�ļ�';
						break;
					}
					$fp = fopen($sfile, 'rb');
					$data = fread($fp, filesize($sfile));
					fclose($fp);
					unlink($sfile);
					$sqldata .="\n".$data;
				}
				if(!empty($sqldata)){
					$sql = str_replace("\r", "\n", $sqldata);
					$ret = array();
					$num = 0;
					foreach(explode(";\n", trim($sql)) as $query) {
						$queries = explode("\n", trim($query));
						foreach($queries as $query) {
							$ret[$num] .= ($query[0] == '#' ? '' : $query);
						}
						$num++;
					}
					unset($sql);
					foreach($ret as $query) {
						$query = trim($query);
						if($query) {
							if(substr($query, 0, 12) == 'CREATE TABLE') {
								$name = preg_replace("/CREATE TABLE IF NOT EXISTS `([a-z0-9_]+)` .*/is", "\\1", $query);
								$query = preg_replace("/CREATE TABLE IF NOT EXISTS `([a-z0-9_]+)` (.*)/is", "CREATE TABLE IF NOT EXISTS `".DBPREFIX."\\1` \\2", $query);
							} else if(substr($query, 0, 10) == 'DROP TABLE'){
								$name = preg_replace("/DROP TABLE IF EXISTS `([a-z0-9_]+)`/is","\\1",$query);
								$query = preg_replace("/DROP TABLE IF EXISTS `([a-z0-9_]+)`/is","DROP TABLE IF EXISTS `".DBPREFIX."\\1`",$query);
							}else if(substr($query, 0, 6) == 'UPDATE'){
								$name = preg_replace("/UPDATE `([a-z0-9_]+)`/is","\\1",$query);
								$query = preg_replace("/UPDATE `([a-z0-9_]+)`/is","UPDATE `".DBPREFIX."\\1`",$query);
							}else if(substr($query, 0, 5) == 'ALTER'){
								$name = preg_replace("/ALTER TABLE `([a-z0-9_]+)`/is","\\1",$query);
								$query = preg_replace("/ALTER TABLE `([a-z0-9_]+)`/is","ALTER TABLE `".DBPREFIX."\\1`",$query);
							}else if(substr($query, 0, 6) == 'DELETE'){
								$name = preg_replace("/DELETE FROM `([a-z0-9_]+)`/is","\\1",$query);
								$query = preg_replace("/DELETE FROM `([a-z0-9_]+)`/is","DELETE FROM `".DBPREFIX."\\1`",$query);
							}else {
								$name = preg_replace("/INSERT INTO `([a-z0-9_]+)` .*/is","\\1",$query);
								$query = preg_replace("/INSERT INTO `([a-z0-9_]+)` (.*)/is","INSERT INTO `".DBPREFIX."\\1` \\2",$query);
							}
							$r = $this->objC->RunQuery($query);
							if(!$r){
								$url = "http://".SITE_DOMAIN."/admin/main.php";
								AlertMsg('sqlִ��ʧ�ܣ����ֶ���װ!',$url);
							}
						}
					}
				}
			}
			if(!empty($phpfile)){
				foreach($phpfile as $phpf){
					$php = $sqlpath.$phpf;
					if(!is_readable($php)) {
						echo 'php�ļ�ִ��<font color="red">ʧ��</font>,���ֶ�ִ��data/update/��php�ļ�';
						break;
					}
					$url = "http://".SITE_DOMAIN."/data/update/".$phpf;
					getContent($url);
					unlink($php);
				}
			}
			$sql = "UPDATE `".DBPREFIX."site_setting` SET `ver`= ".max($version);
			$this->objC->RunQuery($sql);
			$url = "http://".SITE_DOMAIN."/admin/main.php";
			AlertMsg('��װ���!',$url);
		}
	}
	function applydataAction(){
		if($_POST['submit'] && $_POST['updata']){
			$upfiles = $_POST['updata'];
			$sqldata = '';
			foreach($upfiles as $upfile){
				$dversion[] = substr($upfile,0,8);
				$upfile='../data/update/sql/'.$upfile;
				if(!is_readable($upfile)) {
					echo '���ݿ��ļ���ȡ<font color="red">ʧ��</font>,�����н���phpmyadmin����sql�ļ�����';
					break;
				}
				$fp = @fopen($upfile,'rb');
				$data = fread($fp,filesize($upfile));
				fclose($fp);
				unlink($upfile);
				$sqldata .="\n".$data;
			}
			if(!empty($sqldata)){
				$sql = str_replace("\r", "\n", $sqldata);
				$ret = array();
				$num = 0;
				foreach(explode(";\n", trim($sql)) as $query) {
					$queries = explode("\n", trim($query));
					foreach($queries as $query) {
						$ret[$num] .= ($query[0] == '#' ? '' : $query);
					}
					$num++;
				}
				unset($sql);
				foreach($ret as $query) {
					$query = trim($query);
					if($query) {
						if(substr($query, 0, 12) == 'CREATE TABLE') {
							$name = preg_replace("/CREATE TABLE IF NOT EXISTS `([a-z0-9_]+)` .*/is", "\\1", $query);
							$query = preg_replace("/CREATE TABLE IF NOT EXISTS `([a-z0-9_]+)` (.*)/is", "CREATE TABLE IF NOT EXISTS `".DBPREFIX."\\1` \\2", $query);
						} else if(substr($query, 0, 10) == 'DROP TABLE'){
							$name = preg_replace("/DROP TABLE IF EXISTS `([a-z0-9_]+)`/is","\\1",$query);
							$query = preg_replace("/DROP TABLE IF EXISTS `([a-z0-9_]+)`/is","DROP TABLE IF EXISTS `".DBPREFIX."\\1`",$query);
						}else if(substr($query, 0, 6) == 'UPDATE'){
							$name = preg_replace("/UPDATE `([a-z0-9_]+)`/is","\\1",$query);
							$query = preg_replace("/UPDATE `([a-z0-9_]+)`/is","UPDATE `".DBPREFIX."\\1`",$query);
						}else if(substr($query, 0, 5) == 'ALTER'){
							$name = preg_replace("/ALTER TABLE `([a-z0-9_]+)`/is","\\1",$query);
							$query = preg_replace("/ALTER TABLE `([a-z0-9_]+)`/is","ALTER TABLE `".DBPREFIX."\\1`",$query);
						}else if(substr($query, 0, 6) == 'DELETE'){
							$name = preg_replace("/DELETE FROM `([a-z0-9_]+)`/is","\\1",$query);
							$query = preg_replace("/DELETE FROM `([a-z0-9_]+)`/is","DELETE FROM `".DBPREFIX."\\1`",$query);
						}else {
							$name = preg_replace("/INSERT INTO `([a-z0-9_]+)` .*/is","\\1",$query);
							$query = preg_replace("/INSERT INTO `([a-z0-9_]+)` (.*)/is","INSERT INTO `".DBPREFIX."\\1` \\2",$query);
						}
						$this->objC->RunQuery($query);
					}
				}
			}
			$sql = "UPDATE `".DBPREFIX."site_setting` SET `dataver`= ".max($dversion);
			$this->objC->RunQuery($sql);
			$url = "http://".SITE_DOMAIN."/admin/main.php";
			AlertMsg('��װ���!',$url);
		}
	}
}
$action     = isset($_GET['a']) ? $_GET['a'] : 'index';
$classname  = "adminUpdate";
$controllerObj = new $classname;
$actionName = $action.'Action';
if (method_exists($controllerObj, $actionName))
	$controllerObj->$actionName();
else
	die('���Ӵ���');
?>
