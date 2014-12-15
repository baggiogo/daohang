<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title><?{$smarty.const.PAGE_INDEX_TITLE}?></title>
<meta name="description" content="<?{$smarty.const.PAGE_INDEX_DESCRIPTION}?>" />
<meta name="keywords" content="<?{$smarty.const.PAGE_INDEX_KEYWORDS}?>" />
<link href="theme/<?{$smarty.const.THEME_PATH}?>css/base.css" rel="stylesheet" type="text/css" id="links"/>
<link href="theme/<?{$smarty.const.THEME_PATH}?>css/global.css" rel="stylesheet" type="text/css" id="links"/>
<script type="text/javascript" src="static/js/jquery.min.js"></script>
<script  type="text/javascript" charset="utf-8" src="http://<?{$smarty.const.SITE_DOMAIN}?>/static/js/taobao.js"></script>
<script type="text/javascript" src="static/js/index.js?20101101"></script>
<script type="text/javascript" src="static/js/mail.js?20101101"></script>
<script language="javascript" src="static/js/mobile.js"></script>
<base target="_blank" />
</head>
<body onload="$('#kw').focus()" class="body">
<div id="content">
<div id="top" class="clearfix">
<div id="weather">
<iframe width="540" height="22" frameborder="0" scrolling="no" allowtransparency="true" src="http://<?{$smarty.const.SITE_DOMAIN}?>/data/html/tianqi.htm"></iframe>
</div>
<ul id="set">
<li class="sethome"><a href="javascript:;" onclick="setHomePage(this, 'http://<?{$smarty.const.SITE_DOMAIN}?>/');">��Ϊ��ҳ</a></li>
<li class="feedback"><a href="message.php?type=3">�Ὠ��</a></li>
</ul>
</div>

<div id="header">
<div class="box clearfix">
<h1 id="logo"><a style="behavior: url(#default#homepage)" title="��<?{$smarty.const.SITE_DOMAIN}?>��ַ���� ��Ϊ��ҳ" onclick="this.style.behavior='url(#default#homepage)';this.sethomepage('http://<?{$smarty.const.SITE_DOMAIN}?>/');return(false);" href="http://<?{$smarty.const.SITE_DOMAIN}?>" target=_self><img src="<?{$smarty.const.SITE_LOGO}?>"></a></h1>
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
<div style="float:right"><iframe src="data/html/huangli.htm" width="165" height="64" SCROLLING="no" FRAMEBORDER="0"></iframe></div>
</div><b class="rc-bt"><b></b></b></div>

