<?{include file="admin/header.tpl"}?>
<script language="javascript" src="http://<?{$smarty.const.SITE_DOMAIN}?>/tuan/js/manager.js"></script>
<div class="right">
  <table width="100%" border="0" cellpadding="1" cellspacing="1" class="table_title">
        <tr>
      <td height="52" bgcolor="#FFFFFF"><h1>�Ź���Ʒ����</h1>
      <div class="search"><form action="tuanindex.php?c=tuangoods" method="post">
			�Ź�����:<input type="text" name="theform[title]" value="<?{$smarty.post.theform.title}?>">
			��Դ��վ��
			<select name="theform[siteid]">
			<option value="" <?{if $smarty.post.theform.siteid==""}?>selected<?{/if}?>>--��ѡ��--</option>
			<?{html_options options=$arrSites selected=$smarty.post.theform.siteid}?>
			</select>
			��Ʒ���ࣺ
			<select name="theform[typeid]">
			<option value="" <?{if $smarty.post.theform.typeid==""}?>selected<?{/if}?>>--��ѡ��--</option>
			<?{html_options options=$arrTypes selected=$smarty.post.theform.typeid}?>
			</select>
            <input type="submit" name="Submit3" value="�� ѯ" class="button" style="width:auto;">
            <input type="button" onclick="if(confirm('ȷ��Ҫ�ɼ������Ź����ݣ�')){window.location.href='http://<?{$smarty.const.SITE_DOMAIN}?>/tuan/crontab/tuanfetch.php'}" value="��ʼ�ɼ�" class="button">
            <input type="button" onclick="window.location.href='tuanindex.php?c=tuangoods&a=edit'" value="����Ź���Ʒ" class="button" style="width:auto;">
			<input class="button" type="button" value="��Ʒ����" onclick="doAction('typeid','good','typeid','doform')" style="width:auto;">&nbsp;<input class="button" type="button" value="�޸ķ���" onclick="doAction('status','good','status','doform')" style="width:auto;">&nbsp;<input class="button" type="button" value="�޸�����" onclick="doAction('sortorder','good','order','doform')" style="width:auto;">
            <input type="button" onclick="window.location.href='tuanindex.php?c=tuangoods&a=deldead'" value="ɾ�����ڵ�Ʒ" class="button" style="width:auto;"></form></div>
		</td>
        </tr>
  </table>
<table id="datatable" width="100%" border="0" cellspacing="0" cellpadding="0" class="table_list" title="˫���༭">
      <tr id="title" >
    <td class="tr1" width="5%">ѡ��<input type="checkbox" onclick="chooseAll(this,'good')" style="width:auto"></td>
    <td class="tr1" width="10%">ͼƬ</td>
    <td class="tr1" width="25%">�Ź�����</td>
    <td class="tr1" width="5%">��Ʒ����</td>
    <td class="tr1" width="5%"><span style="width:50px;white-space:nowrap">��Դ��վ</span></td>
    <td class="tr1" width="4%"><span style="width:50px;white-space:nowrap">�Ź�����</span></td>
    <td class="tr1" width="4%"><span style="width:50px;white-space:nowrap">�Ƿ񷢲�</span></td>
    <td class="tr1" width="4%">����</td>
    <td class="tr1" width="6%">��ʼʱ��</td>
    <td class="tr1" width="6%">����ʱ��</td>
    <td class="tr1" width="6%">�ɼ�ʱ��</td>
    <td class="tr1" width="4%"><span style="width:50px;white-space:nowrap">����</span></td>
    </tr>
<?{section name=loop loop=$voLists}?>
  <tr ondblclick="location.href='?c=tuangoods&a=edit&gid=<?{$voLists[loop].gid}?>';">
 	<td class="tr_a"><input type="checkbox" style="width:auto;" id="choose_<?{$voLists[loop].gid}?>" name="good" value="<?{$voLists[loop].gid}?>"></td>
 	<td class="tr_a"><img src="<?{$voLists[loop].imageurl}?>" width="100px" height="60px"></td>
    <td class="tr_a"><a href="<?{$voLists[loop].goodurl}?>" target="_blank"><?{$voLists[loop].title|mb_substr:0:100:gbk}?></a></td>
    <td class="tr_a"><select name="typeid"><option value="">--��ѡ��--</option><?{html_options options=$arrTypes selected=$voLists[loop].typeid}?></select></td>
    <td class="tr_a"><?{$voLists[loop].sitename}?></td>
    <td class="tr_a"><?{$voLists[loop].cityname}?></td>
    <td class="tr_a"><select name="status"><?{html_options options=$statusArr selected=$voLists[loop].status}?></select></td>
    <td class="tr_a"><input type="text" value="<?{$voLists[loop].sortorder}?>" name="order" size="4" style="width:auto"></td>
    <td class="tr_a"><?{$voLists[loop].starttime|date_format:"%Y-%m-%d %H:%M:%S"}?></td>
    <td class="tr_a"><?{$voLists[loop].endtime|date_format:"%Y-%m-%d %H:%M:%S"}?></td>
    <td class="tr_a"><?{$voLists[loop].gettime|date_format:"%Y-%m-%d %H:%M:%S"}?></td>
    <td class="tr_a"><a href="?c=tuangoods&a=edit&gid=<?{$voLists[loop].gid}?>">�༭</a> | <a href="?c=tuangoods&a=delete&gid=<?{$voLists[loop].gid}?>">ɾ��</a></td>
  </tr>
<?{/section}?>
<tr>
<td height="30" colspan="12" align="right" valign="middle" class="ly_Rtd"><?{$pager}?>
            <input type="button" onclick="window.location.href='tuanindex.php?c=tuangoods&a=edit'" value="����Ź���Ʒ" class="button" style="width:auto;"><input class="button" type="button" value="��Ʒ����" onclick="doAction('typeid','good','typeid','doform')" style="width:auto;">&nbsp;<input class="button" type="button" value="�޸ķ���" onclick="doAction('status','good','status','doform')" style="width:auto;">&nbsp;<input class="button" type="button" value="�޸�����" onclick="doAction('sortorder','good','order','doform')" style="width:auto;">
            <input type="button" onclick="window.location.href='tuanindex.php?c=tuangoods&a=deldead'" value="ɾ�����ڵ�Ʒ" class="button" style="width:auto;">
</td></tr>
</table>
<form name="doform" action="?c=tuangoods&a=do" method="post">
<input type="hidden" name="optype">
<input type="hidden" name="ids">
<input type="hidden" name="orders">
</form>
<div class="clear"></div>
  </div>
<?{include file="admin/footer.tpl"}?>
