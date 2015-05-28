<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	//标段
	$('#bidSection').combobox({
		url : "${pageContext.request.contextPath}/dictionary/combox?code=bd",
		parentField : 'dictionaryId',
		valueField : 'id',
		multiple:true,
		textField : 'text',
		panelHeight : 'auto'				
	});
	
	var selectedBds=[];
	var bss = '${bidBond.bidSection}';
	selectedBds = bss.split(',');
	$('#bidSection').combobox('setValues',selectedBds); 
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="bidBondPayEditForm" method="post"
			style="width: 800px; height: 330px;">
			<table class="grid">
				<tr>
					<th width="100px">项目名称 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="5"><input name="type" type="hidden"
						value="${bidBond.type}"></input> <input name="idNumber"
						type="hidden" value="${bidBond.idNumber}"></input> <input
						name="applierId" type="hidden" value="${bidBond.applierId}"></input>
						<input name="id" type="hidden" value="${bidBond.id}"></input> <input
						name="handlerId" type="hidden" value="${bidBond.handlerId}"></input>
						<input name="projectName" value="${bidBond.projectName}"
						style="width: 100%; height: 100%" type="text" id="projectName"
						class="easyui-validatebox span2" data-options="required:true" /></td>
				</tr>

				<tr>
					<th>标段 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="5"><select id="bidSection" name="bidSection"
						class="easyui-validatebox span2" style="width: 550px;"
						data-options="editable:false,required:true">
					</select></td>
				</tr>
				<tr>
					<th>保证金数额 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="5"><input name="bondFee"
						value="${bidBond.bondFee}" style="width: 100%;"
						type="number" id="bondFee" class="easyui-numberbox" precision="2"
						data-options="required:true" /></td>
				</tr>
				<tr>
					<th rowspan="5">收 款 人<br />详细信息 &nbsp;
					</th>
					<th>户 名&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="4"><input name="payeeAccountName"
						value="${bidBond.payeeAccountName}" type="text"
						id="payeeAccountName" style="width: 100%; height: 100%"
						class="easyui-validatebox span2" data-options="required:true" /></td>
				</tr>
				<tr>
					<th>开户行&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="4"><input name="payeeBank"
						value="${bidBond.payeeBank}" type="text" id="payeeBank"
						style="width: 100%; height: 100%" class="easyui-validatebox span2"
						data-options="required:true" /></td>
				</tr>
				<tr>
					<th>帐 号&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="4"><input name="payeeAccountNum"
						value="${bidBond.payeeAccountNum}" type="text"
						id="payeeAccountNum" style="width: 100%; height: 100%"
						class="easyui-validatebox span2" data-options="required:true" /></td>
				</tr>
				<tr>
					<th>附 言</th>
					<td colspan="4"><input name="payeeComments"
						value="${bidBond.payeeComments}" type="text" id="payeeComments"
						style="width: 100%; height: 100%" class="easyui-validatebox span2" /></td>
				</tr>
				<tr>
					<th>办理时间&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="4"><input name="payeeHandleDT"
						value="${bidBond.payeeHandleDT}" type="text" id="payeeHandleDT"
						class="easyui-datebox" data-options="required:true" /></td>
				</tr>

				<tr>
					<th>客户姓名&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="customerName" value="${bidBond.customerName}" type="text" id="customerName"
						style="width: 100%; height: 100%" class="easyui-validatebox span2"
						data-options="required:true" /></td>
					<th>客户联系方式&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="payerPhone" value="${bidBond.payerPhone}"
						type="text" id="payerPhone" style="width: 100%; height: 100%"
						class="easyui-validatebox span2" data-options="required:true" /></td>
					<th width="100px">转款人姓名&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="payer" value="${bidBond.payer}"
						type="text" id="payer" style="width: 100%; height: 100%"
						class="easyui-validatebox span2" data-options="required:true" /></td>
					
				</tr>

				<tr>
					<th>申请人&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="applierName" value="${bidBond.applierName}"
						type="text" id="applierName" style="width: 100%; height: 100%"
						class="easyui-validatebox span2" readonly="readonly"
						disabled="disabled" /></td>
					<td colspan="2"><input name="applierPhone" value="${bidBond.applierPhone}"
						type="text" id="applierPhone" style="width: 100%; height: 100%"
						class="easyui-validatebox span2" readonly="readonly"
						disabled="disabled" /></td>
					<th>申请时间&nbsp;</th>
					<td><input name="applyDT" value="${bidBond.applyDT}"
						type="text" id="applyDT" style="width: 100%; height: 100%"
						class="easyui-validatebox span2" readonly="readonly"
						disabled="disabled" /></td>
				</tr>

				<tr>
					<th colspan="6"><font color="blue" size="10px">（说明：以下财务填写）</font></th>
				</tr>

				<tr>
					<th>到帐金额</th>
					<td colspan="5"><input name="toAccountFee"
						value="${bidBond.toAccountFee}" type="text" id="toAccountFee"
						style="width: 100%; height: 100%" class="easyui-numberbox"
						readonly="readonly" disabled="disabled" /></td>
				</tr>
				<tr>
					<th>到帐时间</th>
					<td colspan="5"><input name="toAccountDT"
						value="${bidBond.toAccountDT}" type="text" id="toAccountDT"
						class="easyui-datebox" readonly="readonly" disabled="disabled" /></td>
				</tr>
				<tr>
					<th>转出金额</th>
					<td colspan="5"><input name="outAccountFee"
						value="${bidBond.outAccountFee}" type="number" id="outAccountFee"
						style="width: 90%; height: 100%" class="easyui-numberbox"
						readonly="readonly" disabled="disabled" /></td>
				</tr>
				<tr>
					<th>转出时间</th>
					<td colspan="5"><input name="outAccountDT"
						value="${bidBond.outAccountDT}" type="text" id="outAccountDT"
						class="easyui-datebox" readonly="readonly" disabled="disabled" /></td>
				</tr>
				<tr>
					<th>办理人</th>
					<td><input name="handlerName" value="${bidBond.handlerName}"
						type="text" id="handlerName" class="easyui-datebox"
						readonly="readonly" disabled="disabled" /></td>
					<th>办理时间</th>
					<td colspan="3"><input name="handlerDT"
						value="${bidBond.handlerDT}" type="text" id="handlerDT"
						class="easyui-datebox" readonly="readonly" disabled="disabled" /></td>
				</tr>
			</table>
		</form>
	</div>
</div>