<?{include file="admin/header.tpl"}?>
<script language="javascript">
function sub(){
var check = confirm('ȷ��Ҫ������');
if(check){
	var search_select = document.getElementById('search_select').value;
	var action = document.getElementById('action').value;
	var name = document.getElementById('name').value;
	var img_url = document.getElementById('img_url').value;
	var sort = document.getElementById('sort').value;
	var sort1 = document.getElementById('sort1').value;
	var sort2 = document.getElementById('sort2').value;
	if(search_select=='' || action=='' || name=='' || img_url=='' || sort=='' || sort1=='' || sort2==''){
		alert("�б�����δ��д��");
		return false;
	}
}else{
	return false;
}
return true;
}
</script>
<div class="right">
  <table width="100%" border="0" cellpadding="1" cellspacing="1" class="table_title">
        <tr>
      <td height="52" bgcolor="#FFFFFF"><h1>�༭����<?{if $operateFlag}?>--�����ɹ���<?{/if}?></h1></td>
        </tr>
  </table>
<form action="?c=tuanapis&a=edit&aid=<?{$arrAPI.aid}?>" method="post" onSubmit="return sub();">
<input type="hidden" name="aid" value="<?{$arrAPI.aid}?>">
 <table id="datatable" width="100%" border="0" cellspacing="0" cellpadding="0" class="table_list">
 		<tr>
		    <td width="20%" class="tr_a" style="text-align:right">API����*</td>
		    <td width="80%" class="tr_a" style="text-align:left">
		    <input id="search_select" type="text" name="theform[apiname]" value="<?{$arrAPI.apiname}?>">
		    <font style="color:red">�磺�ٶ�API</font>
		    </td>
		    </tr>
		<tr>
		    <td class="tr_a" style="text-align:right">�ű�ǩ</td>
		    <td class="tr_a" style="text-align:left">
		    <input id="action" type="text" name="theform[grouptag]" value="<?{$arrAPI.grouptag}?>">
		    <font style="color:red">�磺url</font>
		    </td>
		    </tr>

			<tr>
		    <td class="tr_a" style="text-align:right">�Ź������ǩ</td>
		    <td class="tr_a" style="text-align:left">
		    <input id="name" type="text" name="theform[groupname]" value="<?{$arrAPI.groupname}?>">
		    <font style="color:red">�磺title</font>
		    </td>
		    </tr>

			<tr>
		    <td class="tr_a" style="text-align:right">��ϸ���ӱ�ǩ</td>
		    <td class="tr_a" style="text-align:left">
		    <input id="img_url" type="text" name="theform[linkurl]" value="<?{$arrAPI.linkurl}?>">
		    <font style="color:red">�磺loc</font>
		    </td>
		    </tr>

			<tr>
		    <td class="tr_a" style="text-align:right">�¼۱�ǩ</td>
		    <td class="tr_a" style="text-align:left">
		    <input id="sort" type="text" name="theform[newprice]" value="<?{$arrAPI.newprice}?>">
		    <font style="color:red">�磺price</font>
		    </td>
		    </tr>

			<tr>
		    <td class="tr_a" style="text-align:right">ԭ�۱�ǩ</td>
		    <td class="tr_a" style="text-align:left">
		    <input id="sort1" type="text" name="theform[price]" value="<?{$arrAPI.price}?>">
		    <font style="color:red">�磺value</font>
		    </td>
		    </tr>

			<tr>
		    <td class="tr_a" style="text-align:right">�ۿ۱�ǩ</td>
		    <td class="tr_a" style="text-align:left">
		    <input id="sort2" type="text" name="theform[discount]" value="<?{$arrAPI.discount}?>">
		    <font style="color:red">�磺rebate</font>
		    </td>
		    </tr>

			<tr>
		    <td class="tr_a" style="text-align:right">������ǩ</td>
		    <td class="tr_a" style="text-align:left">
		    <input type="text" name="theform[personnum]" value="<?{$arrAPI.personnum}?>">
		    <font style="color:red">�磺bought</font>
		    </td>
		    </tr>

			<tr>
		    <td class="tr_a" style="text-align:right">ͼƬ��ǩ</td>
		    <td class="tr_a" style="text-align:left">
		    <input type="text" name="theform[picture]" value="<?{$arrAPI.picture}?>">
		    <font style="color:red">�磺image</font>
		    </td>
		    </tr>

			<tr>
		    <td class="tr_a" style="text-align:right">��ʼʱ���ǩ</td>
		    <td class="tr_a" style="text-align:left">
		    <input type="text" name="theform[starttime]" value="<?{$arrAPI.starttime}?>">
		    <font style="color:red">�磺startTime</font>
		    </td>
		    </tr>

			<tr>
		    <td class="tr_a" style="text-align:right">����ʱ���ǩ</td>
		    <td class="tr_a" style="text-align:left">
		    <input type="text" name="theform[endtime]" value="<?{$arrAPI.endtime}?>">
		    <font style="color:red">�磺endTime</font>
		    </td>
		    </tr>

			<tr>
		    <td class="tr_a" style="text-align:right">���б�ǩ</td>
		    <td class="tr_a" style="text-align:left">
		    <input type="text" name="theform[city]" value="<?{$arrAPI.city}?>">
		    <font style="color:red">�磺city</font>
		    </td>
		    </tr>

			<tr>
		    <td class="tr_a" style="text-align:right">��ϸ��Ϣ��ǩ</td>
		    <td class="tr_a" style="text-align:left">
		    <input type="text" name="theform[detail]" value="<?{$arrAPI.detail}?>">
		    <font style="color:red">�磺description</font>
		    </td>
		    </tr>

			<tr>
		    <td class="tr_a" style="text-align:right">���̵�ַ��ǩ</td>
		    <td class="tr_a" style="text-align:left">
		    <input type="text" name="theform[address]" value="<?{$arrAPI.address}?>">
		    <font style="color:red">�磺address</font>
		    </td>
		    </tr>

			 <tr  class="tb_line">
		    <td colspan="2" ></td>
		    </tr>
		   <tr  >
		    <td height="30" colspan="2" align="center" valign="middle" class="ly_Rtd"><input type="submit" name="Submit" value="�� ��" class="button" ><input type="button" class="button" value="����" onclick="window.location.href='tuanindex.php?c=tuanapis'"></td>
		   </tr>
</table>
		</form>
<div class="clear"></div>
  </div>
<?{include file="admin/footer.tpl"}?>

