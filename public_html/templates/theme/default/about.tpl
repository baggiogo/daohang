<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title><?{$smarty.const.PAGE_INDEX_TITLE}?></title>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta name="keywords" content="<?{$smarty.const.PAGE_INDEX_KEYWORDS}?>" />
<meta name="description" content="<?{$smarty.const.PAGE_INDEX_DESCRIPTION}?>" />
<link href="http://<?{$smarty.const.SITE_DOMAIN}?>/theme/<?{$smarty.const.THEME_PATH}?>css/detail.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://<?{$smarty.const.SITE_DOMAIN}?>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="http://<?{$smarty.const.SITE_DOMAIN}?>/static/js/index.js?20101101"></script>
</head>
<body>
<div id="header_detail">
  <div id="logo"><a href="/"><img src="http://<?{$smarty.const.SITE_DOMAIN}?>/<?{$smarty.const.SITE_LOGO}?>" /></a></div>
  <div id="search_s"><form id="baidu_search" name="f" action="http://www.baidu.com/s" method="get" target="_blank">
        <p><a href="http://www.baidu.com/index.php?tn=leebootool_pg&ch=7" target="_blank"><img src="http://<?{$smarty.const.SITE_DOMAIN}?>/static/images/logo_web.gif" id="baidu_logo" border="0" /></a>
        <input type="text" size=42  class="input" autocomplete="off" name="word" id="kw" style="height:26"/>
        <input type="submit" value="�ٶ�һ��" class="submit">
        <input type="hidden" name='ct' id='ct' value="">
	<input type="hidden" name='tn' id='tn' value="">
	<input type="hidden" id='i' value="">
	</p>
        <span><a style=""></a></span></form>
  </div>
</div>
<div class="bar_nav">
  <div class="tree"><a href="/">��ҳ</a> > ����<?{$smarty.const.SITE_NAME}?></div>
  <div class="sethome2"><a href="javascript:;" onclick="setHomePage(this, 'http://<?{$smarty.const.SITE_DOMAIN}?>');">��<?{$smarty.const.SITE_NAME}?>��Ϊ��ҳ</a></div>
</div>
<div id="main">
  <dl>
    <dt><label>����<?{$smarty.const.SITE_NAME}?> </label></dt>
    <dd class="line_b"><?{$smarty.const.SITE_NAME}?>��ַ����վ��һ��רҵ����ַ������վ,��ַ������¼��������ȫ����ַվ��<br /><br />
<?{$smarty.const.SITE_NAME}?>����վ��������ַ����վ,�Կ�ݡ�ʵ�á����㡢��ɫ�����Ե��ŵ㣬�����������������������Ȥ��<br />
<br />
��ӭʹ��<?{$smarty.const.SITE_NAME}?><br /><br />

<h2>��ϵ��ʽ</h2>
������κ�������飬�����ţ�<a href="mailto:<?{$smarty.const.ADMIN_EMAIL}?>"><?{$smarty.const.ADMIN_EMAIL}?></a></dd>
  </dl>
  
</div>
<?{include file="$footer_path"}?>
</body>
</html>

