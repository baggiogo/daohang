<?php
require("header.inc.php");
require_once CONTROLLER_PATH . 'abstractController.php';
class message extends abstractController
{
    public function indexAction()
    {
        $type = array('1'=>'��ҳ', '2'=>'��ѯ��ҳ', '3'=>'������ҳ', '5'=>'�Ƽ���Ϸ', '4'=>'����');
        $this->objS->assign('types', $type);

        $ct = 'SELECT count(*) as ct FROM '.DBPREFIX.'message WHERE reply is not null';
    		$sql = "SELECT distinct mid, ".DBPREFIX."message.type, ".DBPREFIX."message.title, content, contact, createDate, reply, urlfrom, stpName FROM ".DBPREFIX."message LEFT JOIN ".DBPREFIX."type_site ON (".DBPREFIX."message.urlfrom=".DBPREFIX."type_site.stpHtmlName AND ".DBPREFIX."type_site.stpHtmlName!='') WHERE reply is not null ";
    		if(isset($_GET) && isset($_GET['from'])){
    			if(!empty($_GET['from'])){
    				$f = addslashes(stripslashes(htmlspecialchars($_GET['from'])));
    				$this->objS->assign("urlfrom",$f);
    				$ct .= " AND urlfrom='{$f}'";
    				$sql .= " AND urlfrom='{$f}'";
    			}else{
    				$ct .= " AND urlfrom=''";
    				$sql .= " AND urlfrom=''";
    				$this->objS->assign("urlfrom",'');
    			}

    		}
    		$sql .= " ORDER BY mid DESC";
    		if($recordCount = $this->objC->GetOne($ct)) {
	        if($recordCount){
	            $objP = new Pager($recordCount);
	            $arrLimit = $objP->GetLimit();
	            $result = $this->objC->SelectLimit($sql,$arrLimit[1],$arrLimit[0]);
	            while ($arrRow = $this->objC->FetchRow($result)) {
	                $arrRow['typeName'] = $type[$arrRow['type']];
	                $arrMessage[] = $arrRow;
	            }
	            $this->objS->assign("pager",$objP->ShowMain().$objP->ShowNum());
	            $this->objS->assign("arrMessage",$arrMessage);
	        }
	    }
	    
	    $this->objS->assign('footer_path', 'theme/'.THEME_PATH.'footer.tpl');
	    $this->objS->display('theme/'.THEME_PATH.'message.tpl');
    }

    public function addAction()
    {
        $title   = addslashes(stripslashes(htmlspecialchars($_POST['title'])));
        $content = addslashes(stripslashes(htmlspecialchars($_POST['content'])));
        $contact = addslashes(stripslashes(htmlspecialchars($_POST['contact'])));
        $urlfrom = addslashes(stripslashes(htmlspecialchars($_POST['urlfrom'])));

        $type    = intval($_POST['type']);
        $yzm     = $_POST['yzm'];
        $re      = $_SERVER['HTTP_REFERER'];

        if ($re == '') {
            $re = 'message.php';
        }

    	if(ChkSafeCode($yzm)==false){
    		AlertMsg('�Բ������������֤�����',"-1");
    	}

        if (empty($type)) {
        	AlertMsg('�Բ�����ѡ���飡',"-1");
        }

    	if ($title == '') {
    		AlertMsg('�Բ���������ƺ���',"-1");
    	}

    	if ($content == '') {
    		AlertMsg('�Բ������������Խ��飡',"-1");
    	}

    	if ($contact == '') {
    		AlertMsg('�Բ�����������ϵ��ʽ��',"-1");
    	}
    	$time = time();
    	$sql = "INSERT INTO ".DBPREFIX."message (mid, type, title, content, contact, createDate, urlfrom) VALUES (null, '$type', '$title', '$content', '$contact', '$time', '$urlfrom')";
    	if ($this->objC->RunQuery($sql)) {
    	    AlertMsg('лл�������ԣ��������Խ�����˺���ʾ!',$re);
    	}
    	else {
    	   AlertMsg('�Բ�������ʧ��,���Ժ�����!',$re);
    	}
    }
}

$action     = isset($_GET['a']) ? $_GET['a'] : 'index';
$classname  = "message";
$controllerObj = new $classname;
$actionName = $action.'Action';
if (method_exists($controllerObj, $actionName))
	$controllerObj->$actionName();
else
	die('���Ӵ���');
?>