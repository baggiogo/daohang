<?php /* Smarty version 2.6.18, created on 2014-08-14 12:53:38
         compiled from admin/adminSiteSetting.tpl */ ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "admin/header.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<div id="box">
<div class="right">
<form name="setting" action="adminSiteSetting.php?act=update" method="post">
    <table width="100%" border="0" cellspacing="1" cellpadding="1" class="edit">
  <tr>
    <td class="title_edit">
     <h1>վ���������</h1>
   </td>
  </tr>
  <tr>
    <td class="edit_main"><table width="100%" border="0" cellspacing="1" cellpadding="1">
      <tr>
        <td width="19%" height="36"><div align="right">��վLOGO��</div></td>
        <td width="81%" height="36">
        <input type="text" name="logo" value="<?php echo $this->_tpl_vars['sets']['logo']; ?>
" />
        </td>
      </tr>
      <tr>
        <td height="36"><div align="right">��վ���ƣ�</div></td>
        <td height="36"><input type="text" name="siteName" value="<?php echo $this->_tpl_vars['sets']['siteName']; ?>
" /></td>
      </tr>
      <tr>
        <td height="36"><div align="right">��վ��ҳ��</div></td>
        <td height="36"><input type="text" name="siteDomain" value="<?php echo $this->_tpl_vars['sets']['siteDomain']; ?>
" />
            <span><font color="blue">(����Ҫ��� http://������д��������ҳ����·�����磺www.5w.com)</font></span></td>
      </tr>
      <tr>
        <td height="36"><div align="right">��̬ҳĿ¼��</div></td>
        <td height="36"><input type="text" name="htmlpath" value="<?php echo $this->_tpl_vars['sets']['htmlpath']; ?>
" /><font color="blue">(����ĩβ��"/", ��Ŀ¼Ȩ�ޱ���Ϊ777</font>
        )</td>
      </tr>
      <tr>
        <td height="36"><div align="right">����Ա���䣺</div></td>
        <td height="36"><input type="text" name="adminEmail" value="<?php echo $this->_tpl_vars['sets']['adminEmail']; ?>
" /></td>
      </tr>
      <tr>
        <td height="36"><div align="right">ICP�����ţ�</div></td>
        <td height="36"><input type="text" name="icp" value="<?php echo $this->_tpl_vars['sets']['icp']; ?>
" /></td>
      </tr>
      <tr>
        <td height="36"><div align="right">ICP�������ӣ�</div></td>
        <td height="36"><input type="text" name="icpurl" value="<?php echo $this->_tpl_vars['sets']['icpurl']; ?>
" /></td>
      </tr>

      <tr>
        <td height="36"><div align="right">��վ���⣺</div></td>
        <td height="36"><input type="text" style="width:360px" name="indexTitle" value="<?php echo $this->_tpl_vars['sets']['indexTitle']; ?>
" />
            <span class="gray">(��ʾ���������������������ҳ��ɵ����趨) </span></td>
      </tr>
      <tr>
        <td height="36"><div align="right">��վ�ؼ��֣�</div></td>
        <td height="36"><input type="text" style="width:360px" name="indexKeywords" value="<?php echo $this->_tpl_vars['sets']['indexKeywords']; ?>
" />
            <span class="gray"></span></td>
      </tr>
      <tr>
        <td height="36"><div align="right">��վ������</div></td>
        <td height="36"><input type="text" style="width:360px" name="indexDescription" value="<?php echo $this->_tpl_vars['sets']['indexDescription']; ?>
" />
            <span class="gray"></span></td>
      </tr>

      <tr>
        <td height="36"><div align="right">ҳ��ײ�ͳ�ƴ��룺</div></td>
        <td height="36"><textarea name="countCode" cols="45" rows="5"><?php echo $this->_tpl_vars['sets']['countCode']; ?>
</textarea>
        </td>
      </tr>
      <tr>
        <td height="36">&nbsp;</td>
        <td height="36">
        <input type="submit" class="button" id="button" value="�ύ" onclick="htmlnotice(1);"style="float:left" />
        <div style="position:relative; width:259px; float:left"><img src="images/help.gif" onclick="showhelp('adminSiteSetting',1);" title="����鿴����" style="cursor:pointer"/>
        <div id="help" style="display:none;height:auto;width:259px;position:absolute;top:20px;right:32px;z-index:201;">
         <div class="tipstop"></div>
         <div class="tipsmain" id="helpcontent"></div>
        </div></div>
        </td>
      </tr>
    </table>
     </td>
     </tr>
    </table>
 </form>
  <div class="clear"></div>
  </div>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "admin/footer.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>