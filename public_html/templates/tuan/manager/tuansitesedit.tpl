<?{include file="admin/header.tpl"}?>
<div class="right">
  <table width="100%" border="0" cellpadding="1" cellspacing="1" class="table_title">
        <tr>
      <td height="52" bgcolor="#FFFFFF"><h1>编辑资料<?{if $operateFlag==1}?>--操作成功！<?{/if}?><?{if $operateFlag==-1}?>--<font color="red">操作失败！</font><?{/if}?></h1></td>
        </tr>
  </table>
		<form action="?c=tuansites&a=edit&sid=<?{$arrSite.sid}?>" method="post">
		<input type="hidden" name="sid" value="<?{$arrSite.sid}?>">
		<table id="datatable" width="100%" border="0" cellspacing="0" cellpadding="0" class="table_list">
		   <tr>
		    <td width="20%" class="tr_a" style="text-align:right">团购网站名称*</td>
		    <td width="80%" class="tr_a" style="text-align:left"><input type="text" name="theform[sitename]" value="<?{$arrSite.sitename}?>">
		    </td>
		    </tr>

			<tr >
		    <td class="tr_a" style="text-align:right">网站网址</td>
		    <td class="tr_a" style="text-align:left">
		    <input type="text" name="theform[siteurl]" value="<?{$arrSite.siteurl}?>">
		    <font style="color:red">如:http://www.taoku.com</font>
		    </td>
		    </tr>

			<tr >
		    <td class="tr_a" style="text-align:right">所在城市</td>
		    <td class="tr_a" style="text-align:left">
		    <select name="theform[cityid]">
			<?{html_options options=$arrCitys selected=$arrSite.cityid}?>
			</select>
		    <font style="color:red">如:北京</font>
		    </td>
		    </tr>
		  <tr>
		    <td class="tr_a" style="text-align:right">网站logo地址</td>
		    <td  class="tr_a" style="text-align:left">
		    <input type="text" name="theform[logourl]" value="<?{$arrSite.logourl}?>">
		    <font style="color:red">如:http://www.taoku.com/logo.gif</font>
		    </td>
		    </tr>
		    <tr >
		    <td class="tr_a" style="text-align:right">字体颜色</td>
		    <td class="tr_a" style="text-align:left">
		    <input type="text" name="theform[wordcolor]" value="<?{$arrSite.wordcolor|default:''}?>">
		    <font style="color:red">如:#FFFFFF</font>
		    </td>
		    </tr>

		    <tr >
		    <td class="tr_a" style="text-align:right">是否推荐到首页名站</td>
		    <td class="tr_a" style="text-align:left">
		    <select name="theform[commend]">
			<?{html_options options=$statusArr selected=$arrSite.commend}?>
			</select>
		    </td>
		    </tr>

			<tr >
		    <td class="tr_a" style="text-align:right">排序</td>
		    <td class="tr_a" style="text-align:left">
		    <input type="text" name="theform[sortorder]" value="<?{$arrSite.sortorder|default:1000}?>">
		    <font style="color:red">如:数字越小越排前面</font>
		    </td>
		    </tr>

			<tr >
		    <td class="tr_a" style="text-align:right">详细介绍</td>
		    <td class="tr_a" style="text-align:left">
		    <textarea name="theform[detail]" cols="50" rows="15"><?{$arrSite.detail}?></textarea>
		    </td>
		    </tr>
		   <tr  >
		    <td colspan="2" align="center" class="tb_tr_bottom"><input type="submit" name="Submit" value="保 存" class="button" >    <input type="button" class="button" value="返回" onclick="window.location.href='tuanindex.php?c=tuansites'"></td>
		   </tr>
</table>
		</form>
<div class="clear"></div>
  </div>
<?{include file="admin/footer.tpl"}?>

