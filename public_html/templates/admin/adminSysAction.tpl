<?{include file="admin/header.tpl"}?>
<?{if $viewAdminAction == "true"}?>
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
            <td  class="tb_tr_title">Ȩ�޹���</td>
            <td width="3" align="right"><img src="images/right.gif" /></td>
          </tr>
        </table>
		</td>
      </tr>


  <tr>
    <td colspan="3" align="left" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0" class="left_td">
      <tr >
        <td class="ly_td" >Ȩ������</td>
        <td class="ly_td">Ȩ���ַ���</td>
        <td  class="ly_td">����ģ������</td>
        <td class="ly_td"> ����<input type="checkbox" onclick="chooseall(this,'chkLockID[]')"></td>
        <td class="ly_Rtd"> ɾ��<input type="checkbox" onclick="chooseall(this,'chkDelID[]')"> </td>
      </tr>
      <?{section name=actionList loop=$arrActionList}?>
      <tr>
        <td align="center" height="34" class="ly_td">
          <input type="hidden" name="hidActionID[]" value="<?{$arrActionList[actionList].actionID}?>"><input name="tbActionName[]" type="text" value="<?{$arrActionList[actionList].actionName}?>" size="20" maxlength="20" />
        </td>
        <td align="center" class="ly_td"><input name="tbActionStr[]" type="text" value="<?{$arrActionList[actionList].actionStr}?>" size="20" maxlength="50" /></td>
        <td align="center" class="ly_td">
          <label>
            <select name="tbModuleID[]"><option value="">��ѡ��ģ��</option><?{html_options options=$arrModuleList selected=$arrActionList[actionList].moduleID}?></select>
          </label>
        </td>
        <td align="center" class="ly_td">
          <label>
            <input type="checkbox" name="chkLockID[]" id="chkLockID" value="<?{$arrActionList[actionList].actionID}?>" <?{if $arrActionList[actionList].actionState=="0"}?>checked<?{/if}?> />
          </label>
       </td>
        <td align="center" class="ly_Rtd">
        <label>
        <input type="checkbox" name="chkDelID[]" id="chkDelID" value="<?{$arrActionList[actionList].actionID}?>" />
          </label></td>
      </tr>
      <?{/section}?>
      <tr>
        <td colspan="3" align="right"  height="32px"class="ly_Rtd"><?{$pager}?></td>
        <td class="ly_Rtd"><input type="submit" name="btnUpdate" value=" ��  �� " class="button" <?{if $updateAdminAction!="true"}?>disabled<?{/if}?> /></td>
        <td class="ly_Rtd"><input type="submit" name="btnDelete" value=" ɾ  �� " class="button" <?{if $delAdminAction!="true"}?>disabled<?{/if}?> /></td>
      </tr> 
    </table></td>
  </tr>
</table>
<?{/if}?>
<?{if $addAdminAction == "true"}?>
<form action="?act=add&p=<?{$p}?>" method="post"><!-- onSubmit="return CheckAddAction()"-->
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="xt_glz">


 <tr ><td>
        <table width="100%" height="28" border="0" cellspacing="0" cellpadding="0" background="images/mid.gif">
          <tr>
            <td align="left" width="3"><img src="images/left_03.gif"  /></td>
            <td  class="tb_tr_title">�����Ȩ��</td>
            <td width="3" align="right"><img src="images/right.gif" /></td>
          </tr>
        </table>
		</td>
      </tr>

 
  <tr>
    <td colspan="3" align="left" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0" class="left_td">
      <?{foreach from=$arrNO item=NO}?>
      <tr>
        <td  width="242"align="center" height="60" class="ly_td">Ȩ������<?{$NO}?>:
            <input name="tbActionName[]" type="text" value="" size="20" maxlength="20">
          </td>
        <td width="295" align="center" class="ly_td">Ȩ���ַ���:
            <input name="tbActionStr[]" type="text" value="" size="20" maxlength="50"></td>
        <td width="285" align="center" class="ly_Rtd">����ģ��:<select name="tbModuleID[]">
        <option value="">��ѡ��ģ��</option><?{html_options options=$arrModuleList}?>
      </select></td>
        </tr>
      <?{/foreach}?>
      <tr>
        <td colspan="3" align="center"  height="42px"class="ly_Rtd"><input value=" ��  �� " type="submit" class="button" <?{if $addAdminAction!="true"}?>disabled<?{/if}?>></td>
        </tr>
    </table></td>
  </tr>
</table>

</form>
<br />
<br />
<?{/if}?>
<?{include file="admin/footer.tpl"}?>
