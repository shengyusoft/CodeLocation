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
<title>服务商管理</title>
<script type="text/javascript">
	var dataGrid;
	$(function() {
		//load the project type
		$('#dictionaryId').combobox(
			{
				url : "${pageContext.request.contextPath}/dictionary/combox?code=fwstype",
				parentField : 'dictionaryId',
				valueField : 'id',
				textField : 'text',
				panelHeight : 'auto'
		});

		dataGrid = $('#dataGrid').datagrid({
			url : '${ctx}' + '/merchant/dataGrid',
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
				title : '服务商编码',
				align : 'center',
				field : 'code'
			}, {
				width : '160',
				title : '服务商类型',
				align : 'center',
				field : 'dictionaryText'
			}, {
				width : '160',
				title : '服务商名称',
				field : 'name',
				align : 'center'
			}, {
				width : '200',
				title : '地址',
				align : 'center',
				field : 'address'
			}, {
				width : '160',
				title : '电子邮件',
				align : 'center',
				field : 'email'
			}, {
				width : '100',
				title : '邮编',
				align : 'center',
				field : 'postCode'
			}, {
				width : '100',
				title : '办公电话',
				align : 'center',
				field : 'officeNumber'
			} , {
				width : '100',
				title : '手机号码',
				align : 'center',
				field : 'mobilePhone'
			}] ],
			toolbar : '#toolbar'
		});

	});

	function searchFun() {
		var queryParams = $('#dataGrid').datagrid('options').queryParams;
		queryParams.dictionaryId = "";
		queryParams.name = "";
		var projectType=$('#dictionaryId').combobox('getValue');
		var merchantName = $('#merchantName').val();
		if (!isEmpty(projectType)) {
			queryParams.dictionaryId = projectType;
		}

		if (!isEmpty(merchantName)) {
			queryParams.name = merchantName;
		}

		//重新加载datagrid的数据  
		$("#dataGrid").datagrid('reload');
	}
	
	function clearFun() {
		$('#dictionaryId').combobox('clear');
		$('#merchantName').val('');
	}

	function addFun() {
		parent.$.modalDialog({
			title : '添加服务商',
			width : 700,
			height : 600,
			href : '${ctx}/merchant/addPage',
			buttons : [ {
				text : '添加',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
					var f = parent.$.modalDialog.handler
							.find('#merchantAddForm');
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
				$.post('${ctx}/merchant/delete', {
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
			title : '编辑服务商',
			width : 700,
			height : 600,
			href : '${ctx}/merchant/editPage?id=' + id,
			buttons : [ {
				text : '编辑',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					var f = parent.$.modalDialog.handler
							.find('#merchantAddForm');
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
			width : 700,
			height : 600,
			href : '${ctx}/merchant/detailPage?id=' + id,
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
			<c:when test="${fn:contains(sessionInfo.resourceList, '/merchant/add')}">
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
			<c:when test="${fn:contains(sessionInfo.resourceList, '/merchant/edit')}">
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
			<c:when test="${fn:contains(sessionInfo.resourceList, '/merchant/delete')}">
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
			<c:when test="${fn:contains(sessionInfo.resourceList, '/merchant/detail')}">
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
		
		<c:if test="${fn:contains(sessionInfo.resourceList, '/merchant/search')}">
			<div id="searchbar" class = "search-toolbar">
				<span>服务商类型:</span> 
				<select id="dictionaryId"
					name="dictionaryId" class="easyui-validatebox span2"
					style="width: 135px;">
				</select> 
				
				<span>服务商名称:</span> 
				<input type="text" id="merchantName"> 
				
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