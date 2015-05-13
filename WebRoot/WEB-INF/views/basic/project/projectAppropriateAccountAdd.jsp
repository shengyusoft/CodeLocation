<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		$('#projectAppropriateAccountAddForm')
				.form(
						{
							url : '${pageContext.request.contextPath}/projectAppropriateAccount/add',
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
									parent.$.modalDialogTwo.openner_dataGrid
											.datagrid('reload');
									parent.$.modalDialogTwo.handler
											.dialog('close');
								} else {
									parent.$.messager.alert('错误', result.msg,
											'error');
								}
							}
						});
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="projectAppropriateAccountAddForm" method="post">
			<table class="grid">
				<tr>
					<th>到帐金额（元） &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td>
					<input id="projectAppRegId" type="hidden" name="projectAppRegId"></input>
					<input name="toAccountFee"
						style="width: 100%; height: 100%" type="number" id="toAccountFee"
						class="easyui-validatebox span2" data-options="required:true" /></td>
					<th>到帐时间 &nbsp;</th>
					<td><input name="toAccountDT"
						style="width: 100%; height: 100%" type="number" id="toAccountDT"
						readonly="readonly" class="easyui-validatebox span2" /></td>
					<th>申请拨付金额 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input class="easyui-validatebox span2" type="number"
						name="applyFee" id="applyFee" style="width: 98%; height: 100%;"
						data-options="required:true" /></td>
				</tr>
				<tr>
					<th>申请拨付时间 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input class="Wdate" type="text" name="applyDT"
						id="applyDT" style="width: 98%; height: 100%;"
						data-options="required:true" onfocus="showDate('yyyy-MM-dd')" /></td>
					<th>实际拨付金额（元）&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="actualFee"
						style="width: 100%; height: 100%" type="number"
						id="actualFee" class="easyui-validatebox span2"
						data-options="required:true" /></td>
					<th>实际拨付时间&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input class="Wdate" type="text" name="actualDT"
						id="actualDT" style="width: 98%; height: 100%;"
						data-options="required:true" onfocus="showDate('yyyy-MM-dd')" /></td>
				</tr>
				<tr>
					<th>收款人 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="payee" style="width: 100%; height: 100%"
						type="text" id="accountNum" class="easyui-validatebox span2"
						data-options="required:true" /></td>
					<th>开户行&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="bank" style="width: 100%; height: 100%"
						type="text" id="bank" class="easyui-validatebox span2"
						data-options="required:true" /></td>
					<th>帐号&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="accountNum" style="width: 100%; height: 100%"
						type="text" id="accountNum" class="easyui-validatebox span2"
						data-options="required:true" /></td>
				</tr>
				<tr>
					<th>备注1&nbsp;</th>
					<td colspan="5"><textarea style="width: 100%" rows="3"
							name="remark"></textarea></td>
				</tr>
				<tr>
					<th>备注2&nbsp;</th>
					<td colspan="5"><textarea style="width: 100%" rows="3"
							name="remark"></textarea></td>
				</tr>
			</table>
		</form>
	</div>
</div>