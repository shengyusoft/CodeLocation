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
<title>项目管理</title>
<script type="text/javascript">
	var dataGrid;
	$(function() {
		//load the project type
		$('#dictionaryId').combobox(
			{
				url : "${pageContext.request.contextPath}/dictionary/combox?code=xmlxtype",
				parentField : 'dictionaryId',
				valueField : 'id',
				textField : 'text',
				panelHeight : 'auto'
		});

		dataGrid = $('#dataGrid').datagrid({
			url : '${ctx}' + '/project/dataGrid',
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
				width : '30',
			}, {
				width : '90',
				title : '项目编码',
				align : 'center',
				field : 'code'
			}, {
				width : '90',
				title : '项目类别',
				align : 'center',
				field : 'dictionaryText'
			}, {
				width : '200',
				title : '项目名称',
				field : 'name',
				align : 'center'
			}, {
				width : '150',
				title : '承包单位',
				align : 'center',
				field : 'merchantText'
			}, {
				width : '100',
				title : '项目经理',
				field : 'projectMangerName',
				align : 'center'
			}, {
				width : '90',
				title : '项目金额',
				field : 'projectAmount',
				align : 'center'
			}, {
				width : '120',
				title : '建设时间',
				align : 'center',
				field : 'startDT',
				sortable : true,
				formatter : function(value, row, index) {
					if(isEmpty(value)){
						return '';
					}else{
						return value.substring(0,value.indexOf(' '));
					}
				}
			}, {
				width : '120',
				title : '结束时间',
				align : 'center',
				field : 'endDT',
				sortable : true,
				formatter : function(value, row, index) {
					if(isEmpty(value)){
						return '';
					}else{
						return value.substring(0,value.indexOf(' '));
					}
				}
			}, {
				width : '120',
				title : '验收时间',
				align : 'center',
				field : 'checkDT',
				sortable : true,
				formatter : function(value, row, index) {
					if(isEmpty(value)){
						return '';
					}else{
						return value.substring(0,value.indexOf(' '));
					}
				}
			} ] ],
			toolbar : '#toolbar'
		});

	});

	function searchFun() {
		var queryParams = $('#dataGrid').datagrid('options').queryParams;
		queryParams.dictionaryId = "";
		queryParams.name = "";
		var projectType=$('#dictionaryId').combobox('getValue');
		var projectName = $('#projectName').val();
		if (!isEmpty(projectType)) {
			queryParams.dictionaryId = projectType;
		}

		if (!isEmpty(projectName)) {
			queryParams.name = projectName;
		}

		//重新加载datagrid的数据  
		reloadGrid($("#dataGrid"));
	}
	
	function clearFun() {
		$('#dictionaryId').combobox('clear');
		$('#projectName').val('');
	}

	function addFun() {
		parent.$.modalDialog({
			title : '添加项目',
			width : 750,
			height : 490,
			href : '${ctx}/project/addPage',
			buttons : [ {
				text : '添加',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
					var f = parent.$.modalDialog.handler
							.find('#projectAddForm');
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
				$.post('${ctx}/project/delete', {
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
					}else{
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
			title : '编辑',
			width : 750,
			height : 490,
			href : '${ctx}/project/editPage?id=' + id,
			buttons : [ {
				text : '编辑',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					var f = parent.$.modalDialog.handler
							.find('#projectEditForm');
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
			title : '详情',
			width : 750,
			height : 430,
			href : '${ctx}/project/detailPage?id=' + id,
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
	<div id="toolbar" class="mygrid-toolbar" style="inline:true">

		<c:choose>
			<c:when test="${fn:contains(sessionInfo.resourceList, '/project/add')}">
			<a onclick="addFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_add'">添加 </a>
			</c:when>
			<c:otherwise>
			<a href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_add_disabled'"><font color="gray">添加</font> </a>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${fn:contains(sessionInfo.resourceList, '/project/edit')}">
			<a onclick="editFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_edit'">编辑</a>
			</c:when>
			<c:otherwise>
			<a href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_edit_disabled'"><font color="gray">编辑</font> </a>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${fn:contains(sessionInfo.resourceList, '/project/delete')}">
			<a onclick="deleteFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_del'">删除 </a>
			</c:when>
			<c:otherwise>
			<a  href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_del_disabled'"><font color="gray">删除</font> </a>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${fn:contains(sessionInfo.resourceList, '/project/detail')}">
			<a onclick="detailFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_detail'">详情 </a>
			</c:when>
			<c:otherwise>
			<a  href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_detail_disabled'"><font color="gray">详情</font> </a>
			</c:otherwise>
		</c:choose>
		
		<c:if test="${fn:contains(sessionInfo.resourceList, '/project/search')}">
			<div id="searchbar" class = "search-toolbar">
				<span>项目类型:</span> 
				<select id="dictionaryId"
					name="dictionaryId" class="easyui-validatebox span2"
					style="width: 135px;">
				</select> 
				
				<span>项目名称:</span> 
				<input type="text" id="name"> 
				
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