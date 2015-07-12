<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script type="text/javascript"
	src="${ctx}/jslib/easyui1.3.3/plugins/datagrid-statistics.js"
	charset="utf-8"></script>
<script type="text/javascript">
	var dataGrid;
	$(function() {
		$('#reimbursementBatchEditForm')
				.form(
						{
							url : '${pageContext.request.contextPath}/reimbursementBatch/apply',
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
									parent.$.messager.alert('提示', '编辑成功');
									parent.$.modalDialog.openner_dataGrid
											.datagrid('reload');
								} else {
									parent.$.messager.alert('错误', result.msg,
											'error');
								}
							}
						});
		detailGridRegist();
	});

	function detailGridRegist() {
		dataGrid = $('#dataGrid').datagrid(
				{
					url : '${ctx}' + '/reimbursement/dataGrid',
					striped : true,
					pagination : true,
					nowrap : true,
					showFooter : true,
					queryParams : {
						batchId : isEmpty($('#batchId').val()) ? -1 : $(
								'#batchId').val(),
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
						title : '序号',
						field : 'index',
						align : 'center',
						width : '40',
						rowspan : 2,
						formatter : function(val, row, index) {
							if (isEmpty(val)) {
								return index + 1;
							} else {
								return val;
							}
						}
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
					columns : [ [ {
						title : '费用小计',
						colspan : 8
					}, {
						width : '100',
						title : '合计',
						rowspan : 2,
						sum : true,
						align : 'center',
						field : 'total',
					} ], [ {
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
						title : '证章费（元）',
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
						title : '培训费（元）',
						sum : true,
						align : 'center',
						field : 'trainFee'
					}, {
						width : '100',
						title : '其他费（元）',
						sum : true,
						align : 'center',
						field : 'otherFee'
					} ] ],

					onLoadSuccess : function() {
						$('#dataGrid').datagrid('statistics');
						var footers = $('#dataGrid').datagrid('getFooterRows');
						var sumTotal = footers[0].total;
						$('#totalFee').val(sumTotal);
					},
					toolbar : '#toolbar'
				});
	}

	//报销详情方法
	function addFun() {
		var pid = $('#batchId').val();
		if (isEmpty(pid)) {
			parent.$.messager.alert('警告', '请先进行报销登记!');
			return;
		}
		parent.$
				.modalDialogTwo({
					title : '报销详情',
					width : '900',
					height : '500',
					href : '${ctx}/reimbursement/addPage',
					buttons : [
							{
								text : '添加',
								handler : function() {
									parent.$.modalDialogTwo.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
									var f = parent.$.modalDialogTwo.handler
											.find('#reimbursementAddForm');
									parent.$.modalDialogTwo.handler.find(
											'#option').val(0);
									var batchId = parent.$.modalDialogTwo.handler
											.find('#batchId');
									if (batchId) {
										batchId.val(pid);
									}
									f.submit();
								}
							},
							{
								text : '退出',
								handler : function() {
									//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
									parent.$.modalDialogTwo.handler
											.dialog('close');
								}
							} ]
				});
	}

	function deleteFun() {
		var selected = parent.getSelecteds(dataGrid);
		if (isEmpty(selected)) {
			parent.$.messager.alert('警告', '至少选中一条记录!');
			return;
		}
		parent.$.messager.confirm('询问', '确认删除选中的记录吗？', function(b) {
			if (b) {
				progressLoad();
				$.post('${ctx}/reimbursement/delete', {
					ids : selected
				}, function(result) {
					if (result.success) {
						parent.$.messager.alert('提示', result.msg, 'info');
						//删除成功后,前台删除行,防止下次再删除的时候可以取到之前选到的行
						removeSelectedRow(dataGrid);
						dataGrid.datagrid('reload');
					} else {
						parent.$.messager.alert('警告', result.msg, 'warning');
					}
					progressClose();
				}, 'JSON');
			}
		});
	}

	function editFun() {
		var id = null;
		var rows = dataGrid.datagrid('getSelections');
		if (rows == null || rows.length == 0) {
			parent.$.messager.alert('警告', '没有可编辑对象!');
			return;
		}

		if (rows.length > 1) {
			parent.$.messager.alert('警告', '只能对一条记录编辑!');
			return;
		}

		id = rows[0].id;

		parent.$
				.modalDialogTwo({
					title : '报销详情修改',
					width : '900',
					height : '500',
					href : '${ctx}/reimbursement/editPage?id=' + id,
					buttons : [
							{
								text : '编辑',
								handler : function() {
									//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
									parent.$.modalDialogTwo.openner_dataGrid = dataGrid;
									parent.$.modalDialogTwo.handler.find(
											'#option').val(2);
									var f = parent.$.modalDialogTwo.handler
											.find('#reimbursementEditForm');
									f.submit();
								}
							},
							{
								text : '退出',
								handler : function() {
									parent.$.modalDialogTwo.handler
											.dialog('close');
								}
							} ]
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
<div class="easyui-layout" data-options="fit:true,border:false"
	style="overflow: hidden">
	<div data-options="border:false"
		style="overflow: hidden; padding: 3px;">
		<form id="reimbursementBatchEditForm" method="post">
			<table class="grid">
				<tr>
					<th>月份 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input id="batchId" type="hidden"
						value="${reimbursementBatch.id}" name="id"><input
						type="hidden" name="option" id="option" value="" /> <input
						type="hidden" name="process.id"
						value="${reimbursementBatch.process_vo.id}" /> <input
						class="Wdate" type="text" name="month" id="month"
						value="${reimbursementBatch.month}"
						style="width: 68%; height: 100%;" /></td>
					<th>报销人&nbsp;</th>
					<td colspan="4"><input class="easyui-validatebox"
						style="width: 100%" name="bxr" id="bxr"
						value="${reimbursementBatch.process_vo.applyUserName}"
						readonly="readonly" disabled="disabled"></input></td>
					<th>报销总额&nbsp;</th>
					<td colspan="4"><input class="easyui-validatebox"
						style="width: 100%" name="totalFee" id="totalFee"
						value="${reimbursementBatch.totalFee}" readonly="readonly"
						disabled="disabled"></input></td>
				</tr>
			</table>
		</form>
	</div>
	<span style="font-size: 14px; color: blue">报销明细</span>
	<div data-options="fit:true,border:false"
		style="overflow: auto; height: 360px">
		<table id="dataGrid" data-options="fit:true,border:false"></table>
	</div>
	<div id="toolbar" class="mygrid-toolbar" style="inline: true">
		<c:choose>
			<c:when
				test="${fn:contains(sessionInfo.resourceList, '/reimbursement/detail')}">
				<a onclick="detailFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_detail'">详情 </a>
			</c:when>
			<c:otherwise>
				<a href="javascript:void(0);" class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_detail_disabled'"><font
					color="gray">详情</font> </a>
			</c:otherwise>
		</c:choose>
	</div>
</div>