<?php /* Smarty version 2.6.18, created on 2014-08-13 01:52:58
         compiled from admin/footer.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'default', 'admin/footer.tpl', 3, false),array('modifier', 'date_format', 'admin/footer.tpl', 3, false),)), $this); ?>
<div class="footer">
  <span>��лʹ�� 5W��վ������ | <a href="http://www.5w.com/help.htm" target="_blank">����</a> | <a href="http://www.5w.com/message.php?type=3" target="_blank">����</a></span>
  <em>Powered by 5W v<?php echo @VERSION_5W; ?>
    Total <?php echo $this->_tpl_vars['s']; ?>
(s) query <?php echo ((is_array($_tmp=@$this->_tpl_vars['queryNum'])) ? $this->_run_mod_handler('default', true, $_tmp, 0) : smarty_modifier_default($_tmp, 0)); ?>
, Time now is:<?php echo ((is_array($_tmp=time())) ? $this->_run_mod_handler('date_format', true, $_tmp, "%Y-%m-%d %H:%M:%S") : smarty_modifier_date_format($_tmp, "%Y-%m-%d %H:%M:%S")); ?>
</em>  </div>

</body>
</html>