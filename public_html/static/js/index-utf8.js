var scache = new Array();var ccache = new Array();var mingzhan = new Array();var indextab="mingzhan";var stat=1;var timer=null;function qhshow(a){timer=setTimeout("newshow("+a+")",500)}
function newshow(b){if(b==0){$("#tabname > li").removeClass("cur_main");$("#s10").addClass("cur_main");$("#mzdh_other").html('');$("#s_s10").show();}
else{if(mingzhan[b]!=undefined){$("#s_s10").hide();$("#mzdh_other").html(mingzhan[b])}else{$.getJSON('getdata.php?act=getTab&iid='+b,function(json){$("#s_s10").hide();$("#mzdh_other").html(json);mingzhan[b]=json;});}$("#tabname > li").removeClass("cur_main");$("#s1"+b).addClass("cur_main");}}
function getCookie(a){var b=a+"=";var c="";if(document.cookie.length>0){offset=document.cookie.lastIndexOf(b);if(offset!=-1){offset+=b.length;end=document.cookie.indexOf(";",offset);if(end==-1){end=document.cookie.length}c=unescape(document.cookie.substring(offset,end))}}return c}function SetCookie(c,e,a,f,d){var b=new Date();b.setTime(b.getTime()+30*24*60*60);a=b.toGMTString();f="/";d="";document.cookie=c+"="+escape(e)+("; expires="+a)+("; path="+f)+";"}
function toolChange(c){var u=new Array('http://chongzhi.huoban.taobao.com/game_card.php?css=vertical&pid=mm_19869273_2351859_9092254&unid=','http://chongzhi.huoban.taobao.com/air_ticket.php?css=vertical&pid=mm_19869273_2351859_9092254&unid=','http://www.5w.com/data/html/jiudian.htm');var b=4;for(var a=1;a<=b;a++){document.getElementById("tool-tab"+a).className='';document.getElementById("tb"+a).style.display='none';if(a>=2 && $('#tbif'+a).attr('src')!=u[a-2])$('#tbif'+a).attr('src',u[a-2]);}document.getElementById("tool-tab"+c).className="active";document.getElementById("tb"+c).style.display='';}
function colorOn(b){var c=getCookie("pcss");var a=flag2=flag3="";if(c=="green"){flag2="On"}else{if(c=="pink"){flag3="On"}else{a="On"}}$("#blue").addClass("blue"+a);$("#green").addClass("green"+flag2);$("#pink").addClass("pink"+flag3)}
function setHomePage(c,d){if(document.all){document.body.style.behavior="url(#default#homepage)";document.body.setHomePage(d)}else{if(window.sidebar){if(window.netscape){try{netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect")}catch(b){alert("\u60a8\u7684firefox\u5b89\u5168\u9650\u5236\u9650\u5236\u60a8\u8fdb\u884c\u526a\u8d34\u677f\u64cd\u4f5c\uff0c\u8bf7\u5728\u6d4f\u89c8\u5668\u5730\u5740\u680f\u8f93\u5165\u2019about:config\u2019\u5e76\u56de\u8f66\uff0c\u7136\u540e\u5c06\u2019signed.applets.codebase_principal_support\u2019\u8bbe\u7f6e\u4e3a\u2019true\u2019\u4e4b\u540e\u91cd\u8bd5\u3002");return}}var a=Components.classes["@mozilla.org/preferences-service;1"].getService(Components.interfaces.nsIPrefBranch);a.setCharPref("browser.startup.homepage",d)}}}function getNowFormatDate(){var b=new Date();var a=0;var c=0;var e=0;var d="";a=b.getFullYear();c=b.getMonth()+1;e=b.getDate();d+=a+"-";if(c>=10){d+=c+"-"}else{d+="0"+c+"-"}if(e>=10){d+=e}else{d+="0"+e}$("#jp_today").val(d)};
function toLoginCheck(){var tbUserName = document.getElementById("tbUserName").value;var tbUserPwd = document.getElementById("tbUserPwd").value;if (tbUserName == '') {alert('请输入用户名！');return false;}if (tbUserPwd == '') {alert('请输入密码！');return false;}return true;}
function gotosearch(){
	var objfrm = document.f;
	if(objfrm.backurl !=undefined){
		var re;
		re = /{key}/g;             // 创建正则表达式模式。
		var keys = objfrm.key.value;
		var url = objfrm.backurl.value;
		objfrm.backurl.value = url.replace(re, keys);
	}
	return true;
}
var onsub;
var inputid='kw';
function change(f){
	var key = $("#kw").val();
	$("#s_ul > li").removeClass("cur");
	$("#so_"+f).addClass("cur");
	if(scache[f]!=undefined){
		$("#sform").html(scache[f]);
		getfocus(key);
	}else{
		$.getJSON('getdata.php?act=getsearch&sid='+f,function(json){
			var action = json.def.action;
			if(action.indexOf('taobao')!=-1){
				action = action+'" accept-charset="gbk';
				onsub = "document.charset='gbk';";
				inputid='q';
			}else if(action.indexOf('dangdang')!=-1 || action.indexOf('360buy')!=-1 || action.indexOf('sogou')!=-1){
				action = action+'" accept-charset="gbk';
				onsub = "document.charset='gbk';return gotosearch();";
			}else{
				onsub = "return gotosearch();";
			}
			var str='';
			str+='<div id="sf"><div id="search_form"><form name="f" action="'+action+'" method="get" onsubmit="'+onsub+'">';
			str+='<p><a href="'+json.def.url+'"><img src="'+json.def.img_url+'" border="0"/></a>';
			str+='<input type="text" size="42" class="int" autocomplete="off" name="'+json.def.name+'" id="'+inputid+'"/>';
			var i=json.i;
			for(var j=0;j<i;j++){
				str+='<input type="hidden" name="'+json.params[j][0]+'" value="'+json.params[j][1]+'"/>';
			}
			str+='<input type="submit" value="'+json.def.btn+'" id="bdbutton" class="searchint"></p></form></div>';
			str+='<div class="ctrl">';
			var l=json.search.length;
			for(var z=0;z<l;z++){
				var c="";
				if(json.search[z].is_default == 1){
					c = " checked='checked'";
				}
				str+='<label><input class="radio" onclick="changesearch('+json.search[z].id+')" type="radio" name="search_select"'+c+'/>'+json.search[z].search_select+'</label>';
			}
			str+='</div></div><div id="hot_words"><ul>';
			var l=json.keywords.length;
			for(var z=0;z<l;z++){
				if(json.keywords[z].namecolor !=''){
					str+='<li><a href="'+json.keywords[z].url+'" style="color:'+json.keywords[z].namecolor+'">'+json.keywords[z].name+'</a></li>';
				}else{
					str+='<li><a href="'+json.keywords[z].url+'">'+json.keywords[z].name+'</a></li>';
				}
			}
			str+='</ul></div>';
			$("#sform").html(str);
			scache[f]=str;
			getfocus(key);
		})
	}
}
function changesearch(id){
	var key = $("#kw").val();
	if(ccache[id]!=undefined){
		$("#search_form").html(ccache[id]);
		getfocus(key);
	}else{
		$.getJSON('getdata.php?act=getcon&id='+id,function(json){
			var action = json.con.action;
			if(action.indexOf('taobao')!=-1){
				action = action+'" accept-charset="gbk';
				onsub = "document.charset='gbk';";
				inputid='q';
			}else if(action.indexOf('dangdang')!=-1 || action.indexOf('360buy')!=-1 || action.indexOf('sogou')!=-1){
				action = action+'" accept-charset="gbk';
				onsub = "document.charset='gbk';return gotosearch();";
			}else{
				onsub = "return gotosearch();";
			}
			var str='';
			str+='<form name="f" action="'+action+'" method="get" onsubmit="'+onsub+'">';
			str+='<p><a href="'+json.con.url+'"><img src="'+json.con.img_url+'" border="0"/></a>';
			str+='<input type="text" size="42" class="int" autocomplete="off" name="'+json.con.name+'" id="'+inputid+'"/>';
			var i=json.i;
			for(var j=0;j<i;j++){
				str+='<input type="hidden" name="'+json.params[j][0]+'" value="'+json.params[j][1]+'"/>';
			}
			str+='<input type="submit" value="'+json.con.btn+'" id="bdbutton" class="searchint"></p></form>';
			$("#search_form").html(str);
			ccache[id] = str;
			getfocus(key);
		})
	}
}
function neichange(f){var key=$("#kw").val();$("#s_ul_detail > li").removeClass("cur");$("#so_"+f).addClass("cur");
$.getJSON('../getdata.php?act=getsearch&sid='+f,function(json){
var action = json.def.action;
if(action.indexOf('taobao')!=-1){
action = action+'" accept-charset="gbk';
onsub = "document.charset='gbk';";
inputid='q';
}else if(action.indexOf('dangdang')!=-1 || action.indexOf('360buy')!=-1 || action.indexOf('sogou')!=-1){
action = action+'" accept-charset="gbk';
onsub = "document.charset='gbk';return gotosearch();";
}else{
onsub = "return gotosearch();";
}
var str='';str+='<form name="f" action="'+action+'" method="get" onsubmit="'+onsub+'">';str+='<p><a href="'+json.def.url+'"><img src="../'+json.def.img_url+'" border="0"/></a>';str+='<input type="text" style="width:262px" class="int" autocomplete="off" name="'+json.def.name+'" id="'+inputid+'"/>';var i=json.i;for(var j=0;j<i;j++){str+='<input type="hidden" name="'+json.params[j][0]+'" value="'+json.params[j][1]+'"/>';}str+='<input type="submit" value="'+json.def.btn+'" id="bdbutton" class="searchint"></p></form>';$("#sform_detail").html(str);getfocus(key);})}
function getfocus(key){	$("#kw").focus();$("#kw").val(key);taobaoready();}
$(document).ready(function(){  
	var timer = 500; //下拉菜单延时
	var activeContent;
	var hideState = true;
	var delayInterval;
	var hide = function(){
		if(hideState && activeContent){
			activeContent.style.display = "none";			
		}
	}
	$("#topsite em").each(function(el){
		el=this;
		el.onmouseover = function(){
			hide();
			var box = el.parentNode.getElementsByTagName("div")[0];
			delayInterval = window.setTimeout(function(){$(box).show()},timer);
			activeContent = box;
			hideState = false;
			if(!box.onmouseover){
				box.onmouseover = function(){
					hideState = false;
				}
				box.onmouseout = function(){
					hideState = true;
					window.setTimeout(hide,timer);
				}
			}
		}
		el.onmouseout = function(){
			hideState = true;
			window.setTimeout(hide,timer);
			if(delayInterval!=undefined){
				window.clearTimeout(delayInterval);
			}

		}
	});
});//结束名站子站点菜单