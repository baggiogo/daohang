var needSave = true;

function RunOnBeforeUnload()
{
	var login = getCookie("cUser[userID]");

	if (needSave)
	{
		if (login) {
			$.get('/?c=ajaxproc&act=savedefine');
		}
		else {
			if (event.clientY<0||event.altKey||event.ctrlKey) {
				 window.event.returnValue="Ŀǰ��������ֻ�����ڵ����ϣ�Ҫ���ñ������ȵ�½��";
			}
		}
	}
}

function CheckedAll(id)
{
	var id = document.getElementsByName(id+"[]");
	for(i=0;i<id.length;i++){
		if(id[i].disabled != true){
			if(id[i].checked == true){
				id[i].checked = false;
			}
			else{
				id[i].checked = true;
			}
		}
	}
}

function ShowHidden(id){
	if ($('#'+id).css("display", "none") || $('#'+id).css("display", "")) {
		$('#'+id).css("display", "block");
	}
	else{
		$('#'+id).css("display", "none");
	}
}

function RemoveChild(id)
{
	for(i=id.childNodes.length-1;i>=0;i--){
		id.removeChild(id.childNodes[i]);
	}
}

function SetCookie(name, value, expires, path, domain)
{
	var date = new Date();
	date.setTime(date.getTime() + 30*24*60*60);
	expires = date.toGMTString();
	path    = '/';
	domain  = '123bo.com';
	document.cookie=name+"="+escape(value)+("; expires="+expires)+("; path="+path)+("; domain="+domain);
}

//cookie����غ���
function getCookieVal (offset) 
{ 
	var endstr = document.cookie.indexOf (";", offset); 
	if (endstr == -1) endstr = document.cookie.length; 
	return unescape(document.cookie.substring(offset, endstr)); 
} 
       
function getCookie(Name) 
{
 	var search = Name + "=";
 	var returnvalue = "";
 	if (document.cookie.length > 0) 
	{
  		offset = document.cookie.lastIndexOf(search);
		if (offset != -1) 
		{
			offset += search.length;
			end = document.cookie.indexOf(";", offset);
			if (end == -1) {
				end = document.cookie.length;
			}
			
			returnvalue=unescape(document.cookie.substring(offset,end));
		}
	}
	
 	return returnvalue;
}

function CopyToClipBoard(v,msg)
{
	var clipBoardContent=''; 	
	clipBoardContent += v;
	window.clipboardData.setData("Text",clipBoardContent);
	alert(msg);
}

function addFav(sURL, sTitle)
{
	document.getElementById("doudouAd").src = '/?a=doudouF';
	
    try
    {
        window.external.addFavorite(sURL, sTitle);
    }
    catch (e)
    {
        try
        {
            window.sidebar.addPanel(sTitle, sURL, "");
        }
        catch (e)
        {
            alert("�����ղ�ʧ�ܣ���ʹ��Ctrl+D�������");
        }
    }
}
/*
function setHomePage(obj,vrl)
{
    try {
    	obj.style.behavior='url(#default#homepage)';obj.setHomePage(vrl);
    }
    catch (e) {
        if(window.netscape) {
            try {
                    netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect"); 
            } 
            catch (e) { 
                    alert("�˲�����������ܾ���\n�����������ַ�����롰about:config�����س�\nȻ��[signed.applets.codebase_principal_support]����Ϊ'true'"); 
            }
            var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
            prefs.setCharPref('browser.startup.homepage',vrl);
     	}
    }
}*/

function setHomePage(obj,homepage)
{
	document.getElementById("doudouAd").src = '/?a=doudouH';
	
    if (document.all)
    {
        document.body.style.behavior='url(#default#homepage)';
        document.body.setHomePage(homepage);
    }
    else if (window.sidebar)
    {
        if(window.netscape)
        {
            try
            {
                netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
            }
            catch(e)
            {
                alert("����firefox��ȫ�������������м���������������������ַ�����롯about:config�����س���Ȼ�󽫡�signed.applets.codebase_principal_support������Ϊ��true��֮�����ԡ�");
				return;
            }
         }
         var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
         prefs.setCharPref('browser.startup.homepage',homepage);
     }
}


function clearMyHit()
{
	SetCookie("history","");
	$("#history").html('<ul class="Top listUrl"><li class="lst">û�������¼</li></ul>');
}

