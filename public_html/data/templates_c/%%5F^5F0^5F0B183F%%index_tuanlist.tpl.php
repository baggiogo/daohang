<?php /* Smarty version 2.6.18, created on 2014-08-15 13:02:54
         compiled from tuan/index_tuanlist.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'default', 'tuan/index_tuanlist.tpl', 83, false),)), $this); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title><?php echo $_GET['city']; ?>
�Ź� - <?php echo $_GET['city']; ?>
�Ź��� - 5w�Ź�! �C <?php echo $_GET['city']; ?>
�Ź�������רҵ���Ź���վ! </title>
<META name="keywords" content="<?php echo $_GET['city']; ?>
�Ź�,<?php echo $_GET['city']; ?>
�Ź���,�Ź�,�Ź���,�Ź���վ,�����Ź�,�Ź�����,�Ź���ȫ,�Ź���վ��ȫ" />
<META name="description" content="ȫ����רҵ���Ź���,����,Ŵ��,����,QQ��,������,�ȸ���������Ϣ���,���Ϻ����Ź���,�����Ź���,�Ϻ��Ź����Լ�����,����,�Ͼ�,�ɶ�,�ൺ,������ȫ���Ź������Ź���Ϣ,5wӵ���Ź���վ��ȫ����߼�ֵ���Ź���Ϣ,����<?php echo $_GET['city']; ?>
�Ź�ÿ���Ź���Ϣ,������רҵ���Ź�������" />
<?php if ($_GET['p'] > 1): ?><META name="robots" content="noindex,follow" />
<?php endif; ?>
<META name="copyright" content="www.taoku.com" />
<link href="http://<?php echo @SITE_DOMAIN; ?>
/tuan/css/tuan.css?20110316" rel="stylesheet" type="text/css" />
<SCRIPT type=text/javascript>
var arrEndTime=[],timmer;
function $(a){
  return document.getElementById(a);
}
function initIframeHeight(){
  $("showLoad").style.display="none";
  $("showPro").style.display="block";
  var iframeHeight = document.getElementById('lis1').offsetHeight+document.getElementById('lis2').offsetHeight+10;//document.body.offsetHeight;
  if(iframeHeight<=300) iframeHeight = 300;
  parent.document.getElementById('iframepage').height=iframeHeight+"px";
  countDown();
}
function countDown(){
	for(var i = 0; i < arrEndTime.length; i++){
		var countDownId = arrEndTime[i]["countDownId"],
			endTime  = arrEndTime[i]["endTime"] + "000",
			lastTime = (parseInt(endTime) - new Date().getTime()) / 1000,
			days     =  Math.floor(lastTime  / (24 * 3600)),
			lastSec  = (lastTime - days * 24 * 3600),
			hours    = Math.floor(lastSec/3600),
			minutes  = Math.floor((lastSec - hours * 3600)/60),
			seconds  = Math.floor(lastSec - (hours * 3600) - (minutes * 60));
	if(days <= 0){
		days = 0;
	}else{
		days = days;
	}
	if(lastTime <= 0){
		$(countDownId).innerHTML = "<font>�Ź��ѽ���</font>";
	}else{
		$(countDownId).innerHTML = "���� <font class='orange'>"+days+"</font>��<font class='orange'>"+hours+"</font>Сʱ<font class='orange'>"+minutes+"</font>��<font class='orange'>"+seconds+"</font>��";
	}
	}
	clearInterval(timmer);
	timmer = setInterval(countDown,1000);
}
function changeCity(){
	var dis = $("city_drop").style.display;
	if(dis == "block") $("city_drop").style.display="none";
	else $("city_drop").style.display="block";


	 $('city_drop').style.zIndex = 999;
}


function hideCity(){
	$("city_drop").style.display="none";
}

function SetCookie(name, value, expires, path){
	var date = new Date();
	date.setTime(date.getTime() + 30*86400);
	expires = date.toGMTString();
	path    = '/';
	document.cookie=name+"="+escape(value)+("; expires="+expires)+("; path="+path);
}
</script>
</head>
<body style="background:none">
<div id="city_drop" style="display:none">
    <ul>
	<?php $_from = $this->_tpl_vars['arrCitys']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['arrCitys'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['arrCitys']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['cityitem']):
        $this->_foreach['arrCitys']['iteration']++;
?>
	<?php if ($this->_tpl_vars['key'] < 75): ?><li><a href="http://<?php echo @SITE_DOMAIN; ?>
/tuan/index.php?c=tuan&a=list&city=<?php echo $this->_tpl_vars['cityitem']['city']; ?>
" onclick="SetCookie('tuancity','<?php echo $this->_tpl_vars['cityitem']['city']; ?>
');"><?php echo $this->_tpl_vars['cityitem']['city']; ?>
</a></li><?php endif; ?>
	<?php endforeach; endif; unset($_from); ?>
	</ul>
</div>
<div id="lis1" class="tg_mall_list_title2">
  <h3>
	<ul class="city_tag">
	  <li id="city" onclick=changeCity();><?php echo ((is_array($_tmp=@$_GET['city'])) ? $this->_run_mod_handler('default', true, $_tmp, "ȫ��") : smarty_modifier_default($_tmp, "ȫ��")); ?>
<a class="qhbtn" href="javascript:void(0);" target="_self">�����б�</a>

	  </li>
	  <li <?php if ($_GET['type'] == 0): ?>class="hovertab"<?php endif; ?>><a class="cate_ico1" href="http://<?php echo @SITE_DOMAIN; ?>
/tuan/index.php?c=tuan&a=list">�����Ź�</a></li>
	  <?php $_from = $this->_tpl_vars['arrTypes']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['arrTypes'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['arrTypes']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['typeitem']):
        $this->_foreach['arrTypes']['iteration']++;
?>
	  <li <?php if ($_GET['type'] == $this->_tpl_vars['typeitem']['tid']): ?>class="hovertab"<?php endif; ?>><a class="cate_ico<?php echo $this->_tpl_vars['key']+2; ?>
" href="http://<?php echo @SITE_DOMAIN; ?>
/tuan/index.php?c=tuan&a=list&city=<?php echo $_GET['city']; ?>
&type=<?php echo $this->_tpl_vars['typeitem']['tid']; ?>
&p=<?php echo $_GET['p']; ?>
"><?php echo $this->_tpl_vars['typeitem']['typename']; ?>
</a></li>
	  <?php endforeach; endif; unset($_from); ?>
	</ul>
  </h3>
</div>
<div id="lis2" class="tg_mall_list" onclick="hideCity()" style="margin-top:0; border-top:none; padding-bottom:10px">
<div id="showLoad" style="DISPLAY:block;vertical-align:middle; text-align:center"><img src="http://<?php echo @SITE_DOMAIN; ?>
/tuan/images/loading.gif"><br>�����С�����</div>
  <div id="showPro" style="DISPLAY:none;">
	<div class="tgcnt_bd">
	  <h4>
      <span class="price">
	  <?php $_from = $this->_tpl_vars['arrPrices']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['arrPrices'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['arrPrices']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['pkey'] => $this->_tpl_vars['pitem']):
        $this->_foreach['arrPrices']['iteration']++;
?>
	  <a href="http://<?php echo @SITE_DOMAIN; ?>
/tuan/index.php?c=tuan&a=list&city=<?php echo $_GET['city']; ?>
&type=<?php echo $_GET['type']; ?>
&price=<?php echo $this->_tpl_vars['pkey']; ?>
" <?php if ($_GET['price'] == $this->_tpl_vars['pkey']): ?>class="price_a"<?php endif; ?>><?php echo $this->_tpl_vars['pitem']; ?>
</a>
	  <?php endforeach; endif; unset($_from); ?>
	  <input type="text" id="tags" name="tags" size="10"><input type="submit" onclick="window.location.href='index.php?c=tuan&a=list&tags='+escape(document.getElementById('tags').value)" value="����">
	  </span>
	  
	  <div class="page" style="width:320px;"><ul><?php echo $this->_tpl_vars['pager']; ?>
</ul></div>

	  </h4>
	</div>
<div id="list">
      <?php $_from = $this->_tpl_vars['voLists']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['voLists'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['voLists']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['item']):
        $this->_foreach['voLists']['iteration']++;
?>
      <div onmouseover="this.className='item item_select';" onmouseout="this.className='item'" class="item">
      <dl>
         <dt><a href="<?php echo $this->_tpl_vars['item']['goodurl']; ?>
" title="<?php echo $this->_tpl_vars['item']['title']; ?>
" target="_blank" class="orange">��<?php echo $this->_tpl_vars['item']['sitename']; ?>
��</a><a href="<?php echo $this->_tpl_vars['item']['goodurl']; ?>
" title="<?php echo $this->_tpl_vars['item']['title']; ?>
" target="_blank"><?php echo $this->_tpl_vars['item']['title']; ?>
</a></dt>
         <dd class="img"><?php if ($this->_tpl_vars['item']['personnum'] > 1000): ?><label class="hotimg">hot</label><?php endif; ?><a href="<?php echo $this->_tpl_vars['item']['goodurl']; ?>
" title="<?php echo $this->_tpl_vars['item']['title']; ?>
" target="_blank"><img src="<?php echo $this->_tpl_vars['item']['imageurl']; ?>
" border="0" width="235px" height="160px"></a></dd>
         <dd class="rebate">
         <span class="bougth"><b>��<?php echo $this->_tpl_vars['item']['newprice']; ?>
</b><label><em><?php echo ((is_array($_tmp=@$this->_tpl_vars['item']['discount'])) ? $this->_run_mod_handler('default', true, $_tmp, 0) : smarty_modifier_default($_tmp, 0)); ?>
</em>��</label></span>
        
         </dd>
         <dd class="btn"><a  target="_blank" href="<?php echo $this->_tpl_vars['item']['goodurl']; ?>
">����</a></dd>
         <dd class="price">
         <span class="value">ԭ�ۣ�</span>
          <del><?php echo $this->_tpl_vars['item']['price']; ?>
Ԫ</del>
          <span class="p"><?php echo ((is_array($_tmp=@$this->_tpl_vars['item']['personnum'])) ? $this->_run_mod_handler('default', true, $_tmp, 0) : smarty_modifier_default($_tmp, 0)); ?>
���Ѿ�����</span>
          </dd>
         <dd class="endtime" id="countDownId_<?php echo $this->_tpl_vars['item']['gid']; ?>
"></dd>
         
         </dl>
         <SCRIPT>
			 arrEndTime.push({"countDownId":"countDownId_"+<?php echo $this->_tpl_vars['item']['gid']; ?>
,"endTime":<?php echo $this->_tpl_vars['item']['endtime']; ?>
});
		  </SCRIPT>
		
      </div><?php endforeach; endif; unset($_from); ?>
      </div>

	  <div class="page" style="width:960px;"><ul><?php echo $this->_tpl_vars['pager']; ?>
</ul></div>
	
  </div>
</div>
<SCRIPT type=text/javascript>
initIframeHeight();
</SCRIPT>
</body>
</html>