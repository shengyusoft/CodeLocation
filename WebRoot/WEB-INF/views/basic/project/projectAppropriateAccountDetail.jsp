<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
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
					<th>到帐金额（元） &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input id="projectAppRegId" type="hidden"
						name="projectAppRegId"
						value="${projectAppropriateAccount.projectAppRegId}"></input> <input
						type="hidden" name="id" id="id"
						value="${projectAppropriateAccount.id}"></input> <input
						name="toAccountFee" value="${projectAppropriateAccount.toAccountFee}" style="width: 100%; height: 100%"
						type="number" id="toAccountFee" class="easyui-validatebox span2"
						data-options="required:true" /></td>
					<th>到帐时间 &nbsp;</th>
					<td><input name="toAccountDT"
						value="${projectAppropriateAccount.toAccountDT}"
						style="width: 100%; height: 100%" type="number" id="toAccountDT"
						readonly="readonly" class="easyui-validatebox span2" /></td>

				</tr>
				<tr>
					<th>申请拨付金额 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input class="easyui-validatebox span2" type="number"
						name="applyFee" value="${projectAppropriateAccount.applyFee}"
						id="applyFee" style="width: 98%; height: 100%;"
						data-options="required:true" /></td>
					<th>申请拨付时间 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input class="Wdate" type="text" name="applyDT"
						value="${projectAppropriateAccount.applyDT}" id="applyDT"
						style="width: 98%; height: 100%;" data-options="required:true"
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
					<th>实际拨付金额（元）&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="actualFee"
						value="${projectAppropriateAccount.actualFee}"
						style="width: 100%; height: 100%" type="number" id="actualFee"
						class="easyui-validatebox span2" data-options="required:true" /></td>
					<th>实际拨付时间&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input class="Wdate" type="text" name="actualDT"
						value="${projectAppropriateAccount.actualDT}" id="actualDT"
						style="width: 98%; height: 100%;" data-options="required:true"
						onfocus="showDate('yyyy-MM-dd')" /></td>
				</tr>
				<tr>
					<th>收款人 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="payee"
						value="${projectAppropriateAccount.payee}"
						style="width: 100%; height: 100%" type="text" id="accountNum"
						class="easyui-validatebox span2" data-options="required:true" /></td>
					<th>开户行&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="bank"
						value="${projectAppropriateAccount.bank}"
						style="width: 100%; height: 100%" type="text" id="bank"
						class="easyui-validatebox span2" data-options="required:true" /></td>

				</tr>
				<tr>
					<th>帐号&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="accountNum"
						value="${projectAppropriateAccount.accountNum}"
						style="width: 100%; height: 100%" type="text" id="accountNum"
						class="easyui-validatebox span2" data-options="required:true" /></td>
				</tr>

				<tr>
					<th>备注2&nbsp;</th>
					<td colspan="5"><textarea style="width: 100%" rows="3"
							name="remark2">${projectAppropriateAccount.remark2}</textarea></td>
				</tr>
			</table>
		</form>
	</div>
</div>