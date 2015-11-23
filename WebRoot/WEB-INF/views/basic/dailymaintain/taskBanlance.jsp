<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../inc.jsp"></jsp:include>
<meta http-equiv="X-UA-Compatible" content="edge" />
<title>任务派单管理</title>
<script type="text/javascript">
	var dataGrid;
	$(function() {
		dataGrid = $('#dataGrid').datagrid({
			url : '${ctx}' + '/task/banlanceGrid',
			striped : true,
			rownumbers : true,
			pagination : true,
			nowrap : true,
			idField : 'id',
			sortName : 'id',
			sortOrder : 'asc',
			pageSize : 10,
			pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
			frozenColumns : [ [

			{
				checkbox : true,
				field : 'id',
				width : '10'
			}, {
				width : '245',
				title : '任务名称',
				align : 'center',
				field : 'name',
				formatter : function(value, row, index) {
					if (isEmpty(value)) {
						return '';
					} else {
						if(isEmpty(row.id)){
							return value;
						}else{
							var href="<a href='#' onClick='detailFun("+ row.id+")'>"+value+"</a>";
							return href;
						}
					}
				}
			}, {
				width : '210',
				title : '执行日期',
				align : 'center',
				field : 'excuteDT',
				sortable : true,
				formatter : function(value, row, index) {
					if (isEmpty(value)) {
						return '';
					} else {
						return value.substring(0, value.indexOf(' '));
					}
				}
			}, {
				width : '210',
				title : '受理日期',
				align : 'center',
				field : 'acceptDT',
				sortable : true,
				formatter : function(value, row, index) {
					if (isEmpty(value)) {
						return '未受理';
					} else {
						return value.substring(0, value.indexOf(' '));
					}
				}
			}, {
				width : '210',
				title : '收费状态',
				align : 'center',
				field : 'chargeState',
				sortable : true,
				formatter : function(value, row, index) {
					if (value == 0) {
						return '未收费';
					} else if (value == 1) {
						return '已经收费';
					} else {
						return '';
					}

				}
			}, {
				width : '210',
				title : '发票状态',
				align : 'center',
				field : 'invoiceState',
				sortable : true,
				formatter : function(value, row, index) {
					if (value == 1) {
						return '已开发票';
					} else if (value == 2) {
						return '未开发票';
					} else {
						return '';
					}

				}
			} ] ],
			toolbar : '#toolbar'
		});

	});

	function searchFun() {
		var queryParams = $('#dataGrid').datagrid('options').queryParams;
		queryParams.name = "";
		queryParams.chargeState = 0;
		queryParams.invoiceState = 0;

		var name = $('#taskName').val();
		var chargeState = $('#chargeState').combobox('getValue');
		var invoiceState = $('#invoiceState').combobox('getValue');
		if (!isEmpty(name)) {
			queryParams.name = name;
		}

		if (!isEmpty(chargeState)) {
			queryParams.chargeState = chargeState;
		}

		if (!isEmpty(invoiceState)) {
			queryParams.invoiceState = invoiceState;
		}

		//重新加载datagrid的数据  
		reloadGrid($("#dataGrid"));
	}

	function clearFun() {
		$('#taskName').val('');
		$('#chargeState').combobox('clear');
		$('#invoiceState').combobox('clear');
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

		parent.$.modalDialog({
			title : '任务核查',
			width : '600',
			height : '280',
			href : '${ctx}/task/banlanceEditPage?id=' + id,
			buttons : [ {
				text : '编辑',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					var f = parent.$.modalDialog.handler.find('#banlanceEditForm');
					f.submit();
				}
			} ]
		});
	}

	//任务查看
	function detailFun(id) {
		parent.$.modalDialog({
			title : '任务详情',
			width : '870',
			height : '560',
			href : '${ctx}/task/historyDetail?id=' + id,
			buttons : [ {
				text : '退出',
				handler : function() {
					//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					parent.$.modalDialog.handler.dialog('close');
				}
			} ]
		});
	}
</script>
</head>
<body class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',fit:true,border:false">
		<table id="dataGrid" data-options="fit:true,border:false"></table>
	</div>
	<div id="toolbar" class="mygrid-toolbar" style="inline: false">

		<c:choose>
			<c:when test="${fn:contains(sessionInfo.resourceList, '/task/banlanceEdit')}">
				<a onclick="editFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_edit'">编辑</a>
			</c:when>
			<c:otherwise>
				<a href="javascript:void(0);" class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_edit_disabled'"><font
					color="gray">编辑</font> </a>
			</c:otherwise>
		</c:choose>

		<c:if test="${fn:contains(sessionInfo.resourceList, '/task/banlanceSearch')}">
			<div id="searchbar" class="search-toolbar">
				<span>任务名称:</span> <input type="text" id="taskName" name="taskName">
				
				<span>收费状态:</span> <select id="chargeState" class="easyui-combobox"
					name="chargeState" style="width: 100px;" panelHeight="auto">
					<option value="0">--请选择--</option>
					<option value="1">已收费</option>
					<option value="2">未收费</option>
				</select> 
				<span>发票状态:</span> <select id="invoiceState" class="easyui-combobox"
					name="invoiceState" style="width: 100px;" panelHeight="auto">
					<option value="0">--请选择--</option>
					<option value="1">已开发票</option>
					<option value="2">未开发票</option>
				</select>
				
				<a onclick="searchFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_search'">搜索</a> 
					
				<a onclick="clearFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_clear'">清空</a>
			</div>
		</c:if>

	</div>

</body>
</html>