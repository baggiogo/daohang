<?php
session_cache_limiter('private,must-revalidate');
require("header.inc.php");
ChkAdminLogin();
$viewadmin_ad = "";
$sMasterAct = $_SESSION['sMaster']['masterAct'];
if (preg_match('["viewadmin_ad"]','"'.$sMasterAct.'"')) {
    $viewadmin_ad = "true";
}

$objC = new Conn();

$act = isset($_GET['act'])?$_GET['act']:'';
if ($act== 'update'){
	$autoID = isset($_GET['autoID'])?$_GET['autoID']:0;
	$sql = "select * from ".DBPREFIX."admin_ad where autoID = ".$autoID;
	$adCon = $objC->GetRow($sql);
	$objS->assign("adCon",$adCon);
	if(isset($_POST['upAd'])){
    	AddAdminLog("�޸Ĺ��");
    	$autoID = $_POST['autoID'];
		$adContent = addslashes($_POST['adContent']);
		$adOrders  = $_POST['adOrders'];
		$adStatus = $_POST['adStatus'];
    	$sql = "UPDATE `".DBPREFIX."admin_ad` SET `content` = '".$adContent."', `orders` = '".$adOrders."', `status` = '".$adStatus."' WHERE `autoID` =".$autoID;
    	$objC->RunQuery($sql);
		if($objC -> GetAffectedRows() < 0){
			AlertMsg("����ʧ�ܣ�","adminAd_4.php");
		}else{
			AlertMsg("�����ɹ��� ע�⣺�뵽 [���ɾ�̬] ��Ŀ������������ҳ!","adminAd_4.php");
		}
    }
}else if($act == 'add'){
	if($_POST['addAd']){
		AddAdminLog("��ӹ��");
		$adContent = addslashes($_POST['adContent']);
		$adOrders  = $_POST['adOrders'];
		$adStatus = $_POST['adStatus'];
		$adID = $_POST['adID'];
		$adTitle = $_POST['adTitle'];
		$adWide = $_POST['adWide'];
		$adHigh = $_POST['adHigh'];
		$sql="INSERT INTO ".DBPREFIX."admin_ad (`id`, `title`, `content`, `orders`, `status`, `wide`, `high`) VALUES ('$adID', '$adTitle', '$adContent', '$adOrders', '$adStatus', '$adWide', '$adHigh');";
		$objC -> RunQuery($sql);
		if($objC -> GetAffectedRows() < 0){
			AlertMsg("����ʧ�ܣ�","adminAd_4.php");
		}else{
			AlertMsg("�����ɹ��� ע�⣺�뵽 [���ɾ�̬] ��Ŀ������������ҳ!","adminAd_4.php");
		}
	}
}else if($act == 'updateAll'){
	if($_POST['upAdAll']){
    	AddAdminLog("�޸Ĺ��");
		$idArr = $_POST['hidMid'];
		$contentArr = $_POST['content'];
		$ordersArr = $_POST['orders'];
		$statusArr = $_POST['adStatus'];
		foreach($idArr as $id){
			$statusArr[$id] = isset($statusArr[$id]) ? '1' : '0';
	    	$sql = "UPDATE `".DBPREFIX."admin_ad` SET `content` = '".addslashes($contentArr[$id])."', `orders` = '".$ordersArr[$id]."', `status` = '".$statusArr[$id]."' WHERE `autoID` =".$id;
	    	$objC->RunQuery($sql);
		}
		if($objC -> GetAffectedRows() < 0){
			AlertMsg("����ʧ�ܣ�","adminAd_4.php");
		}else{
			AlertMsg("�����ɹ��� ע�⣺�뵽 [���ɾ�̬] ��Ŀ������������ҳ!","adminAd_4.php");
		}
    }
}else{
    $arrSearchField = array("id"=>"ID",
						"title"=>"����",
						"wide"=>"��",
    					"high"=>"��",
						"content"=>"�������",
    					"orders"=>"˳��",
						"status"=>"״̬",
						);

    $objS->assign("arrSearchField",$arrSearchField);


    $ct = 'SELECT count(*) as ct FROM '.DBPREFIX.'admin_ad WHERE 1=1 and id="index04"';
    $sql = 'SELECT * FROM '.DBPREFIX.'admin_ad WHERE 1=1 and id="index04" order by orders ASC';

    $req = addSlash($_GET);


    $where_condition = "";


    $sql .= $where_condition;
    $ct .= $where_condition;


    //echo $sql;
    if($recordCount = $objC->GetOne($ct)) {
        if($recordCount){
            $objP = new Pager($recordCount);
            $arrLimit = $objP->GetLimit();
            $result = $objC->SelectLimit($sql,$arrLimit[1],$arrLimit[0]);
            while ($arrRow = $objC->FetchRow($result)) {
                $arradmin_ad[] = $arrRow;
            }
            $objS->assign("pager",$objP->ShowMain().$objP->ShowNum());
            $objS->assign("arradmin_ad",$arradmin_ad);
        }
    }
}
$adImgPath = '../static/images/ad5.jpg';
$objS->assign("adImgPath",$adImgPath);
$objS->assign("viewadmin_ad",$viewadmin_ad);

require("footer.inc.php");
$objS->display("admin/admin_ad.tpl");