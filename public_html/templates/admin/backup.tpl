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
    	if(confirm("��ȷ�����β�����"))
    		return true;
    	else
    		return false;
    }
</script>
<table width="100%" border="0" cellpadding="1" cellspacing="1" class="table_title">
  <tr>
    <td height="52" bgcolor="#FFFFFF"><h1>���ݱ���</h1>
      <div class="search">���ݿ��ܴ�С:<?{$total_size}?></div></td>
    </tr>
	</table>
<form action='backupController.php?a=backup' method='post' onsubmit="return alertmsg()">


	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_list" id="tb1">
		<tr><td colspan="9" align="right"><input type="submit" class="button" style="width:auto;" name="backup" value="����" />&nbsp;
        <input type="submit" class="button" style="width:auto;" name="repair" value="�޸�" />&nbsp;
        <input type="submit" class="button" style="width:auto;" name="optimize" value="�Ż�" />&nbsp;</td></tr>
    <tr>
     <td class="tr1">���ݿ����</td>
     <td class="tr1">����;</td>
     <td class="tr1">������</td>
     <td class="tr1">��¼��</td>
     <td class="tr1">���ݴ�С</td>
     <td class="tr1">������С</td>
     <td class="tr1">��Ƭ</td>
     <td class="tr1">���ݱ��С</td>
     <td class="tr1">ѡ��<input type="checkbox" style="width:auto; border:none" onclick="chooseall(this,'table_list[]')"></td>
      </tr>
	<?{foreach name=output item=current_row from=$output}?>
   <tr>
     <td class="tr_a"><?{$current_row.table_name}?></td>
     <td class="tr_a"><?{$current_row.table_use}?></td>
     <td class="tr_a"><?{$current_row.Engine}?></td>
     <td class="tr_a"><?{$current_row.Rows}?></td>
     <td class="tr_a"><?{$current_row.Data_length}?></td>
     <td class="tr_a"><?{$current_row.Index_length}?></td>
     <td class="tr_a"><?{$current_row.Data_free}?></td>
     <td class="tr_a"><?{$current_row.size}?></td>
     <td class="tr_a"><input style="width:auto;border:none" type='checkbox' name='table_list[]' value='<?{$current_row.table_name}?>' /></td>
    </tr>
    <?{/foreach}?>
      <tr><td colspan="9" align="right"><input type="submit" class="button" style="width:auto;" name="backup" value="����" />&nbsp;
        <input type="submit" class="button" style="width:auto;" name="repair" value="�޸�" />&nbsp;
        <input type="submit" class="button" style="width:auto;" name="optimize" value="�Ż�" />&nbsp;</td></tr>
     </table>
</form>

<?{include file="admin/footer.tpl"}?>