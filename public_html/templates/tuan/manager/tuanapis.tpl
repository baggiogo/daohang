<?{include file="admin/header.tpl"}?>
<script language="javascript" src="http://<?{$smarty.const.SITE_DOMAIN}?>/tuan/js/manager.js"></script>
<div class="right">
  <table width="100%" border="0" cellpadding="1" cellspacing="1" class="table_title">
        <tr>
      <td height="52" bgcolor="#FFFFFF"><h1>团购接口管理</h1>
      <div class="search"><form action="tuanindex.php?c=tuanapis" method="post">
			模板名称:<input type="text" name="theform[apiname]">
            <input type="submit" name="Submit3" value="查 询" class="button">
            <input type="button" onclick="window.location.href='tuanindex.php?c=tuanapis&a=edit'" value="添加API模板" class="button">
			</form></div>
		</td>
        </tr>
  </table>
<table id="datatable" width="100%" border="0" cellspacing="0" cellpadding="0" class="table_list" title="双击编辑">
      <tr id="title" >
      <td width="50%" class="tr1">API模板名称</td>
    <td width="50%" class="tr1">管理</td></tr>
    <?{section name=loop loop=$voLists}?>
  <tr ondblclick="location.href='?c=tuanapis&a=edit&aid=<?{$voLists[loop].aid}?>';">
    <td class="tr_a"><a href="?c=tuanapis&a=edit&aid=<?{$voLists[loop].aid}?>"><?{$voLists[loop].apiname}?></a></td>
    <td class="tr_a"><a href="?c=tuanapis&a=edit&aid=<?{$voLists[loop].aid}?>">编辑</a> | <a href="?c=tuanapis&a=delete&aid=<?{$voLists[loop].aid}?>">删除</a></td>
  </tr>
  <tr  class="tb_line">
    <td colspan="8" ></td>
    </tr>
<?{/section}?>
<tr>
    <td height="30" colspan="2" align="right" valign="middle" class="ly_Rtd"><?{$pager}?><input type="button" onclick="window.location.href='tuanindex.php?c=tuanapis&a=edit'" value="添加API模板" class="button">
</td></tr>
</table>
<div class="clear"></div>
  </div>
<?{include file="admin/footer.tpl"}?>
