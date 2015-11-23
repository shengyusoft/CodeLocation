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
			url : '${ctx}' + '/pointInspect/dataGrid',
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
				width : '300',
				title : '巡点记录名称',
				align : 'center',
				field : 'name'
			}, {
				width : '240',
				title : '添加人',
				align : 'center',
				field : 'userName'
			}, {
				width : '240',
				title : '添加时间',
				align : 'center',
				field : 'createDT',
				sortable : true
			}, {
				width : '300',
				title : '附件列表',
				align : 'center',
				field : 'attachmentIds',
				sortable : true,
				formatter : function(value, row, index) {
					if(isEmpty(value)){
						return "无附件";
					}else{
						var size = value.split(',').length;
						if(size == 1){
							var path = ctxPath + "/fileup/download?id=" + value;
							var href = "<a href=" + path + "><u>下载附件</u></a>";
							return href;
						}
						return "<a href='#' onClick=\"showAttach(\'"+value+"\')\">多个附件(点击查看)</a>";
					}
				}
			}] ],
			toolbar : '#toolbar'
		});

	});
	
	function showAttach(ids){
		if(isEmpty(ids)){
			return;
		}
		
		parent.$.modalDialog({
			title : '巡点记录附件下载列表',
			width : '500',
			height : '220',
			resizable : true,
			href : "${ctx}/fileup/attachPage?ids="+ids
		});
	}

	function searchFun() {
		var queryParams = $('#dataGrid').datagrid('options').queryParams;
		queryParams.name = "";
		var name = $('#name').val();
		if (!isEmpty(name)) {
			queryParams.name = name;
		}
		//重新加载datagrid的数据  
		reloadGrid($("#dataGrid"));
	}

	function clearFun() {
		$('#name').val('');
	}

	//任务添加
	function addFun() {
		parent.$.modalDialog({
			title : '添加巡点记录',
			width : '500',
			height : '300',
			resizable : true,
			href : '${ctx}/pointInspect/showPage',
			buttons : [ 
			{
				text : '添加',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
					var f = parent.$.modalDialog.handler.find('#pointInspectForm');
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
			title : '编辑任务',
			width : '500',
			height : '300',
			href : '${ctx}/pointInspect/showPage?id=' + id,
			buttons : [
				{
					text : '编辑',
					handler : function() {
						parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
						var f = parent.$.modalDialog.handler.find('#pointInspectForm');
						f.submit();
					}
				}
			]
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
				$.post('${ctx}/pointInspect/delete', {
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
</script>
</head>
<body class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',fit:true,border:false">
		<table id="dataGrid" data-options="fit:true,border:false"></table>
	</div>
	<div id="toolbar" class="mygrid-toolbar" style="inline: false">

		<c:choose>
			<c:when test="${fn:contains(sessionInfo.resourceList, '/pointInspect/add')}">
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
			<c:when test="${fn:contains(sessionInfo.resourceList, '/pointInspect/edit')}">
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
				test="${fn:contains(sessionInfo.resourceList, '/pointInspect/delete')}">
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
		
		<c:if test="${fn:contains(sessionInfo.resourceList, '/pointInspect/search')}">
			<div id="searchbar" class="search-toolbar">
				<span>巡点记录名称:</span> <input type="text" id="name" name="name">
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