<?{include file="admin/header.tpl"}?>
<script language="javascript">
function chooseall(obj,target){
	var checkobj = document.getElementsByName(target);
	for(var i=0;i<checkobj.length;i++){
		checkobj[i].checked = obj.checked;
	}
}
function addTab(){
	var str='<td class="tr_a"><input type="text" name="isort[add]" value="" style="width:35px"></td><td class="tr_a"><input type="text" name="iname[add]" value="" style="width:80px"></td><td class="tr_a"><textarea name="iiframe[add]" style="width:100%; height:80px;"></textarea></td><td class="tr_a"><input type="checkbox" name="iid[]" id="iid" value="add" style="width:20px"/></td>';
	$("#addTab").html(str);
}
function sub(){
var iid = document.getElementsByName("iid[]");
var iidcheck = 0;
for(var i=0;i<iid.length;i++){
	if(iid[i].checked){
		iidcheck = 1;
	}
}
if(iidcheck == 0){
alert("δѡ����Ҫ�Ĳ����");
return false;
}
var check = confirm('ȷ��Ҫ������');
if(check){
}else{
	return false;
}
htmlnotice(1);
return true;
}
</script>
<div class="right">
  <table width="100%" border="0" cellpadding="1" cellspacing="1" class="table_title">
        <tr>
      <td height="52" bgcolor="#FFFFFF"><h1>��ҳ��վ�л�������</h1>
</td>
        </tr>
      </table>

 <form action="?act=operate" method="post" onSubmit="return sub();">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_list" style="border-bottom:none">
      <tr>
        <td height="35" align="right"><input type="button" id="addbtn" value="���ӱ�ǩ" class="button" onclick="addTab();"/><input type="submit" name="upsub" value=" �ύ�޸� " class="button"  /><input type="submit" name="delsub" value=" �ύɾ�� " class="button"  /></td>
      </tr>
    </table>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_list" id="t">
    <tr >
      <td class="tr1">����</td>
      <td class="tr1">��ǩ����</td>
      <td class="tr1">iframe��ַ</td>
      <td class="tr1">ѡ��<input style="width:auto;border:none"  type="checkbox" onclick="chooseall(this,'iid[]')"></td>
    </tr>
    <?{section name=l loop=$indexArr}?>
    <tr >
      <td class="tr_a"><input type="text" name="isort[<?{$indexArr[l].iid}?>]" value="<?{$indexArr[l].isort}?>" style="width:35px"></td>
      <td class="tr_a"><input type="text" name="iname[<?{$indexArr[l].iid}?>]" value="<?{$indexArr[l].iname}?>" style="width:80px"></td>
      <td class="tr_a"><textarea name="iiframe[<?{$indexArr[l].iid}?>]" style="width:100%; height:80px;"><?{$indexArr[l].iiframe|stripslashes}?></textarea></td>
      <td class="tr_a"><input type="checkbox" name="iid[]" id="iid" value="<?{$indexArr[l].iid}?>" style="width:auto; border:none"/></td>
    </tr>
    <?{/section}?>
    <tr id="addTab"></tr>
    <tr >
      <td colspan="5" align="right"  class="ly_Rtd"><input type="button" id="addbtn" value="���ӱ�ǩ" class="button" onclick="addTab();"/><input type="submit" name="upsub" value=" �ύ�޸� " class="button"  /><input type="submit" name="delsub" value=" �ύɾ�� " class="button"  /></td>
    </tr>
  </table>
</form>
<div class="clear"></div>
  </div>
<?{include file="admin/footer.tpl"}?>
