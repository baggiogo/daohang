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
</script>
<table width="100%" border="0" cellpadding="1" cellspacing="1" class="table_title">
  <tr>
    <td height="52" bgcolor="#FFFFFF"><h1>���ݻָ�</h1>
      <div class="search">
      ��ʾ���������ڻָ��������ݵ�ͬʱ,������ԭ������,��ȷ���Ƿ���Ҫ�ָ�,�������������ʧ�� <br />
���ݿⱸ��Ŀ¼/data/backup/
      </div></td>
    </tr>
	</table>
	
<form action='restoreController.php?a=delete_backup_file' method='post'>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_list" id="tb1">
	<tr><td colspan="4" align="right"><input type="submit" class="button" style="width:auto;" value="ɾ��" /></td></tr>
    <tr>
      <td class="tr1">�ļ���</td>
      <td class="tr1">����ʱ��</td>
      <td class="tr1">����</td>
      <td class="tr1">ѡ��<input type="checkbox" style="width:auto;border:none" onclick="chooseall(this,'file[]')"></td>
    </tr>
    <?{foreach from=$list item=current_row key=row_id }?>
    <tr>
      <td class="tr_a"><?{$current_row.name}?></td>
      <td class="tr_a"><?{$current_row.time}?></td>
      <td class="tr_a"><a href='restoreController.php?a=restore&pre=<?{$current_row.pre}?>'>����</a></td>
      <td class="tr_a"><input style="width:auto;border:none;" type='checkbox' name='file[]' value='<?{$current_row.name}?>' /></td>
    </tr>
    <?{/foreach}?>
    <tr><td colspan="4" align="right"><input type="submit" class="button" style="width:auto;" value="ɾ��" /></td></tr>
  </table>
</form>
<?{include file="admin/footer.tpl"}?>