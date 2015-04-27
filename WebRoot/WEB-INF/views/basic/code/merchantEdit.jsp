<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		$('#merchantAddForm').form({
			url : '${pageContext.request.contextPath}/merchant/edit',
			onSubmit : function() {
				progressLoad();
				var isValid = $(this).form('validate');
				if (!isValid) {
					progressClose();
				}
				return isValid;
			},
			success : function(result) {
				progressClose();
				result = $.parseJSON(result);
				if (result.success) {
					//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
					parent.$.modalDialog.openner_dataGrid.datagrid('reload');
					parent.$.modalDialog.handler.dialog('close');
				} else {
					parent.$.messager.alert('错误', result.msg, 'error');
				}
			}
		});
	});
	
	$('#dictionaryId').combobox({
	    url : "${pageContext.request.contextPath}/dictionary/combox?code=fwstype",
		parentField : 'dictionaryId',
	    valueField : 'id',
	    value : '${merchant.dictionaryId}',
	    textField : 'text',
	    panelHeight : 'auto'
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="merchantAddForm" method="post">
			<table class="grid" border="1">
				<tr>
					<td colspan="4"><font color="#6394C6">基本信息</font></td>
				</tr>
				<tr>
					<td>服务商名称 
					<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</td>
					<td colspan="3">
						<input type="hidden" name="id" value="${merchant.id}"/>
						<input name="name" type="text" data-options="required:true" 
							value ='${merchant.name}'
							class="easyui-validatebox span2" id="name" style="width: 520px;" />
					</td>
				</tr>
				<tr>
					<td>服务商类型 
						<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</td>
					<td>
						<select id="dictionaryId" name="dictionaryId"  data-options="required:true"
							class="easyui-validatebox span2" style="width: 205px; ">
						</select>
					</td>
					<td>服务商编码 :
						<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</td>
					<td width="272"><input name="code" type="text"  data-options="required:true"
						value ='${merchant.code}'
						style="width: 205px;" id="code" class="easyui-validatebox span2" /></td>
				</tr>
				<tr>
					<td colspan="4"><font color="#6394C6">账号信息</font></td>
				</tr>
				<tr>
					<td>开户行 :
						<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</td>
					<td colspan="3"><input name="bank" type="text"  data-options="required:true"
						value ='${merchant.bank}'
						class="easyui-validatebox span2" id="bank" style="width: 520px;" /></td>
				</tr>
				<tr>
					<td>账号: 
						<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</td>
					<td>
						<input name="account" type="number"  data-options="required:true"
							value ='${merchant.account}'
							style="width: 205px;" id="account" class="easyui-validatebox span2" />
					</td>
					<td>税号: <label style="color: red; vertical-align: middle; text-align: center;">*</label></td>
					<td><input name="tax" type="text"  data-options="required:true"
						value ='${merchant.tax}'
						style="width: 205px;" id="tax" class="easyui-validatebox span2" /></td>
				</tr>
				<tr>
					<td colspan="4"><font color="#6394C6">联系信息</font></td>
				</tr>
				<tr>
					<td>服务商地址</td>
					<td colspan="3"><input name="address" type="text"
						class="easyui-validatebox span2" id="address"
						value ='${merchant.address}'
						style="width: 520px;" /></td>
				</tr>
				<tr>
					<td>服务商网址 <label
						style="color: red; vertical-align: middle; text-align: center;"></label></td>
					<td colspan="3">
					<input name="website" type="text"
						value ='${merchant.website}'
						class="easyui-validatebox span2" id="website"
						style="width: 520px;" /></td>
				</tr>
				<tr>
					<td>邮编</td>
					<td>
					<input name="postCode" type="text"
						value ='${merchant.postCode}'
						style="width: 205px;" id="postCode"
						class="easyui-validatebox span2" /></td>
					<td>电子邮件 <label style="color: red; vertical-align: middle; text-align: center;">*</label></td>
					<td>
					<input name="email" type="text"  data-options="required:true"
						value ='${merchant.email}'
						style="width: 205px;" id="email"
						class="easyui-validatebox span2" /></td>
				</tr>
				<tr>
					<td>联系人</td>
					<td><input name="contact" type="text"
						style="width: 205px;" id="contact"
						value ='${merchant.contact}'
						class="easyui-validatebox span2" /></td>
					<td>手机号码</td>
					<td><input name="mobilePhone" type="text"
						style="width: 205px;" id="mobilePhone"
						value ='${merchant.mobilePhone}'
						class="easyui-validatebox span2" /></td>
				</tr>
				<tr>
					<td>办公电话</td>
					<td><input name="officeNumber" type="text"
						style="width: 205px;" id="officeNumber"
						value ='${merchant.officeNumber}'
						class="easyui-validatebox span2" /></td>
					<td>传真号码</td>
					<td><input name="faxNumber" type="text"
						style="width: 205px;" id="faxNumber"
						value ='${merchant.faxNumber}'
						class="easyui-validatebox span2" /></td>
				</tr>
				<tr>
					<td>备注</td>
					<td colspan="3"><textarea name="remark" cols="" rows="4"
							style="width: 520px;">${merchant.remark}</textarea></td>
				</tr>
			</table>
		</form>
	</div>
</div>