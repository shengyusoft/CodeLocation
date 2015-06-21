<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		$('#processBatchForm').form({
			url : '${pageContext.request.contextPath}/reimbursementBatch/complate',
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
					parent.$.messager.alert('提示',result.msg,'success');
					var grid = parent.$.modalDialog.openner_dataGrid;
					if(!isEmpty(grid)){
						grid.datagrid('reload');
					}
					parent.$.modalDialog.handler.dialog('close');
				} else {
					parent.$.messager.alert('错误', result.msg, 'error');
				}
			}
		});
		
		detailGridRegist();
	});
	
	function detailGridRegist(){
		dataGrid = $('#dataGrid').datagrid({
			url : '${pageContext.request.contextPath}' + '/reimbursement/dataGrid',
			striped : true,
			rownumbers : true,
			pagination : true,
			nowrap : true,
			queryParams:{
            	batchId : isEmpty($('#batchId').val())?-1:$('#batchId').val(),
            	type : 1
            },
			idField : 'id',
			sortName : 'id',
			sortOrder : 'desc',
			pageSize : 10,
			pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
			frozenColumns : [ [

			{
				checkbox : true,
				field : 'id',
				width : '30',
				rowspan : 2
			}, {
				width : '150',
				title : '时间范围',
				rowspan : 2,
				sortable : true,
				align : 'center',
				field : 'startDT',
				formatter : function(value, row, index) {
					var st = formatDate(row.startDT);
					var et = formatDate(row.endDT);
					return st + "--" + et;
				}
			}, {
				width : '190',
				title : '地点',
				rowspan : 2,
				align : 'center',
				field : 'place'
			}, {
				width : '130',
				title : '工作',
				rowspan : 2,
				align : 'center',
				field : 'workDetail'
			}, {
				width : '150',
				title : '费用明细',
				rowspan : 2,
				align : 'center',
				field : 'costDetail'
			} ] ],
			columns : [ [{
				title : '费用小计',
				colspan : 8
			}],[ {
				width : '100',
				title : '交通费（元）',
				align : 'center',
				field : 'trafficFee'
			}, {
				width : '100',
				title : '就餐费（元）',
				align : 'center',
				field : 'mealFee'
			}, {
				width : '100',
				title : '办公费（元）',
				align : 'center',
				field : 'officeFee'
			}, {
				width : '100',
				title : '招待费（元）',
				align : 'center',
				field : 'receiveFee'
			}, {
				width : '100',
				title : '证章费（元）',
				align : 'center',
				field : 'badgeFee'
			}, {
				width : '100',
				title : '通讯费（元）',
				align : 'center',
				field : 'communicationFee'
			}, {
				width : '100',
				title : '培训费（元）',
				align : 'center',
				field : 'trainFee'
			}, {
				width : '100',
				title : '其他费（元）',
				align : 'center',
				field : 'otherFee'
			}, {
				width : '100',
				title : '合计',
				align : 'center',
				field : 'total',
			} ] ],

			toolbar : '#toolbar'
		});
	}
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="border:false" style="overflow: hidden; padding: 3px;">
		<form id="reimbursementBatchAuditForm" method="post">
			<table class="grid">
				<tr>
					<th>月份 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input id="batchId" type="hidden" value="${reimbursementBatch.id}"
						name="id"><input type="hidden" name="option" id="option" value="" />
						<input type="hidden" name="process.id" value="${reimbursementBatch.process_vo.id}" />
						<input class="Wdate" type="text" name="month" id="month" value="${reimbursementBatch.month}"
						style="width: 68%; height: 100%;" readonly="readonly"
						onfocus="showDate('yyyy-MM-dd')" /></td>
					<th>报销总额&nbsp;</th>
					<td colspan="4"><input class="easyui-validatebox"
						style="width: 100%" name="totalFee" id="totalFee" value="${reimbursementBatch.totalFee}"
						readonly="readonly" disabled="disabled"></input></td>
				</tr>
			</table>
		</form>
	</div>
	<span style="font-size: 14px; color: blue">报销明细</span>
	<div data-options="fit:true,border:false" style="overflow: auto;height: 360px">
		<table id="dataGrid" data-options="fit:true,border:false"></table>
	</div>
	<div data-options="fit:true,border:false" style="overflow: auto;">
		<form id="processBatchForm" method="post">
			<table class="grid">
				<tr>
					<th>流程名称 &nbsp;</th>
					<td><input type="hidden" name="id" value="${reimbursementBatch.process_vo.id}" /> <input
						type="hidden" name="option" id="option" value="" type="text" /><input
						name="processName" value="${reimbursementBatch.process_vo.processName}" type="text"
						id="processName" style="width: 100%; height: 100%"
						class="easyui-validatebox span2" readonly="readonly" /></td>
					<th>申请人 &nbsp;</th>
					<td><input type="hidden" name="applyUserId"
						value="${reimbursementBatch.process_vo.applyUserId}" /> <input name="applyUserName"
						value="${reimbursementBatch.process_vo.applyUserName}" type="text" id="applyUserName"
						style="width: 100%; height: 100%" class="easyui-validatebox span2"
						readonly="readonly" /></td>
				</tr>
				<tr>
					<th>开始时间 &nbsp;</th>
					<td><input class="Wdate" type="text" name="startDT"
						readonly="readonly" style="width: 98%; height: 100%;"
						value="${reimbursementBatch.process_vo.startDT}" /></td>
					<th>结束时间 &nbsp;</th>
					<td><input class="Wdate" type="text" name="endDT"
						readonly="readonly" value="${reimbursementBatch.process_vo.endDT}" id="endDT"
						style="width: 98%; height: 100%;" /></td>
				</tr>
				<tr>
					<th>办理意见&nbsp;</th>
					<td colspan="4"><textarea style="width: 100%" rows="3"
							name="remark" id="remark"></textarea></td>
				</tr>
			</table>
		</form>
	</div>
</div>