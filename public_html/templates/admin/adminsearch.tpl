<?{include file="admin/header.tpl"}?>
<script language="javascript">
function changes(obj)
{
    if(obj.value == "") return;
    location.href = "adminSearch.php?classid=" + obj.value;
}
function sub(){
var check = confirm('ȷ��Ҫ������');
if(check){
	var search_select = document.getElementById('search_select').value;
	var action = document.getElementById('action').value;
	var name = document.getElementById('name').value;
	var img_url = document.getElementById('img_url').value;
	var sort = document.getElementById('sort').value;
	if(search_select=='' || action=='' || name=='' || img_url=='' || sort==''){
		alert("�б�����δ��д��");
		return false;
	}
}else{
	return false;
}
htmlnotice(1);htmlnotice(4);
return true;
}
</script>
<div class="right">
  <table width="100%" border="0" cellpadding="1" cellspacing="1" class="table_title">
        <tr>
      <td height="52" bgcolor="#FFFFFF"><h1>��ҳ������������</h1>
</td>
        </tr>
      </table>

<?{if $smarty.get.act == 'update'}?>
<form action="adminSearch.php?act=save" method="post" onSubmit="return sub();">
                <?{if $data.id}?><input type="hidden" name="form[id]" value="<?{$data.id}?>"/><?{/if}?>
                <div>
                    <table id="datatable" width="100%" border="0" cellspacing="0" cellpadding="0" class="table_list">
                        <tr>
                            <td width="20%" class="tr_a" style="text-align:right">���������ࣺ</td>
                            <td width="80%" class="tr_a" style="text-align:left">
                                <select name=form[class] style="width:70px;">
                                    <?{html_options options=$options selected=$data.class}?>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="tr_a" style="text-align:right">����*��</td>
                            <td class="tr_a" style="text-align:left"><input id="search_select" type="text" name="form[search_select]" value="<?{$data.search_select}?>" /> radio��ť������</td>
                        </tr>
                        <tr>
                            <td class="tr_a" style="text-align:right">�ӿڵ�ַ*��</td>
                            <td class="tr_a" style="text-align:left"><input id="action" type="text" name="form[action]" value="<?{$data.action}?>" /> ����actionֵ</td>
                        </tr>
                        <tr>
                            <td class="tr_a" style="text-align:right">�����ֶ���*��</td>
                            <td class="tr_a" style="text-align:left"><input id="name" type="text" name="form[name]" value="<?{$data.name}?>" /> ������name</td>
                        </tr>
                        <tr>
                            <td class="tr_a" style="text-align:right">LOGO���ӣ�</td>
                            <td class="tr_a" style="text-align:left"><input type="text" name="form[url]" value="<?{$data.url}?>" /> ������logoʱ��ת�ĵ�ַ</td>
                        </tr>
                        <tr>
                            <td class="tr_a" style="text-align:right">LOGOͼƬ*��</td>
                            <td class="tr_a" style="text-align:left"><input id="img_url" type="text" name="form[img_url]" value="<?{$data.img_url}?>" /> ���Ϊ105*35px����ʹ�þ���·��</td>
                        </tr>
                        <tr>
                            <td class="tr_a" style="text-align:right">LOGO������</td>
                            <td class="tr_a" style="text-align:left"><input type="text" name="form[img_text]" value="<?{$data.img_text}?>" /> ����LOGO��ͼƬalt����</td>
                        </tr>
                        <tr>
                            <td class="tr_a" style="text-align:right">��ť���֣�</td>
                            <td class="tr_a" style="text-align:left"><input type="text" name="form[btn]" value="<?{$data.btn}?>" /> ������ť�ϵ�����</td>
                        </tr>
                        <tr>
                            <td class="tr_a" style="text-align:right">����*��</td>
                            <td class="tr_a" style="text-align:left"><input id="sort" type="text" name="form[sort]" value="<?{$data.sort}?>" onkeyup="value=value.replace(/[^\d]/g,'')" /></td>
                        </tr>
                        <tr>
                            <td class="tr_a" style="vertical-align:top;text-align:right">���������</td>
                            <td valign="top">
                            	<table>
                                <tr>
                                	<td valign="top"><textarea style="height:120px;" name="form[params]"><?{$data.params}?></textarea> </td>
                                    <td valign="top">�����ص�input�������������䣬û�пɲ����:<br />
								<p style="color:red">
                                &lt;input type="hidden" name="tn" value="1" /&gt; <br />
								&lt;input type="hidden" name="ch" value="2" /&gt;
                                </p>����д:
                                <p style="color:red"> tn:1,ch:2</p>ע�⣺���������<font color=red>,</font>�ָ�����������ֵ��<font color=red>:</font>�ָ����������а���<font color=red>ð��</font>����<font color=red>%3A</font>�滻</td>
                                </tr>
                                </table>
                            </td>
                        </tr>
                        <tr><td class="tr_a" style="text-align:right"></td>
                            <td class="tr_a" style="text-align:left"><input type="submit" class="button" name="savebtn" value="�ύ" /></td>
                        </tr>
                    </table>
                </div>
                </form>
