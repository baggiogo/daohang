<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title><?{$smarty.const.PAGE_INDEX_TITLE}?></title>
<meta name="description" content="<?{$smarty.const.PAGE_INDEX_DESCRIPTION}?>" />
<meta name="keywords" content="<?{$smarty.const.PAGE_INDEX_KEYWORDS}?>" />
<link href="theme/<?{$smarty.const.THEME_PATH}?>css/style_default.css" rel="stylesheet" type="text/css" id="links"/>
<base target="_blank" />
</head>
<body onload="$('#kw').focus()">
<div id="container">
<div id="topbar">
<div id="top" class="center">
<div id="weather">
<iframe width="540" height="22" frameborder="0" scrolling="no" allowtransparency="true" src="http://<?{$smarty.const.SITE_DOMAIN}?>/data/html/tianqi.htm"></iframe>
</div>
<ul id="set">
<li class="sethome"><a onclick="setHomePage(this, 'http://<?{$smarty.const.SITE_DOMAIN}?>/');">��Ϊ��ҳ</a></li>
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
<h1 id="logo"><a style="behavior: url(#default#homepage)" title="��<?{$smarty.const.SITE_DOMAIN}?>��ַ���� ��Ϊ��ҳ" onclick="this.style.behavior='url(#default#homepage)';this.sethomepage('http://<?{$smarty.const.SITE_DOMAIN}?>/');return(false);" href="http://<?{$smarty.const.SITE_DOMAIN}?>" target=_self><img src="<?{$smarty.const.SITE_LOGO}?>" width="148" height="60"></a></h1>
<form name="mail" method="post" onsubmit="MailLogin.sendMail();return false;" action="">
<div class="top_login"><b>���䣺</b>
<select id="hao_mail_options" class="lg_select" onchange="MailLogin.change(this)"><option>--��ѡ��--</option><option>@163.com ����</option><option>@126.com ����</option><option>��¼�ٶ�</option><option>������</option><option>@sina.com ����</option><option>@yahoo.com.cn</option><option>@yahoo.cn</option><option>@sohu.com �Ѻ�</option><option>@tom.com</option><option>@21cn.com</option><option>@yeah.net</option><option>51.com</option><option>��������</option><option>ChinaRen</option><option>�������ڵ���ҳ��¼��</option><option>QQ�ռ�</option><option>@qq.com</option><option>@gmail.com</option><option>@hotmail.com</option><option>@139.com</option><option>������</option></select><br>
<b>�˺ţ�</b>
<input id="hao_mail_username" class="lg_input" type="text">
<b>���룺</b>
<input id="hao_mail_passwd" class="lg_pw" type="password">
<input class="lg_sub" value="��¼" type="submit">
</div></form>
<div id="topimg"><?{$adIndexMidArr.content|stripslashes}?></div>
<?{foreach name=adIndexArr item=list key=key from=$adIndexArr}?>
<div class="topimg_s" <?{if $key==1}?>id="t_s" style="display:none"<?{/if}?>><?{$list.content|stripslashes}?></div>
<?{/foreach}?>
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
<?{foreach item=s1 from=$search_class}?>
<li id="so_<?{$s1.classid}?>" <?{if $s1.is_default}?>class="cur"<?{/if}?> onclick="change(<?{$s1.classid}?>)"><a><?{$s1.classname}?></a></li>
<?{/foreach}?>
</ul>
<div class="ad3"><?{foreach item=ad3 from=$adsRightArr}?><?{$ad3.content|stripslashes}?><?{/foreach}?></div>
</div>
<div class="searchbox" id="sb">
<div id="sform">
<div id="sf">
<div id="search_form"><form name="f" action="<?{$defaultsearch.action}?>" method="get" ><p><a href="<?{$defaultsearch.url}?>"><img src="<?{$defaultsearch.img_url}?>" border="0" /></a><input type="text" size="42" class="int" autocomplete="off" name="<?{$defaultsearch.name}?>" id="kw"/><?{foreach from=$params item=p}?><input type="hidden" name="<?{$p[0]}?>" value="<?{$p[1]}?>"/><?{/foreach}?><input type="submit" value="<?{$defaultsearch.btn}?>" id="bdbutton" class="searchint"></p></form></div>
<div class="ctrl">
<?{foreach from=$search item=row1}?>
<label><input class="radio" onclick="changesearch(<?{$row1.id}?>)" type="radio" name="search_select" <?{if $row1.is_default}?> checked="checked"<?{/if}?> /><?{$row1.search_select}?></label>
<?{/foreach}?>
</div>
</div>
<div id="hot_words">
<ul>
<?{foreach name=adSeacherArr item=list from=$adSeacherArr}?>
<li><a href="<?{$list.url}?>" <?{if $list.namecolor !=''}?>style="color:<?{$list.namecolor}?>"<?{/if}?>><?{$list.name}?></a></li>
<?{/foreach}?>
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
<?{foreach name=toolList item=list from=$toolList key=key}?>
<li><a href="<?{$list.siteUrl}?>" <?{if $list.siteColor}?>style="color:<?{$list.siteColor}?>"<?{/if}?>><?{$list.siteName}?></a></li>
<?{/foreach}?>
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
<?{foreach name=SiteList item=cate from=$leftSiteList}?>
<?{if $cate.stpHtmlName}?><h2><a href="<?{$cate.stpHtmlName}?>"><?{$cate.stpName}?></a></h2><?{else}?><h2><?{$cate.stpName}?></h2><?{/if}?>
<ul>
<?{foreach name=CateList item=list from=$cate.sites key=key}?>
<li><a href="<?{$list.siteUrl}?>" <?{if $list.siteColor !=''}?>style="color:<?{$list.siteColor}?>"<?{/if}?>><?{$list.siteName}?></a></li>
<?{foreachelse}?>
��û���������Ŀ
<?{/foreach}?>
</ul>
<?{/foreach}?>
</div>
<div id="main">
<div id="main_tab">
<div class="wrap_main">
<ul class="clear_float" id="tabname">
<li id='s10' onMouseOver="qhshow(0);" onmouseout="clearTimeout(timer)" class="cur_main"><a><span>��վ����</span></a></li>
<?{foreach name=mztabs item=tab from=$mztabs}?>
<li id='s1<?{$tab.iid}?>' onMouseOver="qhshow(<?{$tab.iid}?>);" onmouseout="clearTimeout(timer)"><a><span><?{$tab.iname}?></span></a></li>
<?{/foreach}?>
</ul>
<div class="login"> <a href="i/?c=manage" class="my5w">��¼������ҳ</a> </div>
</div>
</div>
<div class="main_box" id="tabs">
<div class="mzdh_list1" id="s_s10" style="display:block">
<ul id="topsite">
<?{foreach name=mztop item=list from=$mztop}?>
<li><?{$list.content|stripslashes}?></li>
<?{/foreach}?>
</ul>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
<?{foreach name=mingzhanSiteList item=list from=$mingzhanSiteList key=key}?>
<td><a href="<?{$list.siteUrl}?>" <?{if $list.siteColor}?>style="color:<?{$list.siteColor}?>"<?{/if}?>><?{$list.siteName}?></a></td>
<?{if ($smarty.foreach.mingzhanSiteList.index+1) mod 6 eq 0}?></tr><tr><?{/if}?>
<?{/foreach}?>
<?{foreach name=adMingzhan item=list from=$adMingzhan}?>
<td><?{$list.content|stripslashes}?></a></td><?{if ($smarty.foreach.adMingzhan.index+1) mod 6 eq 0}?></tr><tr><?{/if}?>
<?{/foreach}?>
</table>
</div>
<div id="mzdh_other" style="display:none"></div>
</div>
<div class="mzdh_bottom">
<?{foreach name=adMidArr item=list from=$adMidArr}?>
<?{$list.content|stripslashes}?>
<?{/foreach}?>
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
<?{foreach name=coolSiteList item=cate from=$coolSiteList}?>
<tr class="<?{cycle values="bg1,bg2"}?>">
<th <?{if $smarty.foreach.coolSiteList.index eq 0}?><?{/if}?>><a href="<?{$cate.stpHtmlName}?>"><?{$cate.stpName}?></a></th>
<td class="s_widen"><?{foreach name=coolSite item=list from=$cate.sites}?>
<a href="<?{$list.siteUrl}?>" <?{if $list.siteColor}?>style="color:<?{$list.siteColor}?>"<?{/if}?>><?{$list.siteName}?></a><?{foreachelse}?>��û�����վ��<?{/foreach}?></td>
<td <?{if $smarty.foreach.coolSiteList.index eq 0}?>width=60<?{/if}?>><b><a href="<?{$cate.stpHtmlName}?>">����&raquo;</a></b></td>
</tr>
<?{/foreach}?>
</tbody>
</table>
</div>
</div>
</div>
<div class="bottom_nav">
<?{foreach name=footSiteList item=cate from=$footSiteList}?>
<div class="brow"><span><a href="<?{$cate.stpHtmlName}?>"><?{$cate.stpName}?>��</a></span>
<p>
<?{foreach name=SiteList item=list from=$cate.sites}?><a href="<?{$list.siteUrl}?>" <?{if $list.siteColor}?>style="color:<?{$list.siteColor}?>"<?{/if}?>><?{$list.siteName}?></a><?{/foreach}?>
</p>
<b><a href="<?{$cate.stpHtmlName}?>">����&raquo;</a></b></div>
<?{/foreach}?>
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
<?{include file="$footer_path"}?>
</div>
<script type="text/javascript" src="http://<?{$smarty.const.SITE_DOMAIN}?>/static/js/jquery.min.js"></script>
<script  type="text/javascript" charset="utf-8" src="http://<?{$smarty.const.SITE_DOMAIN}?>/static/js/taobao.js"></script>
<script type="text/javascript" src="http://<?{$smarty.const.SITE_DOMAIN}?>/static/js/index.js"></script>
<script type="text/javascript" src="http://<?{$smarty.const.SITE_DOMAIN}?>/static/js/mail.js"></script>
<script language="javascript" src="http://<?{$smarty.const.SITE_DOMAIN}?>/static/js/mobile.js"></script>
</body>
</html>