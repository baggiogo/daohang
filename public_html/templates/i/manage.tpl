<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<META http-equiv="Pragma" content="no-cache">
<META http-equiv="Cache-Control" content="no-cache">
<META http-equiv="Expires" content="0">
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>�û��������ù���</title>
<link type="text/css" rel="stylesheet" href="http://<?{$smarty.const.SITE_DOMAIN}?>/static/css/jquery-ui-1.8.2.custom.css" />
<link href="http://<?{$smarty.const.SITE_DOMAIN}?>/static/css/css.css" rel="stylesheet" type="text/css" />
<script language="javascript">
var domain = '<?{$domain}?>';
var userID = '<?{$userID}?>';
var domain2 = '<?{$domain}?>';
</script>
<script type="text/javascript" src="../static/js/jquery.min.js"></script>
<script type="text/javascript" src="../static/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="../static/js/jquery-ui-1.8.2.custom.min.js"></script>
<script type="text/javascript" src="../static/js/jquery.easywidgets.js"></script>
<script type="text/javascript" src="../static/js/function.js"></script>
<script type="text/javascript" src="../static/js/layout.js"></script>
</head>

<body>
<div id="header">
<div id="weather">
<iframe width="470" height="22" frameborder="0" scrolling="no" allowtransparency="true" src="http://<?{$smarty.const.SITE_DOMAIN}?>/data/html/tianqi.htm"></iframe>
</div>
  <div class="r03"></div>
  <div class="r02"><a href="<?{if $sets == 1}?>http://<?{$smarty.const.SITE_DOMAIN}?>/i/?<?{$userdomain}?><?{elseif $sets == 2}?>http://<?{$smarty.const.SITE_DOMAIN}?>/i/<?{$userdomain}?><?{else}?>http://<?{$userdomain}?>.<?{$site_domain}?><?{/if}?>" ><font color="#FF0000">������ҳ</font></a>&nbsp;&nbsp;|&nbsp;&nbsp;
 <a href="http://<?{$smarty.const.SITE_DOMAIN}?>/i/index.php?c=login&act=logout">ע��</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="http://bbs.5w.com/thread-113-1-1.html" target="_blank">����</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="http://<?{$smarty.const.SITE_DOMAIN}?>/" target="_blank">������վ��ҳ</a></div>
  <div class="r01"></div>
</div>
 <div class="manage_site" style="margin-top:30px">
  <div class="title">
   <span class="<?{if $setdomain == 0}?>tab2<?{else}?>tab<?{/if}?>" id="t1" onclick="changeset(1);">��ҳ����</span> <span id="t2" class="<?{if $setdomain == 0}?>tab<?{else}?>tab2<?{/if}?>" onclick="changeset(2);">���Ի�����</span><span id="t3" class="tab2" onclick="changeset(3);">�޸�����</span></div>

  	<div class="main" id="tab1" style="display:<?{if $setdomain == 0}?>none<?{else}?>block<?{/if}?>">
	<form action="http://<?{$smarty.const.SITE_DOMAIN}?>/i/?c=manage&a=change" method="post">
	    <div class="mata">
	��ҳ���Ա��⣺<input type="text" name="title" value="<?{$title|default:'5W���Ե���'}?>" maxlength="80" size="30" style="height:23px; line-height:23px;" /> �޸������Լ��ĵ�������
	</div>
	<div class="set_search">
	<img src="<?{if $google}?>http://<?{$smarty.const.SITE_DOMAIN}?>/static/images/google.gif<?{elseif $taobao}?>http://<?{$smarty.const.SITE_DOMAIN}?>/static/images/taobao.gif<?{elseif $baidu}?>http://<?{$smarty.const.SITE_DOMAIN}?>/static/images/baidu.gif<?{elseif $sogou}?>http://<?{$smarty.const.SITE_DOMAIN}?>/static/images/s/sogou.gif<?{elseif $soso}?>http://<?{$smarty.const.SITE_DOMAIN}?>/static/images/s/soso.gif<?{elseif $youdao}?>http://<?{$smarty.const.SITE_DOMAIN}?>/static/images/s/youdao.gif<?{/if}?>" id="clogo" width="101" height="33" />
	<input type="text" size="30" style="height:23px; line-height:23px;" /> <input type="button" value="�� ��" style="height:30px; padding:0 5px" /><br />
	ѡ���������棺<label><input style="width:20px;" name="search" type="radio" value="4" onclick="clogo.src='http://<?{$smarty.const.SITE_DOMAIN}?>/static/images/s/sogou.gif'" <?{if $sogou}?>checked="checked"<?{/if}?> />�ѹ�</label>
	<label><input style="width:20px;" name="search" type="radio" value="5" onclick="clogo.src='http://<?{$smarty.const.SITE_DOMAIN}?>/static/images/s/soso.gif'" <?{if $soso}?>checked="checked"<?{/if}?>/>����</label>
	<label><input style="width:20px;" name="search" type="radio" value="6" onclick="clogo.src='http://<?{$smarty.const.SITE_DOMAIN}?>/static/images/s/youdao.gif'" <?{if $youdao}?>checked="checked"<?{/if}?>/>�е�</label>
	<label><input style="width:20px;" name="search" type="radio" value="1" onclick="clogo.src='http://<?{$smarty.const.SITE_DOMAIN}?>/static/images/taobao.gif'" <?{if $taobao}?>checked="checked"<?{/if}?> />�Ա�</label>
	<label><input style="width:20px;" name="search" type="radio" value="2" onclick="clogo.src='http://<?{$smarty.const.SITE_DOMAIN}?>/static/images/baidu.gif'" <?{if $baidu}?>checked="checked"<?{/if}?>/>�ٶ�</label>
	<label><input style="width:20px;" name="search" type="radio" value="3" onclick="clogo.src='http://<?{$smarty.const.SITE_DOMAIN}?>/static/images/google.gif'" <?{if $google}?>checked="checked"<?{/if}?>/>�ȸ�</label>
	</div>
	<div class="save"><input class="set_btn"  type="submit" value="��������" /><input class="set_btn"  type="hidden" value="Ԥ��Ч��" /></div>
	</form></div>

   <div class="main" id="tab2" style="display:<?{if $setdomain == 0}?>block<?{else}?>none<?{/if}?>">
