<?php
include('../class/mail/class.phpmailer.php');
class getPWDController extends abstractController {
	public function getpasswordAction(){
		if(isset($_POST) && isset($_POST['u']) && isset($_POST['t'])  && isset($_POST['m']) && isset($_POST['newpwd'])){
			$u = AddSlash($_POST['u']);
			$t = AddSlash($_POST['t']);
			$m = AddSlash($_POST['m']);
			$p = $_POST['newpwd'];
			$now = time();
			$sql = "SELECT userID,userMail,userPwd FROM ".DBPREFIX."members WHERE userID={$u}";
			$rs = $this->objC->GetRow($sql);
			if($now-$t <= 7*86400 && $rs){
				
				if($m==md5($rs['userPwd'].$t.$u.GETPWD_MASK)){
					$this->objC->RunQuery("UPDATE ".DBPREFIX."members SET userPwd='".Encrypt($p)."' WHERE userID=".$u);
					AlertMsg("�����޸ĳɹ������������ǣ�".$p,"http://".SITE_DOMAIN);
				}else{
					AlertMsg("��֤��������ʧЧ",-1);
				}
			}else{
				AlertMsg("����7�죬��������ʧЧ���򲻴��ڴ��û�",-1);
			}
		}
		if(isset($_POST) && isset($_POST['email']) && isset($_POST['doudou']) && isset($_POST['username'])){
			$username = AddSlash($_POST['username']);
			$doudou = AddSlash($_POST['doudou']);
			$email = AddSlash($_POST['email']);
			$sql = "SELECT m.userID,m.userMail,d.doudouID FROM ".DBPREFIX."members m LEFT JOIN ".DBPREFIX."members_doudou d on m.userID=d.userID WHERE userName='{$username}' and d.doudouID={$doudou}";
			$rs = $this->objC->GetRow($sql);
			if($rs){
				$this->objC->RunQuery("UPDATE ".DBPREFIX."members SET userMail='{$email}' WHERE userID=".$rs['userID']);	
			}else{
				AlertMsg("�������doudouID��������������",-1);
				exit;
			}
		}
		if(isset($_POST) && isset($_POST['username'])){
			$username = AddSlash($_POST['username']);
			$sql = "SELECT m.userID,m.userMail,m.userPwd FROM ".DBPREFIX."members m WHERE userName='{$username}'";
			$rs = $this->objC->GetRow($sql);
			if($rs){
				$email = $rs['userMail'];
				if($email){
					$t = time();
					$md5 = md5($rs['userPwd'].$t.$rs['userID'].GETPWD_MASK);
					$url = 'http://'.SITE_DOMAIN.'/i/?a=getpwd&t='.$t.'&u='.$rs['userID'].'&m='.$md5;
					$url = '��һ����ͨ�����������޸�������룺<a href="'.$url.'">'.$url.'</a>���ǵ��޸ĳɹ���ɾ�����ʼ�';
					/*
					$str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ132456789";
					$strSafeCode = '';
					for($i=1;$i<=6;$i++){
						$strSafeCode .= substr($str,rand(1,60),1);
					}
					$this->objC->RunQuery("UPDATE ".DBPREFIX."members SET userPwd='".Encrypt($strSafeCode)."' WHERE userID=".$rs['userID']);
					*/
					$title = '�޸������ʼ�';
					$content = $url;
					if(CHARSET=='gbk'){
						$title = iconv('gbk','utf-8',$title);
						$content = iconv('gbk','utf-8',$content);
					}
					//$content = '�����������ǣ�'.$strSafeCode.'����¼�ɹ�����ɾ�����ʼ���';
					
					if($this->_sendmail($email,$title,$content)){
						$info = "���ͳɹ������¼����".$rs['userMail']."��ȡ�޸��������ӣ�";
						$this->objS->assign('info', $info);
						$this->objS->assign('mailsendsucc', 'mailsendsucc');
						$this->objS->display('i/getpwd.tpl');
						//$info = iconv("UTF-8","GB2312",$info);
						//$url = "http://".SITE_DOMAIN;
						//AlertMsg($info,$url);
						exit;
					}
				}else{
						AlertMsg("��û���趨���䣬�޷���ȡ���룬����ϵ�ͷ���Ա����",$url);
				}
			}else{
				AlertMsg('�޴��û�',-1);
			}
		}
	}

	private function _sendmail($address,$title,$content){
		$mail             = new PHPMailer();
		$mail->CharSet = 'utf-8';
		$mail->IsSMTP(); // telling the class to use SMTP
		$mail->SMTPAuth   = true;                  // enable SMTP authentication
		$mail->Host       = MAILSERVER; // sets the SMTP server
		$mail->Port       = MAILPORT;                    // set the SMTP port for the GMAIL server
		$mail->Username   = MAILUSERNAME; // SMTP account username
		$mail->Password   = MAILPASSWORD;        // SMTP account password
		$mail->SetFrom(MAILUSERNAME, MAILNICK);
		$mail->AddReplyTo(MAILUSERNAME, MAILNICK);
		$mail->Subject    = $title;
		$mail->MsgHTML($content);
		$mail->AddAddress($address, "");

		if(!$mail->Send()) {
		  return false;
		}
		return true;
	}
}