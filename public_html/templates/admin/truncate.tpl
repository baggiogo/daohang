<?{include file="admin/header.tpl"}?>
<div id="box">
<div class="right">
<script type="text/javascript">
function chooseall(obj,target){
	var checkobj = document.getElementsByName(target);
	for(var i=0;i<checkobj.length;i++){
		checkobj[i].checked = obj.checked;
	}
}
function alertmsg(){
	if(confirm("ȷ��Ҫ�������վ�����ݣ��������ȱ�����Ӧ��!"))
		return true;
	else
		return false;
}
</script>
<table width="100%" border="0" cellpadding="1" cellspacing="1" class="table_title">
  <tr>
    <td height="52" bgcolor="#FFFFFF"><h1>վ���������</h1></td>
    <td>��ʾ:�����ܽ������ѡվ�����ݱ�,�Ƽ��ڲ���ǰ��<font color=red>����</font>Ҫ��յı�����,�������������ʧ��<a href="backupController.php" style="color:red">���ݿⱸ��</a>
    </td>
    </tr>
	</table>
<form action='restoreController.php?a=truncate' method='post' onsubmit="return alertmsg()">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_list">
<tr><td colspan="3" align="right">
     <input class="button" name="sub" type="submit" style="width:auto;" value="�����ѡ������"/>
   </td></tr>
    <tr>
     <td class="tr1">���ݿ����</td>
     <td class="tr1">����;</td>
     <td class="tr1">ѡ��<input type="checkbox" style="width:auto; border:none" onclick="chooseall(this,'tables[]')"></td>
   </tr>
   <tr>
     <td class="tr_a"><?{$smarty.const.DBPREFIX}?>site</td>
     <td class="tr_a">��¼��ַ��</td>
     <td class="tr_a"><input style="width:auto; border:none" type='checkbox' name='tables[]' value='site' /></td>
    </tr>
   <tr>
     <td class="tr_a"><?{$smarty.const.DBPREFIX}?>site_cool</td>
     <td class="tr_a">��վ��ַ��</td>
     <td class="tr_a"><input style="width:auto; border:none" type='checkbox' name='tables[]' value='site_cool' /></td>
    </tr>
   <tr>
     <td class="tr_a"><?{$smarty.const.DBPREFIX}?>site_famous</td>
     <td class="tr_a">��վ��ַ��</td>
     <td class="tr_a"><input style="width:auto; border:none" type='checkbox' name='tables[]' value='site_famous' /></td>
    </tr>
   <tr>
     <td class="tr_a"><?{$smarty.const.DBPREFIX}?>site_foot</td>
     <td class="tr_a">ҳ�ŵ�����ַ��</td>
     <td class="tr_a"><input style="width:auto; border:none" type='checkbox' name='tables[]' value='site_foot' /></td>
    </tr>
   <tr>
     <td class="tr_a"><?{$smarty.const.DBPREFIX}?>site_tool</td>
     <td class="tr_a">ʵ����ַ��</td>
     <td class="tr_a"><input style="width:auto; border:none" type='checkbox' name='tables[]' value='site_tool' /></td>
    </tr>
   <tr>
     <td class="tr_a"><?{$smarty.const.DBPREFIX}?>type_cool</td>
     <td class="tr_a">��վ�����</td>
     <td class="tr_a"><input style="width:auto; border:none" type='checkbox' name='tables[]' value='type_cool' /></td>
    </tr>
   <tr>
     <td class="tr_a"><?{$smarty.const.DBPREFIX}?>type_foot</td>
     <td class="tr_a">ҳ�ŵ��������</td>
     <td class="tr_a"><input style="width:auto; border:none" type='checkbox' name='tables[]' value='type_foot' /></td>
    </tr>
   <tr>
     <td class="tr_a"><?{$smarty.const.DBPREFIX}?>type_site</td>
     <td class="tr_a">��¼��ַ����</td>
     <td class="tr_a"><input style="width:auto; border:none" type='checkbox' name='tables[]' value='type_site' /></td>
    </tr>
    <tr><td colspan="3" align="right">
     <input class="button" name="sub" type="submit" style="width:auto;" value="�����ѡ������"/>
   </td></tr>
</table></form>

  <div class="clear"></div>
<?{include file="admin/footer.tpl"}?>
