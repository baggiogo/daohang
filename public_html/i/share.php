<?php
require("../header.inc.php");
ini_set('display_errors','off');
require_once CONTROLLER_PATH . 'abstractController.php';
class share extends abstractController
{
    public function indexAction()
    {
    	//http://www.5w.com/i/share.php?url=http://www.taoku.com&title=�Կ���
    	//�ж�COOKIE
    	$url = addSlash($_REQUEST['url']);
    	$title = addSlash($_REQUEST['title']);
    	$navArr = array();
		if (!empty($_COOKIE['cUser']['userID'])) {
			$userID = GetCUserID();
			$sql = "SELECT userName FROM `".DBPREFIX."members` WHERE `userID` = ".$userID;
			$uname = $this->objC->GetOne($sql);
			$dstatus = $this->objC->GetOne("SELECT dstatus FROM ".DBPREFIX."members WHERE userID=".$userID);
			if($dstatus){
				$sql = "SELECT navID,navName FROM `".DBPREFIX."tag_site_nav` WHERE `userID` = $userID ORDER by navSort ASC";
				$navArr = $this->objC->GetAll($sql);
			}else{
				$sql = "SELECT stpID as navID,stpName as navName FROM `".DBPREFIX."defaultsitetype` ORDER by stpSort ASC";
				$navArr = $this->objC->GetAll($sql);
			}
		}
 		if($_GET['act'] == 'slogin')
        {
	    	$url = $_POST['url'];
	    	$title = $_POST['title'];
        	$userName = $_REQUEST['tbUserName'];
        	$userPwd  = $_REQUEST['tbUserPwd'];
        	$cookie   = $_REQUEST['scookie'];
            if(!preg_match("/^[0-9a-zA-Z]+$/", $userName)){
            	AlertMsg("�Բ����û���ֻ������ĸ��������ϣ�","-1");
            }

        	$sql = "SELECT * FROM `".DBPREFIX."members` WHERE `userName` = '".addSlash($userName)."' AND `userPwd` = '".md5($userPwd)."' AND `from` = '5w'";
        	$arrRow = $this->objC->GetRow($sql);

        	if($arrRow)
        	{
        		if($arrRow['userStatus'] == "0"){
        			AlertMsg('�Բ��������ʺ�������������ϵ�ͷ���Ա��',"-1");
        		}
        		//����COOKIE
        		if($cookie == "1"){
        			setcookie("cUser[userID]",$arrRow['userID']."\t".MDCUserPwd($arrRow['userPwd']),COOK_LIFE, '/', WEB_HOST);
        			setcookie("cUser[domain]",$arrRow['domain']."\t".MDCUserPwd($arrRow['userPwd']),COOK_LIFE, '/', WEB_HOST);
        		}else{
        			setcookie("cUser[userID]",$arrRow['userID']."\t".MDCUserPwd($arrRow['userPwd']),NULL, '/', WEB_HOST);
        			setcookie("cUser[domain]",$arrRow['domain']."\t".MDCUserPwd($arrRow['userPwd']),NULL, '/', WEB_HOST);
        		}
				$headerurl = 'http://'.SITE_DOMAIN.'/i/share.php?url='.$url.'&title='.$title;
        		header('location:'.$headerurl);exit;
        	}
        	else {
        		AlertMsg('�Բ��𣬵�½ʧ�ܣ����������ʺź����룡',"-1");
        	}
        }
	    $url = iconv("utf-8","gbk",$url) ? iconv("utf-8","gbk",$url) : $url;
		$title = iconv("utf-8","gbk",$title) ? iconv("utf-8","gbk",$title) : $title;
		$this->objS->assign('uname',$uname);
		$this->objS->assign('navArr',$navArr);
		$this->objS->assign('url',$url);
		$this->objS->assign('title',$title);
	    $this->objS->display('i/share.tpl');
    }
    public function sregAction(){
    	$url = addSlash($_REQUEST['url']);
    	$title = addSlash($_REQUEST['title']);
    	if($_POST['regsub']){
	        $userMail = isset($_REQUEST['mail']) ? $_REQUEST['mail'] : '';
	        $userName = $_REQUEST['uname'];
	        $userPwd  = $_REQUEST['pass'];     
	        if(!preg_match("/^[0-9a-zA-Z]{3,}$/", $userName)){
	        	AlertMsg("�Բ����û���ֻ������ĸ���������,�ҳ����������ַ����ϣ�",-1);
	        }
    		if(empty($userPwd) || empty($userMail)){
				AlertMsg("�Բ�����������䲻��Ϊ�գ�",-1);
			}
	        $userName = addSlash($userName);
	        $userName = strtolower($userName);
	        $userMail = addSlash($userMail);

	        $sql = "SELECT count(*) as ct FROM ".DBPREFIX."members WHERE userName = '".$userName."'";
	        $ct = $this->objC -> GetOne($sql);
	        $darkNameContent = file_get_contents(ROOT . 'darkName.txt');
	        $arrDarkNames = preg_split("/\n/", $darkNameContent);

	        if($ct || in_array($userName, $arrDarkNames)){
	        	AlertMsg('�Բ���,���û����Ѿ���ע�ᣬ�뻻һ�����ԣ�',"-1");
	        	exit();
	        }

	        $getIP = GetIP();
			$domain = $userName;
	$sql = "INSERT INTO `".DBPREFIX."members` (`userID`, `userMail`, `userName`, `userPwd`, `userLoginTimes`, `userLastIP`, `userStatus`, `userLastDate`, `userRegDate`, `userRegIP`, `from`, `domain`) VALUES (NULL, '".$userMail."', '".$userName."', '".md5($userPwd)."', '1', '".$getIP."', '1', '".time()."', '".time()."', '".$getIP."', '5w', '".$domain."');";
	//		echo $sql;exit;
	        $this->objC -> RunQuery($sql);
	        if($this->objC -> GetAffectedRows() <= 0){
	        	AlertMsg('�Բ���ע��ʧ�ܣ����Ժ����ԣ�',"-1");
	        	exit();
	        }
	        $userID = $this->objC->GetInsertId();
	        //����COOKIE

	        setcookie("cUser[userID]",$userID."\t".MDCUserPwd(md5($userPwd)), COOK_LIFE, '/', WEB_HOST);
	        setcookie("cUser[domain]",$domain."\t".MDCUserPwd(md5($userPwd)), COOK_LIFE, '/', WEB_HOST);

			$headerurl = 'http://'.SITE_DOMAIN.'/i/share.php?url='.$url.'&title='.$title;
	        header('location:'.$headerurl);exit;
    	}
    	$this->objS->assign('fromshare','1');
		$this->objS->assign('url',$url);
		$this->objS->assign('title',$title);
	    $this->objS->display('i/reg.tpl');
    }
    public function slogoutAction(){
    	$url = addSlash($_REQUEST['url']);
    	$title = addSlash($_REQUEST['title']);
        setcookie("cUser[userID]",'0',null, '/', WEB_HOST);
        setcookie("cUser[domain]",'0',null, '/', WEB_HOST);
        setcookie("cUser","",null, '/', WEB_HOST);
		$headerurl = 'http://'.SITE_DOMAIN.'/i/share.php?url='.$url.'&title='.$title;
	    header('location:'.$headerurl);exit;
    }
    public function addAction()
    {
        $tagID  = GetCUserID();
        $domain = GetCUserDomain();
    	$siteUrl = stripSlash($_POST['url']);
    	$siteName = stripSlash($_POST['title']);
    	$navID = intval($_POST['nav']);
        $siteUrl  = str_replace('http://', '', $siteUrl);
        $siteUrl  = preg_replace("/\/$/", '', $siteUrl);
		if($_POST){
	        if (!empty($tagID))
	        {
	        	$dstatus = $this->objC->GetOne("SELECT dstatus FROM ".DBPREFIX."members WHERE userID={$tagID}");
	        	if($dstatus == 0){
			        $newcache = new FileCache();
					$cachedate = $newcache->getCache(CACHE_PATH.'data/','default.data',0);
					if($cachedate!==false){
		            	$siteList = json_decode(unserialize($cachedate), true);
		            	$sites = array_utf8_to_gbk($siteList);
		            	$navID = $this->runInsertSite($navID, $tagID, $sites);
					}else{
		        		$sql = "insert into `".DBPREFIX."tag_site_nav`(`navID`,`userID`,`navName`,navImg,navSort) values (NULL,$tagID,'Ĭ�Ϸ���','z_0.gif',1)";
			        	$result = $this->objC->RunQuery($sql);
			        	$navID = $this->objC->GetInsertId();
					}
		        	if($navID){
					    $sql = "INSERT INTO ".DBPREFIX."tag_site_url (siteID, siteName, siteUrl, userID, usedate,siteSort,navID) VALUES(NULL, '$siteName', '$siteUrl', $tagID, '".time()."',100,$navID)";
					    $result = $this->objC->RunQuery($sql);
		        	}
	        	}else{
		        	if($navID){
			            $sql = "INSERT INTO ".DBPREFIX."tag_site_url (siteID, siteName, siteUrl, userID, usedate,siteSort,navID) VALUES(NULL, '$siteName', '$siteUrl', $tagID, '".time()."',100,$navID)";
			            $result = $this->objC->RunQuery($sql);		        		
		        	}else{
		        		$sql = "insert into `".DBPREFIX."tag_site_nav`(`navID`,`userID`,`navName`,navImg,navSort) values (NULL,$tagID,'Ĭ�Ϸ���','z_0.gif',1)";
		        		$result = $this->objC->RunQuery($sql);
		        		if($result){
			        		$navID = $this->objC->GetInsertId();
			        		$sql = "update ".DBPREFIX."tag_site_url set navID = $navID where userID = $tagID";
		        			$this->objC->RunQuery($sql);
				            $sql = "INSERT INTO ".DBPREFIX."tag_site_url (siteID, siteName, siteUrl, userID, usedate,siteSort,navID) VALUES(NULL, '$siteName', '$siteUrl', $tagID, '".time()."',100,$navID)";
				            $result = $this->objC->RunQuery($sql);
		        		}
		        	}
	        	}
	            if (!$result) {
	                echo "<script type=\"text/javascript\">alert(\"�Բ���,д��վ����Ϣʧ��,���Ժ�����!\");window.close();</script>";
	            }else{
		            //-------------------------------------ͬ������΢��������㲥������״̬---fengguanxing 2010.12.15
					$text = "#�����ղؼ�# ����5w!���Ե���������һ���������վ��#".$siteName."# http://".$domain.".5w.com";
					$text = addslashes($text);
	//				$text = iconv('gbk', 'utf-8', $text);
					$sql = "SELECT sina,renren,douban,qq FROM `".DBPREFIX."members` WHERE `userID` = '".$tagID."'";
					$bindarr = $this->objC->GetRow($sql);
					if(!empty($bindarr)){
						$sql = 'insert into '.DBPREFIX.'members_addsite(id,userID,bfrom,content) values';
						$sqls='';
						if($bindarr['renren']){
							$sqls .= "(NULL,'".$tagID."','renren','".$text."'),";
						}
						if($bindarr['sina']){
							$sqls .= "(NULL,'".$tagID."','sina','".$text."'),";
						}
						if($bindarr['douban']){
							$sqls .= "(NULL,'".$tagID."','douban','".$text."'),";
						}
						if($bindarr['qq']){
							$sqls .= "(NULL,'".$tagID."','qq','".$text."'),";
						}
						if(!empty($sqls)){
							$sqls = substr($sqls, 0, -1);
							$sql = $sql.$sqls;
							$this->objC->RunQuery($sql);
						}
					}
					if(CACHE_USE){
						$childpath = FileCache::getDir($tagID);
			            unlink(CACHE_PATH.$childpath.'/'.$tagID.'.data');
					}
					$this->objC->RunQuery("UPDATE ".DBPREFIX."members SET dstatus=1 WHERE userID={$tagID}");
					$this->objS->display('i/share_ok.tpl');
					echo "<script type=\"text/javascript\">window.setTimeout('window.close();', 3000);</script>";
	            }
	        }
	        else {
	            echo "<script type=\"text/javascript\">alert(\"�Բ���,����ʧЧ,�����µ�¼!\");window.close();</script>";
	        }
		}
    }
    public function runInsertSite($navID,$userID,$sites)
    {
		$nid = $navID;
    	if(isset($sites['ct']) && is_array($sites['ct'])){
    		foreach ($sites['ct'] as $site){
    			$i = 1;
    			$values = array();
    			$navName = $site['te'];
    			$navImg = $site['tg'];
    			$navSort = $site['tt'];
    			$stpid = $site['td'];
    			$sql = "INSERT INTO `".DBPREFIX."tag_site_nav` (`navID` ,`userID` ,`navName`,navImg,navSort)VALUES (NULL , '{$userID}', '".$navName."','".$navImg."','{$navSort}');";
    			$this->objC->RunQuery($sql);
    			$navID = $this->objC->GetInsertId();
    			if($nid == $stpid){
    				$tagID = $navID;
    			}
    			if(!empty($site['ss'])){
	    			foreach ($site['ss'] as $s){
	    				$values[] = "(NULL, '{$s['se']}', '{$s['sl']}', '$userID', '$navID',".($i++).",".time().")";
	    			}
	    			$sql  = "INSERT INTO ".DBPREFIX."tag_site_url (siteID, siteName, siteUrl, userID,navID,siteSort,usedate) VALUES ";
	            	$sql .= implode(',', $values);
	            	$this->objC->RunQuery($sql);
    			}
    		}
    		return $tagID;
    	}
    	return false;
    }    
}
$action     = isset($_GET['a']) ? $_GET['a'] : 'index';
$classname  = "share";
$controllerObj = new $classname;
$actionName = $action.'Action';
if (method_exists($controllerObj, $actionName))
	$controllerObj->$actionName();
else
	die('���Ӵ���');
?>