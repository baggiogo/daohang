<?php /* Smarty version 2.6.18, created on 2014-08-16 11:03:15
         compiled from i/login.tpl */ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>���Ե���վ��¼</title>
<link href="http://<?php echo @SITE_DOMAIN; ?>
/static/css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://<?php echo @SITE_DOMAIN; ?>
/static/js/login.js"></script>
</head>

<body>
<div id="header">
  <div class="r03"></div>
  <div class="r02"><a href="http://<?php echo @SITE_DOMAIN; ?>
/i/index.php?a=reg">ע��i��ҳ</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="http://<?php echo @SITE_DOMAIN; ?>
">��ҳ</a></div>
  <div class="r01"></div>
</div>
 <div id="logo" style=" width:990px"><a href="http://www.5w.com" target="_blank"><img src="../static/images/logo.gif" title="5w����"/></a></div>


 <div id="login"><div class="m_reg">
  <div class="title">
   <span class="tab">�û���¼</span><div class="more" style="color:#666666">�һ�δע�ᣬ����ȥ <a href="http://<?php echo @SITE_DOMAIN; ?>
/i/?a=reg" style="color:#0066CC">������ҳ</a> </div>  </div>
  <div class="main">
  

<div id="login1" style="display:block">
<form id="loginForm" name="loginForm" onsubmit="return toLoginCheck()" action="http://<?php echo @SITE_DOMAIN; ?>
/i/?c=login&act=login" method="post">
   <ul class="reg" style="margin:45px;">
    <li><span>�û�����</span><input class="input" name="tbUserName" type="text" value="<?php echo $this->_tpl_vars['userName']; ?>
" id="tbUserName"/></li>
     <li><span>���룺</span><input name="tbUserPwd" type="password" id="tbUserPwd" class="input"  /></li>
     <li><span>&nbsp;</span><input name="scookie" type="checkbox" value="1" checked="checked"/>&nbsp;��ס��</li>
    <li><span>&nbsp;</span><input class="set_btn"  type="submit" name="loginsubmit" value="�� ¼" /><a href="http://<?php echo @SITE_DOMAIN; ?>
/i/?a=getpwd" style="color:#06c">�������룿</a>
    <input type="hidden" name="re" id="re" value="http://<?php echo @SITE_DOMAIN; ?>
/i/?c=manage" /></li>
   </ul></form></div>
  </div>
 </div>
 <div class="reg_des">
  <div class="title">
   <span class="tab">ʲô��5w���Ե�����</span> </div>
  <div class="main">
  <ul>
   <li>
    <h2>���Ի��������������������������ҳ��</h2>
    
    <span>�����������޸����ĵ�����ҳ��ҳ��������ݣ�����ʵ����
���������</span>
   </li>
   <li>
    <h2>�ٶȿ졢�����ݡ�������ʧ��</h2>
    
    <span>���ʿ����ȶ�������򵥿�ݣ������ղص���վʵ����Զ����
ʧ���������ӣ���ʡ3000���ӣ�</span>
   </li>
   <li>
    <h2>����չʾ�Ķ���������</h2>
    
    <span>ӵ��ר�������ĸ��Ի�����������</span>
   </li>
  </ul>
  </div>
 </div>
 </div>
</body>
</html>