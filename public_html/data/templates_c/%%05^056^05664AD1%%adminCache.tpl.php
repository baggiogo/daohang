<?php /* Smarty version 2.6.18, created on 2014-08-13 01:53:19
         compiled from admin/adminCache.tpl */ ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "admin/header.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
<script language="javascript">
$(document).ready(function(){
	var c1=getCookie("htmlnotice1");
	var c2=getCookie("htmlnotice2");
	var c3=getCookie("htmlnotice3");
	var c4=getCookie("htmlnotice4");
	if(c1==1){
		var str='<img src="images/notice.gif" title="����������ã���Ҫ�������ɾ�̬ҳ��">';
		$('#checkhtml1 span').html(str);
	}
	if(c2==1){
		var str='<img src="images/notice.gif" title="����������ã���Ҫ�������ɾ�̬ҳ��">';
		$('#checkhtml2 span').html(str);
	}
	if(c3==1){
		var str='<img src="images/notice.gif" title="��������Զ���Ĭ����ַ����Ҫ������棡">';
		$('#checkhtml3 span').html(str);
	}
	if(c4==1){
		var str='<img src="images/notice.gif" title="��������������ã���Ҫ������棡">';
		$('#checkhtml4 span').html(str);
	}
	<?php if (! $this->_tpl_vars['ft']): ?>str='<img src="images/notice.gif" title="��ҳ�����ڣ������ɣ�">';$('#checkhtml1 span').html(str);<?php endif; ?>
});
</script>
<style>
.button {width:150px;height:30px;background-color:#eee;margin-top:5px;}
</style>
<?php if ($this->_tpl_vars['doCache'] == 'true'): ?>
<div id="box">
<div class="right">
<table width="100%" border="0" cellspacing="1" cellpadding="1" class="edit">
  <tr>
    <td class="title_edit">
     <h1>��̬����</h1>
   </td>
  </tr>
  <tr>
	<tr ><td class="edit_main">
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_list">
      <tr>
        <td width="50%" class="tr1"><span style="float:right;margin-right:100px">���ɾ�̬</span></td>
        <td width="50%" class="tr1"><span style="float:left;margin-left:100px">�������</span></td></tr>
<tr><td height="26"><div id="checkhtml1" style="position:relative;width:155px;float:right;margin-right:50px;">
<input class="button" id="button1" type="button" value="������ҳ" onclick="if(confirm('ȷ��Ҫ����������ҳ��')){chtmlnotice(1);location.href='adminCache.php?ctype=index'}" /><span style="position:absolute;top:9px;left:112px;"></span>
</div></td>
<td height="26"><div id="checkhtml3" style="position:relative;width:155px;float:left;margin-left:50px">
<input class="button" type="button" value="���Զ��嵼������" onclick="if(confirm('ȷ��Ҫ���Զ��嵼��������')){chtmlnotice(3);location.href='adminCache.php?ctype=hc_self'}"><span style="position:absolute;top:14px;left:126px;"></span>
</div></td></tr>
      <tr><td height="26"><div id="checkhtml2" style="position:relative;width:155px;;float:right;margin-right:50px;">
<input class="button" id="button2" type="button" value="��������ҳ" onclick="if(confirm('ȷ��Ҫ���������������ݵ���ҳ��������!')){chtmlnotice(2);location.href='adminCache.php?ctype=all'}" /><span style="position:absolute;top:13px;left:112px;"></span>
</div></td>
<td height="26"><div style="width:155px;float:left;margin-left:50px">
<input class="button" type="button" value="������Ԥ������" onclick="if(confirm('ȷ��Ҫ������Ԥ��������')){location.href='adminCache.php?ctype=hc_weather'}">
</div></td></tr>
      <tr><td height="26"><div style="width:155px;float:right;margin-right:50px;">
<input class="button" id="button5" type="button" value="��������ҳ" onclick="if(confirm('ȷ��Ҫ������������ҳ��')){location.href='adminCache.php?ctype=help'}">
</div></td><td height="26"><div id="checkhtml4" style="position:relative;width:155px;float:left;margin-left:50px">
<input class="button" type="button" value="����ҳ��ҳ��������" onclick="if(confirm('ȷ��Ҫ����ҳ��ҳ����������')){chtmlnotice(4);location.href='adminCache.php?ctype=hc_sosuo'}">
<span style="position:absolute;top:14px;left:132px;"></span></div></td>

</tr>
      <tr><td height="26"><div style="width:155px;float:right;margin-right:50px;">
<input class="button" id="button4" type="button" value="����ȫվ" onclick="if(confirm('ȷ��Ҫ��������ȫվ��̬ҳ��������!')){chtmlnotice(1);chtmlnotice(2);location.href='adminCache.php?ctype=forall'}" />
</div></td><td height="26"><div style="width:155px;float:left;margin-left:50px">
<input class="button" type="button" value="����վ�л�������" onclick="if(confirm('ȷ��Ҫ����վ�л���������')){location.href='adminCache.php?ctype=cq_zdyad'}">
</div></td></tr>
</table></td></tr>
</table>

  <div class="clear"></div>
<?php endif; ?>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "admin/footer.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>