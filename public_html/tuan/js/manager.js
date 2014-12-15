function chooseAll(obj,targ){
	var targObj = document.getElementsByName(targ);
	if(null != targObj){
		for(var i=0;i<targObj.length;i++){
			targObj[i].checked = obj.checked;
		}
	}
}
function doAction(type,checkobj,orderobj,formobj){
	var targObj = document.getElementsByName(checkobj);
	if(undefined != orderobj)
		var txtObj = document.getElementsByName(orderobj);
	var ids = '';
	var orders = '';
	if(null != targObj){
		for(var i=0;i<targObj.length;i++){
			if(targObj[i].checked){
				ids += ','+targObj[i].value;
				if(undefined != orderobj)
					orders += ','+txtObj[i].value;
			}
		}
	}
	ids = ids.substr(1);
	orders = orders.substr(1);
	if(ids == ''){
		alert('请将要操作的行选项选上');
		return false;
	}
	if(confirm('您确定要提交本次操作？')){
		document.forms[formobj].optype.value = type;
		document.forms[formobj].ids.value = ids;
		document.forms[formobj].orders.value = orders;
		document.forms[formobj].submit();
	}
}