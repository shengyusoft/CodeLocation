<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		$('#quotationDetailEditForm').form({
			url : '${pageContext.request.contextPath}/quotationDetail/edit',
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
		<form id="quotationDetailEditForm" method="post"
			style="width: 380px; height: 230px;">
			<table class="grid">
				<tr>
					<th>品名</th>
					<td><input type="hidden" name="id" id="id"
						value="${quotationDetail.id}"> 
						<input type="hidden" name="quotation.id" id="quotation"
						value="${quotationDetail.quotation.id}">
						
						<input type="hidden" name="goods.id" id="quotation"
						value="${quotationDetail.goods.id}">
						
						<input name="name"
						style="width: 100%; height: 100%" type="text" id="name"
						class="easyui-validatebox span2" readonly="readonly"
						disabled="disabled" value="${quotationDetail.goods.name}" /></td>
					<th>单位</th>
					<td><input name="unit" style="width: 100%; height: 100%"
						type="text" id="unit" class="easyui-validatebox span2"
						readonly="readonly" disabled="disabled"
						value="${quotationDetail.goods.unit}" /></td>
				</tr>
				<tr>
					<th>定价&nbsp;</th>
					<td><input name="standard" style="width: 100%; height: 100%"
						type="text" id="standard" class="easyui-validatebox span2"
						readonly="readonly" disabled="disabled"
						value="${quotationDetail.goods.orderPrice1}" /></td>

					<th>报价&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="salePrice" type="text" id="salePrice"
						data-options="required:true" style="width: 100%; height: 100%"
						class="easyui-validatebox span2" data-options="required:true"
						value="${quotationDetail.salePrice}" /></td>
				</tr>
			</table>
		</form>
	</div>
</div>