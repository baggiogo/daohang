<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>�������_<?{$smarty.const.PAGE_INDEX_TITLE}?></title>
<link href="theme/<?{$smarty.const.THEME_PATH}?>css/base.css" rel="stylesheet" type="text/css" id="links"/>
<link href="theme/<?{$smarty.const.THEME_PATH}?>css/global.css" rel="stylesheet" type="text/css" id="links"/>
<script type="text/javascript" src="http://<?{$smarty.const.SITE_DOMAIN}?>/static/js/jquery.min.js"></script>
<script type="text/javascript" src="http://<?{$smarty.const.SITE_DOMAIN}?>/static/js/index.js?20101101"></script>
<script language="javascript">
function checkMessage()
{
	var title   = $("#title").val();
	var content = $("#content").val();
	var contact = $("#contact").val();
	var yzm     = $("#yzm").val();
	var type    = $("#type").val();

	if (type == '') {
		alert('��ѡ����!');
		return false;
	}

	if (title == '') {
		alert('����д�ƺ�!');
		return false;
	}

	if (content == '') {
		alert('����д����!');
		return false;
	}

	if (contact == '') {
		alert('����д������ϵ��ʽ,���ֻ���QQ���绰����!');
		return false;
	}

	if (yzm == '') {
		alert('����д��֤��!');
		return false;
	}
	else {
		if (!yzm.match(/^[0-9a-zA-Z]{4}$/)) {
			alert("�Բ�����֤���ʽ����!");
			return false;
		}
	}
	return true;
}
</script>
</head>

<body>
<div id="content">
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
  <div class="tree"><a href="/">��ҳ</a> > �������</div>
  <div class="sethome2"><a href="javascript:;" onclick="setHomePage(this, 'http://<?{$smarty.const.SITE_DOMAIN}?>');">��<?{$smarty.const.SITE_NAME}?>��Ϊ��ҳ</a></div>
</div>
<div id="main_detail">
  <dl>
    <dt>
      <label>�������</label>
    </dt>
    <dd class="line_b" >
    <form action="message.php?a=add" method="post" onsubmit="return checkMessage();">
    <input type="hidden" name="urlfrom" value="<?{$urlfrom}?>">
    <input type="hidden" name="type" id="type" value="1">
      <ul class="url">
        <li><span><em class="red">*</em>���ĳƺ���</span>
        <input type="text" name="title" id="title" value="<?{$smarty.const.SITE_NAME}?>�û�" onclick="if(this.value=='<?{$smarty.const.SITE_NAME}?>�û�'){select();}"/>
        </li>
        <li><span>���Ľ��飺</span>
          <textarea name="content" id="content" style="width:500px"></textarea>
        </li>
        <li><span>������ϵ��ʽ��</span>
          <input type="text" name="contact" id="contact" value=""/>
        </li>
        <li><span>��֤�룺</span>
        <input type="text" name="yzm" id="yzm" style="width:60px"/>
          <label><img src="class/safeCode.img.php" onclick="this.src = this.src+'?'+Math.random()"  /> </label>
          <input type="submit" value="�ύ" class="submit" />
        </li>
      </ul>
     </form>
    </dd>
  </dl>
  

</div>
<?{include file="$footer_path"}?>
</div>
</body>
</html>
