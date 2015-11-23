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
<title>任务计划管理</title>
<script type="text/javascript">
	var dataGrid;
	$(function() {
		dataGrid = $('#dataGrid').datagrid({
			url : '${ctx}' + '/taskSchedule/dataGrid',
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
				field : 'taskName',
				formatter : function(value, row, index) {
					if (isEmpty(value)) {
						return '';
					} else {
						if(isEmpty(row.id)){
							return value;
						}else{
							var href="<a href='#' onClick='detailFun("+ row.taskId+")'>"+value+"</a>";
							return href;
						}
					}
				}
			}, {
				width : '100',
				title : '添加人',
				align : 'center',
				field : 'userName'
			}, {
				width : '120',
				title : '添加时间',
				align : 'center',
				field : 'addTime',
				sortable : true
			}, {
				width : '120',
				title : '首次执行时间',
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
				title : '计划期限',
				align : 'center',
				field : 'endDT',
				sortable : true,
				formatter : function(value, row, index) {
					if (isEmpty(value)) {
						return '';
					} else {
						return value.substring(0, value.indexOf(' '));
					}
				}
			}, {
				width : '100',
				title : '计划类型',
				align : 'center',
				sortable : true,
				field : 'sheduleType',
				formatter : function(value, row, index) {
					//1仅一次 2 每天 3 每周 4 每月
					if (value == 1) {
						return '仅一次';
					} else if (value == 2) {
						return '每天';
					} else if (value == 3) {
						return '每周';
					} else if(value == 4){
						return '每月';
					}else {
						return '';
					}
				}
			}, {
				width : '90',
				title : '提前执行',
				align : 'center',
				field : 'sheduleAdvice',
				sortable : true,
				formatter : function(value, row, index) {
					return value+'天';
				}
			}, {
				width : '90',
				title : '自动安排任务',
				align : 'center',
				field : 'isArrange',
				sortable : true,
				formatter : function(value, row, index) {
					if (value == 0) {
						return '自动安排';
					} else{
						return '手动安排';
					}
				}
			}, {
				width : '100',
				title : '执行状态',
				align : 'center',
				field : 'state',
				sortable : true,
				formatter : function(value, row, index) {
					//0 未执行(默认状态) 1 开始 2 进行中..3 已结束(任务到了规定的截止日) 4过期
					if (value == 0) {
						return '未启动';
					} else if (value == 1) {
						return '计划开始';
					} else if (value == 2) {
						return '进行中..';
					} else if (value == 3) {
						return '计划完成';
					} else if (value == 4) {
						return '计划过期';
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
		queryParams.taskName = "";
		queryParams.state = -1;

		var taskName = $('#taskName').val();
		var state = $('#state').combobox('getValue');
		if (!isEmpty(taskName)) {
			queryParams.taskName = taskName;
		}

		if (!isEmpty(state)) {
			queryParams.state = state;
		}

		//重新加载datagrid的数据  
		reloadGrid($("#dataGrid"));
	}

	function clearFun() {
		$('#taskName').val('');
		$('#state').combobox('clear');
	}

	//任务计划添加
	function addFun() {
		parent.$.modalDialog({
			title : '添加任务计划',
			width : '640',
			height : '380',
			resizable : true,
			href : '${ctx}/taskSchedule/showPage',
			buttons : [ 
			{
				text : '添加',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
					var f = parent.$.modalDialog.handler.find('#taskScheduleForm');
					f.submit();
				}
			},{
				text : '执行',
				handler : function() {
					parent.$.modalDialog.handler.find('#state').val(1);
					parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
					var f = parent.$.modalDialog.handler.find('#taskScheduleForm');
					f.submit();
				}
			}]
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

		parent.$.modalDialog({
			title : '编辑任务计划',
			width : '640',
			height : '380',
			href : '${ctx}/taskSchedule/showPage?id=' + id,
			buttons : [ 
						{
							text : '编辑',
							handler : function() {
								parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
								var f = parent.$.modalDialog.handler.find('#taskScheduleForm');
								f.submit();
							}
						},{
							text : '执行',
							handler : function() {
								parent.$.modalDialog.handler.find('#state').val(1);
								parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
								var f = parent.$.modalDialog.handler.find('#taskScheduleForm');
								f.submit();
							}
						}]
		});
	}
	
	function excuteFun() {
		
		var selected = '';
		var rows = $("#dataGrid").datagrid("getSelections");
		var successMsg = '您已经成功执行了' + rows.length + '个计划';
		for ( var i = 0; rows && i < rows.length; i++) {
			var row = rows[i];
			if (row.state > 0) {
				parent.$.messager.alert('警告', '所选记录不符合要求,计划' + row.taskName
						+ "已经开始执行了!", 'icon_warning');
				return;
			}
			selected += (i == 0) ? row.id : ',' + row.id;
		}
		
		if (isEmpty(selected)) {
			parent.$.messager.alert('警告', '至少选中一条记录!');
			return;
		}

		parent.$.messager.confirm('询问', '确认执行选中的计划吗？', function(b) {
			if (b) {
				progressLoad();
				$.post('${ctx}/taskSchedule/startTask', {
					ids : selected
				}, function(result) {
					if (result.success) {
						parent.$.messager.alert('提示', successMsg, 'info');
						dataGrid.datagrid('reload');
					}else{
						parent.$.messager.alert('提示', result.msg, 'info');
					}
					progressClose();
				}, 'JSON');
			}
		});
	}

	function deleteFun() {
		var selected = getSelected();
		if (isEmpty(selected)) {
			parent.$.messager.alert('警告', '至少选中一条记录!');
			return;
		}
		parent.$.messager.confirm('询问', '确认删除选中的记录吗？', function(b) {
			if (b) {
				progressLoad();
				$.post('${ctx}/taskSchedule/delete', {
					ids : selected
				}, function(result) {
					if (result.success) {
						parent.$.messager.alert('提示', result.msg, 'info');
						//删除成功后,前台删除行,防止下次再删除的时候可以取到之前选到的行
						var rows = dataGrid.datagrid("getSelections");
						for ( var i = 0; i < rows.length; i++) {
							var index = dataGrid.datagrid('getRowIndex',
									rows[i]);
							dataGrid.datagrid('deleteRow', index);
						}
						dataGrid.datagrid('reload');
					}
					progressClose();
				}, 'JSON');
			}
		});
	}

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
			<c:when test="${fn:contains(sessionInfo.resourceList, '/taskSchedule/add')}">
				<a onclick="addFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_add'">添加 </a>
			</c:when>
			<c:otherwise>
				<a href="javascript:void(0);" class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_add_disabled'"><font
					color="gray">添加</font> </a>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${fn:contains(sessionInfo.resourceList, '/taskSchedule/edit')}">
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
		<c:choose>
			<c:when
				test="${fn:contains(sessionInfo.resourceList, '/taskSchedule/delete')}">
				<a onclick="deleteFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_del'">删除 </a>
			</c:when>
			<c:otherwise>
				<a href="javascript:void(0);" class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_del_disabled'"><font
					color="gray">删除</font> </a>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when
				test="${fn:contains(sessionInfo.resourceList, '/taskSchedule/startTask')}">
				<a onclick="excuteFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_plan_start'">执行</a>
			</c:when>
			<c:otherwise>
				<a href="javascript:void(0);" class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_plan_start'"><font
					color="gray">执行</font> </a>
			</c:otherwise>
		</c:choose>

		<c:if test="${fn:contains(sessionInfo.resourceList, '/taskSchedule/search')}">
			<div id="searchbar" class="search-toolbar">
				<span>任务名称:</span> <input type="text" id="taskName" name="taskName">
				<span>计划状态:</span> <select id="state" class="easyui-combobox"
					name="state" style="width: 100px;" panelHeight="auto">
					<option value="-1">--请选择--</option>
					<option value="0">未启动</option>
					<option value="1">计划开始</option>
					<option value="2">进行中..</option>
					<option value="3">计划结束</option>
					<option value="4">计划过期</option>
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