<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title><?{$smarty.const.PAGE_INDEX_TITLE}?></title>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta name=description content="<?{$smarty.const.PAGE_INDEX_DESCRIPTION}?>">
<meta name=keywords content="<?{$smarty.const.PAGE_INDEX_KEYWORDS}?>">
<link href="http://<?{$smarty.const.SITE_DOMAIN}?>/theme/<?{$smarty.const.THEME_PATH}?>css/base.css" rel="stylesheet" type="text/css" id="links"/>
<link href="http://<?{$smarty.const.SITE_DOMAIN}?>/theme/<?{$smarty.const.THEME_PATH}?>css/global.css" rel="stylesheet" type="text/css" id="links"/>
<script type="text/javascript" src="http://<?{$smarty.const.SITE_DOMAIN}?>/static/js/jquery.min.js"></script>
<script  type="text/javascript" charset="utf-8" src="http://<?{$smarty.const.SITE_DOMAIN}?>/static/js/taobao.js"></script>
<script type="text/javascript" src="http://<?{$smarty.const.SITE_DOMAIN}?>/static/js/index.js?20101130"></script>
<script type="text/javascript" src="http://<?{$smarty.const.SITE_DOMAIN}?>/static/js/mail.js?20101130"></script>
<base target="_blank" />
</head>
<body>
<div id="top">
<div id="weather">
<iframe width="540" height="22" frameborder="0" scrolling="no" allowtransparency="true" src="http://<?{$smarty.const.SITE_DOMAIN}?>/data/html/tianqi.htm"></iframe>
</div>
  <ul id="set">
    <li class="sethome"><a href="javascript:;" onclick="setHomePage(this, 'http://<?{$smarty.const.SITE_DOMAIN}?>/');">设为首页</a></li>
    <li class="feedback"><a href="message.php?type=3" target="_blank">提建议</a></li>
    <li><a href="http://<?{$smarty.const.SITE_DOMAIN}?>/i/?c=manage" class="my5w" target="_blank">登录个性首页</a></li>
  </ul>
</div>
<div id="header">
  <h1 id="logo"><a style="behavior: url(#default#homepage)" title="把<?{$smarty.const.SITE_DOMAIN}?>网址导航 设为主页" onclick="this.style.behavior='url(#default#homepage)';this.sethomepage('http://<?{$smarty.const.SITE_DOMAIN}?>/');clickcount('homepage1');return(false);" href="http://<?{$smarty.const.SITE_DOMAIN}?>" target=_self><img src="<?{$smarty.const.SITE_LOGO}?>" alt=""></a></h1>
  <form name="mail" method="post" onsubmit="MailLogin.sendMail();return false;" action="" target="_blank">
    <div class="top_login"><b>邮箱：</b><span style="border:1px solid #89c754; position:absolute; overflow:hidden">
<select id="hao_mail_options" class="lg_select" onchange="MailLogin.change(this)"><option>--请选择--</option><option>@163.com 网易</option><option>@126.com 网易</option><option>登录百度</option><option>人人网</option><option>@sina.com 新浪</option><option>@yahoo.com.cn</option><option>@yahoo.cn</option><option>@sohu.com 搜狐</option><option>@tom.com</option><option>@21cn.com</option><option>@yeah.net</option><option>51.com</option><option>天涯社区</option><option>ChinaRen</option><option>以下请在弹出页登录↓</option><option>QQ空间</option><option>@qq.com</option><option>@gmail.com</option><option>@hotmail.com</option><option>@139.com</option><option>开心网</option></select>
</span>
      <br>
      <b>账号：</b>
      <input id="hao_mail_username" class="lg_input" name="hao_mail_username" value="" type="text">
      <b>密码：</b>
      <input id="hao_mail_passwd" class="lg_pw" name="hao_mail_passwd" value="" type="password">
      <input class="lg_sub" value="登录" type="submit" style="cursor:pointer">
    </div>
  </form>
  <div id="topimg"><?{$adIndexMidArr.content|stripslashes}?></div>
<?{foreach name=adIndexArr item=list key=key from=$adIndexArr}?>
<div class="topimg_s" <?{if $key==1}?>id="t_s" style="display:none"<?{/if}?>><?{$list.content|stripslashes}?></div>
<?{/foreach}?>
  <div style="float:right">
  <iframe src="http://<?{$smarty.const.SITE_DOMAIN}?>/data/html/huangli.htm" width="165" height="64" SCROLLING="no" FRAMEBORDER="0"></iframe>
  </div>
