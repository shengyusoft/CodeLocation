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
<title>运维档案</title>
<script type="text/javascript">
	var dataGrid;
	$(function() {
		dataGrid = $('#dataGrid').datagrid({
			url : '${ctx}' + '/task/historyGrid',
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
				width : '10',
			}, {
				width : '150',
				title : '任务名称',
				align : 'center',
				field : 'name'
			}, {
				width : '100',
				title : '发起人',
				align : 'center',
				field : 'sendUserName'
			}, {
				width : '90',
				title : '接受人',
				align : 'center',
				field : 'acceptUserName'
			}, {
				width : '120',
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
				width : '120',
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
				width : '100',
				title : '维护类型',
				align : 'center',
				sortable : true,
				field : 'taskTypeName'
			}, {
				width : '120',
				title : '合同',
				align : 'center',
				field : 'contractName'
			}, {
				width : '90',
				title : '是否收费',
				align : 'center',
				field : 'charge',
				sortable : true,
				formatter : function(value, row, index) {
					if (value == 1) {
						return '收费';
					} else if (value == 0) {
						return '不收费';
					} else {
						return '';
					}

				}
			}, {
				width : '90',
				title : '重要等级',
				align : 'center',
				field : 'level',
				sortable : true,
				formatter : function(value, row, index) {
					if (value == 1) {
						return '一般';
					} else if (value == 2) {
						return '重要';
					} else if (value == 3) {
						return '紧急';
					} else {
						return '';
					}
				}
			}, {
				width : '100',
				title : '处理状态',
				align : 'center',
				field : 'taskState',
				sortable : true,
				formatter : function(value, row, index) {
					//0 未启动任务 1 已分配 2已接受(处理中) 4任务完成 3 未完成待续
					if (value == 0) {
						return '未启动';
					} else if (value == 1) {
						return '已分配';
					} else if (value == 2) {
						return '已接受';
					} else if (value == 3) {
						return '未完成待续';
					} else if (value == 4) {
						return '已完成';
					} else if(value == 5) {
						return '过期';
					}else{
						return '不合法';
					}

				}
			} ] ],
			toolbar : '#toolbar'
		});

	});

	function searchFun() {
		var queryParams = $('#dataGrid').datagrid('options').queryParams;
		queryParams.name = "";
		queryParams.level = -1;
		queryParams.charge = 0;

		var name = $('#taskName').val();
		var level = $('#level').combobox('getValue');
		var charge = $('#charge').combobox('getValue');
		if (!isEmpty(name)) {
			queryParams.name = name;
		}

		if (!isEmpty(level)) {
			queryParams.level = level;
		}

		if (!isEmpty(charge)) {
			queryParams.charge = charge;
		}

		//重新加载datagrid的数据  
		reloadGrid($("#dataGrid"));
	}

	function clearFun() {
		$('#taskName').val('');
		$('#level').combobox('clear');
		$('#charge').combobox('clear');
	}

	//任务查看
	function detailFun() {
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
			title : '维护档案详情',
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
			<c:when
				test="${fn:contains(sessionInfo.resourceList, '/task/historyDetail')}">
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

		<c:if test="${fn:contains(sessionInfo.resourceList, '/task/historySearch')}">
			<div id="searchbar" class="search-toolbar">
				<span>任务名称:</span> <input type="text" id="taskName" name="taskName">
				<span>重要等级:</span> <select id="level" class="easyui-combobox"
					name="level" style="width: 100px;" panelHeight="auto">
					<option value="0">--请选择--</option>
					<option value="1">一般</option>
					<option value="2">重要</option>
					<option value="3">紧急</option>
				</select> <span>是否收费:</span> <select id="charge" class="easyui-combobox"
					name="charge" style="width: 100px;" panelHeight="auto">
					<option value="0">--请选择--</option>
					<option value="1">是</option>
					<option value="2">否</option>
				</select> <a onclick="searchFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_search'">搜索</a> <a
					onclick="clearFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_clear'">清空</a>
			</div>
		</c:if>

	</div>

</body>
</html>