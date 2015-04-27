<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		$('#banlanceEditForm').form({
			url : '${pageContext.request.contextPath}/task/banlanceEdit',
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

	//初始化状态值
	var chargeState = '${task.chargeState}';
	$('#chargeState').val(chargeState);

	var invoiceState = '${task.invoiceState}';
	$('#invoiceState').val(invoiceState);
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="banlanceEditForm" method="post"
			style="width: auto; height: auto;">
			<table class="grid">
				<tr>
					<th width="20%">任务名称</th>
					<td><input name="name" value="${task.name}"
						style="width: 98%; height: 98%" type="text" id="name"
						class="easyui-validatebox span2" data-options="required:true" />
						<input type="hidden" name="id" id="id" value="${task.id}" /></td>


				</tr>

				<tr>
					<th>任务执行日期&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input class="Wdate" type="text" name="excuteDT"
						value="${task.excuteDT}" id="excuteDT"
						style="width: 45%; height: 98%" onfocus="showDate('yyyy-MM-dd')" /></td>
				</tr>

				<tr>
					<th>发票状态</th>
					<td><select id="invoiceState" class="easyui-combobox"
						name="invoiceState" style="width: 100px;" panelHeight="auto">
							<option value="0">未开发票</option>
							<option value="1">已开发票</option>
					</select></td>
				</tr>

				<tr>
					<th>收费状态</th>
					<td><select id="chargeState" class="easyui-combobox"
						name="chargeState" style="width: 100px;" panelHeight="auto">
							<option value="0">未收费</option>
							<option value="1">已收费</option>
					</select></td>
				</tr>
			</table>
		</form>
	</div>
</div>