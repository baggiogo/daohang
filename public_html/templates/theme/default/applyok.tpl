<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>�ύ��վ_<?{$smarty.const.PAGE_INDEX_TITLE}?></title>
<meta name="keywords" content="<?{$smarty.const.PAGE_INDEX_KEYWORDS}?>" />
<meta name="description" content="<?{$smarty.const.PAGE_INDEX_DESCRIPTION}?>" />
<title><?{$smarty.const.PAGE_INDEX_TITLE}?></title>
<link href="http://<?{$smarty.const.SITE_DOMAIN}?>/theme/<?{$smarty.const.THEME_PATH}?>css/detail.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://<?{$smarty.const.SITE_DOMAIN}?>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="http://<?{$smarty.const.SITE_DOMAIN}?>/static/js/index.js?20101101"></script>
<script language="javascript">
function copyText(obj)
{
	var text = $('#'+obj).val();
	if(window.clipboardData) { 
		window.clipboardData.setData("Text",text);
		alert("���Ƴɹ�!"); 
	}
	else {
		alert("���������֧��,���Լ����ƴ���!"); 
	}
}
</script>
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
  <div class="tree"><a href="/">��ҳ</a> > ��¼�����ύ���</div>
  <div class="sethome2"><a href="javascript:;" onclick="setHomePage(this, 'http://<?{$smarty.const.SITE_DOMAIN}?>');">��<?{$smarty.const.SITE_DOMAIN}?>��Ϊ��ҳ</a></div>
</div>
<div id="main">
  <dl>
    <dt>
      <label>�ύ����վ����Ϣ</label>
    </dt>
    <dd class="line_b" >
      <div class="tip">
        <h2>��ϲ��������վ����Ϣ�Ѿ��ύ�ɹ���</h2>
        <span>����������ҳ���<?{$smarty.const.SITE_NAME}?>���������ӣ����ǵĹ�����Ա����ʼ��������վ������ˣ�δ���<?{$smarty.const.SITE_NAME}?>�������ӵ�վ�㽫�޷�ͨ����ˡ�</span> </div>
      <ul class="link">
      <li><h2>��������ʾ��:</h2></li>
        <li><span>��վ˵����</span>
          <?{$smarty.const.SITE_NAME}?>
          <label></label>
        </li>
        <li><span>��ҳ��ַ��</span>
          <?{$smarty.const.SITE_DOMAIN}?>
          <label></label>
        </li>
        <li><span>�������ӣ�</span>
          <input type="text" id="textLinkCode" value="&lt;a href=&quot;http://<?{$smarty.const.SITE_DOMAIN}?>&quot; target=&quot;_blank&quot;&gt;<?{$smarty.const.SITE_NAME}?>&lt;/a&gt;" />
          <label><a href="javascript:copyText('textLinkCode');">�������</a></label>
        </li>
        <li><span>ͼƬ���ӣ�</span><img src="http://<?{$smarty.const.SITE_DOMAIN}?>/<?{$smarty.const.SITE_LOGO}?>" />
          <label></label>
        </li>
        <li><span>ͼƬ���룺</span>
         <textarea cols="" rows="" id="imgLinkCode"><a href="http://<?{$smarty.const.SITE_DOMAIN}?>/" target="_blank"><img alt="<?{$smarty.const.SITE_NAME}?>" src="http://<?{$smarty.const.SITE_DOMAIN}?>/<?{$smarty.const.SITE_LOGO}?>" width="214" height="60" border="0" /></a></textarea>
          <label><a href="javascript:copyText('imgLinkCode');">�������</a></label>
        </li>
      </ul>
    </dd>
  </dl>
  <div class="yaoqiu">
    <h1><?{$smarty.const.SITE_NAME}?>��¼������Ҫ��</h1>
    <ul>
      <li>Alexa����20�����ڣ��Ҿ������µĸ�����վ��</li>
      <li>��վ���ݽ������Ϸ�,�޲��������������������Ϣ��ҵ��ICP/IP��������վ��</li>
      <li>���<?{$smarty.const.SITE_NAME}?>��������,δ��ӵĽ���������¼��</li>
    </ul>
  </div>
</div>
<?{include file="$footer_path"}?>
</body>
</html>

