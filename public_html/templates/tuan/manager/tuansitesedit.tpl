<?{include file="admin/header.tpl"}?>
<div class="right">
  <table width="100%" border="0" cellpadding="1" cellspacing="1" class="table_title">
        <tr>
      <td height="52" bgcolor="#FFFFFF"><h1>�༭����<?{if $operateFlag==1}?>--�����ɹ���<?{/if}?><?{if $operateFlag==-1}?>--<font color="red">����ʧ�ܣ�</font><?{/if}?></h1></td>
        </tr>
  </table>
		<form action="?c=tuansites&a=edit&sid=<?{$arrSite.sid}?>" method="post">
		<input type="hidden" name="sid" value="<?{$arrSite.sid}?>">
		<table id="datatable" width="100%" border="0" cellspacing="0" cellpadding="0" class="table_list">
		   <tr>
		    <td width="20%" class="tr_a" style="text-align:right">�Ź���վ����*</td>
		    <td width="80%" class="tr_a" style="text-align:left"><input type="text" name="theform[sitename]" value="<?{$arrSite.sitename}?>">
		    </td>
		    </tr>

			<tr >
		    <td class="tr_a" style="text-align:right">��վ��ַ</td>
		    <td class="tr_a" style="text-align:left">
		    <input type="text" name="theform[siteurl]" value="<?{$arrSite.siteurl}?>">
		    <font style="color:red">��:http://www.taoku.com</font>
		    </td>
		    </tr>

			<tr >
		    <td class="tr_a" style="text-align:right">���ڳ���</td>
		    <td class="tr_a" style="text-align:left">
		    <select name="theform[cityid]">
			<?{html_options options=$arrCitys selected=$arrSite.cityid}?>
			</select>
		    <font style="color:red">��:����</font>
		    </td>
		    </tr>
		  <tr>
		    <td class="tr_a" style="text-align:right">��վlogo��ַ</td>
		    <td  class="tr_a" style="text-align:left">
		    <input type="text" name="theform[logourl]" value="<?{$arrSite.logourl}?>">
		    <font style="color:red">��:http://www.taoku.com/logo.gif</font>
		    </td>
		    </tr>
		    <tr >
		    <td class="tr_a" style="text-align:right">������ɫ</td>
		    <td class="tr_a" style="text-align:left">
		    <input type="text" name="theform[wordcolor]" value="<?{$arrSite.wordcolor|default:''}?>">
		    <font style="color:red">��:#FFFFFF</font>
		    </td>
		    </tr>

		    <tr >
		    <td class="tr_a" style="text-align:right">�Ƿ��Ƽ�����ҳ��վ</td>
		    <td class="tr_a" style="text-align:left">
		    <select name="theform[commend]">
			<?{html_options options=$statusArr selected=$arrSite.commend}?>
			</select>
		    </td>
		    </tr>

			<tr >
		    <td class="tr_a" style="text-align:right">����</td>
		    <td class="tr_a" style="text-align:left">
		    <input type="text" name="theform[sortorder]" value="<?{$arrSite.sortorder|default:1000}?>">
		    <font style="color:red">��:����ԽСԽ��ǰ��</font>
		    </td>
		    </tr>

			<tr >
		    <td class="tr_a" style="text-align:right">��ϸ����</td>
		    <td class="tr_a" style="text-align:left">
		    <textarea name="theform[detail]" cols="50" rows="15"><?{$arrSite.detail}?></textarea>
		    </td>
		    </tr>
		   <tr  >
		    <td colspan="2" align="center" class="tb_tr_bottom"><input type="submit" name="Submit" value="�� ��" class="button" >    <input type="button" class="button" value="����" onclick="window.location.href='tuanindex.php?c=tuansites'"></td>
		   </tr>
</table>
		</form>
<div class="clear"></div>
  </div>
<?{include file="admin/footer.tpl"}?>