<style>
#suggest_box{position:absolute;display:none;z-index:1100;text-align:left;}#suggest_box table{border:1px #333 solid;background:#fff;text-align:right;}#suggest_box tr{line-height:17px;}#suggest_box .hover{background:#36c;color:#fff;}
#suggest_box .hover .suggest_keyword,#suggest_box .hover .suggest_num{color:#fff;}
.suggest_keyword{text-align:left;padding:0 1em 0 3px;font-size:13px;overflow:hidden;white-space:nowrap;color:#000;}.suggest_num{color:green;font-size:12px;overflow:hidden;padding:0 3px;text-align:right;white-space:nowrap;}
</style>
<div id="search">
<div class="wrap02">
<ul class="clear_float" id="s_ul">
<?{foreach item=s1 from=$search_class}?>
<li id="so_<?{$s1.classid}?>" <?{if $s1.is_default}?>class="cur"<?{/if}?> onclick="change(<?{$s1.classid}?>)"><a><?{$s1.classname}?></a></li>
<?{/foreach}?>
</ul>
<div class="ad3"><?{foreach item=ad3 from=$adsRightArr}?><?{$ad3.content|stripslashes}?><?{/foreach}?></div>
</div>
</div>

<div class="searchbox">
<div id="sform">
<div id="sf">
<div id="search_form">
<form name="f" action="<?{$defaultsearch.action}?>" method="get" ><p><a href="<?{$defaultsearch.url}?>"><img src="<?{$defaultsearch.img_url}?>" border="0" /></a><input type="text" size="42" class="int" autocomplete="off" name="<?{$defaultsearch.name}?>" id="kw"/><?{foreach from=$params item=p}?><input type="hidden" name="<?{$p[0]}?>" value="<?{$p[1]}?>"/><?{/foreach}?><input type="submit" value="<?{$defaultsearch.btn}?>" id="bdbutton" class="searchint"></p></form></div>
<div class="ctrl">
<?{foreach from=$search item=row1}?>
<label><input class="radio" onclick="changesearch(<?{$row1.id}?>)" type="radio" name="search_select" <?{if $row1.is_default}?> checked="checked"<?{/if}?> /><?{$row1.search_select}?></label>
<?{/foreach}?>
</div>
</div>
<div id="hot_words">
<ul>
<?{foreach name=adSeacherArr item=list from=$adSeacherArr}?>
<li><a href="<?{$list.url}?>" style="color:<?{$list.namecolor}?>"><?{$list.name}?></a></li>
<?{/foreach}?>
</ul>
</div>
</div>
</div>
<div id="content_all">
<div id="cate">
<b class="rc-tp"><b></b></b>
  <div class="box">
<div id="tool">
<h2 class="tool-title">ʵ�ù���<span><a href="http://chaxun.5w.com/">����&raquo;</a></span></h2>
<ul>
<?{foreach name=toolList item=list from=$toolList key=key}?>
<li><a href="<?{$list.siteUrl}?>" <?{if $list.siteColor}?>style="color:<?{$list.siteColor}?>"<?{/if}?>><?{$list.siteName}?></a></li>
<?{/foreach}?>
</ul>

<ul id="tool-tab">
<li id="tool-tab1" rel="tb4" onClick="toolChange(1);" class="active">�ֻ�</li>
<li id="tool-tab2" rel="tb1" onClick="toolChange(2);" class="">��Ϸ</li>
<li id="tool-tab3" rel="tb2" onClick="toolChange(3);" class="">��Ʊ</li>
<li id="tool-tab4" rel="tb3" onClick="toolChange(4);" class="">�Ƶ�</li>
</ul>
<div id="tb">
<div id="tb1" class="tbox" style="display:inline-block;"><iframe width="217" SCROLLING="no" FRAMEBORDER="0" src="http://www.5w.com/data/html/mobile.htm"></iframe></div>
<div id="tb2" class="tbox" style="display:none"><iframe width="217" id="tbif2" SCROLLING="no" FRAMEBORDER="0"></iframe></div>
<div id="tb3" class="tbox" style="display:none"><iframe width="217" id="tbif3" SCROLLING="no" FRAMEBORDER="0"></iframe></div>
<div id="tb4" class="tbox" style="display:none"><iframe width="217" id="tbif4" SCROLLING="no" src="" FRAMEBORDER="0"></iframe></div>

</div>
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
<?{/foreach}?></div>
<b class="rc-bt"><b></b></b>
</div>

<div id="main">

<div id="bm"><b class="rc-tp"><b></b></b>
<ul id="tabname" class="clearfix">
<li id='s10' onMouseOver="qhshow(0);" onmouseout="clearTimeout(timer)" class="cur_main"><a><span>��վ����</span></a></li>
<?{foreach name=mztabs item=tab from=$mztabs}?>
<li id='s1<?{$tab.iid}?>' onMouseOver="qhshow(<?{$tab.iid}?>);" onmouseout="clearTimeout(timer)"><a><span><?{$tab.iname}?></span></a></li>
<?{/foreach}?>
</ul>
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
<div id="mzdh_other" style="display:none"></div> <b class="rc-bt"><b></b></b>
</div>
<div class="mzdh_bottom">
<?{foreach name=adMidArr item=list from=$adMidArr}?>
<?{$list.content|stripslashes}?>
<?{/foreach}?>
</div>
<div class="cate">
<b class="rc-tp"><b></b></b>
        <div class="box">
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
        <b class="rc-bt"><b></b></b>
</div>
</div>
<div id="meta"><b class="rc-tp"><b></b></b>
    <div class="box">

<?{foreach name=footSiteList item=cate from=$footSiteList}?>
<div class="brow"><span><a href="<?{$cate.stpHtmlName}?>"><?{$cate.stpName}?>��</a></span>
<p>
<?{foreach name=SiteList item=list from=$cate.sites}?><a href="<?{$list.siteUrl}?>" <?{if $list.siteColor}?>style="color:<?{$list.siteColor}?>"<?{/if}?>><?{$list.siteName}?></a><?{/foreach}?>
</p>
<b><a href="<?{$cate.stpHtmlName}?>">����&raquo;</a></b></div>
<?{/foreach}?>
    </div>
  </div>

<div id="fs">
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
    <b class="rc-bt"><b></b></b></div>


<?{include file="$footer_path"}?></div></div>
</body>
</html>