<?{include file="admin/header.tpl"}?>
<script language="javascript" src="http://<?{$smarty.const.SITE_DOMAIN}?>/tuan/js/date.js"></script>
<div class="right">
  <table width="100%" border="0" cellpadding="1" cellspacing="1" class="table_title">
        <tr>
      <td height="52" bgcolor="#FFFFFF"><h1>�༭����<?{if $operateFlag}?>--�����ɹ���<?{/if}?></h1></td>
        </tr>
  </table>
		<form action="?c=tuangoods&a=edit&gid=<?{$arrGood.gid}?>" method="post">
		<input type="hidden" name="gid" value="<?{$arrGood.gid}?>">
		<table id="datatable" width="100%" border="0" cellspacing="0" cellpadding="0" class="table_list">
		    <tr>
		    <td width="20%" class="tr_a" style="text-align:right">�Ź�����*</td>
		    <td width="80%" class="tr_a" style="text-align:left"><input type="text" name="theform[title]" value="<?{$arrGood.title}?>" size="65" style="width:500px">
		    </td>
		    </tr>

		    <tr>
		    <td class="tr_a" style="text-align:right">��������*</td>
		    <td class="tr_a" style="text-align:left"><input type="text" name="theform[goodurl]" value="<?{$arrGood.goodurl}?>" size="65" style="width:500px">
		    </td>
		    </tr>

		    <tr>
		    <td class="tr_a" style="text-align:right">��վ��Դ</td>
		    <td class="tr_a" style="text-align:left">
		    <select name="theform[siteid]">
			<?{html_options options=$arrSites selected=$arrGood.siteid}?>
			</select>
		    </td>
		    </tr>

		    <tr>
		    <td class="tr_a" style="text-align:right">�Ź�����</td>
		    <td class="tr_a" style="text-align:left">
		    <select name="theform[cityname]">
			<?{html_options options=$arrCitys selected=$arrGood.cityname}?>
			</select>
		    </td>
		    </tr>

		    <tr>
		    <td class="tr_a" style="text-align:right">��Ʒ����</td>
		    <td class="tr_a" style="text-align:left">
		    <select name="theform[typeid]">
			<?{html_options options=$arrTypes selected=$arrGood.typeid}?>
			</select>
		    </td>
		    </tr>

		    <tr>
		    <td class="tr_a" style="text-align:right">ԭ��</td>
		    <td class="tr_a" style="text-align:left"><input type="text" name="theform[price]" value="<?{$arrGood.price|default:0}?>">
		    </td>
		    </tr>

		    <tr>
		    <td class="tr_a" style="text-align:right">�Ź���</td>
		    <td class="tr_a" style="text-align:left"><input type="text" name="theform[newprice]" value="<?{$arrGood.newprice|default:0}?>">
		    </td>
		    </tr>

		    <tr>
		    <td class="tr_a" style="text-align:right">�ۿۼ�</td>
		    <td class="tr_a" style="text-align:left"><input type="text" name="theform[discount]" value="<?{$arrGood.discount|default:0}?>">
		    </td>
		    </tr>

		    <tr>
		    <td class="tr_a" style="text-align:right">����</td>
		    <td class="tr_a" style="text-align:left"><input type="text" name="theform[personnum]" value="<?{$arrGood.personnum|default:0}?>">
		    </td>
		    </tr>

		    <tr>
		    <td class="tr_a" style="text-align:right">��ʼʱ��</td>
		    <td class="tr_a" style="text-align:left"><input type="text" name="theform[starttime]" value="<?{$arrGood.starttime|date_format:'%Y-%m-%d %H:%M:%S'}?>" onclick="SelectDate(this,'yyyy-MM-dd hh:mm:ss')">
		    </td>
		    </tr>

		    <tr>
		    <td class="tr_a" style="text-align:right">����ʱ��</td>
		    <td class="tr_a" style="text-align:left"><input type="text" name="theform[endtime]" value="<?{$arrGood.endtime|date_format:'%Y-%m-%d %H:%M:%S'}?>" onclick="SelectDate(this,'yyyy-MM-dd hh:mm:ss')">
		    </td>
		    </tr>

		    <tr>
		    <td class="tr_a" style="text-align:right">ͼƬ����</td>
		    <td class="tr_a" style="text-align:left"><input type="text" name="theform[imageurl]" value="<?{$arrGood.imageurl}?>" size="65">
		    </td>
		    </tr>

		    <tr>
		    <td class="tr_a" style="text-align:right">���̵�ַ</td>
		    <td class="tr_a" style="text-align:left"><textarea name="theform[address]" cols="45" rows="5"><?{$arrGood.address}?></textarea></td>
		    </tr>

		    <tr>
		    <td class="tr_a" style="text-align:right">��ϸ��Ϣ</td>
		    <td class="tr_a" style="text-align:left"><textarea name="theform[detail]" cols="45" rows="5"><?{$arrGood.detail}?></textarea></td>
		    </tr>

			<tr >
		    <td class="tr_a" style="text-align:right">�Ƿ񷢲�</td>
		    <td class="tr_a" style="text-align:left">
		    <select name="theform[status]">
			<?{html_options options=$statusArr selected=$arrGood.status}?>
			</select>
			<font style="color:red">��ʾ��ѡ��񽫲����Ź�ҳ����ʾ</font>
		    </td>
		    </tr>

			<tr >
		    <td class="tr_a" style="text-align:right">����</td>
		    <td class="tr_a" style="text-align:left">
		    <input type="text" name="theform[sortorder]" value="<?{$arrGood.sortorder|default:1000}?>">
		    <font style="color:red">��ʾ:����ԽСԽ��ǰ��</font>
		    </td>
		    </tr>
		   <tr >
		    <td colspan="2" align="center" class="tb_tr_bottom"><input type="submit" name="Submit" value="�� ��" class="button" >    <input type="button" class="button" value="����" onclick="window.location.href='tuanindex.php?c=tuangoods'"></td>
		   </tr>
		</table>
		</form>

    </td>
  </tr>
</table>
</body>
</html>

