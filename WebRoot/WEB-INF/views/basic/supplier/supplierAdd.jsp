<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		$('#supplierAddForm').form({
			url : '${pageContext.request.contextPath}/supplier/add',
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
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="supplierAddForm" method="post"
			style="width: 800px; height: 330px;">
			<table class="grid">
				<tr>
					<th>供应商名称 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="name" style="width: 100%; height: 100%"
						type="text" id="name" class="easyui-validatebox span2"
						data-options="required:true" /></td>
					<th>供应商编码 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="code" style="width: 100%; height: 100%"
						type="text" id="code" class="easyui-validatebox span2" /></td>
				</tr>
				<tr>
					<th>地址&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="place" type="text" id="place"
						style="width: 100%; height: 100%" class="easyui-validatebox span2"
						data-options="required:true" /></td>
					<th>传真 &nbsp;</th>
					<td><input name="fax" style="width: 100%; height: 100%"
						type="text" id="fax" class="easyui-validatebox span2"
						data-options="required:true" /></td>
				</tr>

				<tr>
					<th>邮政编码&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="zip" type="text" id="zip"
						style="width: 100%; height: 100%" class="easyui-validatebox span2" /></td>
					<th>邮件地址 &nbsp;</th>
					<td><input name="email" style="width: 100%; height: 100%"
						type="text" id="email" class="easyui-validatebox span2" /></td>
				</tr>
				<tr>
					<th>联络人&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="contactPerson" type="text" id="contactPerson"
						style="width: 100%; height: 100%" class="easyui-validatebox span2"/></td>
					<th>联络电话 &nbsp;</th>
					<td><input name="phone" style="width: 100%; height: 100%"
						type="text" id="phone" class="easyui-validatebox span2" /></td>
				</tr>
				<tr>
					<th>简介&nbsp;</th>
					<td colspan="3"><textarea style="width: 100%" rows="5"
							name="remark"></textarea></td>
				</tr>
			</table>
		</form>
	</div>
</div>