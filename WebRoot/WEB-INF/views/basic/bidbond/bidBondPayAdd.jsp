<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		$('#bidBondPayAddForm').form({
			url : '${pageContext.request.contextPath}/bidBond/add',
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
		<form id="bidBondPayAddForm" method="post"
			style="width: 800px; height: 330px;">
			<table class="grid">
				<tr>
					<th>项目名称 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="3">
					<input name="type" type="hidden" value="0"></input>
					<input name="projectName"
						style="width: 100%; height: 100%" type="text" id="projectName"
						class="easyui-validatebox span2" data-options="required:true" /></td>
					<th>标段 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="bidSection" style="width: 100%; height: 100%"
						type="text" id="bidSection" class="easyui-validatebox span2"
						data-options="required:true" /></td>
				</tr>
				<tr>
					<th>保证金数额 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="5"><input name="bondFee"
						style="width: 100%; height: 100%" type="number" id="bondFee"
						class="easyui-numberbox" data-options="required:true" /></td>
				</tr>
				<tr>
					<th rowspan="5">收 款 人<br />详细信息 &nbsp;
					</th>
					<th>户 名&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="4"><input name="payeeAccountName" type="text"
						id="payeeAccountName" style="width: 100%; height: 100%"
						class="easyui-validatebox span2" data-options="required:true" /></td>
				</tr>
				<tr>
					<th>开户行&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="4"><input name="payeeBank" type="text"
						id="payeeBank" style="width: 100%; height: 100%"
						class="easyui-validatebox span2" data-options="required:true" /></td>
				</tr>
				<tr>
					<th>帐 号&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="4"><input name="payeeAccountNum" type="text"
						id="payeeAccountNum" style="width: 100%; height: 100%"
						class="easyui-numberbox" data-options="required:true" /></td>
				</tr>
				<tr>
					<th>附 言</th>
					<td colspan="4"><input name="payeeComments" type="text"
						id="payeeComments" style="width: 100%; height: 100%"
						class="easyui-validatebox span2" /></td>
				</tr>
				<tr>
					<th>办理时间&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="4"><input name="payeeHandleDT" type="text"
						id="payeeHandleDT" class="easyui-datebox"
						data-options="required:true" /></td>
				</tr>

				<tr>
					<th>付款人&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="2"><input name="payer" type="text" id="payer"
						style="width: 100%; height: 100%" class="easyui-validatebox span2"
						data-options="required:true" /></td>
					<th colspan="2">联系方式&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="payerPhone" type="text" id="payerPhone"
						style="width: 100%; height: 100%" class="easyui-validatebox span2"
						data-options="required:true" /></td>
				</tr>
				<tr>
					<th>到帐金额</th>
					<td colspan="5"><input name="toAccountFee" type="text"
						id="toAccountFee" style="width: 100%; height: 100%"
						class="easyui-numberbox" data-options="required:true" /></td>
				</tr>
				<tr>
					<th>到帐时间</th>
					<td colspan="5"><input name="toAccountDT" type="text"
						id="toAccountDT" class="easyui-datebox"
						data-options="required:true" /></td>
				</tr>
				<tr>
					<th>转出金额</th>
					<td colspan="5"><input name="outAccountFee" type="number"
						id="outAccountFee" style="width: 100%; height: 100%"
						class="easyui-numberbox" data-options="required:true" /></td>
				</tr>
				<tr>
					<th>转出时间</th>
					<td colspan="5"><input name="outAccountDT" type="text"
						id="outAccountDT" class="easyui-datebox"
						data-options="required:true" /></td>
				</tr>
			</table>
		</form>
	</div>
</div>