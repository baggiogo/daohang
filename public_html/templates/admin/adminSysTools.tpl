<?{include file="admin/header.tpl"}?>
<form action="?act=operate" method="post" onSubmit="return confirm('ȷ��Ҫ������')">
	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
		<tr class="tr_title">
			<td width="10%">ϵͳ����</td>
		</tr>
		<tr class="tr_title">
			<td align="center"><input type="submit" name="btnClearCache" class="button" value=" ������л��� " /></td>
		</tr>
		<tr class="tr_title">
			<td align="center"><input type="submit" name="btnClearCompiled" class="button" value=" �������ģ�� " /></td>
		</tr>
		<tr class="tr_title">
			<td align="center"><input type="submit" name="btnDataBackUp" class="button" value=" ������������ " /></td>
		</tr>
	</table>
</form>
<?{include file="admin/footer.tpl"}?>