<?{if $setdomain == 0}?>
    <div class="set_url" id="seturl1">
     <p>��������ĸ�������,������һ�����ý��޷��޸ġ�</p>
     <form action="http://<?{$smarty.const.SITE_DOMAIN}?>/i/?c=manage&a=setdomain" method="post" onSubmit="return setindex(this, '<?{if $sets == 1}?>http://<?{$smarty.const.SITE_DOMAIN}?>/i/?<?{$userdomain}?><?{elseif $sets == 2}?>http://<?{$smarty.const.SITE_DOMAIN}?>/i/<?{$userdomain}?><?{else}?>http://<?{$userdomain}?>.<?{$site_domain}?><?{/if}?>');">
     <?{if $sets == 1}?>
     http://<?{$smarty.const.SITE_DOMAIN}?>/i/?<input id="setdomain" onkeyup="checksetdomain();" type="text" name="sdomain" value="" maxlength="20" size="10" style="height:20px; line-height:20px; margin-left:10px; color:#666" />
     <?{elseif $sets == 2}?>
     http://<?{$smarty.const.SITE_DOMAIN}?>/i/<input id="setdomain" onkeyup="checksetdomain();" type="text" name="sdomain" value="" maxlength="20" size="10" style="height:20px; line-height:20px; margin-left:10px; color:#666" />
     <?{else}?>
     <input id="setdomain" onkeyup="checksetdomain();" type="text" name="sdomain" value="" maxlength="20" size="10" style="height:20px; line-height:20px; margin-left:10px; color:#666" />.<?{$site_domain}?>
     <?{/if}?>
      <span id="result"></span><input id="ssubmit" disabled="disabled" type="submit" name="ssubmit" value="��" style="height:26px; line-height:22px; margin-left:10px; " />
     </form>
     </div>
