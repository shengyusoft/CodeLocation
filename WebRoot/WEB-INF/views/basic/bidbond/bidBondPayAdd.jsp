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

	$('#bidSection').combobox({
		url : "${pageContext.request.contextPath}/dictionary/combox?code=bd",
		parentField : 'dictionaryId',
		valueField : 'id',
		multiple : true,
		textField : 'text',
		panelHeight : 'auto'
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="bidBondPayAddForm" method="post"
			style="width: 800px; height: 330px;">
			<table class="grid">
				<tr>
					<th width="160px">项目名称 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="5"><input name="type" type="hidden" value="0"></input>
						<input name="projectName" style="width: 100%; height: 100%"
						type="text" id="projectName" class="easyui-validatebox span2"
						data-options="required:true" /></td>
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
					<th>保证金数额（元）【.00】 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="5"><input name="bondFee"
						style="width: 100%; height: 100%" type="number" id="bondFee"
						class="easyui-numberbox" precision="2"
						data-options="required:true" /></td>
				</tr>
				<tr>
					<th rowspan="5">收款人（<font color="blue">公共资源交易中心或招标代理机构等</font>）详细信息
						&nbsp;
					</th>
					<th>户 名&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="4"><input name="payeeAccountName" type="text"
						id="payeeAccountName" style="width: 98%; height: 100%"
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
						class="easyui-validatebox span2" data-options="required:true" /></td>
				</tr>
				<tr>
					<th>附 言</th>
					<td colspan="4"><textarea style="width: 100%" rows="3"
							name="payeeComments" id="payeeComments">${bidBond.payeeComments}</textarea></td>
				</tr>
				<tr>
					<th>填表时间&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="4"><input name="payeeHandleDT" type="text"
						id="payeeHandleDT" class="easyui-datebox"
						data-options="required:true" /></td>
				</tr>

				<tr>
					<th>客户姓名&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="customerName" type="text" id="customerName"
						style="width: 100%; height: 100%" class="easyui-validatebox span2"
						data-options="required:true" /></td>
					<th width="100px">客户联系方式&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="payerPhone" type="text" id="payerPhone"
						style="width: 100%; height: 100%" class="easyui-validatebox span2"
						data-options="required:true" /></td>
					<th width="100px">转款人姓名&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="payer" type="text" id="payer"
						style="width: 100%; height: 100%" class="easyui-validatebox span2"
						data-options="required:true" /></td>

				</tr>

				<tr>
					<th colspan="6"><font color="blue" size="10px">（说明：以下内容由财务部出纳填写）</font></th>
				</tr>

				<tr>
					<th>到帐金额</th>
					<td colspan="2"><input name="toAccountFee" type="text"
						id="toAccountFee" style="width: 100%; height: 100%"
						class="easyui-numberbox" readonly="readonly" disabled="disabled" /></td>
					<th>到帐时间</th>
					<td colspan="2"><input name="toAccountDT" type="text"
						id="toAccountDT" class="easyui-datebox" readonly="readonly"
						disabled="disabled" /></td>
				</tr>
				<tr>
					<th>转出金额</th>
					<td colspan="2"><input name="outAccountFee" type="number"
						id="outAccountFee" style="width: 100%; height: 100%"
						class="easyui-numberbox" readonly="readonly" disabled="disabled" /></td>
					<th>转出时间</th>
					<td colspan="2"><input name="outAccountDT" type="text"
						id="outAccountDT" class="easyui-datebox" readonly="readonly"
						disabled="disabled" /></td>
				</tr>
				<tr>
					<th>办理人</th>
					<td colspan="2"><input name="handlerName" type="text" id="handlerName"
						class="easyui-datebox" readonly="readonly" disabled="disabled" /></td>
					<th>办理时间</th>
					<td colspan="2"><input name="handlerDT" type="text"
						id="handlerDT" class="easyui-datebox" readonly="readonly"
						disabled="disabled" /></td>
				</tr>
			</table>
		</form>
	</div>
</div>