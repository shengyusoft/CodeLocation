<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../inc.jsp"></jsp:include>
<script type="text/javascript"
	src="${ctx}/jslib/easyui1.3.3/plugins/datagrid-groupview.js"
	charset="utf-8"></script>
<meta http-equiv="X-UA-Compatible" content="edge" />
<title>工程款到帐及拨付情况表</title>
<script type="text/javascript">
	var dataGrid;
	$(function() {
		dataGrid = $('#dataGrid').datagrid({
			url : '${ctx}' + '/projectAppropriateAccount/dataGrid',
			striped : true,
			rownumbers : true,
			pagination : true,
			nowrap : true,
			idField : 'id',
			sortName : 'id',
			sortOrder : 'desc',
			pageSize : 10,
			pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
			frozenColumns : [ [ {
				checkbox : true,
				field : 'id',
				rowspan : 2,
				width : '30',
			}, {
				width : '120',
				title : '项目名称',
				rowspan : 2,
				align : 'center',
				field : 'projectName'
			}, {
				width : '90',
				title : '中标价（元）',
				rowspan : 2,
				sortable : true,
				align : 'center',
				field : 'bidPrice'
			}, {
				width : '120',
				title : '管理费比例',
				rowspan : 2,
				sortable : true,
				align : 'center',
				field : 'managerFeeRate'
			}, {
				width : '120',
				title : '管理费数额',
				rowspan : 2,
				sortable : true,
				align : 'center',
				field : 'managerFee'
			}, {
				width : '120',
				title : '中标日期',
				rowspan : 2,
				sortable : true,
				align : 'center',
				field : 'bidDT'
			}, {
				width : '90',
				title : '合同工期',
				rowspan : 2,
				align : 'center',
				field : 'contractDuration'
			}, {
				width : '90',
				title : '状态',
				rowspan : 2,
				align : 'center',
				field : 'state',
				formatter : function(value, row, index) {
					return value == 0?'<font color="red">待确认</font>':'<font color="green">已确认</font>';
				}
			} ] ],

			columns : [ [ {
				title : '联系人信息',
				colspan : 3,
				align : 'center'
			}, {
				title : '收款人信息',
				colspan : 3,
				align : 'center'
			}, {
				width : '90',
				title : '备注',
				rowspan : 2,
				align : 'center',
				field : 'remark'
			} ], [ {
				width : '80',
				title : '姓名',
				rowspan : 2,
				sortable : true,
				align : 'center',
				field : 'contactName'
			}, {
				width : '120',
				title : '电话',
				rowspan : 2,
				sortable : true,
				align : 'center',
				field : 'contactTel'
			}, {
				width : '120',
				title : '身份证号',
				rowspan : 2,
				align : 'center',
				field : 'contactIdCard'
			},{
				width : '100',
				title : '户名',
				rowspan : 2,
				sortable : true,
				align : 'center',
				field : 'payee'
			}, {
				width : '120',
				title : '开户行',
				rowspan : 2,
				sortable : true,
				align : 'center',
				field : 'bank'
			}, {
				width : '120',
				title : '帐号',
				rowspan : 2,
				align : 'center',
				field : 'accountNum'
			} ] ],

			toolbar : '#toolbar'
		});

	});

	function searchFun() {
		var queryParams = $('#dataGrid').datagrid('options').queryParams;
		queryParams.projectName = "";
		var projectName = $('#projectName').val();
		if (!isEmpty(projectName)) {
			queryParams.projectName = projectName;
		}
		//重新加载datagrid的数据  
		$("#dataGrid").datagrid('reload');
	}

	function clearFun() {
		$('#projectName').val('');
		//$('#stationId').combobox('clear');
	}

	function addFun() {
		parent.$.modalDialog({
			title : '工程款拨付登记',
			width : document.body.clientWidth*0.75,
			height : 400,
			href : '${ctx}/projectAppropriateReg/addPage',
			buttons : [ {
				text : '添加',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
					var f = parent.$.modalDialog.handler
							.find('#projectAppropriateRegAddForm');
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
				$.post('${ctx}/projectAppropriateReg/delete', {
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
	
	function confirmFun() {
		var selected = getSelected();
		if (isEmpty(selected)) {
			parent.$.messager.alert('警告', '至少选中一条记录!');
			return;
		}
		parent.$.messager.confirm('询问', '对选择的工程款拨付加以确认？', function(b) {
			if (b) {
				progressLoad();
				$.post('${ctx}/projectAppropriateReg/confirm', {
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

		parent.$.modalDialog({
			title : '工程款拨付修改',
			width : document.body.clientWidth*0.75,
			height : 400,
			href : '${ctx}/projectAppropriateReg/editPage?id=' + id,
			buttons : [ {
				text : '编辑',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					var f = parent.$.modalDialog.handler
							.find('#projectAppropriateRegEditForm');
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
			title : '工程款拨付详情',
			width : document.body.clientWidth*0.75,
			height : 400,
			href : '${ctx}/projectAppropriateReg/detailPage?id=' + id,
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
	<div id="toolbar" class="mygrid-toolbar" style="inline: true">
		<c:choose>
			<c:when
				test="${fn:contains(sessionInfo.resourceList, '/projectAppropriateReg/add')}">
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
			<c:when
				test="${fn:contains(sessionInfo.resourceList, '/projectAppropriateReg/edit')}">
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
				test="${fn:contains(sessionInfo.resourceList, '/projectAppropriateReg/delete')}">
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
				test="${fn:contains(sessionInfo.resourceList, '/projectAppropriateReg/detail')}">
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
		
		<c:choose>
			<c:when
				test="${fn:contains(sessionInfo.resourceList, '/projectAppropriateReg/confirm')}">
				<a onclick="confirmFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_audit'">处理</a>
			</c:when>
			<c:otherwise>
				<a href="javascript:void(0);" class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_audit_disabled'"><font
					color="gray">处理</font> </a>
			</c:otherwise>
		</c:choose>

		<c:if
			test="${fn:contains(sessionInfo.resourceList, '/projectAppropriateReg/search')}">
			<div id="searchbar" class="search-toolbar">
				<span>项目名称:</span> <input type="text" id="projectName"> <a
					onclick="searchFun();" href="javascript:void(0);"
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