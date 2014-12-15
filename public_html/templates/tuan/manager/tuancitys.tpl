<?{include file="admin/header.tpl"}?>
<script language="javascript">
function submitLineEdit(sid){
	//document.getElementById('display_row_'+sid).style.display='none';
	$('#display_row_'+sid).hide();
	$('#edit_row_'+sid).show();
}
function hideLineEdit(sid){
	$('#display_row_'+sid).show();
	$('#edit_row_'+sid).hide();
}
var newrow_count=0;
function addNewSite(){
	// ע���ò�ͬ��ʽ������������ԭ����
	newrow_count++;
	$("#title").after('<tr id="new_row_'+newrow_count+'"><td class="tr_a"><input type="text" size="3" style="width:auto" value="1" name="siteSort[]" id="new_siteSort_'+newrow_count+'"/><input type="hidden" id="new_siteID_'+newrow_count+'" name="siteID[]" id="new_siteID_'+newrow_count+'"></td><td class="tr_a"><input type="text" size="15" style="width:auto" value="" name="siteName[]" id="new_siteName_'+newrow_count+'"/></td><td class="tr_a"><select name="siteStatus[]" id="new_siteStatus_'+newrow_count+'"><option value="1">��</option><option value="0">��</option></select></td><td class="tr_a"><a href="javascript:;" onclick="doLineEdit(\'\','+newrow_count+')"><img src="images/ico_ok.gif" /></a><a href="javascript:;" onclick="deleteLineSite(\'\','+newrow_count+')"><img src="images/ico_del.gif" /></a></td></tr>');
}
function showAllEditStatus(){
	$("#datatable").find("tr").each(function(){
	var trid=$(this).attr('id');

	if(trid.substr(0,9)=='edit_row_'){
		$(this).show();
	}else if(trid.substr(0,12)=='display_row_'){
		$(this).hide();
	}
	});
}
function doLineEdit(rid,nid){
	// rid == '' ����
	var row;
	var upid;
	if(rid==''){
		row = 'new_';
		upid = nid;
	}else{
		row = '';
		upid = rid;
	}
	var siteID = $('#'+row+'siteID_'+upid).val();
	var siteSort = $('#'+row+'siteSort_'+upid).val();
	var siteName = $('#'+row+'siteName_'+upid).val();
	var siteStatus = $('#'+row+'siteStatus_'+upid).val();

	var sortCheck = validate('sort',siteSort);
	var nameCheck = validate('name',siteName);
	if(!sortCheck[0]){
		alert(sortCheck[1]);
		return false;
	}
	if(!nameCheck[0]){
		alert(nameCheck[1]);
		return false;
	}
	$.getJSON("tuanindex.php?c=tuancitys&a=edit&siteID[]="+escape(siteID)+"&siteSort[]="+escape(siteSort)+"&siteName[]="+escape(siteName)+"&siteStatus[]="+escape(siteStatus), function(json){
		editResult(json[0],upid);
	})
}
function editResult(data,upid){
	if(data.flag == 'insert'){
			// insert �����У���ɾ��
			var upedid = data.siteID;
			var siteName = data.siteName;
			var siteSort = data.siteSort;
			var siteStatus = data.siteStatus;
			siteStatus = siteStatus==1?'��':'<font color="#FF0000">��</font>';
			$("#title").after('<tr id="display_row_'+upedid+'" ondblclick="submitLineEdit('+upedid+')"><td class="tr_a">'+siteSort+'</td><input type="hidden" name="hidSiteID[]" value="'+upedid+'"><td class="tr_a">'+siteName+'</td><td class="tr_a">'+siteStatus+'</td><td class="tr_a"><a href="javascript:;" onclick="submitLineEdit('+upedid+')"><img src="images/ico_edit.gif" title="�༭" /></a><a onclick="deleteLineSite('+upedid+')"><img src="images/ico_del.gif" /></a></td></tr><tr id="edit_row_'+upedid+'" style="display:none"><td class="tr_a"><input type="text" size="3" style="width:auto" id="siteSort_'+upedid+'" value="'+siteSort+'" name="siteSort[]" /><input type="hidden" name="siteID[]" id="siteID_'+upedid+'" value="'+upedid+'" /></td><td class="tr_a"><input type="text" size="15" style="width:auto;" value="'+siteName+'" name="siteName[]"  id="siteName_'+upedid+'"/></td><td class="tr_a"><select name="siteStatus[]" id="siteStatus_'+upedid+'"><option value="1" '+(siteStatus=="��"?"selected":"")+'>��</option><option value="0" '+(siteStatus!="��"?"selected":"")+'>��</option></select></td><td class="tr_a"><a  href="javascript:;" onclick="doLineEdit('+upedid+')"><img src="images/ico_ok.gif" /></a><a href="javascript:;" onclick="hideLineEdit('+upedid+')"><img src="images/ico_cancel.gif" /></a><a onclick="deleteLineSite('+upedid+')"><img src="images/ico_del.gif" /></a></td></tr>');
			if(upid!=undefined)
				$('#new_row_'+upid).remove();
			else{
				// ����ɾ��new row
				$("#datatable").find("tr").each(function(){
				var trid=$(this).attr('id');

				if(trid.substr(0,8)=='new_row_'){
					$(this).remove();
				}
				});
			}
		}else if(data.flag == 'update'){
			// update
			var upedid = data.siteID;
			$('#siteSort_'+upedid).val(data.siteSort);
			$('#siteName_'+upedid).val(data.siteName);
			$('#siteStatus_'+upedid).val(data.siteStatus);
			tr = $('#display_row_'+upedid);
			var rdata = new Array(data.siteSort,data.siteName,(data.siteStatus==1)?'��':'<font color="#FF0000">��</font>');
			i=0;
			tr.find("td").each(function(){
			if(i==1)
				$(this).html(rdata[i++]);
			else
				$(this).html(rdata[i++]);
			})
			$('#edit_row_'+upedid).hide();
			tr.show();

		}else if(data.flag == 'error'){
			// error
		}
}
function submitAllEdit(){
	var url = "";
	$("#datatable").find("tr").each(function(){
		var trid=$(this).attr('id');
		if(trid.substr(0,9)=='edit_row_' && $(this).css("display")!='none'){
			// �༭
			var upid = trid.substr(9,trid.length);
			var siteID = $('#siteID_'+upid).val();
			var siteSort = $('#siteSort_'+upid).val();
			var siteName = $('#siteName_'+upid).val();
			var siteStatus = $('#siteStatus_'+upid).val();
			var sortCheck = validate('sort',siteSort);
			var nameCheck = validate('name',siteName);
			if(!sortCheck[0]){
				alert(sortCheck[1]);
				return false;
			}
			if(!nameCheck[0]){
				alert(nameCheck[1]);
				return false;
			}
			url += "&siteID[]="+escape(siteID)+"&siteSort[]="+escape(siteSort)+"&siteName[]="+escape(siteName)+"&siteStatus[]="+escape(siteStatus);
		}
		if(trid.substr(0,8)=='new_row_'){
			// ������
			var upid = trid.substr(8,trid.length);
			var siteID = $('#new_siteID_'+upid).val();
			var siteSort = $('#new_siteSort_'+upid).val();
			var siteName = $('#new_siteName_'+upid).val();
			var siteStatus = $('#new_siteStatus_'+upid).val();
			var sortCheck = validate('sort',siteSort);
			var nameCheck = validate('name',siteName);
			if(!sortCheck[0]){
				alert(sortCheck[1]);
				return false;
			}
			if(!nameCheck[0]){
				alert(nameCheck[1]);
				return false;
			}
			url += "&siteID[]="+escape(siteID)+"&siteSort[]="+escape(siteSort)+"&siteName[]="+escape(siteName)+"&siteStatus[]="+escape(siteStatus);
		}

	});
	if(url!=''){
		url = 'tuanindex.php?c=tuancitys&a=edit'+url;
		$.getJSON(url,function(json){
			for(key in json){
				editResult(json[key]);
			}
		})
	}else{
		alert(" û�п��ύ������ ");
	}
}
function deleteLineSite(id,trid){
	if(id!=''){
		// ɾ��������
		siteID = $('#siteID_'+id).val();
		$.getJSON("tuanindex.php?c=tuancitys&a=delete&siteID[]="+escape(siteID), function(json){
			if(json.flag=='delete'){
				$('#display_row_'+siteID).remove();
				$('#edit_row_'+siteID).remove();
			}else{
				// error
			}
		})
	}else{
		$('#new_row_'+trid).remove();
	}
}
function validate(field,value){
	var arr = new Array();
	if(field == 'sort'){
		if(value < 1 || value != parseInt(value,10) || value == ''){
			arr[0] = false;
			arr[1] = '����ֻ���Ǵ���0������';
		}else{
			arr[0] = true;
		}
	}else if(field == 'name'){
		if(value == ''){
			arr[0] = false;
			arr[1] = '���Ʋ��ܿ�';
		}else{
			arr[0] = true;
		}
	}
	return arr;
}
</script>
<div id="box">
  <div class="right">
  <form action="tuanindex.php?c=tuancitys" method="post">
  <table width="100%" border="0" cellpadding="1" cellspacing="1" class="table_title">
  <tr>
    <td height="52" bgcolor="#FFFFFF"><h1>�Ź����й���</h1>
      <div class="search">
			��������:<input type="text" name="theform[city]">
			�Ƿ��ѿ�ͨ��<select name="theform[status]">
				<option value="">--��ѡ��--</option>
				<?{html_options options=$statusArr}?>
				</select>
        <input type="image" src="images/bt_search.jpg"  name="Submit3" value=" �� �� " style="width:61px;height:20px"/></div></td>
    </tr>
	</table>
	</form>

	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_list" style="border-bottom:none">
      <tr>
        <td height="35" align="right">
        <input type="button" class="button" value="����" onclick="addNewSite()"/>&nbsp;
        <input type="button" class="button" value=" ȫ�༭ " onclick="showAllEditStatus()">&nbsp;
        <input type="button" class="button" value=" ȫ�ύ " onclick="submitAllEdit()">&nbsp;
         </td>
      </tr>
    </table>
    <table id="datatable" width="100%" border="0" cellspacing="0" cellpadding="0" class="table_list" title="˫���༭">
      <tr id="title">
        <td width="9%" class="tr1" id="sort_siteSort">����</td>
        <td width="15%"  class="tr1">�Ź�����</td>
        <td width="10%"  class="tr1" id="sort_siteSort">״̬</td>
        <td width="8%"  class="tr1">����</td>
      </tr>
      <?{section name=loop loop=$voLists}?>
      <tr id="display_row_<?{$voLists[loop].cid}?>" ondblclick="submitLineEdit(<?{$voLists[loop].cid}?>)">
        <td class="tr_a"><?{$voLists[loop].sortorder}?><input type="hidden" name="hidSiteID[]" value="<?{$voLists[loop].cid}?>"></td>
        <td class="tr_a"><?{$voLists[loop].city}?></td>
        <td class="tr_a"><?{$voLists[loop].status}?></td>
        <td class="tr_a"><a href="javascript:;" onclick="submitLineEdit(<?{$voLists[loop].cid}?>)"><img src="images/ico_edit.gif" title="�༭" /></a>
        <a onclick="deleteLineSite(<?{$voLists[loop].cid}?>)"><img src="images/ico_del.gif" /></a></td>
      </tr>
      <tr id="edit_row_<?{$voLists[loop].cid}?>" style="display:none">
         <td class="tr_a"><input type="text" size="3" style="width:auto" id="siteSort_<?{$voLists[loop].cid}?>" value="<?{$voLists[loop].sortorder}?>" name="siteSort[]" />
            <input type="hidden" name="siteID[]" id="siteID_<?{$voLists[loop].cid}?>" value="<?{$voLists[loop].cid}?>" />
         </td>
         <td class="tr_a"><input type="text" size="15" style="width:auto;" value="<?{$voLists[loop].city}?>" name="siteName[]"  id="siteName_<?{$voLists[loop].cid}?>"/></td>
         <td class="tr_a">
		    <select name="siteStatus[]" id="siteStatus_<?{$voLists[loop].cid}?>">
			<?{html_options options=$statusArr selected=$arrCity.status}?>
			</select>
         </td>
         <td class="tr_a"><a  href="javascript:;" onclick="doLineEdit(<?{$voLists[loop].cid}?>)"><img src="images/ico_ok.gif" /></a>
         <a href="javascript:;" onclick="hideLineEdit(<?{$voLists[loop].cid}?>)"><img src="images/ico_cancel.gif" /></a>
         <a onclick="deleteLineSite(<?{$voLists[loop].cid}?>)"><img src="images/ico_del.gif" /></a></td>
       </tr>
       <?{/section}?>
       <tr>
         <td height="30" colspan="4" align="right" valign="middle" class="ly_Rtd" style="cursor:pointer"><?{$pager}?><input type="button" class="button" value="����" onclick="addNewSite()"/>&nbsp;<input type="button" class="button" value=" ȫ�༭ " onclick="showAllEditStatus()">&nbsp;<input type="button" class="button" value=" ȫ�ύ " onclick="submitAllEdit()">&nbsp;</td>
       </tr>
     </table>
<?{include file="admin/footer.tpl"}?>