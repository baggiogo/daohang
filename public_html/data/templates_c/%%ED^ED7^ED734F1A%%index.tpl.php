<?php /* Smarty version 2.6.18, created on 2014-08-13 01:53:22
         compiled from theme/default/index.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('modifier', 'stripslashes', 'theme/default/index.tpl', 41, false),array('function', 'cycle', 'theme/default/index.tpl', 176, false),)), $this); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title><?php echo @PAGE_INDEX_TITLE; ?>
</title>
<meta name="description" content="<?php echo @PAGE_INDEX_DESCRIPTION; ?>
" />
<meta name="keywords" content="<?php echo @PAGE_INDEX_KEYWORDS; ?>
" />
<link href="theme/<?php echo @THEME_PATH; ?>
css/style_default.css" rel="stylesheet" type="text/css" id="links"/>
<base target="_blank" />
</head>
<body onload="$('#kw').focus()">
<div id="container">
<div id="topbar">
<div id="top" class="center">
<div id="weather">
<iframe width="540" height="22" frameborder="0" scrolling="no" allowtransparency="true" src="http://<?php echo @SITE_DOMAIN; ?>
/data/html/tianqi.htm"></iframe>
</div>
<ul id="set">
<li class="sethome"><a onclick="setHomePage(this, 'http://<?php echo @SITE_DOMAIN; ?>
/');">��Ϊ��ҳ</a></li>
<li class="feedback"><a href="message.php?type=3">�Ὠ��</a></li>
<li class="setbar"><a onclick="my()">��������</a></li>
</ul>
</div></div>
<div class="bg" id="mystylediv" style="display:none">
<div class="mystylediv">
<iframe name="ifStyle" width="100%" height="260" id="ifStyle" frameBorder="0" marginWidth="0" scrolling="no" allowTransparency="allowtransparency"></iframe>
</div>
</div>
<div id="mystyle">
<div id="header" class="center w990">
<h1 id="logo"><a style="behavior: url(#default#homepage)" title="��<?php echo @SITE_DOMAIN; ?>
��ַ���� ��Ϊ��ҳ" onclick="this.style.behavior='url(#default#homepage)';this.sethomepage('http://<?php echo @SITE_DOMAIN; ?>
/');return(false);" href="http://<?php echo @SITE_DOMAIN; ?>
" target=_self><img src="<?php echo @SITE_LOGO; ?>
" width="148" height="60"></a></h1>
<form name="mail" method="post" onsubmit="MailLogin.sendMail();return false;" action="">
<div class="top_login"><b>���䣺</b>
<select id="hao_mail_options" class="lg_select" onchange="MailLogin.change(this)"><option>--��ѡ��--</option><option>@163.com ����</option><option>@126.com ����</option><option>��¼�ٶ�</option><option>������</option><option>@sina.com ����</option><option>@yahoo.com.cn</option><option>@yahoo.cn</option><option>@sohu.com �Ѻ�</option><option>@tom.com</option><option>@21cn.com</option><option>@yeah.net</option><option>51.com</option><option>��������</option><option>ChinaRen</option><option>�������ڵ���ҳ��¼��</option><option>QQ�ռ�</option><option>@qq.com</option><option>@gmail.com</option><option>@hotmail.com</option><option>@139.com</option><option>������</option></select><br>
<b>�˺ţ�</b>
<input id="hao_mail_username" class="lg_input" type="text">
<b>���룺</b>
<input id="hao_mail_passwd" class="lg_pw" type="password">
<input class="lg_sub" value="��¼" type="submit">
</div></form>
<div id="topimg"><?php echo ((is_array($_tmp=$this->_tpl_vars['adIndexMidArr']['content'])) ? $this->_run_mod_handler('stripslashes', true, $_tmp) : stripslashes($_tmp)); ?>
</div>
<?php $_from = $this->_tpl_vars['adIndexArr']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['adIndexArr'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['adIndexArr']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['list']):
        $this->_foreach['adIndexArr']['iteration']++;
?>
<div class="topimg_s" <?php if ($this->_tpl_vars['key'] == 1): ?>id="t_s" style="display:none"<?php endif; ?>><?php echo ((is_array($_tmp=$this->_tpl_vars['list']['content'])) ? $this->_run_mod_handler('stripslashes', true, $_tmp) : stripslashes($_tmp)); ?>
</div>
<?php endforeach; endif; unset($_from); ?>
<div style="float:right"><iframe src="data/html/huangli.htm" allowtransparency="true" style="background-color=transparent;" width="155" height="64" SCROLLING="no" FRAMEBORDER="0"></iframe></div>
</div>
<style>
#suggest_box{position:absolute;display:none;z-index:1100;text-align:left;}#suggest_box table{border:1px #333 solid;background:#fff;text-align:right;}#suggest_box tr{line-height:17px;}#suggest_box .hover{background:#36c;color:#fff;}
#suggest_box .hover .suggest_keyword,#suggest_box .hover .suggest_num{color:#fff;}
.suggest_keyword{text-align:left;padding:0 1em 0 3px;font-size:13px;overflow:hidden;white-space:nowrap;color:#000;}.suggest_num{color:green;font-size:12px;overflow:hidden;padding:0 3px;text-align:right;white-space:nowrap;}
</style>
<div id="search" class="center w990">
<div class="wrap02">
<ul class="clear_float" id="s_ul">
<?php $_from = $this->_tpl_vars['search_class']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['s1']):
?>
<li id="so_<?php echo $this->_tpl_vars['s1']['classid']; ?>
" <?php if ($this->_tpl_vars['s1']['is_default']): ?>class="cur"<?php endif; ?> onclick="change(<?php echo $this->_tpl_vars['s1']['classid']; ?>
)"><a><?php echo $this->_tpl_vars['s1']['classname']; ?>
</a></li>
<?php endforeach; endif; unset($_from); ?>
</ul>
<div class="ad3"><?php $_from = $this->_tpl_vars['adsRightArr']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['ad3']):
?><?php echo ((is_array($_tmp=$this->_tpl_vars['ad3']['content'])) ? $this->_run_mod_handler('stripslashes', true, $_tmp) : stripslashes($_tmp)); ?>
<?php endforeach; endif; unset($_from); ?></div>
</div>
<div class="searchbox" id="sb">
<div id="sform">
<div id="sf">
<div id="search_form"><form name="f" action="<?php echo $this->_tpl_vars['defaultsearch']['action']; ?>
" method="get" ><p><a href="<?php echo $this->_tpl_vars['defaultsearch']['url']; ?>
"><img src="<?php echo $this->_tpl_vars['defaultsearch']['img_url']; ?>
" border="0" /></a><input type="text" size="42" class="int" autocomplete="off" name="<?php echo $this->_tpl_vars['defaultsearch']['name']; ?>
" id="kw"/><?php $_from = $this->_tpl_vars['params']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['p']):
?><input type="hidden" name="<?php echo $this->_tpl_vars['p'][0]; ?>
" value="<?php echo $this->_tpl_vars['p'][1]; ?>
"/><?php endforeach; endif; unset($_from); ?><input type="submit" value="<?php echo $this->_tpl_vars['defaultsearch']['btn']; ?>
" id="bdbutton" class="searchint"></p></form></div>
<div class="ctrl">
<?php $_from = $this->_tpl_vars['search']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['row1']):
?>
<label><input class="radio" onclick="changesearch(<?php echo $this->_tpl_vars['row1']['id']; ?>
)" type="radio" name="search_select" <?php if ($this->_tpl_vars['row1']['is_default']): ?> checked="checked"<?php endif; ?> /><?php echo $this->_tpl_vars['row1']['search_select']; ?>
</label>
<?php endforeach; endif; unset($_from); ?>
</div>
</div>
<div id="hot_words">
<ul>
<?php $_from = $this->_tpl_vars['adSeacherArr']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['adSeacherArr'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['adSeacherArr']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['list']):
        $this->_foreach['adSeacherArr']['iteration']++;
?>
<li><a href="<?php echo $this->_tpl_vars['list']['url']; ?>
" <?php if ($this->_tpl_vars['list']['namecolor'] != ''): ?>style="color:<?php echo $this->_tpl_vars['list']['namecolor']; ?>
"<?php endif; ?>><?php echo $this->_tpl_vars['list']['name']; ?>
</a></li>
<?php endforeach; endif; unset($_from); ?>
</ul>
</div>
</div>
</div>
</div>

<div id="content" class="center w990">
<div id="cate">
<div id="tool">
<h2 class="tool-title">ʵ�ù���<span><a href="http://chaxun.5w.com/">����&raquo;</a></span></h2>
<ul>
<?php $_from = $this->_tpl_vars['toolList']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['toolList'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['toolList']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['list']):
        $this->_foreach['toolList']['iteration']++;
?>
<li><a href="<?php echo $this->_tpl_vars['list']['siteUrl']; ?>
" <?php if ($this->_tpl_vars['list']['siteColor']): ?>style="color:<?php echo $this->_tpl_vars['list']['siteColor']; ?>
"<?php endif; ?>><?php echo $this->_tpl_vars['list']['siteName']; ?>
</a></li>
<?php endforeach; endif; unset($_from); ?>
</ul>
</div>
<ul id="tool-tab">
<li id="tool-tab1" rel="tb4" onClick="toolChange(1);" class="active">�ֻ�</li>
<li id="tool-tab2" rel="tb1" onClick="toolChange(2);" class="">��Ϸ</li>
<li id="tool-tab3" rel="tb2" onClick="toolChange(3);" class="">��Ʊ</li>
<li id="tool-tab4" rel="tb3" onClick="toolChange(4);" class="">�Ƶ�</li>
</ul>
<div id="tb">
<div id="tb1" class="tbox" style="display:inline-block;"><iframe width="217" SCROLLING="no" FRAMEBORDER="0" src="http://www.5w.com/data/html/mobile.htm" allowtransparency="true" style="background-color=transparent"></iframe></div>
<div id="tb2" class="tbox" style="display:none"><iframe width="217" id="tbif2" SCROLLING="no" FRAMEBORDER="0" allowtransparency="true" style="background-color=transparent"></iframe></div>
<div id="tb3" class="tbox" style="display:none"><iframe width="217" id="tbif3" SCROLLING="no" FRAMEBORDER="0" allowtransparency="true" style="background-color=transparent"></iframe></div>
<div id="tb4" class="tbox" style="display:none"><iframe width="217" id="tbif4" SCROLLING="no" src="" FRAMEBORDER="0" allowtransparency="true" style="background-color=transparent"></iframe></div>
</div>
<?php $_from = $this->_tpl_vars['leftSiteList']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['SiteList'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['SiteList']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['cate']):
        $this->_foreach['SiteList']['iteration']++;
?>
<?php if ($this->_tpl_vars['cate']['stpHtmlName']): ?><h2><a href="<?php echo $this->_tpl_vars['cate']['stpHtmlName']; ?>
"><?php echo $this->_tpl_vars['cate']['stpName']; ?>
</a></h2><?php else: ?><h2><?php echo $this->_tpl_vars['cate']['stpName']; ?>
</h2><?php endif; ?>
<ul>
<?php $_from = $this->_tpl_vars['cate']['sites']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['CateList'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['CateList']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['list']):
        $this->_foreach['CateList']['iteration']++;
?>
<li><a href="<?php echo $this->_tpl_vars['list']['siteUrl']; ?>
" <?php if ($this->_tpl_vars['list']['siteColor'] != ''): ?>style="color:<?php echo $this->_tpl_vars['list']['siteColor']; ?>
"<?php endif; ?>><?php echo $this->_tpl_vars['list']['siteName']; ?>
</a></li>
<?php endforeach; else: ?>
��û���������Ŀ
<?php endif; unset($_from); ?>
</ul>
<?php endforeach; endif; unset($_from); ?>
</div>
<div id="main">
<div id="main_tab">
<div class="wrap_main">
<ul class="clear_float" id="tabname">
<li id='s10' onMouseOver="qhshow(0);" onmouseout="clearTimeout(timer)" class="cur_main"><a><span>��վ����</span></a></li>
<?php $_from = $this->_tpl_vars['mztabs']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['mztabs'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['mztabs']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['tab']):
        $this->_foreach['mztabs']['iteration']++;
?>
<li id='s1<?php echo $this->_tpl_vars['tab']['iid']; ?>
' onMouseOver="qhshow(<?php echo $this->_tpl_vars['tab']['iid']; ?>
);" onmouseout="clearTimeout(timer)"><a><span><?php echo $this->_tpl_vars['tab']['iname']; ?>
</span></a></li>
<?php endforeach; endif; unset($_from); ?>
</ul>
<div class="login"> <a href="i/?c=manage" class="my5w">��¼������ҳ</a> </div>
</div>
</div>
<div class="main_box" id="tabs">
<div class="mzdh_list1" id="s_s10" style="display:block">
<ul id="topsite">
<?php $_from = $this->_tpl_vars['mztop']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['mztop'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['mztop']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['list']):
        $this->_foreach['mztop']['iteration']++;
?>
<li><?php echo ((is_array($_tmp=$this->_tpl_vars['list']['content'])) ? $this->_run_mod_handler('stripslashes', true, $_tmp) : stripslashes($_tmp)); ?>
</li>
<?php endforeach; endif; unset($_from); ?>
</ul>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<?php $_from = $this->_tpl_vars['mingzhanSiteList']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['mingzhanSiteList'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['mingzhanSiteList']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['key'] => $this->_tpl_vars['list']):
        $this->_foreach['mingzhanSiteList']['iteration']++;
?>
<td><a href="<?php echo $this->_tpl_vars['list']['siteUrl']; ?>
" <?php if ($this->_tpl_vars['list']['siteColor']): ?>style="color:<?php echo $this->_tpl_vars['list']['siteColor']; ?>
"<?php endif; ?>><?php echo $this->_tpl_vars['list']['siteName']; ?>
</a></td>
<?php if (( ($this->_foreach['mingzhanSiteList']['iteration']-1)+1 ) % 6 == 0): ?></tr><tr><?php endif; ?>
<?php endforeach; endif; unset($_from); ?>
<?php $_from = $this->_tpl_vars['adMingzhan']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['adMingzhan'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['adMingzhan']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['list']):
        $this->_foreach['adMingzhan']['iteration']++;
?>
<td><?php echo ((is_array($_tmp=$this->_tpl_vars['list']['content'])) ? $this->_run_mod_handler('stripslashes', true, $_tmp) : stripslashes($_tmp)); ?>
</a></td><?php if (( ($this->_foreach['adMingzhan']['iteration']-1)+1 ) % 6 == 0): ?></tr><tr><?php endif; ?>
<?php endforeach; endif; unset($_from); ?>
</table>
</div>
<div id="mzdh_other" style="display:none"></div>
</div>
<div class="mzdh_bottom">
<?php $_from = $this->_tpl_vars['adMidArr']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['adMidArr'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['adMidArr']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['list']):
        $this->_foreach['adMidArr']['iteration']++;
?>
<?php echo ((is_array($_tmp=$this->_tpl_vars['list']['content'])) ? $this->_run_mod_handler('stripslashes', true, $_tmp) : stripslashes($_tmp)); ?>

<?php endforeach; endif; unset($_from); ?>
</div>
<div class="cate">
<div id="taobao">
                	<div class="taobao1"><img src="static/images/taobao.gif" width="81" height="24" /></div>
                    <div style="width:390px; float:left; height:25px; padding-top:4px;">
                    <form method="get" action="http://search8.taobao.com/browse/search_auction.htm" target="_blank">
                    <input  id="q" name="q" type="text" class="sear">
                     <input type="submit" value="" class="s_menu"/>
                    <input name="pid" value="mm_19869273_2351859_9092254" type="hidden">
                    <input name="unid" value="" type="hidden">	<input type="hidden" value="all" name="commend"/> 
					<input type="hidden" value="auction" name="search_type"/>
					<input type="hidden" value="initiative" name="user_action"/>
					<input type="hidden" value="D9_5_1" name="f"/>
					<input type="hidden" value="1" name="at_topsearch"/>
					<input type="hidden" value="" name="sort"/>
					<input type="hidden" value="66" name="mode"/>
					<input type="hidden" value="0" name="spercent"/></form>

                   
                    </div>
                    <div class="s_txt">��<a href="http://s8.taobao.com/search?q=%D0%C2%BF%EE%B4%BA%D7%B0&pid=mm_19869273_2351859_9092254&unid=0&mode=63" target="_blank">2011�¿װ</a>����<a href="http://pindao.huoban.taobao.com/tms/channel/onsale.htm?pid=mm_19869273_2351859_9092254" target="_blank">�Ա�����</a>����<a href="http://pindao.huoban.taobao.com/tms/channel/huangguan.htm?pid=mm_19869273_2351859_9092254" target="_blank">�Ա��ʹڵ�</a></div>
</div>
<table width="100%" cellspacing=0>
<tbody>
<?php $_from = $this->_tpl_vars['coolSiteList']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['coolSiteList'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['coolSiteList']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['cate']):
        $this->_foreach['coolSiteList']['iteration']++;
?>
<tr class="<?php echo smarty_function_cycle(array('values' => "bg1,bg2"), $this);?>
">
<th <?php if (($this->_foreach['coolSiteList']['iteration']-1) == 0): ?><?php endif; ?>><a href="<?php echo $this->_tpl_vars['cate']['stpHtmlName']; ?>
"><?php echo $this->_tpl_vars['cate']['stpName']; ?>
</a></th>
<td class="s_widen"><?php $_from = $this->_tpl_vars['cate']['sites']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['coolSite'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['coolSite']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['list']):
        $this->_foreach['coolSite']['iteration']++;
?>
<a href="<?php echo $this->_tpl_vars['list']['siteUrl']; ?>
" <?php if ($this->_tpl_vars['list']['siteColor']): ?>style="color:<?php echo $this->_tpl_vars['list']['siteColor']; ?>
"<?php endif; ?>><?php echo $this->_tpl_vars['list']['siteName']; ?>
</a><?php endforeach; else: ?>��û�����վ��<?php endif; unset($_from); ?></td>
<td <?php if (($this->_foreach['coolSiteList']['iteration']-1) == 0): ?>width=60<?php endif; ?>><b><a href="<?php echo $this->_tpl_vars['cate']['stpHtmlName']; ?>
">����&raquo;</a></b></td>
</tr>
<?php endforeach; endif; unset($_from); ?>
</tbody>
</table>
</div>
</div>
</div>
<div class="bottom_nav">
<?php $_from = $this->_tpl_vars['footSiteList']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['footSiteList'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['footSiteList']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['cate']):
        $this->_foreach['footSiteList']['iteration']++;
?>
<div class="brow"><span><a href="<?php echo $this->_tpl_vars['cate']['stpHtmlName']; ?>
"><?php echo $this->_tpl_vars['cate']['stpName']; ?>
��</a></span>
<p>
<?php $_from = $this->_tpl_vars['cate']['sites']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }$this->_foreach['SiteList'] = array('total' => count($_from), 'iteration' => 0);
if ($this->_foreach['SiteList']['total'] > 0):
    foreach ($_from as $this->_tpl_vars['list']):
        $this->_foreach['SiteList']['iteration']++;
?><a href="<?php echo $this->_tpl_vars['list']['siteUrl']; ?>
" <?php if ($this->_tpl_vars['list']['siteColor']): ?>style="color:<?php echo $this->_tpl_vars['list']['siteColor']; ?>
"<?php endif; ?>><?php echo $this->_tpl_vars['list']['siteName']; ?>
</a><?php endforeach; endif; unset($_from); ?>
</p>
<b><a href="<?php echo $this->_tpl_vars['cate']['stpHtmlName']; ?>
">����&raquo;</a></b></div>
<?php endforeach; endif; unset($_from); ?>
</div>
<div class="search_bottom">
<div id="search_bottom">
<form  method="get" action="http://www.soso.com/q" name="f"><p><a href="http://www.soso.com/?unc=b400056&amp;cid=union.s.wh"><img border="0" src="http://www.5w.com/static/images/s/soso.gif"></a><input type="text" id="b_kw" name="w" autocomplete="off" class="int" size="42"><input type="hidden" value="b400056" name="unc"><input type="hidden" value="union.s.wh" name="cid"><input type="hidden" value="gb2312" name="ie"><input type="submit" class="btn" id="bdbutton" value="�� ��"></p></form>
</div>
<ul><li><input class="radio" onclick="b_changesearch(46)" type="radio" name="b_search_select">�Ա�</li>
<li><input class="radio" onclick="b_changesearch(22)" type="radio" name="b_search_select" checked>����</li>
<li><input class="radio" onclick="b_changesearch(36)" type="radio" name="b_search_select">�ѹ�</li>
<li><input class="radio" onclick="b_changesearch(4)" type="radio" name="b_search_select">�ٶ�</li>
<li><input class="radio" onclick="b_changesearch(13)" type="radio" name="b_search_select">�ȸ�</li>
<li><input class="radio" onclick="b_changesearch(44)" type="radio" name="b_search_select">�е�</li>
<li><input class="radio" onclick="b_changesearch(45)" type="radio" name="b_search_select">Ӱ��</li>
</ul>
<div class="gotop"><a href="#" target="_self">���ض�����</a></div>
</div>
</div>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => ($this->_tpl_vars['footer_path']), 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
</div>
<script type="text/javascript" src="http://<?php echo @SITE_DOMAIN; ?>
/static/js/jquery.min.js"></script>
<script  type="text/javascript" charset="utf-8" src="http://<?php echo @SITE_DOMAIN; ?>
/static/js/taobao.js"></script>
<script type="text/javascript" src="http://<?php echo @SITE_DOMAIN; ?>
/static/js/index.js"></script>
<script type="text/javascript" src="http://<?php echo @SITE_DOMAIN; ?>
/static/js/mail.js"></script>
<script language="javascript" src="http://<?php echo @SITE_DOMAIN; ?>
/static/js/mobile.js"></script>
</body>
</html>