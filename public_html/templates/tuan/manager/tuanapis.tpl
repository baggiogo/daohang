<?{include file="admin/header.tpl"}?>
<script language="javascript" src="http://<?{$smarty.const.SITE_DOMAIN}?>/tuan/js/manager.js"></script>
<div class="right">
  <table width="100%" border="0" cellpadding="1" cellspacing="1" class="table_title">
        <tr>
      <td height="52" bgcolor="#FFFFFF"><h1>�Ź��ӿڹ���</h1>
      <div class="search"><form action="tuanindex.php?c=tuanapis" method="post">
			ģ������:<input type="text" name="theform[apiname]">
            <input type="submit" name="Submit3" value="�� ѯ" class="button">
            <input type="button" onclick="window.location.href='tuanindex.php?c=tuanapis&a=edit'" value="���APIģ��" class="button">
			</form></div>
		</td>
        </tr>
  </table>
<table id="datatable" width="100%" border="0" cellspacing="0" cellpadding="0" class="table_list" title="˫���༭">
      <tr id="title" >
      <td width="50%" class="tr1">APIģ������</td>
    <td width="50%" class="tr1">����</td></tr>
    <?{section name=loop loop=$voLists}?>
  <tr ondblclick="location.href='?c=tuanapis&a=edit&aid=<?{$voLists[loop].aid}?>';">
    <td class="tr_a"><a href="?c=tuanapis&a=edit&aid=<?{$voLists[loop].aid}?>"><?{$voLists[loop].apiname}?></a></td>
    <td class="tr_a"><a href="?c=tuanapis&a=edit&aid=<?{$voLists[loop].aid}?>">�༭</a> | <a href="?c=tuanapis&a=delete&aid=<?{$voLists[loop].aid}?>">ɾ��</a></td>
  </tr>
  <tr  class="tb_line">
    <td colspan="8" ></td>
    </tr>
<?{/section}?>
<tr>
    <td height="30" colspan="2" align="right" valign="middle" class="ly_Rtd"><?{$pager}?><input type="button" onclick="window.location.href='tuanindex.php?c=tuanapis&a=edit'" value="���APIģ��" class="button">
</td></tr>
</table>
<div class="clear"></div>
  </div>
<?{include file="admin/footer.tpl"}?>
