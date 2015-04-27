<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		$('#purchasePlanDetailEditForm').form({
			url : '${pageContext.request.contextPath}/purchasePlanDetail/edit',
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
		<form id="purchasePlanDetailEditForm" method="post"
			style="width: 380px; height: 230px;">
			<table class="grid">
				<tr>
					<th width="60">品名</th>
					<td><input type="hidden" name="id" id="id"
						value="${purchasePlanDetail.id}"> <input type="hidden"
						name="torder.id" id="torder"
						value="${purchasePlanDetail.purchasePlan.id}"> <input
						type="hidden" name="goods.id" id="order"
						value="${purchasePlanDetail.goods.id}"> <input name="name"
						style="width: 100%; height: 100%" type="text" id="name"
						class="easyui-validatebox span2" readonly="readonly"
						disabled="disabled" value="${purchasePlanDetail.goods.name}" /></td>
					<th width="60">采购价</th>
					<td><input name="salePrice" style="width: 100%; height: 100%"
						disabled="disabled" readonly="readonly" type="text" id="salePrice"
						class="easyui-validatebox"
						value="${purchasePlanDetail.goods.price}"
						data-options="validType:'num'" /></td>
				</tr>
				<tr>
					<th>计划数量</th>
					<td colspan="3"><input name="scheduleNum"
						style="width: 100%; height: 100%" type="text" id="scheduleNum"
						class="easyui-numberbox"
						data-options="required:true,validType:'num'"
						value="${purchasePlanDetail.scheduleNum}" /></td>
				</tr>
				<tr>
					<th>备注&nbsp;</th>
					<td colspan="3"><input name="remark"
						style="width: 100%; height: 100%" type="text" id="remark"
						class="easyui-validatebox span2"
						value="${purchasePlanDetail.remark}" /></td>
				</tr>
			</table>
		</form>
	</div>
</div>