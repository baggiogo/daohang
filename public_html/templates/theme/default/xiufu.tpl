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
  <div class="tree"><a href="/">��ҳ</a> > ��ҳ�޸�</div>
  <div class="sethome2"><a href="javascript:;" onclick="setHomePage(this, 'http://<?{$smarty.const.SITE_DOMAIN}?>');">��<?{$smarty.const.SITE_DOMAIN}?>��Ϊ��ҳ</a></div>
</div>
<div id="main">
  <dl>
    <dt><label>5w��ҳ������۸ģ��Ҹ���ô�죿 </label></dt>
    <dd>����һ��ʹ����ҳ�޸��������<br />

      360��ȫ��ʿ������ҳ&nbsp;&nbsp;&nbsp;<a href="360suoding.htm" target="_blank">ʹ��˵��>></a><br />

      ��������ʹ�������ݷ�ʽ<br />

    �������5w�����ݷ�ʽ&nbsp;&nbsp;&nbsp;<a href="ies.htm" target="_blank">ͼʾ˵��>></a></dd>
  </dl>
  <dl>
    <dt><label>�ڳ�����������ν�5w��Ϊ��ҳ��</label></dt>
    <dd>1.�����ie�ｫ5w��Ϊ��ҳ��&nbsp;&nbsp;&nbsp;<a href="sheshouye.htm" target="_blank">����鿴��ϸ����>></a> <br />
 
      2.<a href="sheshouyef.htm" target="_blank">�����360����������Ρ��ѹ����������5wΪ��ҳ��</a></dd>
  </dl>
  <dl>
    <dt><label>5w��ҳ�򲻿�����ʾ��ȫ���Ҹ���ô�죿 </label></dt>
    <dd class="line_b">����һ�� ��<span class="red"> F5 �� Ctrl+F5 </span>���¼�����ҳ<br />

      ������������������ˢ�°�ť��ˢ��ҳ��<br />

      ��������������������&nbsp;&nbsp;&nbsp;<a href="huancun.htm" target="_blank">�建���������>></a> </dd>
  </dl>
  <p style="text-align:center; padding:12px 0 0 0; clear:both">�������ߵ�����Ҳ����ͬ�������ţ������ѱ�ҳ��ַ�����������ѣ� </p>
</div>
<?{include file="$footer_path"}?>
</body>
</html>

