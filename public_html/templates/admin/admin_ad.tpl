<?{include file="admin/header.tpl"}?>
<script language="javascript">
function showimg(){
	document.getElementById('showimg').style.display = 'block';
}
function removeimg(){
	document.getElementById('showimg').style.display = 'none';
}
function check(){
	var code = document.getElementById('code').value;
	var ord = document.getElementById('order').value;
	if(code == ''){
		alert("�����벻��Ϊ�գ�");
		return false;
	}
	var re=/^[0-9]+$/;
	var r = re.exec(ord);
	if (r == null){
		alert("�������Ϊ���֣�");
		return false;
	}
	htmlnotice(1);
	return true;
}
</script>
<?{if $smarty.get.act == "update"}?>
<div id="box">
<div class="right">
<form action="?act=update" method="post" onSubmit="if(confirm('ȷ��Ҫ������')){htmlnotice(1);return true;}else{return false;}" enctype="multipart/form-data">
<table width="100%" border="0" cellspacing="1" cellpadding="1" class="edit">
    <tr >
    <td class="title_edit">
     <h1>����޸�</h1>
   </td>
    </tr>
  <tr>
    <td class="edit_main">
      <table width="100%" border="0" cellspacing="1" cellpadding="1">
          <tr>
            <td width="19%" height="36"><div align="right">������:</div></td>
            <td width="81%" height="36"><label>
            <input name="autoID" type="hidden" value="<?{$adCon.autoID}?>"/>
            <input name="adID" type="hidden" value="<?{$adCon.id}?>"/>
            <input name="adTitle" type="hidden" value="<?{$adCon.title}?>"/>
            <input name="adSize" type="hidden" value="<?{$adCon.size}?>"/>
            <textarea name="adContent" style="width:100%; height:80px;"><?{$adCon.content|stripslashes}?></textarea>
              </label></td>
          </tr>
          <tr>
            <td height="36"><div align="right">���˳��:</div></td>
            <td height="36"><label>
              <input style="width:50px;" name="adOrders" type="text" value="<?{$adCon.orders}?>"/>
              </label></td>
          </tr>
           <tr>
            <td height="36"><div align="right">վ��״̬:</div></td>
            <td height="36"><input style="width:20px;" name="adStatus" type="radio" value="1" checked="checked" />����
            <input style="width:20px;" value="0" name="adStatus" type="radio" />������</td>
          </tr>
          <tr><td height="36">&nbsp;</td>
        <td height="36"><input type="submit" name="upAd" value="�޸�" class="button"/></td>
          </tr>
        </table></td>
    </tr>
  </table>
</form>
  <div class="clear"></div>
  </div>
<?{else}?>
 <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_list">
      <form action="?act=updateAll" method="post" onSubmit="if(confirm('ȷ��Ҫ������')){htmlnotice(1);return true;}else{return false;}">
      <tr>
          <td colspan="6" align="right"><input type="submit" name="upAdAll" value="�ύȫ��" class="button" /></td>
        </tr>
        <tr>
        <td width="5%" class="tr1">����</td>
          <td width="10%" class="tr1">����</td>
          <td width="5%" class="tr1">�ߴ�</td>
          <td width="65%" class="tr1">����</td>

          <td width="5%" class="tr1">����</td>
          <td width="5%" class="tr1" onclick="CheckedAll('chkDelID');">����</td>
        </tr>
        <?{foreach name=arrMessage item=list from=$arradmin_ad}?>
        <tr>
        	<td class="tr_a"><div align="center"><input style="width:20px;" type="text" name="orders[<?{$list.autoID}?>]" value="<?{$list.orders}?>"/></div></td>
          <input type="hidden" name="hidMid[<?{$list.autoID}?>]" value="<?{$list.autoID}?>" />
          <td class="tr_a"><div align="center"><?{$list.title}?></div></td>
          <td class="tr_a"><div align="center">��:<?{$list.wide}?><br/>��:<?{$list.high}?></div></td>
          <td class="tr_a"><div align="center">
          <textarea style="width:80%; height:80px;" name="content[<?{$list.autoID}?>]"><?{$list.content|stripslashes}?></textarea>
          <iframe title="���Ч��Ԥ��" src="adminAd.php?cid=<?{$list.autoID}?>" width="80%" height="60" align="middle" SCROLLING="auto" FRAMEBORDER="0"></iframe>
          </div></td>

            <?{if $list.status == 1}?>
            <td class="tr_a"><div align="center">
            <input style="width:20px;" type="checkbox" name="adStatus[<?{$list.autoID}?>]" checked="checked"/></td>
            <?{else}?>
           <td class="tr_a"><div align="center">
            <input style="width:20px;" type="checkbox" name="adStatus[<?{$list.autoID}?>]"/></div></td>
            <?{/if}?>
          <td class="tr_a"><div align="center"><a href="?autoID=<?{$list.autoID}?>&act=update"><font color='red'>�޸�</font></a></div></td>
        </tr>
        <?{/foreach}?>
        <tr>
          <td colspan="6" align="right"><?{$pager}?><input type="submit" name="upAdAll" value="�ύȫ��" class="button" /></td>
        </tr>
      </form>
    </table>
<form action="?act=add" method="post"  enctype="multipart/form-data" onSubmit="return check();">
<table border="0" cellspacing="0" cellpadding="1" class="edit" width="100%">
    <tr>
    <td colspan="2" class="title_edit">
     <h1>������</h1>
   </td>
    </tr>
    <tr>
		<td class="edit_main" width="68%"><table width="100%" border="0" cellspacing="1" cellpadding="1">
          <tr>
            <td width="26%" height="36"><div align="right">������:</div></td>
            <td width="74%" height="36"><label>
            <input name="adID" type="hidden" value="<?{$list.id}?>"/>
            <input name="adTitle" type="hidden" value="<?{$list.title}?>"/>
            <input name="adWide" type="hidden" value="<?{$list.wide}?>"/><input name="adHigh" type="hidden" value="<?{$list.high}?>"/>
              <textarea name="adContent" id="code" style="width:100%; height:110px;"></textarea>
              </label></td>
          </tr>
          <tr>
           <td height="36"><div align="right">���˳��:</div></td>
            <td height="36"><label>
              <input name="adOrders" id="order" type="text" value=""/>
              </label><span style="cursor:pointer; border:1px solid;" onmouseover="showimg()" onmouseout="removeimg()">λ��Ԥ��</span></td>
          </tr>
           <tr>
            <td height="36"><div align="right">վ��״̬:</div></td>
            <td height="36"><input style="width:20px; border:none" name="adStatus" type="radio" value="1" checked="checked" />����
            <input style="width:20px;border:none;" value="0" name="adStatus" type="radio" />������</td>
          </tr>
          <tr><td height="36">&nbsp;</td>
        <td height="36"><input type="submit" name="addAd" value=" �� �� " class="button"/></td>
          </tr>
        </table></td>
        <td class="edit_main" width="32%" style="margin:0px; padding:0px;">
		<div id="showimg" style="border:0px; position:relative; display:none; margin:0px; padding:0px;">
		<img height="240px" width="270px" src="<?{$adImgPath}?>" style="border:0px;"/></div>
        </td>
    </tr>
  </table>
</form>
<div class="clear"></div>
<?{/if}?>
<?{include file="admin/footer.tpl"}?>