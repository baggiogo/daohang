<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title>5w����С˵��������¼������ȫ��С˵��ַ</title>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<link href="http://<?{$smarty.const.SITE_DOMAIN}?>/theme/<?{$smarty.const.THEME_PATH}?>css/book.css?2011042515" rel="stylesheet" type="text/css" />
<style>
#suggest_box {
	position:absolute;
	display:none;
	z-index:1100;
	text-align:left;
}
#suggest_box table {
	border:1px #333 solid;
	background:#fff;
	text-align:right;
}
#suggest_box tr {
	line-height:17px;
}
#suggest_box .hover {
	background:#36c;
	color:#fff;
}
#suggest_box .hover .suggest_keyword, #suggest_box .hover .suggest_num {
	color:#fff;
}
.suggest_keyword {
	text-align:left;
	padding:0 1em 0 3px;
	font-size:13px;
	overflow:hidden;
	white-space:nowrap;
	color:#000;
}
.suggest_num {
	color:green;
	font-size:12px;
	overflow:hidden;
	padding:0 3px;
	text-align:right;
	white-space:nowrap;
}
</style>
<base target="_blank" />
</head>
<body>
<div class="auto_hidden" id="auto"></div>
<div id="header_detail">
  <div id="logo"><a href="http://<?{$smarty.const.SITE_DOMAIN}?>/"><img src="http://<?{$smarty.const.SITE_DOMAIN}?>/static/images/logo.gif" /></a></div>
  <div class="logo_xs" title="5w��ַ����С˵��">5w��ַ����С˵��</div>
  <div id="sform_detail">
    <form name="f" action="<?{$defaultsearch.action}?>" method="get" onsubmit="return gotosearch();">
      <a href="<?{$defaultsearch.url}?>"><img src="http://<?{$smarty.const.SITE_DOMAIN}?>/<?{$defaultsearch.img_url}?>" border="0" /></a>
      <input type="text" style=" width:262px" class="int" onkeyup="ac.start(event)" autocomplete="off" name="<?{$defaultsearch.name}?>" id="kw"/>
      <?{foreach from=$params item=p}?>
      <input type="hidden" name="<?{$p[0]}?>" value="<?{$p[1]}?>"/>
      <?{/foreach}?>
      <input type="submit" value="<?{$defaultsearch.btn}?>" id="bdbutton" class="searchint">
    </form>
  </div>
  <div class="hotword"> <a href="http://www.soso.com/q?w=%B4%A9%D4%BD%D0%A1%CB%B5&unc=b400056&cid=union.s.wh&ie=gb2312">��ԽС˵</a> <a href="http://www.soso.com/q?w=%D0%A1%CB%B5%CF%C2%D4%D8&unc=b400056&cid=union.s.wh&ie=gb2312">С˵����</a> <a href="http://www.soso.com/q?w=%D0%A1%CB%B5%C5%C5%D0%D0%B0%F1&unc=b400056&cid=union.s.wh&ie=gb2312">С˵���а�</a> <a href="http://www.soso.com/q?w=%B6%B7%C6%C6%B2%D4%F1%B7&unc=b400056&cid=union.s.wh&ie=gb2312">���Ʋ��</a></div>
</div>
<div id="guide">
  <div class="fr"> <span>���ŷ���:</span> <a href="http://www.5w.com/caipiao.htm">��Ʊ</a><a href="http://www.5w.com/stock.htm">��Ʊ</a><a href="http://www.5w.com/jijin.htm">����</a><a href="http://www.5w.com/movie.htm">��Ӱ</a><a href="http://www.5w.com/wanmei.htm">��Ƶ</a><a href="http://www.5w.com/music.htm">����</a><a href="http://www.5w.com/book.htm">С˵</a><a href="http://www.5w.com/game.htm">��Ϸ</a><a href="http://www.5w.com/tu.htm">��ͼ</a><a href="http://www.5w.com/nba.htm">NBA</a><a href="http://www.5w.com/newsweek.htm">����</a><a href="http://www.5w.com/liangxing.htm">����</a><a href="http://www.5w.com/">���� &raquo;</a> </div>
  <div class="fl"> <a href="http://www.5w.com/" target="_parent">5w������ҳ</a> &raquo; <span>С˵</span> </div>
