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
	$("#title").after('<tr id="new_row_'+newrow_count+'"><td class="tr_a"><input type="text" size="3" style="width:auto" value="1" name="siteSort[]" id="new_siteSort_'+newrow_count+'"/><input type="hidden" id="new_siteID_'+newrow_count+'" name="siteID[]" id="new_siteID_'+newrow_count+'"></td><td class="tr_a"><input type="text" size="15" style="width:auto" value="" name="siteName[]"  id="new_siteName_'+newrow_count+'"/></td><td class="tr_a"><input type="text" size="50" value="" name="siteUrl[]"  id="new_siteUrl_'+newrow_count+'"/></td><td class="tr_a"><input type="text" size="20" value="" name="siteCount[]"  id="new_siteCount_'+newrow_count+'"/></td><td class="tr_a"><select name="siteStatus[]" id="new_siteStatus_'+newrow_count+'"><option value="1">��ʾ</option><option value="0">����ʾ</option></select></td><?{if $updateSite =="true"}?><td class="tr_a"><a href="javascript:;" onclick="doLineEdit(\'\','+newrow_count+')"><img src="images/ico_ok.gif" /></a></td><?{/if}?></tr>');
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
	var siteUrl = $('#'+row+'siteUrl_'+upid).val();
	var siteCount = $('#'+row+'siteCount_'+upid).val();
	var siteStatus = $('#'+row+'siteStatus_'+upid).val();
siteUrl = urlf(siteUrl);
	var sortCheck = validate('sort',siteSort);
	var nameCheck = validate('name',siteName);
	var urlCheck = validate('url',siteUrl);
	var countCheck = validate('sort',siteCount);
	if(!countCheck[0]){
		alert(countCheck[1]);
		return false;
	}
	if(!sortCheck[0]){
		alert(sortCheck[1]);
		return false;
	}
	if(!nameCheck[0]){
		alert(nameCheck[1]);
		return false;
	}
	if(!urlCheck[0]){
		alert(urlCheck[1]);
		return false;
	}
	$.getJSON("site_show.php?a=edit&siteID[]="+escape(siteID)+"&siteSort[]="+escape(siteSort)+"&siteName[]="+escape(siteName)+"&siteUrl[]="+escape(siteUrl)+"&siteCount[]="+escape(siteCount)+"&siteStatus[]="+escape(siteStatus), function(json){
		editResult(json[0],upid);
htmlnotice(1);
	})
}

