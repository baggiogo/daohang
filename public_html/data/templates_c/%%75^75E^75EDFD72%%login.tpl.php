<?php /* Smarty version 2.6.18, created on 2014-08-13 01:52:47
         compiled from admin/login.tpl */ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>管理员登陆</title>
<link href="./style/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/function.js"></script>
</head>

<body>
<div id="header">
  <div class="vision"><a href="http://<?php echo @SITE_DOMAIN; ?>
">←<?php echo @SITE_NAME; ?>
</a></div>
</div>
<div id="login">
  <div class="title"><img src="images/logintitle.gif" /></div>
  <div class="login_top"></div>
<form method="post" action="?act=login">
  <div class="login_main">
    <ul>
      <li><label>用户名</label><input name="tbMasterMail" id="tbMasterMail" type="text" /></li>
      <li><label>密码</label><input name="tbMasterPwd" id="tbMasterPwd" type="password" /></li>

      <li><div class="bt"><INPUT type="image" border=0 src="images/bt_login.jpg" name="Submit"/></div>
      </li>
    </ul>
  </div>
  <div class="login_bt"></div>
</form>
</div>
<div id="footer">Powered by 5W v<?php echo $this->_tpl_vars['version']; ?>
</div>
</body>
</html>