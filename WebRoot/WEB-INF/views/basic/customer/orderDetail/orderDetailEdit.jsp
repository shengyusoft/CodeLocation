<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		$('#orderDetailEditForm').form({
			url : '${pageContext.request.contextPath}/orderDetail/edit',
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
		<form id="orderDetailEditForm" method="post"
			style="width: 380px; height: 230px;">
			<table class="grid">
				<tr>
					<th width="60">品名</th>
					<td><input type="hidden" name="id" id="id"
						value="${orderDetail.id}"> <input type="hidden"
						name="torder.id" id="torder" value="${orderDetail.torder.id}">

						<input type="hidden" name="goods.id" id="order"
						value="${orderDetail.goods.id}"> <input name="name"
						style="width: 100%; height: 100%" type="text" id="name"
						class="easyui-validatebox span2" readonly="readonly"
						disabled="disabled" value="${orderDetail.goods.name}" /></td>
					<th width="60">报价&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label>
					<td><input name="salePrice" style="width: 100%; height: 100%" required="required"
						type="text" id="salePrice" class="easyui-validatebox" 
						value="${orderDetail.salePrice}" data-options="required:true,validType:'num'" />
					</td>
				</tr>
				<tr>
					<th>预定数量&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="scheduleNum" required="required"
						style="width: 100%; height: 100%" type="number" id="scheduleNum"
						class="easyui-numberbox"
						value="${orderDetail.scheduleNum}" data-options="required:true" /></td>

					<th>实收数量</th>
					<td><input name="acceptNum" type="number" id="acceptNum"
						style="width: 100%; height: 100%" class="easyui-numberbox"
						value="${orderDetail.acceptNum}" /></td>
				</tr>
				<tr>
					<th>备注&nbsp;</th>
					<td colspan="3"><input name="remark" style="width: 100%; height: 100%"
						type="text" id="remark" class="easyui-validatebox span2"
						value="${orderDetail.remark}" /></td>
				</tr>
			</table>
		</form>
	</div>
</div>