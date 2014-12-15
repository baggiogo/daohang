<?{include file="admin/header.tpl"}?>
<script language="javascript" src="http://<?{$smarty.const.SITE_DOMAIN}?>/tuan/js/manager.js"></script>
<div class="right">
  <table width="100%" border="0" cellpadding="1" cellspacing="1" class="table_title">
        <tr>
      <td height="52" bgcolor="#FFFFFF"><h1>团购网站管理</h1>
      <div class="search">
          	<form action="tuanindex.php?c=tuansites" method="post">
			站点名称:<input type="text" name="theform[s.sitename]">
			站点地址:<input type="text" name="theform[s.siteurl]">
            <input type="submit" name="Submit3" value="查 询" class="button ">
            <input type="button" onclick="window.location.href='tuanindex.php?c=tuansites&a=edit'" value="添加网站" class="button">
			<input class="button" type=button value="修改排序" onclick="doAction('sortorder','site','order','doform')"></form></div>
		</td>
        </tr>
  </table>
<table id="datatable" width="100%" border="0" cellspacing="0" cellpadding="0" class="table_list" title="双击编辑">
      <tr id="title" >
    <td class="tr1"  width="10%">选择<input type="checkbox" onclick="chooseAll(this,'site')" style="width:auto;border:0"></td>
    <td class="tr1" width="10%">网站</td>
    <td class="tr1" width="30%">地址</td>
    <td class="tr1" width="10%">城市</td>
    <td class="tr1" width="10%">字体颜色</td>
    <td class="tr1" width="10%"><span style="width:100px;white-space:nowrap">首页名站推荐</span></td>
    <td class="tr1" width="5%">排序</td>
    <td class="tr1" width="15%">管理</td>
    </tr>
<?{section name=loop loop=$voLists}?>
  <tr ondblclick="location.href='?c=tuansites&a=edit&sid=<?{$voLists[loop].sid}?>';">
    <td class="tr_a"><input type="checkbox" id="choose_<?{$voLists[loop].sid}?>" name="site" value="<?{$voLists[loop].sid}?>" style="width:auto;border:0"></td>
    <td class="tr_a"><a href="?c=tuansites&a=edit&sid=<?{$voLists[loop].sid}?>"><?{$voLists[loop].sitename}?></a></td>
    <td class="tr_a"><a href="<?{$voLists[loop].siteurl}?>" target="_blank"><?{$voLists[loop].siteurl}?></a></td>
    <td class="tr_a"><font color="<?{$voLists[loop].wordcolor}?>"><?{$voLists[loop].city|default:'全国'}?></font></td>
    <td class="tr_a"><font color="<?{$voLists[loop].wordcolor}?>"><?{$voLists[loop].wordcolor}?></font></td>
    <td class="tr_a"><?{$voLists[loop].commend}?></td>
    <td class="tr_a"><input type="text" value="<?{$voLists[loop].sortorder}?>" name="order" style="width:auto;border:auto"></td>
    <td class="tr_a"><a href="?c=tuansites&a=edit&sid=<?{$voLists[loop].sid}?>">编辑</a> | <a href="?c=tuansites&a=delete&sid=<?{$voLists[loop].sid}?>">删除</a></td>
  </tr>
<?{/section}?>
<tr>
    <td height="30" colspan="8" align="right" valign="middle" class="ly_Rtd"><?{$pager}?><input type="button" onclick="window.location.href='tuanindex.php?c=tuansites&a=edit'" value="添加网站" class="button"><input class="button" type=button value="修改排序" onclick="doAction('sortorder','site','order','doform')"></td></tr>
</table>
<form name="doform" action="?c=tuansites&a=do" method="post">
<input type="hidden" name="optype">
<input type="hidden" name="ids">
<input type="hidden" name="orders">
</form>
<div class="clear"></div>
  </div>
<?{include file="admin/footer.tpl"}?>
