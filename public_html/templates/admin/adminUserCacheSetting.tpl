<?{include file="admin/header.tpl"}?>
<div id="box">
<div class="right">
<form name="setting" action="adminSiteSetting.php?act=update" method="post">
    <table width="100%" border="0" cellspacing="1" cellpadding="1" class="edit">
  <tr>
    <td class="title_edit">
     <h1>自定义站点缓存设置</h1>
   </td>
  </tr>
  <tr>
    <td class="edit_main"><table width="100%" border="0" cellspacing="1" cellpadding="1">
      <tr>
        <td width="25%" height="66"><div align="right">自定义站点缓存设置：</div></td>
        <td width="75%" height="66">
<label><input style="width:auto; border:none;" name="usecache" type="radio" value="1" onclick="if(this.checked)document.getElementById('sptime').disabled=false" <?{if $sets.usecache==1}?>checked="checked"<?{/if}?> />启用缓存</label><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;缓存时间：<input type="text" name="sptime" style="width:100px" id="sptime" value="<?{$sets.sptime}?>">(0表示永久有效，大于0表示缓存有效天数)<br />
<label><input style="width:auto; border:none;" name="usecache" type="radio" value="0" onclick="if(this.checked)document.getElementById('sptime').disabled=true" <?{if $sets.usecache==0}?>checked="checked"<?{/if}?>/>不启用缓存</label><br/>
        </td>
      </tr>
      <tr>
        <td height="36">&nbsp;</td>
        <td height="36"><input type="submit" class="button" id="button" value="提交" />&nbsp;&nbsp;<input type="button" class="button" id="button" value="清除个性导航缓存" onclick="window.location.href='adminSiteSetting.php?act=clear'"/>
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