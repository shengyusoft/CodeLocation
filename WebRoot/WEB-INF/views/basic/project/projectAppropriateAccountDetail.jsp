<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="projectAppropriateAccountEditForm" method="post">
			<table class="grid">

				<tr>
					<td colspan="4"><font
						style="font-weight: bold; color: rgba(128, 128, 128, 0.47);">（说明：以下工程部填写）</font></td>
				</tr>
				<tr>
					<th>业主本次拨付金额（元） &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input id="projectAppRegId" type="hidden"
						name="projectAppRegId"
						value="${projectAppropriateAccount.projectAppRegId}"></input> <input
						type="hidden" name="id" id="id"
						value="${projectAppropriateAccount.id}"></input> <input
						name="toAccountFee"
						value="${projectAppropriateAccount.toAccountFee}"
						style="width: 100%; height: 100%" type="text" id="toAccountFee"
						class="easyui-numberbox" readonly="readonly" /></td>
					<th>到帐时间 &nbsp;</th>
					<td><input class="Wdate" type="text" name="toAccountDT"
						value="${projectAppropriateAccount.toAccountDT}" id="toAccountDT"
						style="width: 98%; height: 100%;" readonly="readonly"
						onfocus="showDate('yyyy-MM-dd hh:mm:ss')" /></td>
				</tr>
				<tr>
					<th>本次计划支付金额 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input class="easyui-numberbox" type="text"
						name="applyFee" value="${projectAppropriateAccount.applyFee}"
						id="applyFee" style="width: 98%; height: 100%;"
						readonly="readonly" /></td>
					<th>业主本次拨付时间 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input class="Wdate" type="text" name="applyDT"
						value="${projectAppropriateAccount.applyDT}" id="applyDT"
						style="width: 98%; height: 100%;" readonly="readonly"
						onfocus="showDate('yyyy-MM-dd')" /></td>

				</tr>

				<tr>
					<th>备注1&nbsp;</th>
					<td colspan="5"><textarea style="width: 100%" rows="3"
							name="remark1">${projectAppropriateAccount.remark1}</textarea></td>
				</tr>

				<tr>
					<td colspan="4"><font
						style="font-weight: bold; color: rgba(128, 128, 128, 0.47);">（说明：以下会计填写）</font></td>
				</tr>

				<tr>
					<th>实际到帐金额（元）&nbsp;</th>
					<td><input name="actualFee"
						value="${projectAppropriateAccount.actualFee}"
						style="width: 100%; height: 100%" type="number" id="actualFee"
						class="easyui-validatebox span2" readonly="readonly" /></td>
					<th>实际到帐时间&nbsp;</th>
					<td><input class="Wdate" type="text" name="actualDT"
						value="${projectAppropriateAccount.actualDT}" id="actualDT"
						style="width: 98%; height: 100%;" readonly="readonly"
						onfocus="showDate('yyyy-MM-dd')" /></td>
				</tr>
				<tr>
					<th>实际支付金额（元）&nbsp;</th>
					<td><input name="actualPayFee"
						style="width: 100%; height: 100%" type="number" precision="2"
						id="actualPayFee" class="easyui-validatebox span2"
						readonly="readonly"
						value="${projectAppropriateAccount.actualPayFee}" /></td>
					<th>收款人 &nbsp;</th>
					<td><input name="payee"
						value="${projectAppropriateAccount.payee}"
						style="width: 100%; height: 100%" type="text" id="accountNum"
						class="easyui-validatebox span2" readonly="readonly" /></td>
				</tr>
				<tr>

					<th>开户行&nbsp;</th>
					<td><input name="bank"
						value="${projectAppropriateAccount.bank}"
						style="width: 100%; height: 100%" type="text" id="bank"
						class="easyui-validatebox span2" readonly="readonly" /></td>
					<th>帐号&nbsp;</th>
					<td><input name="accountNum"
						value="${projectAppropriateAccount.accountNum}"
						style="width: 100%; height: 100%" type="text" id="accountNum"
						class="easyui-validatebox span2" readonly="readonly" /></td>
				</tr>
				<tr>
					<th>备注2&nbsp;</th>
					<td colspan="5"><textarea style="width: 100%" rows="3"
							readonly="readonly" name="remark2">${projectAppropriateAccount.remark2}</textarea></td>
				</tr>
			</table>
		</form>
	</div>
</div>