<?{else}?>
      <div class="set_url" id="seturl2">
     <p>���Ѿ����ø���������</p>
      <div class="myurl">
     <?{if $sets == 1}?>
     ��ҳ�棺<span id="tbid">http://<?{$smarty.const.SITE_DOMAIN}?>/i/?<?{$userdomain}?></span>
     <p><a onclick="setHomePage(this, 'http://<?{$smarty.const.SITE_DOMAIN}?>/i/?<?{$userdomain}?>');" href="javascript:;"><img src="../static/images/home.gif" />&nbsp;��Ϊ��ҳ</a>&nbsp;<a onclick="addFav('http://<?{$smarty.const.SITE_DOMAIN}?>/i/?<?{$userdomain}?>', '<?{$title|default:'5W���Ե���'}?>');" href="javascript:void(0);"><img src="../static/images/fav.gif" />&nbsp;�����ղؼ�</a>&nbsp; <a href="javascript:;" onclick="xcopyf();"><img src="../static/images/share.gif" />&nbsp;�����ҵ���ַ</a></p>
     <?{elseif $sets == 2}?>
     ��ҳ�棺<span id="tbid">http://<?{$smarty.const.SITE_DOMAIN}?>/i/<?{$userdomain}?></span>
	<p><a onclick="setHomePage(this, 'http://<?{$smarty.const.SITE_DOMAIN}?>/i/<?{$userdomain}?>');" href="javascript:;"><img src="../static/images/home.gif" />&nbsp;��Ϊ��ҳ</a>&nbsp;<a onclick="addFav('http://<?{$smarty.const.SITE_DOMAIN}?>/i/<?{$userdomain}?>', '<?{$title|default:'5W���Ե���'}?>');" href="javascript:void(0);"><img src="../static/images/fav.gif" />&nbsp;�����ղؼ�</a>&nbsp; <a href="javascript:;" onclick="xcopyf();"><img src="../static/images/share.gif" />&nbsp;�����ҵ���ַ</a></p>
     <?{else}?>
     ��ҳ�棺<span id="tbid">http://<?{$userdomain}?>.<?{$site_domain}?></span>
	<p><a onclick="setHomePage(this, 'http://<?{$userdomain}?>.<?{$site_domain}?>');" href="javascript:;"><img src="../static/images/home.gif" />&nbsp;��Ϊ��ҳ</a>&nbsp;<a onclick="addFav('http://<?{$userdomain}?>.<?{$site_domain}?>', '<?{$title|default:'5W���Ե���'}?>');" href="javascript:void(0);"><img src="../static/images/fav.gif" />&nbsp;�����ղؼ�</a>&nbsp; <a href="javascript:;" onclick="xcopyf();"><img src="../static/images/share.gif" />&nbsp;�����ҵ���ַ</a></p>
     <?{/if}?>
      </div>
     </div>
<?{/if}?>
   </div>
  	<div class="main" id="tab3" style="display:none;z-index:1;">
     <div class="set_url" >
     <form action="http://<?{$smarty.const.SITE_DOMAIN}?>/i/index.php?c=manage&a=changepwd" method="post" onSubmit="return ajaxCheck()">
     <p>&nbsp;��&nbsp;��&nbsp;�룺<input id="oldpass" name="oldpass" type="password" class="input" onblur="ajaxcheckoldpwd();"/><label id="oldpwdlabel">�����������</label></p>
     <p>&nbsp;��&nbsp;��&nbsp;�룺<input id="pass" name="pass" type="password" class="input" onblur="ajaxcheckpwd();"/><label id="pwdlabel">���볤������6���ַ�</label></p>
     <p>����һ�Σ�<input id="spass" name="spass" type="password" class="input" onblur="ajaxcheckpwd2();"/><label id="pwdlabel2">����һ��������</label></p>
     <p><input type="submit" value="�޸�" class="set_btn" style="margin-left:60px"/></p>
     </form>
     </div>
	</div>
   </div>

  <div class="manage_site">
  <div class="title">
   <span class="tab">��ַ��¼</span><label>С��ʾ����������ס����һ����϶���ַ����</label>
  </div>
  <div class="main">
  	<div id="divPageNav" style="vertical-align:top; width:842px; padding-left:6px;overflow:hidden;">
		<div id="pageNavNameList" class="pageNav_name" style="width:848px; overflow:hidden;">
		<div id="showLoad" style="DISPLAY:block;vertical-align:middle; text-align:center"><img src="http://<?{$smarty.const.SITE_DOMAIN}?>/tuan/images/loading.gif"><br>�����С�����</div></div>
	</div>

    <div class="save_site"> <input class="set_btn" type="button" value="���沼��" onclick="endsave()" />
    <input class="set_btn" type="button" value="������ҳ" onclick="location.href='<?{if $sets == 1}?>http://<?{$smarty.const.SITE_DOMAIN}?>/i/?<?{$userdomain}?><?{elseif $sets == 2}?>http://<?{$smarty.const.SITE_DOMAIN}?>/i/<?{$userdomain}?><?{else}?>http://<?{$userdomain}?>.<?{$site_domain}?><?{/if}?>';" />
    <input class="set_btn" type="button" onclick="if(confirm('ȷ��Ҫ�ָ����ĸ��Ե�������ʼ״̬������Ӻ��޸ĵ���ַ����ɾ����')){location.href='http://<?{$smarty.const.SITE_DOMAIN}?>/i/index.php?c=reset';}" value="�ָ���ʼ" /></div>
  </div>

 </div>

