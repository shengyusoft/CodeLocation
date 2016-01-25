<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script type="text/javascript"
	src="${ctx}/jslib/easyui1.3.3/plugins/datagrid-statistics.js"
	charset="utf-8"></script>
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
		$('#month').val(Common.formatterMonth('${reimbursementBatch.month}'));
	});
	
	function detailGridRegist(){
		dataGrid = $('#dataGrid').datagrid({
			url : '${ctx}' + '/reimbursement/dataGrid',
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
			showFooter : true,
			pageSize : getDefaultPageSize(),
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
					debugger;
					if(!isEmpty(value) && value.indexOf('合计')>=0){
   						return value;
   					}
					var st = formatDate(row.startDT);
					var et = formatDate(row.endDT);
					return st + "--" + et;
				}
			}, {
				width : '150',
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
			} ] ],
			columns : [ [{
				title : '费用小计',
				colspan : 12
			}, {
				width : '100',
				title : '合计',
				rowspan : 2,
				sum : true,
				align : 'center',
				field : 'total',
			}],[ {
				width : '100',
				title : '交通费（元）',
				sum : true,
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
				sum : true,
				align : 'center',
				field : 'officeFee'
			}, {
				width : '100',
				title : '招待费（元）',
				sum : true,
				align : 'center',
				field : 'receiveFee'
			}, {
				width : '100',
				title : '刻章费（元）',
				sum : true,
				align : 'center',
				field : 'badgeFee'
			}, {
				width : '100',
				title : '通讯费（元）',
				sum : true,
				align : 'center',
				field : 'communicationFee'
			}, {
				width : '100',
				title : '物品购置费（元）',
				sum : true,
				align : 'center',
				field : 'trainFee'
			}, {
				width : '100',
				title : '文印费（元）',
				sum : true,
				align : 'center',
				field : 'wyFee'
			}, {
				width : '100',
				title : '制证费（元）',
				sum : true,
				align : 'center',
				field : 'zzFee'
			}, {
				width : '100',
				title : '住宿费（元）',
				sum : true,
				align : 'center',
				field : 'zsFee'
			}, {
				width : '100',
				title : '快递费（元）',
				sum : true,
				align : 'center',
				field : 'kdFee'
			}, {
				width : '100',
				title : '其他费（元）',
				sum : true,
				align : 'center',
				field : 'otherFee'
			} ] ],
			
			onLoadSuccess:function(){ 
                $('#dataGrid').datagrid('statistics');
                var footers=$('#dataGrid').datagrid('getFooterRows');
                var sumTotal = footers[0].total;
                $('#totalFee').val(sumTotal);
          	},
			toolbar : '#toolbar'
		});
	}
	
	function detailFun() {
		var id = null;
		var rows = dataGrid.datagrid('getSelections');
		if (rows == null || rows.length == 0) {
			parent.$.messager.alert('警告', '没有可查看对象!');
			return;
		}

		if (rows.length > 1) {
			parent.$.messager.alert('警告', '只能查看一条记录!');
			return;
		}

		id = rows[0].id;

		parent.$.modalDialogTwo({
			title : '报销明细详情',
			autoScroll : true,
			width : document.body.clientWidth * 0.7,
			height : document.body.clientHeight * 0.9,
			href : '${ctx}/reimbursement/detailPage2?id=' + id,
			buttons : [ {
				text : '退出',
				handler : function() {
					//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					parent.$.modalDialogTwo.handler.dialog('close');
				}
			} ]
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
					<th>报销人&nbsp;</th>
					<td colspan="4"><input class="easyui-validatebox"
						style="width: 100%" name="bxr" id="bxr"
						value="${reimbursementBatch.process_vo.applyUserName}"
						readonly="readonly" disabled="disabled"></input></td>
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
	<div id="toolbar" class="mygrid-toolbar" style="inline: true">
		<a onclick="detailFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_detail'">详情 </a>
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
						style="width: 98%;" /></td>
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