<?{include file="admin/header.tpl"}?>
<div id="box">
<div class="right">
<form name="setting" action="adminUserSetting.php?act=update" method="post">
    <table width="100%" border="0" cellspacing="1" cellpadding="1" class="edit">
  <tr>
    <td class="title_edit">
     <h1>վ���������</h1>
   </td>
  </tr>
  <tr>
    <td class="edit_main"><table width="100%" border="0" cellspacing="1" cellpadding="1">
      <tr>
        <td width="25%" height="66"><div align="right">�Զ������ã�</div></td>
        <td width="75%" height="66">
<input style="width:20px; border:none" name="userSite" type="radio" value="1" <?{if $sets==1}?>checked="checked"<?{/if}?> />Ĭ�Ϸ�ʽ  <?{$smarty.const.SITE_DOMAIN}?>/i/?userdomain<br/>
<input style="width:20px; border:none" name="userSite" type="radio" value="2" <?{if $sets==2}?>checked="checked"<?{/if}?>/>���ö���Ŀ¼ <?{$smarty.const.SITE_DOMAIN}?>/i/userdomain/��ע�����ķ���������֧��url��д��<br/>
<input style="width:20px; border:none" name="userSite" type="radio" value="3" <?{if $sets==3}?>checked="checked"<?{/if}?>/>���ö������� userdomain<?{$smarty.const.SITE_DOMAIN|substr:3}?>��ע�����ķ���������֧��url��д��
        </td>
      </tr>
      <tr>
        <td height="36">&nbsp;</td>
        <td height="36"><input type="submit" class="button" id="button" value="�ύ" /> <a href="http://bbs.5w.com/thread-302-1-1.html" target="_blank">url��д����</a>
        </td>
      </tr>
    </table>
     </td>
     </tr>
    </table>
 </form>

  <div class="clear"></div>
  </div>
<?{include file="admin/footer.tpl"}?>