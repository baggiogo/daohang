<?{include file="admin/header.tpl"}?>
<script language="javascript">
function sub(){
var check = confirm('确定要操作吗？');
if(check){
	var search_select = document.getElementById('search_select').value;
	var action = document.getElementById('action').value;
	var name = document.getElementById('name').value;
	var img_url = document.getElementById('img_url').value;
	var sort = document.getElementById('sort').value;
	var sort1 = document.getElementById('sort1').value;
	var sort2 = document.getElementById('sort2').value;
	if(search_select=='' || action=='' || name=='' || img_url=='' || sort=='' || sort1=='' || sort2==''){
		alert("有必填项未填写！");
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
      <td height="52" bgcolor="#FFFFFF"><h1>编辑资料<?{if $operateFlag}?>--操作成功！<?{/if}?></h1></td>
        </tr>
  </table>
<form action="?c=tuanapis&a=edit&aid=<?{$arrAPI.aid}?>" method="post" onSubmit="return sub();">
<input type="hidden" name="aid" value="<?{$arrAPI.aid}?>">
 <table id="datatable" width="100%" border="0" cellspacing="0" cellpadding="0" class="table_list">
 		<tr>
		    <td width="20%" class="tr_a" style="text-align:right">API名称*</td>
		    <td width="80%" class="tr_a" style="text-align:left">
		    <input id="search_select" type="text" name="theform[apiname]" value="<?{$arrAPI.apiname}?>">
		    <font style="color:red">如：百度API</font>
		    </td>
		    </tr>
		<tr>
		    <td class="tr_a" style="text-align:right">团标签</td>
		    <td class="tr_a" style="text-align:left">
		    <input id="action" type="text" name="theform[grouptag]" value="<?{$arrAPI.grouptag}?>">
		    <font style="color:red">如：url</font>
		    </td>
		    </tr>

			<tr>
		    <td class="tr_a" style="text-align:right">团购标题标签</td>
		    <td class="tr_a" style="text-align:left">
		    <input id="name" type="text" name="theform[groupname]" value="<?{$arrAPI.groupname}?>">
		    <font style="color:red">如：title</font>
		    </td>
		    </tr>

			<tr>
		    <td class="tr_a" style="text-align:right">详细链接标签</td>
		    <td class="tr_a" style="text-align:left">
		    <input id="img_url" type="text" name="theform[linkurl]" value="<?{$arrAPI.linkurl}?>">
		    <font style="color:red">如：loc</font>
		    </td>
		    </tr>

			<tr>
		    <td class="tr_a" style="text-align:right">新价标签</td>
		    <td class="tr_a" style="text-align:left">
		    <input id="sort" type="text" name="theform[newprice]" value="<?{$arrAPI.newprice}?>">
		    <font style="color:red">如：price</font>
		    </td>
		    </tr>

			<tr>
		    <td class="tr_a" style="text-align:right">原价标签</td>
		    <td class="tr_a" style="text-align:left">
		    <input id="sort1" type="text" name="theform[price]" value="<?{$arrAPI.price}?>">
		    <font style="color:red">如：value</font>
		    </td>
		    </tr>

			<tr>
		    <td class="tr_a" style="text-align:right">折扣标签</td>
		    <td class="tr_a" style="text-align:left">
		    <input id="sort2" type="text" name="theform[discount]" value="<?{$arrAPI.discount}?>">
		    <font style="color:red">如：rebate</font>
		    </td>
		    </tr>

			<tr>
		    <td class="tr_a" style="text-align:right">人数标签</td>
		    <td class="tr_a" style="text-align:left">
		    <input type="text" name="theform[personnum]" value="<?{$arrAPI.personnum}?>">
		    <font style="color:red">如：bought</font>
		    </td>
		    </tr>

			<tr>
		    <td class="tr_a" style="text-align:right">图片标签</td>
		    <td class="tr_a" style="text-align:left">
		    <input type="text" name="theform[picture]" value="<?{$arrAPI.picture}?>">
		    <font style="color:red">如：image</font>
		    </td>
		    </tr>

			<tr>
		    <td class="tr_a" style="text-align:right">开始时间标签</td>
		    <td class="tr_a" style="text-align:left">
		    <input type="text" name="theform[starttime]" value="<?{$arrAPI.starttime}?>">
		    <font style="color:red">如：startTime</font>
		    </td>
		    </tr>

			<tr>
		    <td class="tr_a" style="text-align:right">结束时间标签</td>
		    <td class="tr_a" style="text-align:left">
		    <input type="text" name="theform[endtime]" value="<?{$arrAPI.endtime}?>">
		    <font style="color:red">如：endTime</font>
		    </td>
		    </tr>

			<tr>
		    <td class="tr_a" style="text-align:right">城市标签</td>
		    <td class="tr_a" style="text-align:left">
		    <input type="text" name="theform[city]" value="<?{$arrAPI.city}?>">
		    <font style="color:red">如：city</font>
		    </td>
		    </tr>

			<tr>
		    <td class="tr_a" style="text-align:right">详细信息标签</td>
		    <td class="tr_a" style="text-align:left">
		    <input type="text" name="theform[detail]" value="<?{$arrAPI.detail}?>">
		    <font style="color:red">如：description</font>
		    </td>
		    </tr>

			<tr>
		    <td class="tr_a" style="text-align:right">店铺地址标签</td>
		    <td class="tr_a" style="text-align:left">
		    <input type="text" name="theform[address]" value="<?{$arrAPI.address}?>">
		    <font style="color:red">如：address</font>
		    </td>
		    </tr>

			 <tr  class="tb_line">
		    <td colspan="2" ></td>
		    </tr>
		   <tr  >
		    <td height="30" colspan="2" align="center" valign="middle" class="ly_Rtd"><input type="submit" name="Submit" value="保 存" class="button" ><input type="button" class="button" value="返回" onclick="window.location.href='tuanindex.php?c=tuanapis'"></td>
		   </tr>
</table>
		</form>
<div class="clear"></div>
  </div>
<?{include file="admin/footer.tpl"}?>

