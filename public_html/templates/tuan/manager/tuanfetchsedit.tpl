<?{include file="admin/header.tpl"}?>
<div class="right">
  <table width="100%" border="0" cellpadding="1" cellspacing="1" class="table_title">
        <tr>
      <td height="52" bgcolor="#FFFFFF"><h1>�༭����<?{if $operateFlag==1}?>--�����ɹ���<?{/if}?><?{if $operateFlag==-1}?>--<font color="red">����ʧ�ܣ�</font><?{/if}?></h1></td>
        </tr>
  </table>

		<form action="?c=tuanfetchs&a=edit&fid=<?{$arrFetch.fid}?>" method="post">
		<input type="hidden" name="fid" value="<?{$arrFetch.fid}?>">
		<table id="datatable" width="100%" border="0" cellspacing="0" cellpadding="0" class="table_list">
		   <tr>
		    <td width="20%" class="tr_a" style="text-align:right">�Ź���վ*</td>
		    <td width="80%" class="tr_a" style="text-align:left" colspan="3">
		    <select name="theform[siteid]">
			<?{html_options options=$arrSites selected=$arrFetch.siteid}?>
			</select>
		    </td>
	      </tr>

			<tr >
		    <td class="tr_a" style="text-align:right">API��ַ</td>
		    <td class="tr_a" style="text-align:left" colspan="3">
		    <input type="text" name="theform[apiurl]" value="<?{$arrFetch.apiurl}?>" size="65">
		    <font style="color:red">��ʾ:����������� {$city} ��ʾ������д����ĳ����ַ���ƥ��</font>
		    </td>
		    </tr>

			<tr >
		    <td class="tr_a" style="text-align:right">APIģ��</td>
		    <td class="tr_a" style="text-align:left" colspan="3">
		    <select name="theform[apiid]">
			<?{html_options options=$arrAPIs selected=$arrFetch.apiid}?>
			</select>
		    <font style="color:red">��:�ٶ�API</font>
		    </td>
		    </tr>

		    <tr >
		    <td class="tr_a" style="text-align:right">�Ƿ�ɼ�</td>
		    <td class="tr_a" style="text-align:left" colspan="3">
		    <select name="theform[apifetch]">
			<?{html_options options=$statusArr selected=$arrFetch.apifetch}?>
			</select>
		    </td>
		    </tr>

			<tr>
		    <td class="tr_a" style="text-align:right">�����ַ���ƥ��</td>
		    <td class="tr_a" width="10%" style="text-align:left">
		    <textarea id="citymatch" name="theform[citymatch]" style="height:600px;width:100px;"><?{$arrFetch.citymatch}?></textarea>
		    </td>
		    <td class="tr_a" width="10%" style="text-align:left"><= <br>
		      <input type="button" class="button" value="ȫ��" onclick="setalltocity()"></td>
		    <td class="tr_a" width="60%" style="text-align:left"><select id="citylist" size="35" multiple="multiple" onclick="settocity(this,this.value)" style="height:600px">
			  <?{html_options options=$citylist}?>
			</select>
		    </td>
		    </tr>
		   <tr  >
		    <td colspan="4" align="center" class="tb_tr_bottom"><input type="submit" name="Submit" value="�� ��" class="button" >    <input type="button" class="button" value="����" onclick="window.location.href='tuanindex.php?c=tuanfetchs'"></td>
		   </tr>
		</table>
		</form>
<div class="clear"></div>
  </div>
<script language="javascript">
function setalltocity(){
	var obj = document.getElementById('citylist');
	for(var i = 0; i < obj.options.length; i++) {
		settocity(obj,i);
	}
}
function settocity(obj,i){
	document.getElementById('citymatch').value += obj[i].text + ",\r\n";
}
</script>
<?{include file="admin/footer.tpl"}?>

