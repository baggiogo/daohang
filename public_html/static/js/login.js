function ajaxcheckname()
{
		var uname = $("#uname").val();
		$.getJSON("index.php?c=reg&a=check&uname="+uname,function(json){
				if(json['result'] == 'ok'){
					var str="<img src=\"../static/images/ico_ok.gif\">";
					$("#unamelabel").html(str);
				}else if(json['result'] == 'error2'){
					var str="<img src=\"../static/images/ico_del.gif\">&nbsp;�û����ѱ�ע��";
					$("#unamelabel").html(str);
				}else{
					var str="<img src=\"../static/images/ico_del.gif\">&nbsp;Ӣ�Ļ�����,����3����,���20����";
					$("#unamelabel").html(str);
				}
		})
}
function ajaxcheckpwd()
{
	var uname = $("#pass").val();
	var plength = uname.length;
	if (plength >= 6) {
		var str="<img src=\"../static/images/ico_ok.gif\">";
		$("#pwdlabel").html(str);
	}else{
		var str="<img src=\"../static/images/ico_del.gif\">&nbsp;���볤������6���ַ�";
		$("#pwdlabel").html(str);
	}

}
function ajaxcheckpwd2()
{
	var pwd1 = $("#pass").val();
	var pwd2 = $("#spass").val();
	var pl = pwd2.length;
	if (pwd1 == pwd2 && pl >= 6) {
		var str="<img src=\"../static/images/ico_ok.gif\">";
		$("#pwdlabel2").html(str);
	}else{
		var str="<img src=\"../static/images/ico_del.gif\">&nbsp;�����������벻һ��";
		$("#pwdlabel2").html(str);
	}

}
function ajaxcheckmail()
{
	var mail = $("#mail").val();
	var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
	var r = mail.match(reg);
	if(r == null){
		var str="<img src=\"../static/images/ico_del.gif\">&nbsp;����д��ȷ�����ַ,����ȡ������";
		$("#maillabel").html(str);
	}else{
		var str="<img src=\"../static/images/ico_ok.gif\">";
		$("#maillabel").html(str);
	}
}
function ajaxCheckReg()
{
	var tbUserName = document.getElementById("uname").value;
	var tbUserPwd = document.getElementById("pass").value;
	var tbsUserPwd = document.getElementById("spass").value;
	var tbMail = document.getElementById("mail").value;
	var ulength = tbUserName.length;
	var plength = tbUserPwd.length;
	if (tbUserName == '') {
		alert('�������û���!');
		return false;
	}
	if (ulength < 3) {
		alert('�û����������3���ַ�!');
		return false;
	}
	if (tbUserPwd == '') {
		alert('����������!');
		return false;
	}

	var r = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
	var re = tbMail.match(r);
	if(re == null){
		alert('����д��ȷ�����ַ!');
		return false;	
	}

	if (plength < 6) {
		alert('����������6���ַ�!');
		return false;
	}
	if (tbsUserPwd == '') {
		alert('������ȷ������!');
		return false;
	}
	if(tbUserPwd != tbsUserPwd){
		alert('�����������벻һ��!');
		document.getElementById("pass").value = '';
		document.getElementById("spass").value = '';
		return false;
	}
	return true;
}
function toLoginCheck()
{
	var tbUserName = document.getElementById("tbUserName").value;
	var tbUserPwd = document.getElementById("tbUserPwd").value;
	if (tbUserName == '') {
		alert('�������û���!');
		return false;
	}
	if (tbUserPwd == '') {
		alert('����������!');
		return false;
	}
	return true;
}