<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style type="text/css">
.grid td {
	padding: 3px;
	line-height: 15px;
}

.grid th {
	padding: 3px;
	line-height: 15px;
}
</style>
<script type="text/javascript">
	$(function() {
		$('#projectAppropriateAccountViewForm')
				.form(
						{
							url : '${pageContext.request.contextPath}/projectAppropriateAccount/save?viewType=${viewType}',
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
									var dg = parent.$.modalDialogTwo.openner_dataGrid;
									if ('add' == '${viewType}') {
										var projectAppRegId = $(
												'#projectAppRegId').val();
										var queryParams = dg
												.datagrid('options').queryParams;
										queryParams.projectAppRegId = projectAppRegId;
									}
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
		<form id="projectAppropriateAccountViewForm" method="post">
			<table class="grid">

				<tr>
					<td colspan="6"><font style="font-weight: bold; color: blue;">（说明：以下工程部填写）</font></td>
				</tr>
				<tr>
					<th>业主本次拨付金额（元） &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input id="projectAppRegId" type="hidden"
						name="projectAppRegId"
						value="${projectAppropriateAccount.projectAppRegId}" /> <input
						id="applierId" type="hidden" name="applierId"
						value="${projectAppropriateAccount.applierId}" /> <input
						type="hidden" name="option" id="option" value="0" /> <input
						type="hidden" name="handlerId1" id="handlerId1"
						value="${projectAppropriateAccount.handlerId1}" /> <input
						type="hidden" name="handlerId2" id="handlerId2"
						value="${projectAppropriateAccount.handlerId2}" /> <input
						type="hidden" name="id" id="id"
						value="${projectAppropriateAccount.id}" /> <input
						name="toAccountFee"
						value="${projectAppropriateAccount.toAccountFee}"
						style="width: 100%; height: 100%" type="text" precision="2"
						id="toAccountFee" class="easyui-numberbox"
						data-options="required:true" /></td>
					<th>本次计划支付金额（元） &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input class="easyui-numberbox" type="text" precision="2"
						name="applyFee" value="${projectAppropriateAccount.applyFee}"
						id="applyFee" style="width: 98%; height: 100%;"
						data-options="required:true" /></td>
					<th>收款人 &nbsp;</th>
					<td><input name="payee"
						value="${projectAppropriateAccount.payee}"
						style="width: 100%; height: 100%" type="text" id="accountNum"
						class="easyui-validatebox span2" data-options="required:true" /></td>
				</tr>
				<tr>
					<th>开户行&nbsp;</th>
					<td><input name="bank"
						value="${projectAppropriateAccount.bank}"
						style="width: 100%; height: 100%" type="text" id="bank"
						class="easyui-validatebox span2" data-options="required:true" /></td>
					<th>帐号&nbsp;</th>
					<td colspan="3"><input name="accountNum"
						value="${projectAppropriateAccount.accountNum}"
						style="width: 100%; height: 100%" type="text" id="accountNum"
						class="easyui-validatebox span2" data-options="required:true" /></td>
				</tr>
				<tr>
					<th>工程部备注&nbsp;</th>
					<td colspan="6"><textarea style="width: 100%" rows="2"
							name="remark1">${projectAppropriateAccount.remark1}</textarea></td>
				</tr>

				<tr>
					<td colspan="6"><font style="font-weight: bold; color: blue;">（说明：以下会计填写）</font></td>
				</tr>
				<c:choose>
					<c:when test="${viewType == 'handler_kj'}">
						<tr>
							<th>实际到帐金额（元）&nbsp;</th>
							<td><input name="actualFee"
								value="${projectAppropriateAccount.actualFee}"
								style="width: 100%; height: 100%" type="number" id="actualFee"
								class="easyui-validatebox span2" required="required" /></td>
							<th>实际到帐时间&nbsp;</th>
							<td colspan="3"><input class="Wdate" type="text"
								name="actualDT"
								value="<fmt:formatDate value="${projectAppropriateAccount.actualDT}" pattern="yyyy-MM-dd HH:mm:ss"/>"
								id="actualDT" style="width: 98%; height: 100%;"
								required="required" onfocus="showDate('yyyy-MM-dd HH:mm:ss')" /></td>
						<tr>
							<th>会计备注&nbsp;</th>
							<td colspan="6"><textarea style="width: 100%" rows="2"
									name="remark2">${projectAppropriateAccount.remark2}</textarea></td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<th>实际到帐金额（元）&nbsp;</th>
							<td><input name="actualFee"
								value="${projectAppropriateAccount.actualFee}"
								style="width: 100%; height: 100%" type="number" id="actualFee"
								class="easyui-validatebox span2 disabled" readonly="readonly" /></td>
							<th>实际到帐时间&nbsp;</th>
							<td colspan="3"><input class="Wdate disabled" type="text"
								name="actualDT" id="actualDT" style="width: 98%; height: 100%;"
								readonly="readonly"
								value="<fmt:formatDate value="${projectAppropriateAccount.actualDT}" pattern="yyyy-MM-dd HH:mm:ss"/>" /></td>
						<tr>
							<th>会计备注&nbsp;</th>
							<td colspan="6"><textarea style="width: 100%" rows="2"
									readonly="readonly" class="disabled" name="remark2">${projectAppropriateAccount.remark2}</textarea></td>
						</tr>
					</c:otherwise>
				</c:choose>

				<tr>
					<td colspan="6"><font style="font-weight: bold; color: blue;">（说明：以下出纳填写）</font></td>
				</tr>
				<c:choose>
					<c:when test="${viewType == 'handler_cn'}">
						<tr>
							<th>本次拨出金额（元）&nbsp;</th>
							<td><input name="actualPayFee"
								style="width: 100%; height: 100%" type="number" precision="2"
								id="actualPayFee" class="easyui-validatebox span2"
								required="required"
								value="${projectAppropriateAccount.actualPayFee}" /></td>
							<th>拨出时间&nbsp;</th>
							<td colspan="3"><input class="Wdate" type="text"
								name="actualDT"
								value="<fmt:formatDate value="${projectAppropriateAccount.actualDT}" pattern="yyyy-MM-dd HH:mm:ss"/>"
								id="actualDT" style="width: 98%; height: 100%;"
								required="required" onfocus="showDate('yyyy-MM-dd HH:mm:ss')" /></td>
						</tr>
						<tr>
							<th>出纳备注&nbsp;</th>
							<td colspan="6"><textarea style="width: 100%" rows="2"
									name="remark3">${projectAppropriateAccount.remark3}</textarea></td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<th>本次拨出金额（元）&nbsp;</th>
							<td><input name="actualPayFee"
								style="width: 100%; height: 100%" type="number" precision="2"
								id="actualPayFee" class="easyui-validatebox span2 disabled"
								readonly="readonly"
								value="${projectAppropriateAccount.actualPayFee}" /></td>
							<th>拨出时间&nbsp;</th>
							<td colspan="3"><input class="Wdate disabled" type="text"
								name="actualDT"
								value="<fmt:formatDate value="${projectAppropriateAccount.actualDT}" 
								pattern="yyyy-MM-dd HH:mm:ss"/>"
								id="actualDT" style="width: 98%; height: 100%;"
								readonly="readonly" /></td>
						</tr>
						<tr>
							<th>出纳备注&nbsp;</th>
							<td colspan="6"><textarea class="disabled"
									style="width: 100%" rows="2" readonly="readonly" name="remark3">${projectAppropriateAccount.remark3}</textarea></td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
		</form>
	</div>
</div>