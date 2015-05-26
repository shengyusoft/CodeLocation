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
<title>项目登记管理</title>
<script type="text/javascript">
	var dataGrid;
	$(function() {
		//init();
		dataGrid = $('#dataGrid').datagrid({
			url : '${ctx}' + '/projectRegist/dataGrid',
			striped : true,
			rownumbers : true,
			pagination : true,
			//fitColumns : true,
			nowrap : true,
			idField : 'id',
			sortName : 'id',
			sortOrder : 'desc',
			pageSize : 10,
			pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
			columns : [ [ {
				checkbox : true,
				field : 'id',
				width : '30',
			}, {
				width : '120',
				title : '公司名称',
				align : 'center',
				field : 'company',
				formatter : function(value, row, index) {
					return isEmpty(value)?'':value.text ;
				}
			}, {
				width : '120',
				title : '项目名称',
				sortable : true,
				align : 'center',
				field : 'projectName'
			}, {
				width : '120',
				title : '省',
				sortable : true,
				align : 'center',
				field : 'provice',
				formatter : function(value, row, index) {
					return isEmpty(value)?'':value.text;
				}
			}, {
				width : '120',
				title : '市',
				sortable : true,
				align : 'center',
				field : 'city',
				formatter : function(value, row, index) {
					return isEmpty(value)?'':value.text;
				}
			}, {
				width : '120',
				title : '县',
				sortable : true,
				align : 'center',
				field : 'county',
				formatter : function(value, row, index) {
					return isEmpty(value)?'':value.text;
				}
			}, {
				width : '120',
				title : '标段',
				align : 'center',
				field : 'bd',
				formatter : function(value, row, index) {
					return isEmpty(value)?'':value.text;
				}
			}, {
				width : '140',
				title : '资质要求',
				align : 'center',
				field : 'qualifyRequirement'
			}, {
				width : '120',
				title : '项目经理',
				sortable : true,
				align : 'center',
				field : 'projectMgr',
				formatter : function(value, row, index) {
					return isEmpty(value)?'':value.text;
				}
			}, {
				width : '120',
				title : '报名时间',
				sortable : true,
				align : 'center',
				field : 'registDT'
			} ] ],

			toolbar : '#toolbar'
		});

	});
	
	//必要的初始化
	function init(){
		$('#delegatorId').combobox({
			url : "${pageContext.request.contextPath}/dictionary/combox?code=wtr",
			parentField : 'dictionaryId',
			valueField : 'id',
			textField : 'text',
			panelHeight : 'auto'				
		});
	}
	
	function searchFun() {
		var queryParams = $('#dataGrid').datagrid('options').queryParams;
		queryParams.projectName = "";
		queryParams.st = "";
		queryParams.et = "";
		//queryParams['delegator.id'] = -1;
		//queryParams.delegator.id = -1;
		
		var projectName = $('#projectName').val();
		var st = $('#st').val();
		var et = $('#et').val();
		//var delegatorId = $('#delegatorId').combobox('getValue');
		
		if(!isEmpty(projectName)){
			queryParams.projectName = projectName;
		}
		if(!isEmpty(st)){
			queryParams.st = st;
		}
		if(!isEmpty(et)){
			queryParams.et = et;
		}
	/* 	if(!isEmpty(delegatorId)){
			queryParams['delegator.id'] = delegatorId;
		}else{
			queryParams['delegator.id'] = '';
		} */
		//重新加载datagrid的数据  
		$("#dataGrid").datagrid('reload');
	}

	function clearFun() {
		$('#projectName').val('');
		$('#st').val('');
		$('#et').val('');
		//$('#delegatorId').combobox('clear');
	}
	
	function addFun() {
		parent.$.modalDialog({
			title : '项目报名登记',
			width : 750,
			height : 490,
			href : '${ctx}/projectRegist/addPage?type=0',
			buttons : [ {
				text : '添加',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
					var f = parent.$.modalDialog.handler
							.find('#projectRegistAddForm');
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
				$.post('${ctx}/projectRegist/delete', {
					ids : selected
				}, function(result) {
					if (result.success) {
						parent.$.messager.alert('提示', result.msg, 'info');
						//删除成功后,前台删除行,防止下次再删除的时候可以取到之前选到的行
						removeSelectedRow(dataGrid);
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
			title : '项目报名登记编辑',
			width : 750,
			height : 490,
			href : '${ctx}/projectRegist/editPage?id=' + id,
			buttons : [ {
				text : '编辑',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					var f = parent.$.modalDialog.handler
							.find('#projectRegistEditForm');
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
			title : '项目报名登记详情',
			width : '815',
			height : '500',
			href : '${ctx}/projectRegist/detailPage?id=' + id,
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
				test="${fn:contains(sessionInfo.resourceList, '/projectRegist/add')}">
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
				test="${fn:contains(sessionInfo.resourceList, '/projectRegist/edit')}">
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
				test="${fn:contains(sessionInfo.resourceList, '/projectRegist/delete')}">
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
				test="${fn:contains(sessionInfo.resourceList, '/projectRegist/detail')}">
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

		<c:if test="${fn:contains(sessionInfo.resourceList, '/projectRegist/search')}">
			<table>
				<tr>
					
					<th>项目名称:</th>
					<td><input type="text" id="projectName"> </td>
					<th>时间段:</th>
					<td>
						<input class="Wdate" type="text" name="st" id="st"
						style="height: 100%" onfocus="showDate('yyyy-MM-dd HH:mm:ss')" /> - 
						<input class="Wdate" type="text" name="et" id="et" style="height: 100%"
						onfocus="showDate('yyyy-MM-dd HH:mm:ss')" /> 
					</td>
					<!-- <th>委托人:</th>
					<td>
						<select id="delegatorId" name="delegatorId" style="width:120px" 
						class="easyui-validatebox span2"></select>
					</td> -->
					<td>
						<a onclick="searchFun();" href="javascript:void(0);" class="easyui-linkbutton"
							data-options="plain:true,iconCls:'icon_toolbar_search'">搜索</a> 
					
						<a onclick="clearFun();" href="javascript:void(0);"class="easyui-linkbutton"
							data-options="plain:true,iconCls:'icon_toolbar_clear'">清空</a>
					</td>
				</tr>
			</table>
		</c:if>
	</div>
</body>
</html>