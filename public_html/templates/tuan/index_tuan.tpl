<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title><?{$city}?>�Ź� - <?{$city}?>�Ź��� - <?{$smarty.const.SITE_NAME}?>��ַ����! �C <?{$city}?>�Ź�������רҵ���Ź���վ! </title>
<META name="keywords" content="<?{$city}?>�Ź�,<?{$city}?>�Ź���,�Ź�,�Ź���,�Ź���վ,�����Ź�,�Ź�����,�Ź���ȫ,�Ź���վ��ȫ" />
<META name="description" content="5w��ַ�����Ź�,����,Ŵ��,����,QQ��,������,�ȸ���������Ϣ���,���Ϻ����Ź���,�����Ź���,�Ϻ��Ź����Լ�����,����,�Ͼ�,�ɶ�,�ൺ,������ȫ���Ź������Ź���Ϣ,5w��ַ����ӵ���Ź���վ��ȫ����߼�ֵ���Ź���Ϣ,����<?{$city}?>�Ź�ÿ���Ź���Ϣ,������רҵ���Ź�������" />
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<link href="http://<?{$smarty.const.SITE_DOMAIN}?>/tuan/css/tuan.css?2011032218" rel="stylesheet" type="text/css" />
<base target="_blank" />
<style>
#suggest_box{position:absolute;display:none;z-index:1100;text-align:left;}#suggest_box table{border:1px #333 solid;background:#fff;text-align:right;}#suggest_box tr{line-height:17px;}#suggest_box .hover{background:#36c;color:#fff;}
#suggest_box .hover .suggest_keyword,#suggest_box .hover .suggest_num{color:#fff;}
.suggest_keyword{text-align:left;padding:0 1em 0 3px;font-size:13px;overflow:hidden;white-space:nowrap;color:#000;}.suggest_num{color:green;font-size:12px;overflow:hidden;padding:0 3px;text-align:right;white-space:nowrap;}
.loginon{float:left;width:72px;height:25px;text-align:center;line-height:25px;cursor:pointer;color:#06C;background:url(http://<?{$smarty.const.SITE_DOMAIN}?>/static/images/dialog2_bg_on.jpg) no-repeat center;}
.loginoff{float:left;width:72px;height:25px;text-align:center;line-height:25px;cursor:pointer;color:#FFF;background:url(http://<?{$smarty.const.SITE_DOMAIN}?>/static/images/dialog2_bg_off.jpg) no-repeat center;}
</style>
</head>
<body onclick="if(iframepage) iframepage.window.hideCity();" class="bg">
<a name="pagetop"></a>

<div style="margin:0 auto;width:960px; position:relative">
<div id="header_detail">
<div id="logo"><a href="http://<?{$smarty.const.SITE_DOMAIN}?>/"><img src="http://<?{$smarty.const.SITE_DOMAIN}?>/static/images/logo.gif" /></a></div>
<div class="logo_tuan" title="5w��ַ�����Ź���">5w��ַ�����Ź���</div>
<form method="get" style="margin:0px;" name="taobaoSearchForm" id="J_searchForm" action="http://search8.taobao.com/browse/search_auction.htm" target="_blank">
<div id="tsearch">
		<a href="http://www.taobao.com/go/chn/tbk_channel/onsale.php?pid=mm_19869273_2351857_9092259" class="slogo">taobao</a>
		<input type="text" value="" id="q" name="q" autocomplete="off" class="input">			
		<input type="hidden" value="mm_19869273_2351857_9092259" name="pid">
		<input type="hidden" value="0" id="taobaost" name="st">
		<input type="hidden" value="all" name="commend"/> 
<input type="hidden" value="auction" name="search_type"/>
<input type="hidden" value="initiative" name="user_action"/>
<input type="hidden" value="D9_5_1" name="f"/>
<input type="hidden" value="1" name="at_topsearch"/>
<input type="hidden" value="" name="sort"/>
<input type="hidden" value="66" name="mode" />
<input type="hidden" value="0" name="spercent"/>

          <input type="submit" value="����" class="searchint" >
</div> </form>
     
</div>
<div id="nav">
<div class="nav_left"></div>
<ul>
<li><a href="http://<?{$smarty.const.SITE_DOMAIN}?>/netbuy.htm">���ﵼ��</a></li>
<li class="select">�Ź���ȫ</li>
<li><a href="http://www.taoku.com">�����̳�</a></li>
<li><a href="http://www.taobao.com/go/chn/tbk_channel/huangguan.php?pid=mm_19869273_2351857_9092259&eventid=101858">�Ա��ʹڵ�</a></li>
<li><a href="http://www.doudou.com/gnCps.php">���ﷵ��</a></li>
</ul><div class="nav_right"></div>
   <!-- JiaThis Button BEGIN -->
<div id="ckepop" style="float:right; margin-top:10px">
	<a href="http://www.jiathis.com/share/?uid=895384" class="jiathis jiathis_txt jtico jtico_jiathis" target="_blank"></a>
	<a class="jiathis_button_qzone"></a>
	<a class="jiathis_button_taobao"></a>
	<a class="jiathis_button_tsina"></a>
	<a class="jiathis_button_kaixin001"></a>
	<a class="jiathis_button_renren"></a>
	<a class="jiathis_button_douban"></a>
</div>
<script type="text/javascript" src="http://v2.jiathis.com/code/jia.js?uid=895384" charset="utf-8"></script>
<!-- JiaThis Button END -->

</div>
<div id="promotion_main">

<div class="tg_mall_list">
  <ul>
	<?{section name=loop max=49 loop=$arrSites}?>
	<li><a href="<?{$arrSites[loop].siteurl}?>" target="_blank"><font color="<?{$arrSites[loop].wordcolor}?>"><?{$arrSites[loop].sitename}?></font></a></li>
	<?{/section}?>
	<li><a href="http://www.5w.com/tgmore.htm" target="_blank"><font color="red">�Ź���վ��ȫ</font></a></li>
  </ul>
</div>
<iframe src="http://<?{$smarty.const.SITE_DOMAIN}?>/tuan/index.php?c=tuan&a=list" width="997px" id="iframepage" name="iframepage" frameBorder=0 scrolling=no></iframe>
</div>
  <div class="request"><a href="http://<?{$smarty.const.SITE_DOMAIN}?>/message.php<?{if $siteUlr}?>?from=<?{$siteUlr}?><?{/if}?>">�����ø���Ŀ������Щ����</a>��</div>
  <div class="home"><a href="http://<?{$smarty.const.SITE_DOMAIN}?>" class="back" target="_self">����</a></div>
    <div class="gotop" style="display:none"><a href="#" target="_self" title="���ض���">���ض���</a></div>
</div>
<script type="text/javascript" src="http://<?{$smarty.const.SITE_DOMAIN}?>/static/js/jquery.min.js"></script>
<script>
window.onscroll = function(){
	var s = $(".gotop").css("display");
	if(document.documentElement.scrollTop>600){
		if(s == 'none'){
		$(".gotop").show();
		}
	}else{
		if(s == 'block'){
		$(".gotop").hide();
		}
	}
}
</script>
<script  type="text/javascript" charset="utf-8" src="http://<?{$smarty.const.SITE_DOMAIN}?>/static/js/taobao.js"></script>
<?{$smarty.const.COUNT_CODE}?>
</body>
</html>
