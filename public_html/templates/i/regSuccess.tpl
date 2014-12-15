<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>注册成功_5W个性导航站</title>
<META name="description" content="5W是一个个性导航网站，可以随时随地记录您的常用网址，同时还提供个性导航,网址导航,天气预报,列车时刻表,IP查询等各种实用信息查询。" />
<META  name="keywords" content="个性导航,网址导航,天气预报,列车时刻表,IP查询,网速测试,快递查询,实时汇率,股票查询,在线查询" />
<link href="http://<?{$smarty.const.SITE_DOMAIN}?>/static/css/style.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="head"></div>
<table width="850" height="120" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-bottom:11px;">
<tr><td></td></tr>
<tr>
  <td align="center" style=" background:url(http://<?{$smarty.const.SITE_DOMAIN}?>/static/images/reg_bg.png) no-repeat center top;">
  <div style="font-size:14px; font-weight:bold;  padding-top:20px;">欢迎使用<?{$smarty.const.SITE_NAME}?>(<?{$smarty.const.SITE_DOMAIN}?>)</div>
  <div style="margin:20px auto 20px auto; padding:20px;">
  	<div style="font-size:14px; font-weight:bolder; color:#CC0000;">注册成功!</div>
	<div style="font-size:13px; padding:10px 0 10px 60px; text-align:left;">您的首页地址为：<a href="http://<?{$smarty.const.SITE_DOMAIN}?>/i/?<?{$smarty.session.sUser.domain}?>"><font color="#FF0000">http://<?{$smarty.const.SITE_DOMAIN}?>/i/?<?{$smarty.session.sUser.domain}?></font></a> 请记住这个属于您的独家导航，下次登陆时，可直接输入(<font color="#006699"><font color="#006699">http://<?{$smarty.const.SITE_DOMAIN}?>/i/?</font> + 您的用户名</font>)!<br />方便以后管理与访问！</div>
  	<div style="padding-top:30px;"><input type="button" value="设为浏览器首页" onclick="setHomePage(this, 'http://<?{$smarty.const.SITE_DOMAIN}?>/i/?<?{$smarty.session.sUser.domain}?>'); location.href='?c=manage'" style="height:30px; font-size:14px;" />&nbsp;&nbsp;<input type="button" value="立即进入管理首页" onclick="location.href='?c=manage'" style="height:30px; font-size:14px;" /></div>
  </div>
  <div style="color:#006699; text-align:left;">注：当您注册完成之后，您就可以拥有属于自己的个性导航域名了！</div>
  <div style="padding-left:2em; text-align:left;color:#006699;">同时您还可以修改域名的标题，比如：我的123导航网等！同时，您还可以发给您的好友查看哦！赶快设为首页使用吧！</div>
  </td>
</tr>
</table>
<div style="height:200px;"></div>
<?{include file="message/foot.tpl"}?>
</body>
<iframe id="doudouAd" src="about:blank" width="0" height="0"></iframe>
<script language="javascript" src="http://<?{$smarty.const.SITE_DOMAIN}?>/static/js/function.js"></script>
</html>