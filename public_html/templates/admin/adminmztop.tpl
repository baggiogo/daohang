<?{include file="admin/header.tpl"}?>
<script language="javascript">
function sub(){
var check = confirm('ȷ��Ҫ������');
if(check){
	var action = document.getElementById('action').value;
	var name = document.getElementById('name').value;
	var sort = document.getElementById('sort').value;
	if(action=='' || name=='' || sort==''){
		alert("��ȷ����ȫ����д��");
		return false;
	}
}else{
	return false;
}
htmlnotice(1);
return true;
}
</script>
<div class="right">
  <table width="100%" border="0" cellpadding="1" cellspacing="1" class="table_title">
        <tr>
      <td height="52" bgcolor="#FFFFFF"><h1>��ҳ��վ��������</h1>
</td>
        </tr>
      </table>

<?{if $smarty.get.act == 'update'}?>
<form action="adminMztop.php?act=save" method="post" onSubmit="return sub();">
                <?{if $data.autoID}?><input type="hidden" name="form[autoID]" value="<?{$data.autoID}?>"/><?{else}?><input type="hidden" name="form[autoID]" value="0"/><?{/if}?>
                <div>
                    <table id="datatable" width="100%" border="0" cellspacing="0" cellpadding="0" class="table_list">
                        <tr>
                            <td width="20%" class="tr_a" style="text-align:right">���ƣ�</td>
                            <td width="80%" class="tr_a" style="text-align:left"><input id="name" type="text" name="form[title]" value="<?{$data.title}?>" style="width:auto;"/></td>
                        </tr>
                        <tr>
                            <td width="20%" class="tr_a" style="text-align:right">HTML���룺</td>
                            <td width="80%" class="tr_a" style="text-align:left"><textarea id="action" name="form[content]" style="height:300px;width:500px"><?{$data.content|stripslashes}?></textarea></td>
                        </tr>
                        <tr>
                            <td width="20%" class="tr_a" style="text-align:right">����</td>
                            <td width="80%" class="tr_a" style="text-align:left"><input id="sort" type="text" name="form[orders]" value="<?{$data.orders}?>" onkeyup="value=value.replace(/[^\d]/g,'')" /></td>
                        </tr>
                        <tr><td width="20%" class="tr_a" style="text-align:right"></td>
                            <td width="80%" class="tr_a" style="text-align:left"><input type="submit" class="button" name="savebtn" value="�ύ" /></td>
                        </tr>
                    </table>
                </div>
                </form>
<?{else}?>
 <form action="?act=operate" method="post" onSubmit="if(confirm('ȷ��Ҫ������')){htmlnotice(1);return true;}else{return false;}">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_list" style="border-bottom:none">
      <tr>
        <td height="35" align="right">
        <input type="button" class="button" value=" ���������վ " style="width:auto;" onclick="location.href='adminMztop.php?act=update'"/>
 		<input type="submit" name="upsub" value=" �ύ�޸� " class="button" style="width:auto;" /></td>
      </tr>
    </table>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_list" id="t" title="˫���༭">
    <tr >
      <td class="tr1" width="5%">����</td>
      <td class="tr1" width="5%">��ʾ</td>
      <td class="tr1" width="15%">����</td>
      <td class="tr1" width="65%">HTML����</td>
      <td class="tr1" width="5%">�޸�</td>
      <td class="tr1" width="5%">ɾ��</td>
    </tr>
<?{foreach from=$data item=v}?>
<tr ondblclick="location.href='?act=update&autoID=<?{$v.autoID}?>';">
<td class="tr_a"><input type="hidden" name="autoID[]" value="<?{$v.autoID}?>"/><input type="text" name="orders[<?{$v.autoID}?>]" value="<?{$v.orders}?>" style="width:30px"></td>
<td class="tr_a"><input type="checkbox" <?{if $v.status==1}?>checked="checked"<?{/if}?> name="status[<?{$v.autoID}?>]" style="width:auto;border:0"/></td>
<td class="tr_a"><?{$v.title}?></td>
<td class="tr_a"><?{$v.content|stripslashes}?></td>
<td class="tr_a"><a href="?act=update&autoID=<?{$v.autoID}?>"><img src="images/ico_edit.gif" title="�޸�"></a></td>
<td class="tr_a"><a onclick="if(confirm('ȷ��Ҫɾ�����')){location.href='?act=delete&autoID=<?{$v.autoID}?>'}" href="javascript:;"><img src="images/ico_del.gif" title="ɾ��"></a></td>
</tr>
<?{/foreach}?>
    <tr >
      <td colspan="8" align="right"  class="ly_Rtd"><input type="button" class="button" value=" ���������վ " style="width:auto;" onclick="location.href='adminMztop.php?act=update'"/><input type="submit" name="upsub" value=" �ύ�޸� " class="button" style="width:auto;" /></td>
    </tr>
  </table>
</form>
<?{/if}?>
<div class="clear"></div>
  </div>
<?{include file="admin/footer.tpl"}?>