</div><style>
#suggest_box{position:absolute;display:none;z-index:1100;text-align:left;}#suggest_box table{border:1px #333 solid;background:#fff;text-align:right;}#suggest_box tr{line-height:17px;}#suggest_box .hover{background:#36c;color:#fff;}
#suggest_box .hover .suggest_keyword,#suggest_box .hover .suggest_num{color:#fff;}
.suggest_keyword{text-align:left;padding:0 1em 0 3px;font-size:13px;overflow:hidden;white-space:nowrap;color:#000;}.suggest_num{color:green;font-size:12px;overflow:hidden;padding:0 3px;text-align:right;white-space:nowrap;}
.loginon{float:left;width:72px;height:25px;text-align:center;line-height:25px;cursor:pointer;color:#06C;background:url(http://<?{$smarty.const.SITE_DOMAIN}?>/static/images/dialog2_bg_on.jpg) no-repeat center;}
.loginoff{float:left;width:72px;height:25px;text-align:center;line-height:25px;cursor:pointer;color:#FFF;background:url(http://<?{$smarty.const.SITE_DOMAIN}?>/static/images/dialog2_bg_off.jpg) no-repeat center;}
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
<div id="sform"><div id="sf"><div id="search_form"><form name="f" action="<?{$defaultsearch.action}?>" method="get" ><p><a href="<?{$defaultsearch.url}?>"><img src="<?{$defaultsearch.img_url}?>" border="0" /></a><input type="text" size="42" class="int" autocomplete="off" name="<?{$defaultsearch.name}?>" id="kw"/><?{foreach from=$params item=p}?><input type="hidden" name="<?{$p[0]}?>" value="<?{$p[1]}?>"/><?{/foreach}?><input type="submit" value="<?{$defaultsearch.btn}?>" id="bdbutton" class="searchint"></p></form></div>
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
<div id="content">
  <div id="cate">
    <?{foreach name=SiteList item=cate from=$leftSiteList}?>
<?{if $cate.stpHtmlName}?><h2><a href="<?{$cate.stpHtmlName}?>" target="_blank"><?{$cate.stpName}?></a></h2><?{else}?><h2><?{$cate.stpName}?></h2><?{/if}?>
<ul>
<?{foreach name=CateList item=list from=$cate.sites key=key}?>
<li><a href="<?{$list.siteUrl}?>" <?{if $list.siteColor !=''}?>style="color:<?{$list.siteColor}?>"<?{/if}?>><?{$list.siteName}?></a></li>
<?{foreachelse}?>
还没有添加子栏目
<?{/foreach}?>
</ul>
<?{/foreach}?>

  </div>
  <div id="main">

    <div class="main_box">
      <div class="mzdh_list1" >
<ul id="topsite">
<?{foreach name=mztop item=list from=$mztop}?>
<li><?{$list.content|stripslashes}?></li>
<?{/foreach}?>
</ul>
       <table width="100%" border="0" cellspacing="0" cellpadding="0"><tr>
<?{foreach name=mingzhanSiteList item=list from=$mingzhanSiteList key=key}?>
    <td><a target="_blank" onclick="addHistory('<?{$list.siteName|strip_tags}?>', '<?{$list.siteUrl}?>')" href="<?{$list.siteUrl}?>" <?{if $list.siteColor}?>style="color:<?{$list.siteColor}?>"<?{/if}?>><?{$list.siteName}?></a></td>
<?{if ($smarty.foreach.mingzhanSiteList.index+1) mod 6 eq 0}?></tr><tr><?{/if}?>
<?{/foreach}?>
<?{foreach name=adMingzhan item=list from=$adMingzhan}?>
<td><?{$list.content|stripslashes}?></a></td><?{if ($smarty.foreach.adMingzhan.index+1) mod 6 eq 0}?></tr><tr><?{/if}?>
<?{/foreach}?>
</table>

      </div>
    </div>
    <div class="mzdh_bottom"><?{foreach name=adMidArr item=list from=$adMidArr}?>
<?{$list.content|stripslashes}?>
<?{/foreach}?></div>
    <div class="cate">
      <table width="100%" cellspacing=0>
        <tbody>
        <?{foreach name=coolSiteList item=cate from=$coolSiteList}?>
<tr class="<?{cycle values="bg1,bg2"}?>">
<th><a href="<?{$cate.stpHtmlName}?>" target="_blank"><?{$cate.stpName}?></a></th>
<td class="s_widen"><?{foreach name=coolSite item=list from=$cate.sites}?>
<a href="<?{$list.siteUrl}?>" target="_blank" <?{if $list.siteColor}?>style="color:<?{$list.siteColor}?>"<?{/if}?>><?{$list.siteName}?></a><?{foreachelse}?>还没有添加站点<?{/foreach}?></td>

<td width=60><b><a href="<?{$cate.stpHtmlName}?>" target="_blank">更多&raquo;</a></b></td>
</tr>
<?{/foreach}?>

        </tbody>
      </table>
    </div>
  </div>
</div>
<div class="bottom_nav">
<?{foreach name=footSiteList item=cate from=$footSiteList}?>
<div class="brow"><span><a href="<?{$cate.stpHtmlName}?>" target="_blank"><?{$cate.stpName}?>：</a></span>
<p>
<?{foreach name=SiteList item=list from=$cate.sites}?><a href="<?{$list.siteUrl}?>" target="_blank" <?{if $list.siteColor}?>style="color:<?{$list.siteColor}?>"<?{/if}?>><?{$list.siteName}?></a><?{/foreach}?>
</p>
<b><a href="<?{$cate.stpHtmlName}?>" target="_blank">更多&raquo;</a></b></div>
<?{/foreach}?>

</div>

<?{include file="$footer_path"}?>
</body>
</html>
