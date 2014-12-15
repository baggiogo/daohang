<?{include file="admin/header.tpl"}?>
<script language="javascript" src="http://<?{$smarty.const.SITE_DOMAIN}?>/tuan/js/manager.js"></script>
<div class="right">
  <table width="100%" border="0" cellpadding="1" cellspacing="1" class="table_title">
        <tr>
      <td height="52" bgcolor="#FFFFFF"><h1>团购采集管理</h1>
      <div class="search">
            <input type="button" onclick="window.location.href='tuanindex.php?c=tuanfetchs&a=edit'" value="添加采集" class="button">&nbsp;
            <input type="button" onclick="if(confirm('确定要采集所有团购数据？')){window.location.href='http://<?{$smarty.const.SITE_DOMAIN}?>/tuan/crontab/tuanfetch.php'}" value="开始采集" class="button">
            </div>
		</td>
        </tr>
  </table>
<table id="datatable" width="100%" border="0" cellspacing="0" cellpadding="0" class="table_list" title="双击编辑">
      <tr id="title" >
    <td class="tr1">网站</td>
    <td class="tr1">API地址</td>
    <td class="tr1">API模板</td>
    <td class="tr1">采集状态</td>
    <td class="tr1">管理</td>
    </tr>
<?{section name=loop loop=$voLists}?>
  <tr ondblclick="location.href='?c=tuanfetchs&a=edit&fid=<?{$voLists[loop].fid}?>';">
    <td  class="tr_a"><a href="?c=tuanfetchs&a=edit&fid=<?{$voLists[loop].fid}?>"><?{$voLists[loop].sitename}?></a></td>
    <td  class="tr_a"><?{$voLists[loop].apiurl}?></td>
    <td  class="tr_a"><?{$voLists[loop].apiname}?></td>
    <td  class="tr_a"><?{$voLists[loop].apifetch}?></td>
    <td class="tr_a"><a href="?c=tuanfetchs&a=edit&fid=<?{$voLists[loop].fid}?>">编辑</a> | <a href="?c=tuanfetchs&a=delete&fid=<?{$voLists[loop].fid}?>">删除</a></td>
  </tr>
<?{/section}?>
<tr>
    <td height="30" colspan="5" align="right" valign="middle" class="ly_Rtd"><?{$pager}?>
            <input type="button" onclick="window.location.href='tuanindex.php?c=tuanfetchs&a=edit'" value="添加采集" class="button">&nbsp;
            <input type="button" onclick="if(confirm('确定要采集所有团购数据？')){window.location.href='http://<?{$smarty.const.SITE_DOMAIN}?>/tuan/crontab/tuanfetch.php'}" value="开始采集" class="button">
            </td></tr>
</table>
<div class="clear"></div>
  </div>
<?{include file="admin/footer.tpl"}?>