<?{else}?>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_list" style="border-bottom:none">
      <tr>
        <td height="35" align="right"><div style="float:left">ѡ�����:
		<select name="classid" onchange="changes(this)" style="width:70px;">
        <?{html_options options=$options selected=$classid}?>
        </select></div>
 <form action="?act=operate" method="post" onSubmit="if(confirm('ȷ��Ҫ������')){htmlnotice(1);htmlnotice(4);return true;}else{return false;}">
        <input type="button" class="button" value=" ����������� " onclick="location.href='adminSearch.php?act=update'"/><input type="submit" name="upsub" value=" �޸�Ĭ������ " class="button" style="width:auto;margin:2px;" />
         </td>
      </tr>
    </table>
  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_list" id="t" title="˫���༭">
    <tr >
      <td class="tr1" width="50">����</td>
      <td class="tr1" width="50">Ĭ��</td>
      <td class="tr1" width="50">��ʾ</td>
      <td class="tr1" width="50">����</td>
      <td class="tr1" width="50">����</td>
      <td class="tr1" width="430">�ӿڵ�ַ</td>
      <td class="tr1" width="50">�޸�</td>
      <td class="tr1" width="50">ɾ��</td>
    </tr>
<?{foreach from=$data item=v}?>
<tr ondblclick="location.href='?act=update&id=<?{$v.id}?>';">
<td class="tr_a"><input type="hidden" name="id[]" value="<?{$v.id}?>"/><input type="text" name="sort[<?{$v.id}?>]" value="<?{$v.sort}?>" style="width:30px"></td>
<td class="tr_a"><input type="radio" name="is_def" value="<?{$v.id}?>" <?{if $v.is_default ==1}?>checked<?{/if}?> style="width:auto; border:none"></td>
<td class="tr_a"><input type="checkbox" name="is_show[<?{$v.id}?>]" <?{if $v.is_show}?>checked<?{/if}?> style="width:auto; border:none"/></td>
<td class="tr_a"><?{$v.search_select}?></td>
<td class="tr_a"><?{$v.classname}?></td>
<td class="tr_a"><?{$v.action}?></td>
<td class="tr_a"><a href="?act=update&id=<?{$v.id}?>"><img src="images/ico_edit.gif" title="�޸�"></a></td>
<td class="tr_a"><a onclick="if(confirm('ȷ��Ҫɾ�����')){location.href='?act=delete&classid=<?{$v.class}?>&id=<?{$v.id}?>'}" href="javascript:;"><img src="images/ico_del.gif" title="ɾ��"></a></td>
</tr>
<?{/foreach}?>
    <tr >
      <td colspan="8" align="right"  class="ly_Rtd"  style="padding:6px 0;"><input type="button" class="button" value=" ����������� " onclick="location.href='adminSearch.php?act=update'"/><input type="submit" name="upsub" value=" �޸�Ĭ������ " class="button" style="width:auto;margin:2px;" /></td>
    </tr>
  </table>
</form>
<?{/if}?>
<div class="clear"></div>
  </div>
<?{include file="admin/footer.tpl"}?>