<div id="divUrl" title="<font color=black>�����ַ</font>" style="display:none; padding-top:20px;">
	<form id="addUrlForm" method="post" action="#" style="margin:0; padding:0;" onSubmit="return false;">
		<table style="width:350px; margin:0 auto; padding-left:5px;" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td align="right" height="30" width="70">���⣺</td><td align="left"><input type="text" style="width:150px; height:15px;" maxlength="10" id="UrlName" name="UrlName" /> *������д6����</td>
			</tr>
			<tr>
				<td align="right" height="38">��ַ��</td><td align="left"><input type="text" style="width:280px; height:15px;" id="UrlPath" name="UrlPath" /><input type="hidden" value="" id="UrltagID" name="UrltagID" /></td>
			</tr>
		</table>
	</form>
</div>
<div id="divModifyUrl" title="<font color=black>�޸���ַ</font>" style="display:none; padding-top:20px;">
	<form id="modifyUrlForm" method="post" action="#" style="margin:0; padding:0;" onSubmit="return false;">
		<table style="width:350px; margin:0 auto; padding-left:5px;" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td align="right" height="30" width="70">���⣺</td><td align="left"><input type="text" style="width:150px; height:15px;" maxlength="10" value="" id="modifyUrlName" name="UrlName" /><input type="hidden" value="" id="modifySiteID" name="siteID" /> *������д6����</td>
			</tr>
			<tr>
				<td align="right" height="38">��ַ��</td><td align="left"><input type="text" style="width:280px; height:15px;" value=""  id="modifyUrlPath" name="UrlPath" /><input type="hidden" id="modifyTagID" value="" name="modifyTagID"/></td>
			</tr>
		</table>
	</form>
</div>
<div id="divPage" title="<font color=black>��ӷ���</font>" style="display:none; padding-top:20px;">
	<form id="addPageForm" name="addPageForm" method="post" action="#" style="margin:0; padding:0;" onSubmit="return false;">
		<table style="width:350px; margin:0 auto; padding-left:5px;" border="0" cellpadding="0" cellspacing="0">
			<tr>
			<td align="right" height="30" width="70">����ͼƬ��</td><td align="left">
			<select name="atagImg" id="atagImg" onchange="chooseimg(this);" style="float:left;">			
			<?{foreach item=l from=$tagImg}?>
			<option value="<?{$l.iname}?>"><?{$l.name}?></option>
			<?{/foreach}?>
			</select><span style="float:left"><img src="../static/images/z_0.gif"/></span></td></tr>
			<tr>
				<td align="right" height="30" width="70">�������ƣ�</td><td align="left"><input type="text" style="width:150px; height:15px;" maxlength="10" id="addPageName" name="addPageName"/> *������д6����</td>
			</tr>
		</table>
	</form>
</div>
<div id="pageNavModify" title="<font color=black>�޸ķ���</font>" style="display:none; padding-top:20px;">
	<form id="modifyPageForm" method="post" action="#" style="margin:0; padding:0;" onSubmit="return false;">
		<table style="width:350px; margin:0 auto; padding-left:5px;" border="0" cellpadding="0" cellspacing="0">
			<tr>
			<td align="right" height="30" width="70">����ͼƬ��</td><td align="left">
			<select name="mtagImg" id="mtagImg" onchange="chooseimg(this);" style="float:left;">			
			<?{foreach item=l from=$tagImg}?>
			<option value="<?{$l.iname}?>"><?{$l.name}?></option>
			<?{/foreach}?>
			</select><span style="float:left"></span></td>
			</tr>
			<tr>
				<td align="right" height="30" width="70">�������ƣ�</td><td align="left"><input type="text" style="width:150px; height:15px;" maxlength="10" value="" id="pageName" name="pageName" /><input type="hidden" value="" id="modifyPageID" name="siteID" /> *������д6����</td>
			</tr>
		</table>
	</form>
</div>
<style>
.d_4{height:30px;line-height:25px;margin:0;width:580px;font-weight: bold;}
.tab_bg{background:#000;width:100%;}
.tab_bg tr td{background:#fff; text-align:center; height:30px;}
</style>
<?{$smarty.const.COUNT_CODE}?>
<script type="text/javascript">
getList();
</script>
</body>
</html>