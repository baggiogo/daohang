<?{include file="admin/header.tpl"}?>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_list">
      <tr>
        <td width="100%" class="tr1">���²�����Ϣ</td></tr>
      <tr><td class="tr_a" valign="top">
<ul style="text-align:left;background-color:#FFD">
<?{if $update==1}?>
<form action="adminUpdate.php?a=apply" method="POST">
<li>�ѳɹ����صĸ����ļ���</li>
<?{foreach name=file_succ item=row from=$file_succ}?>
<li>����ȫ���¡�../data/update/<?{$row}?><input type="hidden" value="<?{$row}?>" name="upfiles[]"></li>
<?{/foreach}?>
<?{if $file_fail !=''}?>
<li><font color=red>����ʧ�ܵ��ļ���</font></li>
<?{foreach name=fail item=frow from=$file_fail}?>
<li><?{$frow}?></li>
<?{/foreach}?>
<input type="button" class="button"  style="cursor: pointer;" value=" ������������ " onclick="location.href='main.php'">
<?{else}?>
<li><input type="submit" class="button" style="cursor: pointer;" value=" ��˰�װ���²��� " name="sub"></li>
<?{/if}?>
</form>
<?{elseif $update==2}?>
<form action="adminUpdate.php?a=applydata" method="POST">
<li>�ѳɹ����ص������ļ���</li>
<?{foreach name=data_succ item=row from=$data_succ}?>
<li>�����ݸ��¡�../data/update/sql/<?{$row}?><input type="hidden" value="<?{$row}?>" name="updata[]"></li>
<?{/foreach}?>
<?{if $data_fail !=''}?>
<li><font color=red>����ʧ�ܵ��ļ���</font></li>
<?{foreach name=data_fail item=frow from=$data_fail}?>
<li><?{$frow}?></li>
<?{/foreach}?>
<input type="button" class="button"  style="cursor: pointer;" value=" ������������ " onclick="location.href='main.php'">
<?{else}?>
<li><input type="submit" class="button" style="cursor: pointer;" value=" ��˰�װ���ݸ��� " name="submit"></li>
<?{/if}?>
</form>
<?{/if}?>
</ul>
      </td>
      </tr>
</table>
<?{include file="admin/footer.tpl"}?>