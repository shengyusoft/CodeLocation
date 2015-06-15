<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script type="text/javascript">
	var dataGrid;
	$(function() {
		var projectAppRegId = '${projectAppropriateReg.id}';
		dataGrid = $('#dataGrid').datagrid({
			url : '${ctx}' + '/projectAppropriateAccount/dataGrid',
			striped : true,
			rownumbers : true,
			pagination : true,
			queryParams:{
            	projectAppRegId : projectAppRegId
            },
			nowrap : true,
			idField : 'id',
			sortName : 'id',
			sortOrder : 'asc',
			pageSize : 5,
			pageList : [ 10, 15 ],
			columns : [ [ {
				checkbox : true,
				rowspan : 2,
				field : 'id',
				width : '30',
			}, {
				title : '以下内容工程部经理填写',
				colspan : 8,
				align : 'center'
			}, {
				title : '以下内容财务部出纳填写',
				colspan : 4,
				align : 'center'
			}, {
				width : '90',
				rowspan : 2,
				title : '状态',
				align : 'center',
				field : 'state',
				formatter : function(value, row, index) {
					return value == 0?'<font color="red">待确认</font>':'<font color="green">已确认</font>';
				}
			}] , [ {
				width : 150,
				title : '业主本次拨付金额（元）',
				align : 'center',
				field : 'toAccountFee'
			}, {
				width : '120',
				title : '业主本次拨付时间',
				sortable : true,
				align : 'center',
				field : 'applyDT'
			}, {
				width : '120',
				title : '本次计划支付金额',
				sortable : true,
				align : 'center',
				field : 'applyFee'
			}, {
				width : '90',
				title : '到帐时间',
				sortable : true,
				align : 'center',
				field : 'toAccountDT'
			},{
				width : '90',
				title : '收款人',
				
				align : 'center',
				field : 'payee'
			}, {
				width : '90',
				title : '开户行',
				
				align : 'center',
				field : 'bank'
			}, {
				width : '90',
				title : '帐号',
				
				align : 'center',
				field : 'accountNum'
			} , {
				width : '90',
				title : '备注1',
				align : 'center',
				field : 'remark1'
			}, {
				width : '120',
				title : '实际到帐金额（元）',
				sortable : true,
				align : 'center',
				field : 'actualFee'
			}, {
				width : '90',
				title : '实际到帐时间',
				align : 'center',
				field : 'actualDT'
			}, {
				width : 150,
				title : '本次实际支付金额（元）',
				sortable : true,
				align : 'center',
				field : 'actualPayFee'
			}, {
				width : '90',
				title : '备注',
				align : 'center',
				field : 'remark2'
			} ] ],
			toolbar : '#toolbar'
		});
	});
	
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="projectAppropriateRegEditForm" method="post">
			<table class="grid">
				<tr>
					<th>项目名称 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input type="hidden" name="id" id="id"
						value="${projectAppropriateReg.id}" /> <input name="projectName"
						style="width: 100%; height: 100%" type="text" id="projectName"
						readonly="readonly" data-options="required:true"
						value="${projectAppropriateReg.projectName}" /></td>
					<th>中标价（元） &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="bidPrice" style="width: 100%; height: 100%"
						type="number" id="bidPrice" readonly="readonly"
						data-options="required:true"
						value="${projectAppropriateReg.bidPrice}" /></td>
					<th>中标日期 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input class="Wdate" type="text" name="bidDT"
						readonly="readonly" id="bidDT" style="width: 98%; height: 100%;"
						value="${projectAppropriateReg.bidDT}"
						data-options="required:true" onfocus="showDate('yyyy-MM-dd')" /></td>
				</tr>
				<tr>
					<th>合同工期（天） &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="name" style="width: 100%; height: 100%"
						type="number" id="name" readonly="readonly"
						data-options="required:true"
						value="${projectAppropriateReg.contractDuration}" /></td>
					<th>管理费比例 （%）&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="managerFeeRate"
						style="width: 100%; height: 100%" type="number"
						id="managerFeeRate" readonly="readonly"
						data-options="required:true"
						value="${projectAppropriateReg.managerFeeRate}" /></td>
					<th>管理费数额（元）&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="managerFee" style="width: 100%; height: 100%"
						type="number" id="managerFee" readonly="readonly"
						data-options="required:true"
						value="${projectAppropriateReg.managerFee}" /></td>
				</tr>
				<tr>
					<td colspan="6">收款人信息</td>
				</tr>
				<tr>
					<th>户名 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="payee" style="width: 100%; height: 100%"
						type="text" id="payee" readonly="readonly"
						data-options="required:true"
						value="${projectAppropriateReg.payee}" /></td>
					<th>开户行&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="bank" style="width: 100%; height: 100%"
						type="text" id="bank" readonly="readonly"
						data-options="required:true" value="${projectAppropriateReg.bank}" /></td>
					<th>帐号&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="accountNum" style="width: 100%; height: 100%"
						type="text" id="accountNum" readonly="readonly"
						data-options="required:true"
						value="${projectAppropriateReg.accountNum}" /></td>
				</tr>
				<tr>
					<td colspan="6">联系人信息</td>
				</tr>
				<tr>
					<th>姓名 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="contactName"
						style="width: 100%; height: 100%" type="text" id="contactName"
						readonly="readonly" data-options="required:true"
						value="${projectAppropriateReg.contactName}" /></td>
					<th>电话&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="contactTel" style="width: 100%; height: 100%"
						type="text" id="contactTel" readonly="readonly"
						data-options="required:true"
						value="${projectAppropriateReg.contactTel}" /></td>
					<th>身份证号&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="contactIdCard"
						style="width: 100%; height: 100%" type="text" id="contactIdCard"
						readonly="readonly" data-options="required:true"
						value="${projectAppropriateReg.contactIdCard}" /></td>
				</tr>
				<tr>
					<th>备注&nbsp;</th>
					<td colspan="5"><textarea style="width: 100%" rows="3"
							readonly="readonly" name="remark">${projectAppropriateReg.remark}</textarea></td>
				</tr>
			</table>
		</form>
	</div>
	<span style="font-size: 14px; color: blue">工程款到帐及拨付情况表（工程部收到钱时填写）</span>
	<div data-options="fit:true,border:false" style="overflow: auto;height: 180px">
		<table id="dataGrid" data-options="fit:true,border:false"></table>
	</div>
</div>