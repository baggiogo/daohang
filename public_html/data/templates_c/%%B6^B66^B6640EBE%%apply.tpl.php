<?php /* Smarty version 2.6.18, created on 2014-08-14 14:39:42
         compiled from theme/default/apply.tpl */ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>�ύ��վ_<?php echo @PAGE_INDEX_TITLE; ?>
</title>
<meta name="keywords" content="<?php echo @PAGE_INDEX_KEYWORDS; ?>
" />
<meta name="description" content="<?php echo @PAGE_INDEX_DESCRIPTION; ?>
" />
<link href="http://<?php echo @SITE_DOMAIN; ?>
/theme/<?php echo @THEME_PATH; ?>
css/detail.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://<?php echo @SITE_DOMAIN; ?>
/static/js/jquery.min.js"></script>
<script type="text/javascript" src="http://<?php echo @SITE_DOMAIN; ?>
/static/js/index.js?20101101"></script>
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

function checkSite()
  {
  	  var name = $("#name").val();
	  var url = $("#url").val();
	  var contact = $("#contact").val();

	  var alexaRank = $("#alexaRank").val();


	  if (name == '') {
	  	 alert('������վ������!');
		 return false;
	  }

	  if (url == '') {
	  	alert('������վ������');
		return false;
	  }

	  if (contact == '') {
	  	alert('��������ϵ��ʽ');
		return false;
	  }



	  if (alexaRank == '') {
	  	alert('������Alexa����');
		return false;
	  }


	  return true;
  }
</script>
</head>
<body>
<div id="header_detail">
  <div id="logo"><a href="http://<?php echo @SITE_DOMAIN; ?>
/"><img src="http://<?php echo @SITE_DOMAIN; ?>
/<?php echo @SITE_LOGO; ?>
" /></a></div>
  <div id="search_s">
  <form id="baidu_search" name="f" action="http://www.baidu.com/s" method="get" target="_blank">
        <p><a href="http://www.baidu.com/index.php?tn=leebootool_pg&ch=7" target="_blank"><img src="http://<?php echo @SITE_DOMAIN; ?>
/static/images/logo_web.gif" id="baidu_logo" border="0" /></a>
        <input type="text" size=42  class="input" autocomplete="off" name="word" id="kw" style="height:26"/>
        <input type="submit" value="�ٶ�һ��" class="submit">
        <input type="hidden" name='ct' id='ct' value="">
	<input type="hidden" name='tn' id='tn' value="">
	<input type="hidden" id='i' value="">
	</p>
        <span><a></a></span></form>
  </div>
</div>
<div class="bar_nav">
  <div class="tree"><a href="http://<?php echo @SITE_DOMAIN; ?>
/">��ҳ</a> > ��¼����</div>
  <div class="sethome2"><a style="cursor:pointer" onclick="setHomePage(this, 'http://<?php echo @SITE_DOMAIN; ?>
');">��<?php echo @SITE_NAME; ?>
��Ϊ��ҳ</a></div>
</div>
<div id="main">
  <dl>
    <dt>
      <label>�ύ����վ����Ϣ</label>
    </dt>
    <dd class="line_b" style=" padding-bottom:0px">
   <ul class="url">
   <form id="add" method="post" onsubmit="return checkSite();" action="http://<?php echo @SITE_DOMAIN; ?>
/apply.php?a=add">
     <li>��������д�������ϣ�</li>
     <li><span><em class="red">*</em>�Ƽ���ַ��</span>
       <input name="url" id="url" type="text" /><label>��վ���ӵ�ַ</label></li>
     <li><span>��վ���ƣ�</span><input name="name" id="name" type="text" /><label>��վ����������(������������)</label></li>
     <li><span>��ϵ��ʽ��</span><input name="contact" id="contact" type="text" class="s"  /><label>��QQ��MSN���ֻ�����</label></li>
     <li><span>Alexa������</span><input name="alexaRank" id="alexaRank" type="text" class="s" /><label>ȫ����վ����&nbsp;&nbsp;<a href="http://www.aosoo.com/" target="_blank">��ѯAlexa����</a></label>
     </li>
     <li><span>��վʱ�䣺</span><input name="buildDate" id="buildDate" type="text" class="s" /></li>
     <li><span>��֤�룺</span><input name="tbSafeCode" id="tbSafeCode" type="text" class="s" maxlength="4" size="8"  value=""/><img align="absmiddle" src="class/safeCode.img.php" width="56" height="17" class="button" onClick="this.src='admin/safeCode.img.php?'+Math.random()" /></li>
     <li><span>&nbsp;</span> <input type="submit" value="�ύ����" class="submit" /> <input type="button" value="�����д" class="submit" /></li>
     <li class="orange">��ʾ�����ύ��¼����һ�ܺ�δ��¼�����ʾ�������벻�ɹ������Ժ����ύ��</li>
     <li></li>
   </form>
   </ul>

</dd>
  </dl>
  <div class="yaoqiu">
  <h1><?php echo @SITE_NAME; ?>
��¼������Ҫ��</h1>
  <ul>
  <li>Alexa����20�����ڣ��Ҿ������µĸ�����վ��</li>
<li>��վ���ݽ������Ϸ�,�޲��������������������Ϣ��ҵ��ICP/IP��������վ��</li>
<li>���<?php echo @SITE_NAME; ?>
��������,δ��ӵĽ���������¼��<a href="javascript:;" onclick="$('#show1').show();$('#show2').show()">(�鿴��������ʾ��)</a></li>
  </ul>
  <h2 id="show1" style="display:none">��������ʾ��:</h2>
  <ul id="show2" style="display:none">
        <li><span>��վ˵����</span>
          <?php echo @SITE_NAME; ?>

          <label></label>
        </li>
        <li><span>��ҳ��ַ��</span>
          <?php echo @SITE_DOMAIN; ?>

          <label></label>
        </li>
        <li><span>�������ӣ�</span>
          <input type="text" size="60" id="textLinkCode" value="&lt;a href=&quot;http://<?php echo @SITE_DOMAIN; ?>
&quot; target=&quot;_blank&quot;&gt;<?php echo @SITE_NAME; ?>
&lt;/a&gt;" />
          <label><a href="javascript:copyText('textLinkCode');">�������</a></label>
        </li>
        <li><span>ͼƬ���ӣ�</span><img src="http://<?php echo @SITE_DOMAIN; ?>
/<?php echo @SITE_LOGO; ?>
" />
          <label></label>
        </li>
        <li><span>ͼƬ���룺</span>
         <textarea cols="50" rows="3" id="imgLinkCode"><a href="http://<?php echo @SITE_DOMAIN; ?>
/" target="_blank"><img alt="<?php echo @SITE_NAME; ?>
" src="http://<?php echo @SITE_DOMAIN; ?>
/<?php echo @SITE_LOGO; ?>
" width="214" height="60" border="0" /></a></textarea>
          <label><a onclick="copyText('imgLinkCode');" href="javascript:;">�������</a></label>
        </li>
      </ul>

  </div>
</div>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => ($this->_tpl_vars['footer_path']), 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
</body>
</html>
