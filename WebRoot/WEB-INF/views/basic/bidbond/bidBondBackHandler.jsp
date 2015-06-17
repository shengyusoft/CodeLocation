<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		$('#bidBondBackHandlerForm').form({
			url : '${pageContext.request.contextPath}/bidBond/commit',
			onSubmit : function() {
				//TODO 预留短信接口!
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

	//标段
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
	selectedBds = bss.split(',');
	$('#bidSection').combobox('setValues', selectedBds);

	var applyDT = '${bidBond.applyDT}';
	if (!isEmpty(applyDT)) {
		applyDT = new Date(applyDT);
		$('#applyDT').val(applyDT.format());
	}
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: auto; padding: 3px;">
		<form id="bidBondBackHandlerForm" method="post">
			<table class="grid">
				<tr>
					<td colspan="6">
						<table class="grid">
							<tr>
								<th>项目名称 &nbsp;<label
									style="color: red; vertical-align: middle; text-align: center;">*</label></th>
								<td width="300px"><input name="type" type="hidden"
									value="${bidBond.type}"></input> <input name="idNumber"
									type="hidden" value="${bidBond.idNumber}"></input> <input
									name="applierId" type="hidden" value="${bidBond.applierId}"></input>
									<input name="id" type="hidden" value="${bidBond.id}"></input> <input
									name="handlerId" type="hidden" value="${bidBond.handlerId}"></input>
									<input name="projectName" value="${bidBond.projectName}"
									style="width: 100%; height: 100%" type="text" id="projectName"
									class="easyui-validatebox span2" readonly="readonly" /></td>
								<th>标段 &nbsp;<label
									style="color: red; vertical-align: middle; text-align: center;">*</label></th>
								<td><select id="bidSection" name="bidSection"
									readonly="readonly" class="easyui-validatebox span2"
									style="width: 200px;" data-options="editable:false">
								</select></td>
								<th>保证金数额（元）&nbsp;<label
									style="color: red; vertical-align: middle; text-align: center;">*</label></th>
								<td><input name="bondFee" precision="2"
									value="${bidBond.bondFee}" style="width: 100%; height: 100%"
									type="number" id="bondFee" class="easyui-numberbox"
									readonly="readonly" /></td>
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
									class="easyui-validatebox span2" readonly="readonly" /></td>
							</tr>
							<tr>
								<th>开户行&nbsp;<label
									style="color: red; vertical-align: middle; text-align: center;">*</label></th>
								<td colspan="3"><input name="payeeBank"
									value="${bidBond.payeeBank}" type="text" id="payeeBank"
									style="width: 100%; height: 100%"
									class="easyui-validatebox span2" readonly="readonly" /></td>
							</tr>
							<tr>
								<th>帐 号&nbsp;<label
									style="color: red; vertical-align: middle; text-align: center;">*</label></th>
								<td colspan="3"><input name="payeeAccountNum"
									value="${bidBond.payeeAccountNum}" type="text"
									id="payeeAccountNum" style="width: 100%; height: 100%"
									class="easyui-numberbox" readonly="readonly" /></td>
							</tr>
							<tr>
								<th>附 言</th>
								<td colspan="3"><textarea style="width: 100%" rows="2"
										readonly="readonly" name="payeeComments" id="payeeComments">${bidBond.payeeAccountNum}</textarea></td>
							</tr>
							<tr>
								<th>客户姓名&nbsp;<label
									style="color: red; vertical-align: middle; text-align: center;">*</label></th>
								<td><input name="customerName" readonly="readonly"
									value="${bidBond.customerName}" type="text" id="customerName"
									style="width: 100%; height: 100%"
									class="easyui-validatebox span2" readonly="readonly" /></td>
								<th>客户联系方式&nbsp;<label
									style="color: red; vertical-align: middle; text-align: center;">*</label></th>
								<td><input name="payerPhone" type="text" id="payerPhone"
									style="width: 100%; height: 100%" value="${bidBond.payerPhone}"
									class="easyui-validatebox span2" readonly="readonly" /></td>
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
									readonly="readonly" style="width: 100%; height: 100%"
									value="${bidBond.head1}" class="easyui-validatebox span2" /></td>
								<td><input name="head2" type="text" id="head2"
									readonly="readonly" style="width: 100%; height: 100%"
									value="${bidBond.head2}" class="easyui-validatebox span2" /></td>
								<td><input name="head3" type="text" id="head3"
									readonly="readonly" style="width: 100%; height: 100%"
									value="${bidBond.head3}" class="easyui-validatebox span2" /></td>
								<th>合计</th>
							</tr>
							<tr>
								<td><input name="luFee" type="text" id="bmFee"
									style="width: 100%; height: 100%" class="easyui-numberbox"
									precision="2" readonly="readonly" value="${bidBond.luFee}" /></td>
								<td><input name="zsFee" type="text" id="kbFee"
									style="width: 100%; height: 100%" class="easyui-numberbox"
									precision="2" readonly="readonly" value="${bidBond.zsFee}" /></td>
								<td><input name="zzFee" type="text" id="zzFee"
									style="width: 100%; height: 100%" class="easyui-numberbox"
									precision="2" readonly="readonly" value="${bidBond.zzFee}" /></td>
								<td><input name="bsFee" type="text" id="bsFee"
									style="width: 100%; height: 100%" class="easyui-numberbox"
									precision="2" readonly="readonly" value="${bidBond.bsFee}" /></td>
								<td><input name="ysFee" type="text" id="ysFee"
									style="width: 100%; height: 100%" class="easyui-numberbox"
									precision="2" readonly="readonly" value="${bidBond.ysFee}" /></td>
								<td><input name="head1Fee" type="text" id="head1Fee"
									style="width: 100%; height: 100%" class="easyui-numberbox"
									precision="2" readonly="readonly" value="${bidBond.head1Fee}" /></td>
								<td><input name="head2Fee" type="text" id="head2Fee"
									style="width: 100%; height: 100%" class="easyui-numberbox"
									precision="2" readonly="readonly" value="${bidBond.head2Fee}" /></td>
								<td><input name="head3Fee" type="text" id="head3Fee"
									style="width: 100%; height: 100%" class="easyui-numberbox"
									precision="2" readonly="readonly" value="${bidBond.head3Fee}" /></td>
								<td><input name="totalFee" type="text" id="totalFee"
									style="width: 100%; height: 100%" readonly="readonly"
									disabled="disabled" class="easyui-numberbox" precision="2"
									readonly="readonly" value="${bidBond.totalFee}" /></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<th>应退保证金（元）&nbsp;</th>
					<td><input name="backFee" value="${bidBond.backFee}"
						type="text" id="backFee" style="width: 100%; height: 100%"
						readonly="readonly" disabled="disabled" class="easyui-numberbox"
						precision="2" readonly="readonly" /></td>
					<th>备注&nbsp;</th>
					<td colspan="3"><textarea style="width: 100%" rows="2"
							name="remark2">${bidBond.remark2}</textarea></td>
				</tr>
				<tr>
					<th width="150px">付款人（<font color="blue">招标代理公司或<br />公共资源交易中心等
					</font>）&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="5"><input name="payer" value="${bidBond.payer}"
						type="text" id="payer" style="width: 100%; height: 100%"
						class="easyui-validatebox span2" readonly="readonly" /></td>
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
						value="${bidBond.applyDT}" class="easyui-datebox"
						readonly="readonly" disabled="disabled" /></td>
				</tr>

				<tr>
					<th style="text-align: center;" colspan="6"><font color="blue"
						size="10px">（说明：以下内容由财务部出纳填写）</font></th>
				</tr>
				<tr>
					<th>到帐金额</th>
					<td colspan="2"><input name="toAccountFee" precision="2"
						value="${bidBond.toAccountFee}" type="text" id="toAccountFee"
						style="width: 100%; height: 100%" class="easyui-numberbox"
						data-options="required:true" /></td>
					<th width="100px">到帐时间</th>
					<td colspan="2"><input name="toAccountDT"
						value="${bidBond.toAccountDT}" type="text" id="toAccountDT"
						class="easyui-validatebox Wdate"
						onfocus="showDate('yyyy-MM-dd HH:mm:ss')"
						data-options="required:true" /></td>
				</tr>
				<tr>
					<th>转出金额</th>
					<td colspan="2"><input name="outAccountFee" precision="2"
						value="${bidBond.outAccountFee}" type="number" id="outAccountFee"
						style="width: 80%; height: 100%;" data-options="required:true" /></td>
					<th>转出时间</th>
					<td colspan="2"><input name="outAccountDT" type="text"
						id="toAccountDT" readonly="readonly" disabled="disabled" /><font
						color="rgb(235, 235, 228)">&nbsp;&nbsp;（提示:提交后系统自动生成）</font></td>
				</tr>
				<tr>
					<th>办理人</th>
					<td colspan="2"><input name="handlerName"
						value="${bidBond.handlerName}" type="text" id="handlerName"
						readonly="readonly" /></td>
					<th>办理时间</th>
					<td colspan="2"><input name="handlerDT"
						value="${bidBond.handlerDT}" type="text" id="handlerDT"
						class="easyui-datebox" data-options="required:true" /></td>
				</tr>
				<tr>
					<th>备注&nbsp;</th>
					<td colspan="5"><textarea style="width: 100%" rows="3"
							name="remark">${bidBond.remark}</textarea></td>
				</tr>


			</table>
		</form>
	</div>
</div>