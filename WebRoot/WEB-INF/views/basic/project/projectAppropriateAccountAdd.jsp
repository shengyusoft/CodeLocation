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
									var dg = parent.$.modalDialogTwo.openner_dataGrid;
									var projectAppRegId = $('#projectAppRegId')
											.val();
									var queryParams = dg.datagrid('options').queryParams;
									queryParams.projectAppRegId = projectAppRegId;
									dg.datagrid('reload');
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
					<td colspan="4"><font
						style="font-weight: bold; color: rgba(128, 128, 128, 0.47);">（说明：以下工程部填写）</font></td>
				</tr>
				<tr>
					<th>到帐金额（元） &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input id="projectAppRegId" type="hidden"
						name="projectAppRegId"></input> <input name="toAccountFee"
						style="width: 100%; height: 100%" type="number" id="toAccountFee"
						class="easyui-validatebox span2" data-options="required:true" /></td>
					<th>到帐时间 &nbsp;</th>
					<td><input name="toAccountDT" value="自动生成"
						style="width: 100%; height: 100%" type="number" id="toAccountDT"
						readonly="readonly" disabled="disabled" class="easyui-validatebox span2" /></td>

				</tr>
				<tr>
					<th>申请拨付金额 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input class="easyui-validatebox span2" type="number"
						name="applyFee" id="applyFee" style="width: 98%; height: 100%;"
						data-options="required:true" /></td>
					<th>申请拨付时间 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input class="Wdate" type="text" name="applyDT"
						id="applyDT" style="width: 98%; height: 100%;"
						data-options="required:true" onfocus="showDate('yyyy-MM-dd')" /></td>

				</tr>
				<tr>
					<th>备注1&nbsp;</th>
					<td colspan="5"><textarea style="width: 100%" rows="3"
							name="remark1"></textarea></td>
				</tr>
				<tr>
					<td colspan="4"><font
						style="font-weight: bold; color: rgba(128, 128, 128, 0.47);">（说明：以下会计填写）</font></td>
				</tr>
				<tr>
					<th>实际拨付金额（元）&nbsp;</th>
					<td><input name="actualFee" style="width: 100%; height: 100%"
						type="number" id="actualFee" class="easyui-validatebox span2"
						readonly="readonly" /></td>
					<th>实际拨付时间&nbsp;</th>
					<td><input class="Wdate" type="text" name="actualDT"
						id="actualDT" style="width: 98%; height: 100%;"
						readonly="readonly" onfocus="showDate('yyyy-MM-dd')" /></td>
				</tr>
				<tr>
					<th>收款人 &nbsp;</th>
					<td><input name="payee" style="width: 100%; height: 100%"
						type="text" id="accountNum" class="easyui-validatebox span2"
						readonly="readonly" /></td>
					<th>开户行&nbsp;</th>
					<td><input name="bank" style="width: 100%; height: 100%"
						type="text" id="bank" class="easyui-validatebox span2"
						readonly="readonly" /></td>

				</tr>
				<tr>
					<th>帐号&nbsp;</th>
					<td><input name="accountNum" style="width: 100%; height: 100%"
						type="text" id="accountNum" class="easyui-validatebox span2"
						readonly="readonly" /></td>
				</tr>
				<tr>
					<th>备注2&nbsp;</th>
					<td colspan="5"><textarea style="width: 100%" rows="3"
							readonly="readonly" name="remark2"></textarea></td>
				</tr>
			</table>
		</form>
	</div>
</div>