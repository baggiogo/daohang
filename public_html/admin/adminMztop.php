<?php
require("header.inc.php");
ChkAdminLogin();
$objC = new Conn();

$sql = "SELECT * FROM `".DBPREFIX."admin_ad` where id='mztop' order by orders ASC";
$data = $objC->GetAll($sql);
$objS->assign('data',$data);

$act = isset($_GET['act']) ? $_GET['act'] : '';
if($act == 'operate'){
	$autoIDarr = $_POST['autoID'];
	$orders = $_POST['orders'];
	$status = $_POST['status'];
	if(!empty($_POST['upsub'])){
		foreach($autoIDarr as $autoID){
			if($status[$autoID] == 'on'){
				$status[$autoID]=1;
			}else{$status[$autoID]=0;}
			$sql = "UPDATE `".DBPREFIX."admin_ad` SET `orders` = $orders[$autoID], `status` = $status[$autoID] WHERE `autoID` = ".$autoID;
			$objC->RunQuery($sql);
		}
		if($objC -> GetAffectedRows() < 0){
			AlertMsg('�Բ��𣬲���ʧ�ܣ�','-1');
		}
		else{
			AlertMsg('�����ɹ���','-1');
		}
	}
}elseif($act == 'delete'){
	$autoID = $_REQUEST['autoID'];
	$sql = "DELETE FROM `".DBPREFIX."admin_ad` WHERE `autoID` = $autoID";
	$objC->RunQuery($sql);
	if($objC -> GetAffectedRows() < 0){
		AlertMsg('�Բ��𣬲���ʧ�ܣ�','-1');
	}
	else{
		AlertMsg('�����ɹ���','-1');
	}
}elseif($act == 'update'){
	$autoID = isset($_REQUEST['autoID'])?$_REQUEST['autoID']:'';
	if($autoID){
	    $sql = "SELECT * FROM `".DBPREFIX."admin_ad` WHERE `autoID`= $autoID";
	    $data = $objC->GetRow($sql);
	    $objS->assign('data',$data);
	}
}elseif($act == 'save'){
	if(isset($_POST['savebtn'])){
		$form = $_POST['form'];
		$autoID = $form['autoID'];
		$title = $form['title'];
		$content = addSlashes($form['content']);
		$orders = $form['orders'];
		if($autoID){						//�޸�
			$sql = "UPDATE `".DBPREFIX."admin_ad` SET `title`='".$title."', `content`='".$content."', `orders`=$orders where `autoID` = $autoID";
			$objC->RunQuery($sql);
		}else{							//���
			$sql = "insert into `".DBPREFIX."admin_ad`(autoID,id,title,content,orders) VALUES(NULL,'mztop','".$title."','".$content."',$orders)";
			$objC->RunQuery($sql);
		}
		if($objC -> GetAffectedRows() < 0){
			AlertMsg('�Բ��𣬲���ʧ�ܣ�','-1');
		}
		else{
			AlertMsg('�����ɹ���','adminMztop.php');
		}
	}
}

require("footer.inc.php");
$objS -> display("admin/adminmztop.tpl");
?>
