<?{include file="admin/header.tpl"}?>
<div id="box">
<div class="right">

<?{if $viewAdminModule == "true"}?>
<script language="javascript">
function chooseall(obj,target){
	var checkobj = document.getElementsByName(target);
	for(var i=0;i<checkobj.length;i++){
		checkobj[i].checked = obj.checked;
	}
}
</script>
<table width="100%" border="0" cellpadding="1" cellspacing="1" class="table_title">
  <tr>
    <td height="52" bgcolor="#FFFFFF"><h1>ģ�����</h1>
	<div class="search"></div></td>
    </tr>
	</table>
	
<form action="?moduleFID=<?{$moduleFID}?>&act=operate&p=<?{$p}?>" method="post" onSubmit="return confirm('ȷ��Ҫ������')">
    
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_list">
	<tr><td align="right" colspan="6"><input type="submit" name="btnUpdate" value=" ��  �� " class="button" <?{if $updateAdminModule!="true"}?>disabled<?{/if}?> />
	   &nbsp;<input type="submit" name="btnDelete" value=" ɾ  �� " class="button" <?{if $delAdminModule!="true"}?>disabled<?{/if}?> /></td></tr>
	<tr>
	  <td class="tr1" >ģ������</td>
	  <td class="tr1">ģ��ҳ��</td>
	  <td class="tr1">ģ��˳��</td>
	  <td  class="tr1"> �Ӽ�ģ��</td>
	  <td class="tr1"> ����<input style="width:auto; border:none" type="checkbox" onclick="chooseall(this,'chkLockID[]')"></td>
	  <td class="tr1"> ɾ��<input style="width:auto;border:none" type="checkbox" onclick="chooseall(this,'chkDelID[]')"> </td>
	</tr>
	<?{section name=moduleList loop=$arrModuleList}?>
	<tr>
	  <td class="tr_a">
	    <input type="hidden" name="hidModuleID[]" value="<?{$arrModuleList[moduleList].moduleID}?>"><input style="width:auto;" type="text" name="tbModuleName[]" value="<?{$arrModuleList[moduleList].moduleName}?>" size="16" />
	  </td>
	  <td class="tr_a"><input type="text" style="width:auto;" name="tbModuleLink[]" value="<?{$arrModuleList[moduleList].moduleLink}?>" size="30" /></td>
	  <td class="tr_a"><input type="text" style="width:auto;" name="moduleIndex[]" value="<?{$arrModuleList[moduleList].moduleIndex}?>" size="5"/></td>
	  <td class="tr_a"><?{if $arrModuleList[moduleList].moduleFID == "0"}?><a href="?moduleFID=<?{$arrModuleList[moduleList].moduleID}?>">�Ӽ�</a><?{else}?><a href="?moduleFID=0">��</a><?{/if}?></td>
	  <td class="tr_a">
	    <label>
		<input type="checkbox" style="width:auto;border:none" name="chkLockID[]" id="chkLockID" value="<?{$arrModuleList[moduleList].moduleID}?>" <?{if $arrModuleList[moduleList].moduleState=="0"}?>checked<?{/if}?> />
	    </label>
	 </td>
	  <td class="tr_a">
	  <label>
	  <input type="checkbox" style="width:auto;border:none" name="chkDelID[]" id="chkDelID" value="<?{$arrModuleList[moduleList].moduleID}?>" />
	    </label></td>
	</tr>
    	<?{/section}?>
	<tr>
	  <td colspan="6" align="right"  height="32px"><?{$pager}?><input type="submit" name="btnUpdate" value=" ��  �� " class="button" <?{if $updateAdminModule!="true"}?>disabled<?{/if}?> />
	   &nbsp;<input type="submit" name="btnDelete" value=" ɾ  �� " class="button" <?{if $delAdminModule!="true"}?>disabled<?{/if}?> /></td>
	</tr>
    </table></td>
  </tr>
</table>
</form>
<?{/if}?>
<?{if $addAdminModule == "true"}?>
<form action="?moduleFID=<?{$moduleFID}?>&act=add&p=<?{$p}?>" method="post">
<table width="100%" border="0" cellspacing="1" cellpadding="1" class="edit">
  <tr>
    <td class="title_edit">
     <h1>�����ģ��</h1>
   </td>
  </tr>
  <tr>
    <td class="edit_main"><table width="100%" border="0" cellspacing="1" cellpadding="1">
<?{foreach from=$arrNO item=NO}?>
  <tr >
		<td width="36%" height="36">ģ������<?{$NO}?>��
		  <input name="tbModuleName[]" id="tbModuleName<?{$NO}?>" value="" type="text" size="20"></td>
	<td width="64%" height="36">ģ��ҳ�棺
	  <input name="tbModuleLink[]" id="tbModuleLink<?{$NO}?>" type="text" value="<?{if $moduleFID=='0'}?>left.php<?{/if}?>" size="30"></td>	
  </tr>
	<?{/foreach}?>
	<tr>
     <td height="36"><input value=" ��  �� " type="submit" class="button" <?{if $addAdminModule!="true"}?>disabled<?{/if}?>></td>
	  </tr>
   </table>
   </td>

</table>
</form>
<?{/if}?>
<?{include file="admin/footer.tpl"}?>