</div>
<div id="xiaoshuo_content">
  <div id="lay-main">
    <h2 class="title">С˵�Ķ�</h2>
    <div  style="display:block; clear:both;">
      <table width="100%" border="0" cellpadding="0" cellspacing="1" id="tab_s">
        <tr>
          <?{foreach name="list" item=tempsite from=$indexedSiteList[0]}?>
          <td<?{if $smarty.foreach.list.index < 5}?> width="20%"<?{/if}?>><a <?{if $tempsite.siteColor!=''}?>style="color:<?{$tempsite.siteColor}?>"<?{/if}?> href="<?{$tempsite.siteUrl}?>" onmouseout="mmout()" onmouseover="mmover(this)">
            <?{$tempsite.siteName}?>
            </a></td>
          <?{if ($smarty.foreach.list.index+1) mod 5 eq 0}?>
          <?{if $smarty.foreach.list.last}?>
        </tr>
        <?{else}?>
        </tr>
        <tr>
          <?{/if}?>
          <?{/if}?>
          <?{/foreach}?>
          <?{if $smarty.foreach.list.total mod 5 eq 1}?>
          <?{section name=addition loop=$nullfor start=0 max=4}?>
          <td>&nbsp;</td>
          <?{/section}?>
        </tr>
        <?{/if}?>
        <?{if $smarty.foreach.list.total mod 5 eq 2}?>
        <?{section name=addition loop=$nullfor start=0 max=3}?>
        <td>&nbsp;</td>
          <?{/section}?>
        </tr>
        <?{/if}?>
        <?{if $smarty.foreach.list.total mod 5 eq 3}?>
        <?{section name=addition loop=$nullfor start=0 max=2}?>
        <td>&nbsp;</td>
          <?{/section}?>
        </tr>
        <?{/if}?>
        <?{if $smarty.foreach.list.total mod 5 eq 4}?>
        <?{section name=addition loop=$nullfor start=0 max=1}?>
        <td>&nbsp;</td>
          <?{/section}?>
        </tr>
        <?{/if}?>
        <tr>
          <td colspan="5" class="book_hot">���������<a href="http://www.soso.com/q?w=%D0%FE%BB%C3%D0%A1%CB%B5&unc=b400056&cid=union.s.wh&ie=gb2312">����С˵</a> <a href="http://www.soso.com/q?w=%B4%A9%D4%BD&unc=b400056&cid=union.s.wh&ie=gb2312">��Խ</a> <a href="http://www.soso.com/q?w=%D1%D4%C7%E9%D0%A1%CB%B5&unc=b400056&cid=union.s.wh&ie=gb2312">����С˵</a> <a href="http://www.soso.com/q?w=%CE%E4%CF%C0%D0%A1%CB%B5&unc=b400056&cid=union.s.wh&ie=gb2312">����С˵</a> <a href="http://www.soso.com/q?w=%CD%F8%C2%E7%D0%A1%CB%B5&unc=b400056&cid=union.s.wh&ie=gb2312">����С˵</a> <a href="http://www.soso.com/q?w=%D0%A3%D4%B0%D0%A1%CB%B5&unc=b400056&cid=union.s.wh&ie=gb2312">У԰С˵</a></td>
        </tr>
      </table>
    </div>
    <h2 class="title">С˵�����</h2>
    <div  style="display:block; clear:both;">
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="cptz">
        <tr>
          <td width="20%"><dl class="tz">
              <dt><a href="http://www.duxiaoshuo.com/modules/article/articleinfo.php?id=2"><img src="http://<?{$smarty.const.SITE_DOMAIN}?>/static/images/book/1.jpg" width="70" height="86"></a></dt>
              <dd>
                <p><a href="http://www.duxiaoshuo.com/modules/article/articleinfo.php?id=2" title="���Ʋ��" >���Ʋ��</a></p>
              </dd>
              <dd>���ߣ�<a href="http://www.duxiaoshuo.com/modules/article/articleinfo.php?id=2">�������</a></dd>
              <dd>���<a href="http://www.duxiaoshuo.com/modules/article/articleinfo.php?id=2">����ħ��</a></dd>
            </dl></td>
          <td width="20%"><dl class="tz">
              <dt><a href="http://www.duxiaoshuo.com/modules/article/articleinfo.php?id=303"><img src="http://<?{$smarty.const.SITE_DOMAIN}?>/static/images/book/2.jpg" width="90" height="115" /></a></dt>
              <dd>
                <p><a title="������������һ��" href="http://www.duxiaoshuo.com/modules/article/articleinfo.php?id=303">������������һ��</a></p>
              </dd>
              <dd>���ߣ�<a href="http://www.duxiaoshuo.com/modules/article/articleinfo.php?id=303">����</a></dd>
              <dd>���<a href="http://www.duxiaoshuo.com/modules/article/articleinfo.php?id=303">��������</a></dd>
            </dl></td>
          <td width="20%"><dl class="tz">
              <dt><a href="http://www.duxiaoshuo.com/modules/article/articleinfo.php?id=1598"><img src="http://<?{$smarty.const.SITE_DOMAIN}?>/static/images/book/3.jpg" width="90" height="115" /></a></dt>
              <dd>
                <p><a title="����������һ��һ" href="http://www.duxiaoshuo.com/modules/article/articleinfo.php?id=1598">����������һ��һ</a></p>
              </dd>
              <dd>���ߣ�<a href="http://www.duxiaoshuo.com/modules/article/articleinfo.php?id=1598">��֪��</a></dd>
              <dd>���<a href="http://www.duxiaoshuo.com/modules/article/articleinfo.php?id=1598">��������</a></dd>
            </dl></td>
          <td width="20%"><dl class="tz">
              <dt><a href="http://www.duxiaoshuo.com/modules/article/articleinfo.php?id=14693"><img src="http://<?{$smarty.const.SITE_DOMAIN}?>/static/images/book/4.jpg" width="90" height="115" /></a></dt>
              <dd>
                <p><a title="���ۻ�����" href="http://www.duxiaoshuo.com/modules/article/articleinfo.php?id=14693">���ۻ�����</a></p>
              </dd>
              <dd>���ߣ�<a href="http://www.duxiaoshuo.com/modules/article/articleinfo.php?id=14693">С����</a></dd>
              <dd>���<a href="http://www.duxiaoshuo.com/modules/article/articleinfo.php?id=14693">��������</a></dd>
            </dl></td>
          <td><dl class="tz">
              <dt><a href="http://www.duxiaoshuo.com/modules/article/articleinfo.php?id=6116"><img src="http://<?{$smarty.const.SITE_DOMAIN}?>/static/images/book/5.jpg" width="90" height="115"></a></dt>
              <dd>
                <p><a href="http://www.duxiaoshuo.com/modules/article/articleinfo.php?id=6116">����</a></p>
              </dd>
              <dd>���ߣ�<a href="http://www.duxiaoshuo.com/modules/article/articleinfo.php?id=6116">ʧ��Ҷ</a></dd>
              <dd>���<a href="http://www.duxiaoshuo.com/modules/article/articleinfo.php?id=6116">����ħ��</a></dd>
            </dl></td>
        </tr>
        <tr>
          <td width="20%"><dl class="tz">
              <dt><a href="http://www.duxiaoshuo.com/modules/article/articleinfo.php?id=428"><img src="http://<?{$smarty.const.SITE_DOMAIN}?>/static/images/book/6.jpg" width="90" height="115"></a></dt>
              <dd>
                <p><a href="http://www.duxiaoshuo.com/modules/article/articleinfo.php?id=428">�����ǿ�</a></p>
              </dd>
              <dd>���ߣ�<a href="http://www.duxiaoshuo.com/modules/article/articleinfo.php?id=428">�ҳ�������</a></dd>
              <dd>���<a href="http://www.duxiaoshuo.com/modules/article/articleinfo.php?id=428">���ζ���</a></dd>
            </dl></td>
          <td width="20%"><dl class="tz">
              <dt><a href="http://www.duxiaoshuo.com/modules/article/articleinfo.php?id=555"><img src="http://<?{$smarty.const.SITE_DOMAIN}?>/static/images/book/7.jpg" width="90" height="115" /></a></dt>
              <dd>
                <p><a title="����" href="http://www.duxiaoshuo.com/modules/article/articleinfo.php?id=555">����</a></p>
              </dd>
              <dd>���ߣ�<a href="http://www.duxiaoshuo.com/modules/article/articleinfo.php?id=555" title="�������">�������</a></dd>
              <dd>���<a href="http://www.duxiaoshuo.com/modules/article/articleinfo.php?id=555">����ħ��</a></dd>
            </dl></td>
          <td width="20%"><dl class="tz">
              <dt><a href="http://www.duxiaoshuo.com/modules/article/articleinfo.php?id=495"><img src="http://<?{$smarty.const.SITE_DOMAIN}?>/static/images/book/8.jpg" width="90" height="115" /></a></dt>
              <dd>
                <p><a title="����" href="http://www.duxiaoshuo.com/modules/article/articleinfo.php?id=495">����</a></p>
              </dd>
              <dd>���ߣ�<a href="http://www.duxiaoshuo.com/modules/article/articleinfo.php?id=495">����</a></dd>
              <dd>���<a href="http://www.duxiaoshuo.com/modules/article/articleinfo.php?id=495">��������</a></dd>
            </dl></td>
          <td width="20%"><dl class="tz">
              <dt><a href="http://www.duxiaoshuo.com/modules/article/articleinfo.php?id=67"><img src="http://<?{$smarty.const.SITE_DOMAIN}?>/static/images/book/9.jpg" width="90" height="115" /></a></dt>
              <dd>
                <p><a title="�������ɴ�" href="http://www.duxiaoshuo.com/modules/article/articleinfo.php?id=67">�������ɴ�</a></p>
              </dd>
              <dd>���ߣ�<a href="http://www.duxiaoshuo.com/modules/article/articleinfo.php?id=67">����</a></dd>
              <dd>���<a href="http://www.duxiaoshuo.com/modules/article/articleinfo.php?id=67">��������</a></dd>
            </dl></td>
          <td><dl class="tz">
              <dt><a href="http://www.duxiaoshuo.com/modules/article/articleinfo.php?id=431"><img src="http://<?{$smarty.const.SITE_DOMAIN}?>/static/images/book/10.jpg" width="90" height="115"></a></dt>
              <dd>
                <p><a title="����" href="http://www.duxiaoshuo.com/modules/article/articleinfo.php?id=431">����</a></p>
              </dd>
              <dd>���ߣ�<a href="http://www.duxiaoshuo.com/modules/article/articleinfo.php?id=431">����</a></dd>
              <dd>���<a href="http://www.duxiaoshuo.com/modules/article/articleinfo.php?id=431">��������</a></dd>
            </dl></td>
        </tr>
      </table>
    </div>
    <h2 class="title">������</h2>
    <div  style="display:block; clear:both;">
      <table width="100%" border="0" cellpadding="0" cellspacing="1" id="tab_s">
        <tr>
          <?{foreach name="list" item=tempsite from=$indexedSiteList[1]}?>
          <td<?{if $smarty.foreach.list.index < 5}?> width="20%"<?{/if}?>><a <?{if $tempsite.siteColor!=''}?>style="color:<?{$tempsite.siteColor}?>"<?{/if}?> href="<?{$tempsite.siteUrl}?>" onmouseout="mmout()" onmouseover="mmover(this)">
            <?{$tempsite.siteName}?>
            </a></td>
          <?{if ($smarty.foreach.list.index+1) mod 5 eq 0}?>
          <?{if $smarty.foreach.list.last}?>
        </tr>
        <?{else}?>
        </tr>
        <tr>
          <?{/if}?>
          <?{/if}?>
          <?{/foreach}?>
          <?{if $smarty.foreach.list.total mod 5 eq 1}?>
          <?{section name=addition loop=$nullfor start=0 max=4}?>
          <td>&nbsp;</td>
          <?{/section}?>
        </tr>
        <?{/if}?>
        <?{if $smarty.foreach.list.total mod 5 eq 2}?>
        <?{section name=addition loop=$nullfor start=0 max=3}?>
        <td>&nbsp;</td>
          <?{/section}?>
        </tr>
        <?{/if}?>
        <?{if $smarty.foreach.list.total mod 5 eq 3}?>
        <?{section name=addition loop=$nullfor start=0 max=2}?>
        <td>&nbsp;</td>
          <?{/section}?>
        </tr>
        <?{/if}?>
        <?{if $smarty.foreach.list.total mod 5 eq 4}?>
        <?{section name=addition loop=$nullfor start=0 max=1}?>
        <td>&nbsp;</td>
          <?{/section}?>
        </tr>
        <?{/if}?>
      </table>
    </div>
    <h2 class="title">�Ļ���ѧ</h2>
    <div style="display:block; clear:both;">
      <table width="100%" border="0" cellpadding="0" cellspacing="1" id="tab_s">
        <tr>
          <?{foreach name="list" item=tempsite from=$indexedSiteList[2]}?>
          <td<?{if $smarty.foreach.list.index < 5}?> width="20%"<?{/if}?>><a <?{if $tempsite.siteColor!=''}?>style="color:<?{$tempsite.siteColor}?>"<?{/if}?> href="<?{$tempsite.siteUrl}?>" onmouseout="mmout()" onmouseover="mmover(this)">
            <?{$tempsite.siteName}?>
            </a></td>
          <?{if ($smarty.foreach.list.index+1) mod 5 eq 0}?>
          <?{if $smarty.foreach.list.last}?>
        </tr>
        <?{else}?>
        </tr>
        <tr>
          <?{/if}?>
          <?{/if}?>
          <?{/foreach}?>
          <?{if $smarty.foreach.list.total mod 5 eq 1}?>
          <?{section name=addition loop=$nullfor start=0 max=4}?>
          <td>&nbsp;</td>
          <?{/section}?>
        </tr>
        <?{/if}?>
        <?{if $smarty.foreach.list.total mod 5 eq 2}?>
        <?{section name=addition loop=$nullfor start=0 max=3}?>
        <td>&nbsp;</td>
          <?{/section}?>
        </tr>
        <?{/if}?>
        <?{if $smarty.foreach.list.total mod 5 eq 3}?>
        <?{section name=addition loop=$nullfor start=0 max=2}?>
        <td>&nbsp;</td>
          <?{/section}?>
        </tr>
        <?{/if}?>
        <?{if $smarty.foreach.list.total mod 5 eq 4}?>
        <?{section name=addition loop=$nullfor start=0 max=1}?>
        <td>&nbsp;</td>
          <?{/section}?>
        </tr>
        <?{/if}?>
      </table>
    </div>
    <h2 class="title">�������Ķ���</h2>
    <div style="display:block; clear:both;">
      <table width="100%" border="0" cellpadding="0" cellspacing="1" id="tab_s">
        <tr>
          <?{foreach name="list" item=tempsite from=$indexedSiteList[3]}?>
          <td<?{if $smarty.foreach.list.index < 5}?> width="20%"<?{/if}?>><a <?{if $tempsite.siteColor!=''}?>style="color:<?{$tempsite.siteColor}?>"<?{/if}?> href="<?{$tempsite.siteUrl}?>" onmouseout="mmout()" onmouseover="mmover(this)">
            <?{$tempsite.siteName}?>
            </a></td>
          <?{if ($smarty.foreach.list.index+1) mod 5 eq 0}?>
          <?{if $smarty.foreach.list.last}?>
        </tr>
        <?{else}?>
        </tr>
        <tr>
          <?{/if}?>
          <?{/if}?>
          <?{/foreach}?>
          <?{if $smarty.foreach.list.total mod 5 eq 1}?>
          <?{section name=addition loop=$nullfor start=0 max=4}?>
          <td>&nbsp;</td>
          <?{/section}?>
        </tr>
        <?{/if}?>
        <?{if $smarty.foreach.list.total mod 5 eq 2}?>
        <?{section name=addition loop=$nullfor start=0 max=3}?>
        <td>&nbsp;</td>
          <?{/section}?>
        </tr>
        <?{/if}?>
        <?{if $smarty.foreach.list.total mod 5 eq 3}?>
        <?{section name=addition loop=$nullfor start=0 max=2}?>
        <td>&nbsp;</td>
          <?{/section}?>
        </tr>
        <?{/if}?>
        <?{if $smarty.foreach.list.total mod 5 eq 4}?>
        <?{section name=addition loop=$nullfor start=0 max=1}?>
        <td>&nbsp;</td>
          <?{/section}?>
        </tr>
        <?{/if}?>
      </table>
    </div> <div class="con_sohu">
  <h2>��������</h2>
 <iframe width="931" height="80" frameborder="0" scrolling="no" allowtransparency="no" src="http://www.5w.com/data/html/sohu.htm?120110425" style="margin-left:16px"></iframe>
</div>
  </div>
 
</div>
<div class="request"><a href="http://<?{$smarty.const.SITE_DOMAIN}?>/message.htm<?{if $siteUlr}?>?from=<?{$siteUlr}?><?{/if}?>">�����ø���Ŀ������Щ����</a>��</div>
<div class="home"><a href="http://<?{$smarty.const.SITE_DOMAIN}?>" class="back" target="_self">����</a></div>
<a href="#" id="addmyfav" style="display:none;" title="��ӵ��Զ��嵼��"></a>
<script type="text/javascript" src="http://<?{$smarty.const.SITE_DOMAIN}?>/static/js/5wsub.js"></script>
<?{$smarty.const.COUNT_CODE}?>
</body>
</html>
