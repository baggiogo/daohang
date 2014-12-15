<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<title><?{$smarty.get.city}?>团购 - <?{$smarty.get.city}?>团购网 - 5w团购! – <?{$smarty.get.city}?>团购导航最专业的团购网站! </title>
<META name="keywords" content="<?{$smarty.get.city}?>团购,<?{$smarty.get.city}?>团购网,团购,团购网,团购网站,今日团购,团购导航,团购大全,团购网站大全" />
<META name="description" content="全国最专业的团购网,美团,糯米,拉手,QQ团,点评团,等各大名团信息汇聚,整合杭州团购网,北京团购网,上海团购网以及广州,深圳,南京,成都,青岛,西安等全国团购网的团购信息,5w拥有团购网站大全中最具价值的团购信息,更新<?{$smarty.get.city}?>团购每日团购信息,打造最专业的团购导航。" />
<?{if $smarty.get.p > 1}?><META name="robots" content="noindex,follow" />
<?{/if}?>
<META name="copyright" content="www.taoku.com" />
<link href="http://<?{$smarty.const.SITE_DOMAIN}?>/tuan/css/tuan.css?20110316" rel="stylesheet" type="text/css" />
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
		$(countDownId).innerHTML = "<font>团购已结束</font>";
	}else{
		$(countDownId).innerHTML = "还有 <font class='orange'>"+days+"</font>天<font class='orange'>"+hours+"</font>小时<font class='orange'>"+minutes+"</font>分<font class='orange'>"+seconds+"</font>秒";
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
	<?{foreach name="arrCitys" item=cityitem key=key from=$arrCitys}?>
	<?{if $key<75}?><li><a href="http://<?{$smarty.const.SITE_DOMAIN}?>/tuan/index.php?c=tuan&a=list&city=<?{$cityitem.city}?>" onclick="SetCookie('tuancity','<?{$cityitem.city}?>');"><?{$cityitem.city}?></a></li><?{/if}?>
	<?{/foreach}?>
	</ul>
</div>
<div id="lis1" class="tg_mall_list_title2">
  <h3>
	<ul class="city_tag">
	  <li id="city" onclick=changeCity();><?{$smarty.get.city|default:"全国"}?><a class="qhbtn" href="javascript:void(0);" target="_self">城市列表</a>

	  </li>
	  <li <?{if $smarty.get.type==0}?>class="hovertab"<?{/if}?>><a class="cate_ico1" href="http://<?{$smarty.const.SITE_DOMAIN}?>/tuan/index.php?c=tuan&a=list">今日团购</a></li>
	  <?{foreach name="arrTypes" item=typeitem from=$arrTypes key=key}?>
	  <li <?{if $smarty.get.type==$typeitem.tid}?>class="hovertab"<?{/if}?>><a class="cate_ico<?{$key+2}?>" href="http://<?{$smarty.const.SITE_DOMAIN}?>/tuan/index.php?c=tuan&a=list&city=<?{$smarty.get.city}?>&type=<?{$typeitem.tid}?>&p=<?{$smarty.get.p}?>"><?{$typeitem.typename}?></a></li>
	  <?{/foreach}?>
	</ul>
  </h3>
</div>
<div id="lis2" class="tg_mall_list" onclick="hideCity()" style="margin-top:0; border-top:none; padding-bottom:10px">
<div id="showLoad" style="DISPLAY:block;vertical-align:middle; text-align:center"><img src="http://<?{$smarty.const.SITE_DOMAIN}?>/tuan/images/loading.gif"><br>加载中。。。</div>
  <div id="showPro" style="DISPLAY:none;">
	<div class="tgcnt_bd">
	  <h4>
      <span class="price">
	  <?{foreach name="arrPrices" key=pkey item=pitem from=$arrPrices}?>
	  <a href="http://<?{$smarty.const.SITE_DOMAIN}?>/tuan/index.php?c=tuan&a=list&city=<?{$smarty.get.city}?>&type=<?{$smarty.get.type}?>&price=<?{$pkey}?>" <?{if $smarty.get.price == $pkey}?>class="price_a"<?{/if}?>><?{$pitem}?></a>
	  <?{/foreach}?>
	  <input type="text" id="tags" name="tags" size="10"><input type="submit" onclick="window.location.href='index.php?c=tuan&a=list&tags='+escape(document.getElementById('tags').value)" value="搜索">
	  </span>
	  
	  <div class="page" style="width:320px;"><ul><?{$pager}?></ul></div>

	  </h4>
	</div>
<div id="list">
      <?{foreach name="voLists" item=item from=$voLists}?>
      <div onmouseover="this.className='item item_select';" onmouseout="this.className='item'" class="item">
      <dl>
         <dt><a href="<?{$item.goodurl}?>" title="<?{$item.title}?>" target="_blank" class="orange">【<?{$item.sitename}?>】</a><a href="<?{$item.goodurl}?>" title="<?{$item.title}?>" target="_blank"><?{$item.title}?></a></dt>
         <dd class="img"><?{if $item.personnum>1000}?><label class="hotimg">hot</label><?{/if}?><a href="<?{$item.goodurl}?>" title="<?{$item.title}?>" target="_blank"><img src="<?{$item.imageurl}?>" border="0" width="235px" height="160px"></a></dd>
         <dd class="rebate">
         <span class="bougth"><b>￥<?{$item.newprice}?></b><label><em><?{$item.discount|default:0}?></em>折</label></span>
        
         </dd>
         <dd class="btn"><a  target="_blank" href="<?{$item.goodurl}?>">购买</a></dd>
         <dd class="price">
         <span class="value">原价：</span>
          <del><?{$item.price}?>元</del>
          <span class="p"><?{$item.personnum|default:0}?>人已经购买</span>
          </dd>
         <dd class="endtime" id="countDownId_<?{$item.gid}?>"></dd>
         
         </dl>
         <SCRIPT>
			 arrEndTime.push({"countDownId":"countDownId_"+<?{$item.gid}?>,"endTime":<?{$item.endtime}?>});
		  </SCRIPT>
		
      </div><?{/foreach}?>
      </div>

	  <div class="page" style="width:960px;"><ul><?{$pager}?></ul></div>
	
  </div>
</div>
<SCRIPT type=text/javascript>
initIframeHeight();
</SCRIPT>
</body>
</html>
