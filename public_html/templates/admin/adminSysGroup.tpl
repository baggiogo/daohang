<?{include file="admin/header.tpl"}?>
<?{if $viewAdminGroup == "true"}?>
<script language="javascript">
function chooseall(obj,target){
	var checkobj = document.getElementsByName(target);
	for(var i=0;i<checkobj.length;i++){
		checkobj[i].checked = obj.checked;
	}
}
</script>
<form action="?act=operate&p=<?{$p}?>" method="post" onSubmit="return confirm('ȷ��Ҫ������')">
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="xt_glz">


 <tr ><td>
        <table width="100%" height="28" border="0" cellspacing="0" cellpadding="0" background="images/mid.gif">
          <tr>
            <td align="left" width="3"><img src="images/left_03.gif"  /></td>
            <td  class="tb_tr_title">���������</td>
            <td width="3" align="right"><img src="images/right.gif" /></td>
          </tr>
        </table>
		</td>
      </tr>

 
  <tr>
    <td colspan="3" align="left" valign="top">
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="left_td">
      <tr >
        <td width="25%" class="ly_td"> ���������� </td>
        <td width="37%" class="ly_td"> ���������� </td>
        <td width="16%"  class="ly_td"> ������Ȩ�� </td>
        <td width="11%" class="ly_td"> ���� <input type="checkbox" onclick="chooseall(this,'chkLockID[]')"></td>
        <td width="11%" class="ly_Rtd"> ɾ�� <input type="checkbox" onclick="chooseall(this,'chkDelID[]')"> </td>
      </tr>
      <?{section name=groupList loop=$arrGroupList}?>
      <tr>
        <td align="center" height="80" class="ly_td"><input type="hidden" name="hidGroupID[]" value="<?{$arrGroupList[groupList].groupID}?>"><input name="tbGroupName[]" type="text" value="<?{$arrGroupList[groupList].groupName}?>" size="20" maxlength="20" /></td>
        <td align="center" class="ly_td">
          <label>
            <textarea name="tbGroupInfo[]" cols="30" rows="5"><?{$arrGroupList[groupList].groupInfo}?></textarea>
          </label>
        </td>
        <td align="center" class="ly_td">
          <label>
            <select name="tbActionStr[<?{$smarty.section.groupList.index}?>][]" size="8" multiple>
		  <option value="">��ѡ��Ȩ��</option><?{html_options options=$arrActionList selected=$arrGroupList[groupList].groupAction}?></select>
          </label>
        </td>
        <td align="center" class="ly_td">
          <label>
            <input type="checkbox" name="chkLockID[]" id="chkLockID" value="<?{$arrGroupList[groupList].groupID}?>" <?{if $arrGroupList[groupList].groupState=="0"}?>checked<?{/if}?> />
          </label>
       </td>
        <td align="center" class="ly_Rtd">
        <label>
        <input type="checkbox" name="chkDelID[]" id="chkDelID" value="<?{$arrGroupList[groupList].groupID}?>" />
          </label></td>
      </tr>
      <?{/section}?>
      <tr>
        <td colspan="3" align="right"  height="32px"class="ly_Rtd"><?{$pager}?></td>
        <td class="ly_Rtd"><input type="submit" name="btnUpdate" value=" ��  �� " class="button" <?{if $updateAdminGroup!="true"}?>disabled<?{/if}?> /></td>
        <td class="ly_Rtd"><input type="submit" name="btnDelete" value=" ɾ  �� " class="button" <?{if $delAdminGroup!="true"}?>disabled<?{/if}?> /></td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
<?{/if}?>
<?{if $addAdminGroup == "true"}?>
<form action="?act=add&p=<?{$p}?>" method="post">
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="xt_glz">


 <tr ><td>
        <table width="100%" height="28" border="0" cellspacing="0" cellpadding="0" background="images/mid.gif">
          <tr>
            <td align="left" width="3"><img src="images/left_03.gif"  /></td>
            <td  class="tb_tr_title">�½���</td>
            <td width="3" align="right"><img src="images/right.gif" /></td>
          </tr>
        </table>
		</td>
      </tr>

  <tr>
    <td ><table width="100%" border="0" cellpadding="0" cellspacing="0" class="left_td">
      <tr>
        <td width="32%"  class="ly_td"><input name="tbGroupName" value="" type="text" size="30" maxlength="20"></td>
        <td width="40%"  class="ly_td">
          <label>
            <textarea name="tbGroupInfo" cols="40" rows="5"></textarea>
          </label>
        </td>
        <td width="28%"  class="ly_td">
          <label>
            <select name="tbActionStr[]" size="8" multiple>
		  <option value="">��ѡ��Ȩ��</option><?{html_options options=$arrActionList}?></select>
          </label>
        </td>
      
      </tr>
      <tr>
        <td colspan="3" align="center"  height="42px"class="ly_Rtd"><input value=" ��  �� " type="submit" class="button" <?{if $addAdminGroup!="true"}?>disabled<?{/if}?>></td>
        </tr>
    </table></td>
  </tr>
</table>
</form>
<?{/if}?>
<?{include file="admin/footer.tpl"}?>