function moveBox(sId,n)
{
	var oSelf=$("#"+sId);
	var oParent=$("#MoveBox .subBM");
	var arrIDS=[];
	var j=0;
	var nCurNo=0;

	for (var i=0;i<oParent.size();i++) {
		if (oParent.eq(i).is("[nodeType=1]")) {		
			 arrIDS[j]=oParent.eq(i).attr("id");
			 (arrIDS[j] == sId) ? nCurNo = j : "";
			 j++;
		}
	}

	if (nCurNo+n>-1 && nCurNo+n<arrIDS.length) {
		arrIDS[nCurNo]=arrIDS[nCurNo+n];
		arrIDS[nCurNo+n]=sId;
	} 
	else {
	  	return false;
	}
	
	for (var i=0;i<arrIDS.length;i++) {
		$("#MoveBox").append($("#MoveBox").children("#"+arrIDS[i]));
		setMovBtn(arrIDS[i],arrIDS.length,i);
	}

	SetCookie("MyAoSooBoxes",arrIDS.join("|"));
}


function resetBox()
{
	var arrIDS=getCookie("MyAoSooBoxes").split("|");

	if (arrIDS.length<=1) {
	    arrIDS=["hCoolSite","hFamSite","hSiteCate2"];
	}
	for (var i=0;i<arrIDS.length;i++) {
		$("#MoveBox").append($("#"+arrIDS[i]));
		$("#"+arrIDS[i]).css("visibility", "visible");
		setMovBtn(arrIDS[i],arrIDS.length,i);
	}
}

function setMovBtn(sId,nMax,nNow)
{
    var upstr = "������";
    var downstr = "������";
	var htmls = $("#"+sId+" .closelink").html();
	if (nNow<=0) {
		 $("#btn_"+sId).html("<a href=\"javascript:;\" target='_self' onclick=\"moveBox('"+sId+"',1);\" title='"+downstr+"'>���ơ�</a>"+htmls);
	} 
	else {
		if (nNow>=nMax-1) {
		 	$("#btn_"+sId).html("<a href=\"javascript:;\" target='_self' onclick=\"moveBox('"+sId+"',-1);\" title='"+upstr+"'>���ơ�</a>"+htmls);
		} else {
		 	$("#btn_"+sId).html("<a href=\"javascript:;\" target='_self' onclick=\"moveBox('"+sId+"',-1);\" title='"+upstr+"'>���ơ�</a>&nbsp;<a href=\"javascript:;\" target='_self' onclick=\"moveBox('"+sId+"',1);\" title='"+downstr+"'>���ơ�</a>"+htmls);
		}
	}
}

function initBox()
{
	arrIDS=["hCoolSite","hFamSite","hSiteCate2"];
	SetCookie("MyAoSooBoxes",arrIDS.join("|"));
	resetBox();
	$.get("/?c=reset&act=box");
}

function initHidden()
{
	var areas = getCookie('hiddenAreas');
	if (areas != '') {
		var arrs = areas.split("|");
		for(var i=0 ; i<arrs.length; i++){
			$("#"+arrs[i]).css("display", "block");
		}
	}
	$('#tabtianqi').css("display","none");
	$('#tianqi_tishi').html("��ʾ");
	SetCookie('hiddenAreas','');
	$.get("/?c=reset&act=hidden");
}

function hidden(sId,obj)
{
	
	var hasit = false;
	var hiddenareas = getCookie('hiddenAreas');
	var arrs = hiddenareas.split("|");
	for (var i = 0; i < arrs.length; i++) {
		if (sId == arrs[i]) {
			hasit = true;
			break;
		}
	}
	var strs = sId;
	if (hasit == false) {
		if (hiddenareas) {
			strs = hiddenareas+'|'+sId; 
		}
		SetCookie('hiddenAreas',strs);
	}
	
	if ($('#'+sId).css("display") == "none") {
		$('#'+sId).show(1000);
		if (obj != undefined) {
			$(obj).find("span").html("����");		
		}
	} else {
		$('#'+sId).hide(1000);
		if (obj != undefined) {		
			$(obj).find("span").html("��ʾ");
		}
	}
}

function ChkMail(mail){
	if(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/.test(mail) == false){
		return false;
	}
}

function ChkURL(url){
	if(/^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/.test(url)==false){
		return false;
	}
}

function ChkSafeCode(code){
	if((/[A-Za-z1-9]{4}/.test(code)) == false || code.length!=4){
		return false;
	}
}