function editResult(data,upid){
	if(data.flag == 'insert'){
			// insert �����У���ɾ��
			var upedid = data.siteID;
			var siteName = data.siteName;
			var siteSort = data.siteSort;
			var siteUrl = data.siteUrl;
			var siteCount = data.siteCount;
			var siteStatus = data.siteStatus;
			siteStatus = siteStatus==1?'��ʾ':'<font color="#FF0000">����ʾ</font>';
			$("#title").after('<tr id="display_row_'+upedid+'" ondblclick="submitLineEdit('+upedid+')"><td class="tr_a">'+siteSort+'</td><input type="hidden" name="hidSiteID[]" value="'+upedid+'"><td class="tr_a">'+siteName+'</td><td class="tr_a">'+siteUrl+'</td><td class="tr_a">'+siteCount+'</td><td class="tr_a">'+siteStatus+'</td><?{if $updateSite =="true"}?><td class="tr_a"><a href="javascript:;" onclick="submitLineEdit('+upedid+')"><img src="images/ico_edit.gif" title="�༭" /></a></td><?{/if}?></tr><tr id="edit_row_'+upedid+'" style="display:none"><td class="tr_a"><input type="text" size="3" style="width:auto" id="siteSort_'+upedid+'" value="'+siteSort+'" name="siteSort[]" /><input type="hidden" name="siteID[]" id="siteID_'+upedid+'" value="'+upedid+'" /></td><td class="tr_a"><input type="text" size="15" style="width:auto;" value="'+siteName+'" name="siteName[]"  id="siteName_'+upedid+'"/></td><td class="tr_a"><input type="text" size="50" value="'+siteUrl+'" name="siteUrl[]"  id="siteUrl_'+upedid+'"/></td><td class="tr_a"><input type="text" size="50" value="'+siteCount+'" name="siteCount[]"  id="siteCount_'+upedid+'"/></td><td class="tr_a"><select name="siteStatus[]" id="siteStatus_'+upedid+'"><option value="1" '+(siteStatus=="��ʾ"?"selected":"")+'>��ʾ</option><option value="0" '+(siteStatus!="��ʾ"?"selected":"")+'>����ʾ</option></select></td><?{if $updateSite =="true"}?><td class="tr_a"><a  href="javascript:;" onclick="doLineEdit('+upedid+')"><img src="images/ico_ok.gif" /></a><a href="javascript:;" onclick="hideLineEdit('+upedid+')"><img src="images/ico_cancel.gif" /></a></td><?{/if}?></tr>');
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
			$('#siteUrl_'+upedid).val(data.siteUrl);
			$('#siteCount_'+upedid).val(data.siteCount);
			$('#siteStatus_'+upedid).val(data.siteStatus);
			tr = $('#display_row_'+upedid);
			var rdata = new Array(data.siteSort,data.siteName,data.siteUrl,data.siteCount,(data.siteStatus==1)?'��ʾ':'<font color="#FF0000">����ʾ</font>');
			i=0;
			tr.find("td").each(function(){
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
			var siteUrl = $('#siteUrl_'+upid).val();
			var siteCount = $('#siteCount_'+upid).val();
			var siteStatus = $('#siteStatus_'+upid).val();
siteUrl = urlf(siteUrl);
			var sortCheck = validate('sort',siteSort);
			var nameCheck = validate('name',siteName);
			var urlCheck = validate('url',siteUrl);
			var countCheck = validate('sort',siteCount);
			if(!countCheck[0]){
				alert(countCheck[1]);
				return false;
			}
			if(!sortCheck[0]){
				alert(sortCheck[1]);
				return false;
			}
			if(!nameCheck[0]){
				alert(nameCheck[1]);
				return false;
			}
			if(!urlCheck[0]){
				alert(urlCheck[1]);
				return false;
			}
			url += "&siteID[]="+escape(siteID)+"&siteSort[]="+escape(siteSort)+"&siteName[]="+escape(siteName)+"&siteUrl[]="+escape(siteUrl)+"&siteCount[]="+escape(siteCount)+"&siteStatus[]="+escape(siteStatus);
		}
		if(trid.substr(0,8)=='new_row_'){
			// ������
			var upid = trid.substr(8,trid.length);
			var siteID = $('#new_siteID_'+upid).val();
			var siteSort = $('#new_siteSort_'+upid).val();
			var siteName = $('#new_siteName_'+upid).val();
			var siteUrl = $('#new_siteUrl_'+upid).val();
			var siteCount = $('#new_siteCount_'+upid).val();
			var siteStatus = $('#new_siteStatus_'+upid).val();
siteUrl = urlf(siteUrl);
			var sortCheck = validate('sort',siteSort);
			var nameCheck = validate('name',siteName);
			var urlCheck = validate('url',siteUrl);
			var countCheck = validate('sort',siteCount);
			if(!countCheck[0]){
				alert(countCheck[1]);
				return false;
			}
			if(!sortCheck[0]){
				alert(sortCheck[1]);
				return false;
			}
			if(!nameCheck[0]){
				alert(nameCheck[1]);
				return false;
			}
			if(!urlCheck[0]){
				alert(urlCheck[1]);
				return false;
			}
			url += "&siteID[]="+escape(siteID)+"&siteSort[]="+escape(siteSort)+"&siteName[]="+escape(siteName)+"&siteUrl[]="+escape(siteUrl)+"&siteCount[]="+escape(siteCount)+"&siteStatus[]="+escape(siteStatus);
		}

	});
	if(url!=''){
		url = 'site_show.php?a=edit'+url;
		$.getJSON(url,function(json){
			for(key in json){
				editResult(json[key]);
			}
		})
htmlnotice(1);
	}else{
		alert(" û�п��ύ������ ");
	}
}
function validate(field,value){
	var arr = new Array();
	if(field == 'sort'){
		if(value < 1 || value != parseInt(value,10) || value == ''){
			arr[0] = false;
			arr[1] = 'ֻ���Ǵ���0������';
		}else{
			arr[0] = true;
		}
	}else if(field == 'url'){
		if(value == ''){
			arr[0] = true;
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
  <form method="get" action="?">
  <table width="100%" border="0" cellpadding="1" cellspacing="1" class="table_title">
  <tr>
    <td height="52" bgcolor="#FFFFFF"><h1>�����ʾ����</h1></td>
    </tr>
	</table>
	</form>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_list" style="border-bottom:none">
      <tr>
        <td height="35" align="right">
        <input style="float:right" type="button" class="button" value=" ȫ�ύ " onclick="submitAllEdit()">
        <input style="float:right" type="button" class="button" value=" ȫ�༭ " onclick="showAllEditStatus()"></td>
      </tr>
    </table>
    <table id="datatable" width="100%" border="0" cellspacing="0" cellpadding="0" class="table_list" title="˫���༭">
      <tr id="title">
        <td width="10%" class="tr1" id="sort_siteSort">����</td>
        <td width="15%"  class="tr1">��������</td>
        <td width="25%"  class="tr1" id="sort_siteUrl">����Ŀ¼����/������ַ</td>
        <td width="10%"  class="tr1" id="sort_siteUrl">��ҳ��ʾ��Ŀ</td>
        <td width="10%"  class="tr1" id="sort_siteSort">״̬</td>
        <td width="10%"  class="tr1">����</td>
      </tr>
      <?{section name=loop loop=$arrSite}?>
      <tr id="display_row_<?{$arrSite[loop].stpID}?>" ondblclick="submitLineEdit(<?{$arrSite[loop].stpID}?>)">
        <td class="tr_a"><?{$arrSite[loop].stpSort}?><input type="hidden" name="hidSiteID[]" value="<?{$arrSite[loop].stpID}?>"></td>
        <td class="tr_a"><?{$arrSite[loop].stpName}?></td>
        <td class="tr_a"><?{$arrSite[loop].stpHtmlName}?></td>
        <td class="tr_a"><?{$arrSite[loop].stpCount}?></td>
        <td class="tr_a">
        	<?{if $arrSite[loop].stpshow == 1}?>��ʾ<?{else}?><font color="#FF0000">����ʾ</font><?{/if}?>
        </td>
        <?{if $updateSite =="true"}?>
        <td class="tr_a"><a href="javascript:;" onclick="submitLineEdit(<?{$arrSite[loop].stpID}?>)"><img src="images/ico_edit.gif" title="�༭" /></a></td>
        <?{/if}?>
      </tr>
      <tr id="edit_row_<?{$arrSite[loop].stpID}?>" style="display:none">
         <td class="tr_a"><input type="text" size="3" style="width:auto" id="siteSort_<?{$arrSite[loop].stpID}?>" value="<?{$arrSite[loop].stpSort}?>" name="siteSort[]" />
            <input type="hidden" name="siteID[]" id="siteID_<?{$arrSite[loop].stpID}?>" value="<?{$arrSite[loop].stpID}?>" />
         </td>
         <td class="tr_a"><input type="text" size="15" value="<?{$arrSite[loop].stpName}?>" name="siteName[]"  id="siteName_<?{$arrSite[loop].stpID}?>"/></td>
         <td class="tr_a"><input type="text" size="50" value="<?{$arrSite[loop].stpHtmlName}?>" name="siteUrl[]"  id="siteUrl_<?{$arrSite[loop].stpID}?>"/></td>
         <td class="tr_a"><input type="text" size="15" value="<?{$arrSite[loop].stpCount}?>" name="siteCount[]"  id="siteCount_<?{$arrSite[loop].stpID}?>"/></td>
         <td class="tr_a">
            <select name="siteStatus[]" id="siteStatus_<?{$arrSite[loop].stpID}?>">
            	<option value="1" <?{if $arrSite[loop].stpshow == 1}?>selected<?{/if}?>>��ʾ</option>
            	<option value="0" <?{if $arrSite[loop].stpshow == 0}?>selected<?{/if}?>>����ʾ</option>
		</select>
         </td>
         <?{if $updateSite =="true"}?>
         <td class="tr_a"><a  href="javascript:;" onclick="doLineEdit(<?{$arrSite[loop].stpID}?>)"><img src="images/ico_ok.gif" /></a><a href="javascript:;" onclick="hideLineEdit(<?{$arrSite[loop].stpID}?>)"><img src="images/ico_cancel.gif" /></a></td>
         <?{/if}?>
       </tr>
       <?{/section}?>
       <tr>
         <td height="30" colspan="6" align="right" valign="middle" class="ly_Rtd"><?{$pager}?>
        <input type="button" class="button" value=" ȫ�༭ " onclick="showAllEditStatus()">&nbsp;
        <input type="button" class="button" value=" ȫ�ύ " onclick="submitAllEdit()">&nbsp;</td>
       </tr>
     </table>
<?{include file="admin/footer.tpl"}?>