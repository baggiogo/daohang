<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
<script type="text/javascript" src="http://<?{$smarty.const.SITE_DOMAIN}?>/static/js/jquery.min.js"></script>
<script language="javascript" src="http://<?{$smarty.const.SITE_DOMAIN}?>/static/js/index.js?20101104"></script>
<link href="http://<?{$smarty.const.SITE_DOMAIN}?>/theme/2345/css/base.css" rel="stylesheet" type="text/css" id="links"/>
<link href="http://<?{$smarty.const.SITE_DOMAIN}?>/theme/2345/css/global.css" rel="stylesheet" type="text/css" id="links"/>
<title>����</title>
<style type="text/css"> 
body {font-size:12px; background:none; color:#fff; font-family: Tahoma, Arial,  Helvetica, "\5b8b\4f53", sans-serif; }
img { border:0;}
ul,li,body { padding:0; margin:0;}
a { color:#fff; text-decoration: none; cursor:pointer; }
a:hover { text-decoration:underline; color:#fff; }

</style>
</head><body>
<div id="weather"></div>
<div  id="choose" style="display:none; width: 500px; height: 22px; text-align: left line-height: 22px; font-size: 12px; color:#fff; float: left; margin: 0; padding: 0"><select id="province" onchange="getcity(this.value)">
</select>
<select id="city">
</select>
<input type="button" value="����" onclick="SetCookie('dcity',$('#city').val());window.location.reload()"> | <input type="button" value="����" onclick="rweather()"/></div>
<script language="javascript">
function rweather(){
$('#weather').show();
$('#choose').hide();	
}
function choosecity(){
$('#weather').hide();
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
var str1=str2=str3='';
    if(undefined!=json.cityName)
    	var str = '<table border=0 cellSpacing=0 cellPadding=0 width="100%" height="50px"><TBODY><TR><TH class=city height=40><a title="�鿴��������" href="http://tianqi.5w.com" target=_blank nowrap="true">'+json.cityName+'</a></TH><TD rowSpan=2><a href="http://tianqi.5w.com" target=_blank nowrap="true">';
    else
    	var str = '';
		for(var i in json.todayWeather){
			if(undefined != json.todayWeather[i].image){
				if(i==0)
					day='����';
				else if(i==1)
					day='����';
				else
					day='����';
					str1 += '<h2>'+day+'</strong>&nbsp;&nbsp;'+json.todayWeather[i].image+'</h2>';
					str2 += '<h3>'+json.todayWeather[i].temperature+'</h3>';
					str3 += '<h4>'+json.todayWeather[i].weather+'</h4>';
				}
		}
		if(str == '')
			str='<a href="javascript:;" onclick="window.location.reload()">���ӳ�ʱ�������»�ȡ����</a>';
		else
			str+='<div>'+str1+'</div>'+'<div>'+str2+'</div>'+'<div>'+str3+'</div>'+'</a></TD></TR><TR><TH class=fset height=20><A title="��������" href="#" onclick="choosecity()">����</A></TH></TR></TBODY></TABLE>';
		$('#weather').html(str);
		})
</script>
</body></html>