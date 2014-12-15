<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<script type="text/javascript" src="http://<?{$smarty.const.SITE_DOMAIN}?>/static/js/jquery.min.js"></script>
<script language="javascript" src="http://<?{$smarty.const.SITE_DOMAIN}?>/static/js/index.js?20101104"></script>
<title>天气</title>
<style type="text/css"> 
body {font-size:12px; background:none; color:#666; font-family: Tahoma, Arial,  Helvetica, "\5b8b\4f53", sans-serif; }
img { border:0;}
ul,li,body { padding:0; margin:0;}
a { color:#666; text-decoration: none; cursor:pointer; }
a:hover { text-decoration:underline; color:#f00; }

</style>
</head><body>

<div  id="detail"></div>
<div  id="choose" style="display:none; width: 500px; height: 22px; text-align: left line-height: 22px; font-size: 12px; color:#000; float: left; margin: 0; padding: 0"><select id="province" onchange="getcity(this.value)">
</select>
<select id="city">
</select>
<input type="button" value="保存" onclick="SetCookie('dcity',$('#city').val());window.location.reload()"> | <input type="button" value="返回" onclick="rweather()"/></div>
<script language="javascript">
function rweather(){
$('#detail').show();
$('#choose').hide();	
}
function choosecity(){
$('#detail').hide();
$('#choose').show();
}
$.getJSON("http://<?{$smarty.const.SITE_DOMAIN}?>/weather.php?c=weather&a=getprovince", function(json){
	for(var key in json){
		var str = "<option value='"+key+"'>"+json[key]+"</option>";
    $(str).appendTo($("#province"));
	}
	$.getJSON("http://<?{$smarty.const.SITE_DOMAIN}?>/weather.php?c=weather&a=getdefaultzone", function(json){
		var p = json[0];
		var c = json[1];
		$('#province').val(p);
		getcity(p);
		$('#city').val(c);
		})
	})
function getcity(p){
	$.getJSON("http://<?{$smarty.const.SITE_DOMAIN}?>/weather.php?c=weather&a=getcity&pid="+p, function(json){
		document.getElementById("city").length = 0;
	for(var key in json){
		var str = "<option value='"+key+"'>"+json[key]+"</option>";
    $(str).appendTo($("#city"));
	}
	})
}
$.getJSON("http://<?{$smarty.const.SITE_DOMAIN}?>/weather.php?a=index", function(json){
    if(undefined!=json.cityName)
    	var str ='<a href="http://tianqi.5w.com" target="_blank"><strong>'+json.cityName+'</strong>';
    else
    	var str = '';
		for(var i in json.todayWeather){
			if(i==0){
				if(undefined != json.todayWeather[i].image){
					str += '&nbsp;&nbsp;<strong>今天</strong>&nbsp;&nbsp;'+json.todayWeather[i].image;
					str += '&nbsp;&nbsp;'+json.todayWeather[i].temperature+'';
					str += '&nbsp;&nbsp;'+json.todayWeather[i].weather;
				}
			}else if(i==1){
				if(undefined != json.todayWeather[i].image){
					str += '&nbsp;&nbsp;<strong>明天</strong>&nbsp;&nbsp;'+json.todayWeather[i].image;
					str += '&nbsp;&nbsp;'+json.todayWeather[i].temperature+'';
					str += '&nbsp;&nbsp;'+json.todayWeather[i].weather+'</a>';
					str += '&nbsp;&nbsp;<a href="javascript:;" onclick="choosecity()">[选择城市]</a>';
				}
			}
		}
		if(str == '')str='<a href="javascript:;" onclick="window.location.reload()">连接超时，请重新获取天气</a>';
		$('#detail').html(str);
		})
</script>
</body></html>