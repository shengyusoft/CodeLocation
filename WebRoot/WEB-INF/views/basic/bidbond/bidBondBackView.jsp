<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style type="text/css">
.grid td {
	padding: 3px;
	line-height: 4px;
	font-size: 10px;
}

.grid th {
	padding: 3px;
	line-height: 4px;
	font-size: 10px;
}

input {
	height: 100%;
	font-size: 10px;
	line-height: 4px;
}
</style>
<script type="text/javascript">
	$(function() {
		$('#bidBondBackViewForm')
				.form(
						{
							url : '${pageContext.request.contextPath}/bidBond/save?viewType=${viewType}',
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
									parent.$.modalDialog.openner_dataGrid
											.datagrid('reload');
									parent.$.modalDialog.handler
											.dialog('close');
								} else {
									parent.$.messager.alert('错误', result.msg,
											'error');
								}
							}
						});
	});

	//标段多选
	$('#bidSection').combobox({
		url : "${pageContext.request.contextPath}/dictionary/combox?code=bd",
		parentField : 'dictionaryId',
		valueField : 'id',
		multiple : true,
		textField : 'text',
		panelHeight : 'auto'
	});

	var selectedBds = [];
	var bss = '${bidBond.bidSection}';
	if (!isEmpty(bss)) {
		selectedBds = bss.split(',');
		$('#bidSection').combobox('setValues', selectedBds);
	}
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: auto; padding: 3px;">
		<form id="bidBondBackViewForm" method="post">
			<table class="grid">
				<tr>
					<td colspan="6">
						<table class="grid"
							style="padding: 0px; margin: 0px; border: none">
							<tr style="border: none">
								<th>项目名称 &nbsp;<label
									style="color: red; vertical-align: middle; text-align: center;">*</label></th>
								<td colspan="5"><input name="id" type="hidden"
									value="${bidBond.id}" /> <input name="type" type="hidden"
									value="1" /> <input name="idNumber" type="hidden"
									value="${bidBond.idNumber}" /> <input name="applierId"
									type="hidden" value="${bidBond.applierId}" /> <input
									name="handlerId" type="hidden" value="${bidBond.handlerId}" />
									<input name="handlerId2" type="hidden"
									value="${bidBond.handlerId2}" /> <input type="hidden"
									name="option" id="option" value="0" /> <input
									name="projectName" value="${bidBond.projectName}"
									style="width: 100%; height: 100%" type="text" id="projectName"
									class="easyui-validatebox span2" data-options="required:true" /></td>
							</tr>
							<tr>
								<th>标段 &nbsp;<label
									style="color: red; vertical-align: middle; text-align: center;">*</label></th>
								<td><select id="bidSection" name="bidSection"
									class="easyui-validatebox span2" style="width: 200px;"
									data-options="editable:false,required:true">
								</select></td>
								<th>保证金数额（元）&nbsp;<label
									style="color: red; vertical-align: middle; text-align: center;">*</label></th>
								<td><input name="bondFee" precision="2"
									value="${bidBond.bondFee}" style="width: 100%; height: 100%"
									type="number" id="bondFee" class="easyui-numberbox"
									data-options="required:true" /></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="6">
						<table class="grid">
							<tr>
								<th rowspan="5" width="150px">收 款 人（客户）详细信息 &nbsp;</th>
								<th>户 名&nbsp;<label
									style="color: red; vertical-align: middle; text-align: center;">*</label></th>
								<td colspan="3"><input name="payeeAccountName"
									value="${bidBond.payeeAccountName}" type="text"
									id="payeeAccountName" style="width: 100%; height: 100%"
									class="easyui-validatebox span2" data-options="required:true" /></td>
							</tr>
							<tr>
								<th>开户行&nbsp;<label
									style="color: red; vertical-align: middle; text-align: center;">*</label></th>
								<td colspan="3"><input name="payeeBank"
									value="${bidBond.payeeBank}" type="text" id="payeeBank"
									style="width: 100%; height: 100%"
									class="easyui-validatebox span2" data-options="required:true" /></td>
							</tr>
							<tr>
								<th>帐 号&nbsp;<label
									style="color: red; vertical-align: middle; text-align: center;">*</label></th>
								<td colspan="3"><input name="payeeAccountNum"
									value="${bidBond.payeeAccountNum}" type="text"
									id="payeeAccountNum" style="width: 100%; height: 100%"
									class="easyui-validatebox" data-options="required:true" /></td>
							</tr>
							<tr>
								<th>附 言</th>
								<td colspan="3"><textarea style="width: 100%" rows="2"
										name="payeeComments" id="payeeComments">${bidBond.payeeComments}</textarea></td>
							</tr>
							<tr>
								<th>客户姓名&nbsp;<label
									style="color: red; vertical-align: middle; text-align: center;">*</label></th>
								<td><input name="customerName"
									value="${bidBond.customerName}" type="text" id="customerName"
									style="width: 100%; height: 100%"
									class="easyui-validatebox span2" data-options="required:true" /></td>
								<th>客户联系方式&nbsp;<label
									style="color: red; vertical-align: middle; text-align: center;">*</label></th>
								<td><input name="payerPhone" type="text" id="payerPhone"
									style="width: 100%; height: 100%" value="${bidBond.payerPhone}"
									class="easyui-validatebox span2" data-options="required:true" /></td>
							</tr>
						</table>
					</td>
				</tr>

				<tr>
					<td colspan="6">
						<table class="grid">
							<tr>
								<th colspan="9">应扣保证金明细</th>
							</tr>
							<tr>
								<th>路费</th>
								<th>住宿费</th>
								<th>资质费</th>
								<th>标书费</th>
								<th>预算费</th>
								<td><input name="head1" type="text" id="head1"
									style="width: 100%; height: 100%" value="${bidBond.head1}"
									class="easyui-validatebox span2" /></td>
								<td><input name="head2" type="text" id="head2"
									style="width: 100%; height: 100%" value="${bidBond.head2}"
									class="easyui-validatebox span2" /></td>
								<td><input name="head3" type="text" id="head3"
									style="width: 100%; height: 100%" value="${bidBond.head3}"
									class="easyui-validatebox span2" /></td>
								<th>合计</th>
							</tr>
							<tr>
								<td><input name="luFee" type="text" id="bmFee"
									style="width: 100%; height: 100%" class="easyui-numberbox"
									precision="2" min="0" value="${bidBond.luFee}" /></td>
								<td><input name="zsFee" type="text" id="kbFee"
									style="width: 100%; height: 100%" class="easyui-numberbox"
									precision="2" min="0" value="${bidBond.zsFee}" /></td>
								<td><input name="zzFee" type="text" id="zzFee"
									style="width: 100%; height: 100%" class="easyui-numberbox"
									precision="2" min="0" value="${bidBond.zzFee}" /></td>
								<td><input name="bsFee" type="text" id="bsFee"
									style="width: 100%; height: 100%" class="easyui-numberbox"
									precision="2" min="0" value="${bidBond.bsFee}" /></td>
								<td><input name="ysFee" type="text" id="ysFee"
									style="width: 100%; height: 100%" class="easyui-numberbox"
									precision="2" min="0" value="${bidBond.ysFee}" /></td>
								<td><input name="head1Fee" type="text" id="head1Fee"
									style="width: 100%; height: 100%" class="easyui-numberbox"
									precision="2" min="0" value="${bidBond.head1Fee}" /></td>
								<td><input name="head2Fee" type="text" id="head2Fee"
									style="width: 100%; height: 100%" class="easyui-numberbox"
									precision="2" min="0" value="${bidBond.head2Fee}" /></td>
								<td><input name="head3Fee" type="text" id="head3Fee"
									style="width: 100%; height: 100%" class="easyui-numberbox"
									precision="2" min="0" value="${bidBond.head3Fee}" /></td>
								<td><input name="totalFee" type="text" id="totalFee"
									style="width: 100%; height: 100%" readonly="readonly"
									disabled="disabled" class="easyui-numberbox" precision="2"
									min="0" value="${bidBond.totalFee}" /></td>
							</tr>
						</table>
					</td>
				</tr>

				<tr>
					<th>应退保证金（元）&nbsp;</th>
					<td colspan="5"><input name="backFee" value="${bidBond.backFee}"
						type="text" id="backFee" style="width: 100%; height: 100%"
						readonly="readonly" disabled="disabled" class="easyui-numberbox"
						precision="2" min="0" /></td>
				</tr>
				<tr>
					<th>备注&nbsp;</th>
					<td colspan="5"><textarea style="width: 100%" rows="2"
							name="remark2">${bidBond.remark2}</textarea></td>
				</tr>
				<tr>
					<th colspan="2" width="150px">付款人（<font color="blue">招标代理公司或公共资源交易中心等
					</font>）&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="4"><input name="payer" value="${bidBond.payer}"
						type="text" id="payer" style="width: 100%; height: 100%"
						class="easyui-validatebox span2" data-options="required:true" /></td>
				</tr>
				<tr>
					<th>申请人&nbsp;</th>
					<td><input name="applierName" value="${bidBond.applierName}"
						type="text" id="applierName" style="width: 100%; height: 100%"
						class="easyui-validatebox span2" readonly="readonly"
						disabled="disabled" /></td>
					<th>联系方式&nbsp;</th>
					<td><input name="applierPhone" value="${bidBond.applierPhone}"
						type="text" id="applierPhone" style="width: 100%; height: 100%"
						class="easyui-validatebox span2" readonly="readonly"
						disabled="disabled" /></td>
					<th>申请时间&nbsp;</th>
					<td><input name="applyDT" type="text" id="applyDT"
					value="<fmt:formatDate value="${bidBond.applyDT}" pattern="yyyy-MM-dd HH:mm"/>"
						class="Wdate disabled"
						readonly="readonly" /></td>
				</tr>
				
				<tr>
					<th colspan="6" style="text-align: center;"><font color="blue"
						size="10px">（说明：以下内容由财务部会计填写）</font></th>
				</tr>
				<c:choose>
					<c:when test="${viewType == 'handler_kj'}">
						<tr>
							<th>到帐金额</th>
							<td colspan="2"><input name="toAccountFee" precision="2"
								type="text" value="${bidBond.toAccountFee}" id="toAccountFee"
								class="easyui-numberbox" style="width: 100%;"
								required="required" /></td>
							<th>到帐时间</th>
							<td colspan="2"><input name="toAccountDT" type="text"
								value="<fmt:formatDate value="${bidBond.toAccountDT}" pattern="yyyy-MM-dd HH:mm"/>"
								id="toAccountDT" class="easyui-datebox" required="required" /></td>
						</tr>
						<tr>
							<th>备注&nbsp;</th>
							<td colspan="5"><textarea style="width: 100%" rows="2"
									name="remark3">${bidBond.remark3}</textarea></td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<th>到帐金额</th>
							<td colspan="2"><input name="toAccountFee" precision="2"
								type="text" value="${bidBond.toAccountFee}" id="toAccountFee"
								class="easyui-numberbox disabled"
								style="width: 100%; height: 100%" readonly="readonly" /></td>
							<th>到帐时间</th>
							<td colspan="2"><input name="toAccountDT" type="text"
								value="<fmt:formatDate value="${bidBond.toAccountDT}" pattern="yyyy-MM-dd HH:mm"/>"
								id="toAccountDT" class="Wdate disabled" readonly="readonly" /></td>
						</tr>
						<tr>
							<th>备注&nbsp;</th>
							<td colspan="5"><textarea class="disabled"
									style="width: 100%" rows="2" readonly="readonly" name="remark3">${bidBond.remark3}</textarea></td>
						</tr>
					</c:otherwise>
				</c:choose>

				<tr>
					<th>办理人</th>
					<td colspan="2"><input name="handlerName2"
						value="${bidBond.handlerName2}" type="text" id="handlerName"
						class="easyui-validatebox" style="width: 100%; height: 100%"
						readonly="readonly" disabled="disabled" /></td>
					<th>办理时间</th>
					<td colspan="2"><input name="handlerDT2" type="text"
						value="<fmt:formatDate value="${bidBond.handlerDT2}" pattern="yyyy-MM-dd"/>"
						id="handlerDT2" class="Wdate disabled" readonly="readonly" /></td>
				</tr>

				<tr>
					<th colspan="6" style="text-align: center;"><font color="blue"
						size="10px">（说明：以下内容由财务部出纳填写）</font></th>
				</tr>
				<c:choose>
					<c:when test="${viewType == 'handler_cn'}">
						<tr>
							<th>转出金额</th>
							<td colspan="2"><input name="outAccountFee" precision="2"
								value="${bidBond.outAccountFee}" type="text" id="outAccountFee"
								style="width: 100%; height: 100%" class="easyui-numberbox"
								required="required" /></td>
							<th>转出时间</th>
							<td colspan="2"><input name="outAccountDT"
								value="<fmt:formatDate value="${bidBond.outAccountDT}" pattern="yyyy-MM-dd HH:mm"/>"
								type="text" id="outAccountDT" class="easyui-datebox"
								required="required" /></td>
						</tr>
						<tr>
							<th>备注&nbsp;</th>
							<td colspan="5"><textarea style="width: 100%" rows="2"
									name="remark">${bidBond.remark}</textarea></td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<th>转出金额</th>
							<td colspan="2"><input name="outAccountFee" precision="2"
								value="${bidBond.outAccountFee}" type="number"
								id="outAccountFee" style="width: 100%; height: 100%"
								class="easyui-numberbox disabled" readonly="readonly" /></td>
							<th>转出时间</th>
							<td colspan="2"><input name="outAccountDT"
								value="<fmt:formatDate value="${bidBond.outAccountDT}" pattern="yyyy-MM-dd HH:mm"/>"
								type="text" id="outAccountDT" class="Wdate disabled"
								readonly="readonly" /></td>
						</tr>
						<tr>
							<th>备注&nbsp;</th>
							<td colspan="5"><textarea class="disabled"
									style="width: 100%; height: auto;" rows="2" readonly="readonly"
									name="remark">${bidBond.remark}</textarea></td>
						</tr>
					</c:otherwise>
				</c:choose>
				<tr>
					<th>办理人</th>
					<td colspan="2"><input name="handlerName"
						value="${bidBond.handlerName}" type="text" id="handlerName"
						class="easyui-validatebox" style="width: 100%; height: 100%"
						readonly="readonly" disabled="disabled" /></td>
					<th>办理时间</th>
					<td colspan="2"><input name="handlerDT" id="handlerDT"
						type="text"
						value="<fmt:formatDate value="${bidBond.handlerDT}" pattern="yyyy-MM-dd"/>"
						class="Wdate disabled" readonly="readonly" /></td>
				</tr>
			</table>
		</form>
	</div>
</div>