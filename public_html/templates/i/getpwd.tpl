<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>���Ե���վȡ������</title>
<link href="http://<?{$smarty.const.SITE_DOMAIN}?>/static/css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://<?{$smarty.const.SITE_DOMAIN}?>/static/js/login.js"></script>
</head>

<body>
<div id="header">

  <div class="r03"></div>
  <div class="r02"><a href="http://<?{$smarty.const.SITE_DOMAIN}?>/i/?c=manage" class="orange">����</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="http://<?{$smarty.const.SITE_DOMAIN}?>/i/?a=reg">ע��</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="http://<?{$smarty.const.SITE_DOMAIN}?>">��ҳ</a></div>
  <div class="r01"></div>
</div>
 <div id="logo"><a href="http://www.5w.com" target="_blank"><img src="../static/images/logo.gif" title="5w����"/></a></div>


<div class="manage" style="margin-top:90px;_margin-top:40px">
  <div class="title">
  
   <span class="tab">ȡ������</span><div class="more" style="color:#666666">�һ�δע�ᣬ����ȥ <a href="http://<?{$smarty.const.SITE_DOMAIN}?>/i/?a=reg" style="color:#0066CC">������ҳ</a> </div>  </div>
  <div class="main">
<form action="http://<?{$smarty.const.SITE_DOMAIN}?>/i/?c=getPWD&a=getpassword" method="POST">
<ul class="reg" style="width:620px">
<?{if $setpwd eq 'setpwd'}?>
<input type="hidden" value="<?{$u}?>" name="u">
<input type="hidden" value="<?{$t}?>" name="t">
<input type="hidden" value="<?{$m}?>" name="m">
<li><span>�����룺</span><input name="newpwd" type="password" class="input" /><label>�������µ�����</label></li>
<li><span>&nbsp;</span><input class="set_btn" type="submit" name="submit" value="�޸�����" />
<?{else}?>
   <?{if $mailsendsucc eq 'mailsendsucc'}?>
   <li><?{$info}?></li>
   <?{else}?>
    <li><span>�û�����</span><input name="username" type="text" class="input" value="<?{$username}?>"/><label>������ע����û���</label></li>
<?{if $nomail}?>
<li><span>doudou�˺ţ�</span><input name="doudou" type="text" class="input" /><label>������󶨵�doudouID</label></li>
<li><span>���䣺</span><input name="email" type="text" class="input" /><label>�������Լ������䣬����ȡ������</label></li>
<?{/if}?>

    <li><span>&nbsp;</span><input class="set_btn" type="submit" name="submit" value="ȡ������" />
    </li>
    <?{/if}?>
    <?{/if}?>
   </ul>
   
</form>

   </div>
 </div>
</body>
<iframe id="doudouAd" src="about:blank" width="0" height="0"></iframe>
<script language="javascript" src="http://<?{$smarty.const.SITE_DOMAIN}?>/static/js/function.js"></script>
</html>
