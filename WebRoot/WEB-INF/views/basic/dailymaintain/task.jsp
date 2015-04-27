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
<title>任务管理</title>
<script type="text/javascript">
	var dataGrid;
	$(function() {
		dataGrid = $('#dataGrid').datagrid({
			url : '${ctx}' + '/task/dataGrid',
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
					if (value == 0) {
						return '不收费';
					} else if (value == 1) {
						return '收费';
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
						return '<font color="red">待接受<font>';
					} else if (value == 2) {
						return '已接受';
					} else if (value == 3) {
						return '<font color="orange">处理中..</font>';
					} else if (value == 4) {
						return '<font color="green">已完成</font>';
					} else if (value == 5) {
						return '过期';
					} else {
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
		//queryParams.charge = 0;

		var name = $('#taskName').val();
		var level = $('#level').combobox('getValue');
		//var charge = $('#charge').combobox('getValue');
		if (!isEmpty(name)) {
			queryParams.name = name;
		}

		if (!isEmpty(level)) {
			queryParams.level = level;
		}

		/* if (!isEmpty(charge)) {
			queryParams.charge = charge;
		} */

		//重新加载datagrid的数据  
		$("#dataGrid").datagrid('reload');
	}

	function clearFun() {
		$('#taskName').val('');
		$('#level').combobox('clear');
		$('#charge').combobox('clear');
	}

	//任务添加
	function addFun() {
		parent.$.modalDialog({
			title : '添加新任务',
			width : '840',
			height : '600',
			resizable : true,
			href : '${ctx}/task/addPage',
			buttons : [ {
				text : '添加',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
					var f = parent.$.modalDialog.handler.find('#taskAddForm');
					f.submit();
				}
			} ]
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
				$.post('${ctx}/task/delete', {
					ids : selected
				}, function(result) {
					if (result.success) {
						parent.$.messager.alert('提示', result.msg, 'info');
						//删除成功后,前台删除行,防止下次再删除的时候可以取到之前选到的行
						removeSelectedRow(dataGrid);
						/* var rows = dataGrid.datagrid("getSelections");
						for ( var i = 0; i < rows.length; i++) {
							var index = dataGrid.datagrid('getRowIndex',
									rows[i]);
							dataGrid.datagrid('deleteRow', index);
						} */
						dataGrid.datagrid('reload');

						//TODO 这里有浏览器兼容问题
						$('input[type="checkbox"]').attr("checked", false);
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

		taskState = rows[0].taskState;
		if (taskState == 2) {
			parent.$.messager.alert('警告', '任务已经被接受,不可编辑,请先撤销');
			return;
		}

		if (taskState == 3) {
			parent.$.messager.alert('警告', '任务在处理中,不可编辑');
			return;
		}

		if (taskState == 4) {
			parent.$.messager.alert('警告', '任务已经完成,不可编辑');
			return;
		}

		parent.$.modalDialog({
			title : '编辑任务',
			width : '840',
			height : '600',
			href : '${ctx}/task/editPage?id=' + id,
			buttons : [ {
				text : '编辑',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					var f = parent.$.modalDialog.handler.find('#taskEditForm');
					f.submit();
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

		parent.$.modalDialog({
			title : '任务详情',
			width : '840',
			height : '600',
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

	//分配任务
	function assignFun() {
		var selected = '';
		var rows = $("#dataGrid").datagrid("getSelections");
		var successMsg = '您已经成功分配了' + rows.length + '项任务';
		for ( var i = 0; rows && i < rows.length; i++) {
			var row = rows[i];
			if (row.taskState > 0) {
				parent.$.messager.alert('警告', '所选记录不符合要求,任务' + row.name
						+ "已经被分配了!", 'icon_warning');
				return;
			}
			selected += (i == 0) ? row.id : ',' + row.id;
		}

		if (isEmpty(selected)) {
			parent.$.messager.alert('警告', '至少选中一条记录!');
			return;
		} else {
			parent.$.messager.confirm('确认', '确认分配所选的任务吗?', function(ok) {
				if (ok) {
					$.ajax({
						type : "post",
						url : ctxPath + "/task/assign",
						cache : false,
						data : {
							ids : selected
						},
						dataType : "json",
						success : function(result) {
							if (result.success) {
								parent.$.messager.alert('提示', successMsg,
										'icon_success');
								dataGrid.datagrid('reload');

							}
						},
						error : function(error) {
							alert(error);
						}

					});
				}
			});

		}

	}

	//撤销任务
	function cancelFun() {
		var selected = '';
		var rows = $("#dataGrid").datagrid("getSelections");
		var successMsg = '您已经成功撤销了' + rows.length + '项任务';
		for ( var i = 0; rows && i < rows.length; i++) {
			var row = rows[i];
			if (row.taskState == 0) {
				parent.$.messager.alert('警告', '任务' + row.name + "还没有被分配,不可撤销!",
						'icon_warning');
				return;
			}
			if (row.taskState > 2) {
				parent.$.messager.alert('警告',
						'任务' + row.name + "已经在处理中..不可撤销!", 'icon_warning');
				return;
			}
			selected += (i == 0) ? row.id : ',' + row.id;
		}

		if (isEmpty(selected)) {
			parent.$.messager.alert('警告', '至少选中一条记录!');
			return;
		} else {
			parent.$.messager.confirm('确认', '确认撤销所选的任务吗?', function(ok) {
				if (ok) {
					$.ajax({
						type : "post",
						url : ctxPath + "/task/cancel",
						cache : false,
						data : {
							ids : selected
						},
						dataType : "json",
						success : function(result) {
							if (result.success) {
								parent.$.messager.alert('提示', successMsg,
										'icon_success');
								dataGrid.datagrid('reload');

							}
						},
						error : function(error) {
							alert(error);
						}

					});
				}
			});

		}

	}

	//接受任务
	function acceptFun() {
		var selected = '';
		var rows = $("#dataGrid").datagrid("getSelections");
		var successMsg = '您已经成功接受了' + rows.length + '项任务:';
		for ( var i = 0; rows && i < rows.length; i++) {
			var row = rows[i];
			if (row.taskState > 1) {
				parent.$.messager.alert('警告', '所选记录不符合要求,任务' + row.name
						+ "已经被接受了!", 'icon_warning');
				return;
			}
			selected += (i == 0) ? row.id : ',' + row.id;
			successMsg += '<br>' + row.name;

		}

		if (isEmpty(selected)) {
			parent.$.messager.alert('警告', '至少选中一条记录!', 'icon_warning');
			return;
		}

		parent.$.messager.confirm('确认', '确认接受所选的任务吗?', function(ok) {
			if (ok) {
				$.ajax({
					type : "post",
					url : ctxPath + "/task/acceptBatch",
					cache : false,
					data : {
						ids : selected
					},
					dataType : "json",
					success : function(result) {
						if (result.success) {
							parent.$.messager.alert('提示', successMsg,
									'success', 'icon_remind');
							dataGrid.datagrid('reload');
						}
					},
					error : function(error) {
						alert(error);
					}

				});
			}
		});

	}

	//处理任务
	function handlerFun() {
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
			title : '处理任务',
			width : '870',
			height : '560',
			href : '${ctx}/task/handlerPage?id=' + id,
			buttons : [ {
				text : '提交',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					var f = parent.$.modalDialog.handler
							.find('#taskHandlerForm');
					f.submit();
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
			<c:when test="${fn:contains(sessionInfo.resourceList, '/task/add')}">
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
			<c:when test="${fn:contains(sessionInfo.resourceList, '/task/edit')}">
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
				test="${fn:contains(sessionInfo.resourceList, '/task/delete')}">
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
				test="${fn:contains(sessionInfo.resourceList, '/task/detail')}">
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

		<c:if test="${fn:contains(sessionInfo.resourceList, '/task/assign')}">
			<a onclick="assignFun();" href="javascript:void(0);"
				class="easyui-linkbutton"
				data-options="plain:true,iconCls:'icon_toolbar_task_assign'">分配
			</a>
		</c:if>

		<c:if test="${fn:contains(sessionInfo.resourceList, '/task/cancel')}">
			<a onclick="cancelFun();" href="javascript:void(0);"
				class="easyui-linkbutton"
				data-options="plain:true,iconCls:'icon_toolbar_task_undo'">撤销 </a>
		</c:if>

		<c:if test="${fn:contains(sessionInfo.resourceList, '/task/accept')}">
			<a onclick="acceptFun();" href="javascript:void(0);"
				class="easyui-linkbutton"
				data-options="plain:true,iconCls:'icon_toolbar_task_accept'">接受
			</a>
		</c:if>

		<c:if test="${fn:contains(sessionInfo.resourceList, '/task/handler')}">
			<a onclick="handlerFun();" href="javascript:void(0);"
				class="easyui-linkbutton"
				data-options="plain:true,iconCls:'icon_toolbar_task_handler'">处理
			</a>
		</c:if>

		<c:if test="${fn:contains(sessionInfo.resourceList, '/task/search')}">
			<div id="searchbar" class="search-toolbar">
				<span>任务名称:</span> <input type="text" id="taskName" name="taskName">
				<span>重要等级:</span> <select id="level" class="easyui-combobox"
					name="level" style="width: 100px;" panelHeight="auto">
					<option value="0">--请选择--</option>
					<option value="1">一般</option>
					<option value="2">重要</option>
					<option value="3">紧急</option>
				</select>
				<!-- <span>是否收费:</span> <select id="charge" class="easyui-combobox"
					name="charge" style="width: 100px;" panelHeight="auto">
					<option value="0">--请选择--</option>
					<option value="1">是</option>
					<option value="2">否</option>
				</select> -->
				<a onclick="searchFun();" href="javascript:void(0);"
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