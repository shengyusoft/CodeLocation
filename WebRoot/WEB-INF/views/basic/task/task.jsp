<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.wtkj.common.GlobalConstant"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../inc.jsp"></jsp:include>
<script type="text/javascript"
	src="${ctx}/jslib/easyui1.3.3/plugins/datagrid-groupview.js"
	charset="utf-8"></script>
<meta http-equiv="X-UA-Compatible" content="edge" />
<title>任务分配</title>
<script type="text/javascript">
	var dataGrid;
	$(function() {
		dataGrid = $('#dataGrid').datagrid({
			url : '${ctx}' + '/task/dataGrid',
			striped : true,
			fit : true,
			pagination : true,
			nowrap : true,
			idField : 'id',
			sortName : 'id',
			sortOrder : 'desc',
			pageSize : 10,
			pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
			columns : [ [
					{
						checkbox : true,
						field : 'id',
						width : '25'
					},
					{
						title : '序号',
						field : 'index',
						align : 'center',
						width : '40',
						formatter : function(value, row, index) {
							return index + 1;
						}
					},
					{
						width : '300',
						title : '任务主题',
						align : 'center',
						field : 'topic'
					},
					{
						width : '300',
						title : '任务描述',
						sortable : true,
						align : 'center',
						field : 'desciption'
					},
					{
						width : '60',
						title : '分配人',
						sortable : true,
						align : 'center',
						field : 'assignerName'
					},
					{
						width : '75',
						title : '分配时间',
						sortable : true,
						align : 'center',
						field : 'assignDt',
						formatter : Common.formatter
					},
					{
						width : '90',
						title : '要求完成时间',
						align : 'center',
						field : 'demandFinishDt',
						formatter : Common.formatter
					},
					{
						width : '100',
						title : '任务状态',
						align : 'center',
						field : 'state',
						formatter : function(val,row,index){
							if(row.effectState > 0){
								return '<font color="green">效果已确认</font>';
							}else if(row.handlerState == 1){
								return '<font color="blue">办理中</blue>';
							}else if(row.handlerState == 2){
								return '<font color="green">已办理</font>';
							}else if(row.assignState <= 0 ){
								return '<font color="red">未分配</font>';
							}else {
								return '<font color="green">已分配</font>(<font color="red">未办理</font>)';
							}
						}
					},
					{
						width : '60',
						title : '承办人',
						sortable : true,
						align : 'center',
						field : 'receiverName'
					},
					{
						width : '75',
						title : '承接时间',
						sortable : true,
						align : 'center',
						field : 'receiveDt',
						formatter : Common.formatter
					},
					{
						width : '90',
						title : '计划完成时间',
						sortable : true,
						align : 'center',
						field : 'planFinishDt',
						formatter : Common.formatter
					}, {
						width : '200',
						title : '完成情况描述',
						align : 'center',
						field : 'finshDesc'
					}] ],
			toolbar : '#toolbar'
		});
							

	});
	
	function viewFun(viewType) {
		var me = this,dwidth=1000,dheight=650,id=null;
		var title = '', href = '${ctx}/task/viewPage?viewType='+ viewType;
		var buttons = [];
		if ('add' == viewType) {
			title = '添加任务';
			buttons = [ {
				text : '保存',
				handler : me.submitForm
			}, {
				text : '退出',
				handler : me.closeDialog
			} ];
		}else{
			var rows = dataGrid.datagrid('getSelections');
			var row = rows[0];
			if (rows == null || rows.length == 0) {
				parent.$.messager.alert('警告', '没有可编辑对象!');
				return;
			}
			if (rows.length > 1) {
				parent.$.messager.alert('警告', '只能对一条记录编辑!');
				return;
			}
			id = row.id;
			href += '&id=' + id;
			
			if('edit' == viewType){
				if(row.handlerState == 1){
					alert('任务办理中不可修改！');
					return;
				}
				title = "编辑任务";
				buttons = [ {
					text : '编辑',
					handler : me.submitForm
				}, {
					text : '退出',
					handler : me.closeDialog
				} ];
			}else if('detail' == viewType){
				title = "任务详情";
				buttons = [{
					text : '退出',
					handler : me.closeDialog
				} ];
			}else if('handler' == viewType){
				if(row.effectState > 0){
					alert('任务效果已经确认，不可办理!');
					return;
				}
				title = "办理任务";
				buttons = [ {
					text : '保存',
					handler : me.submitForm
				}, {
					text : '退出',
					handler : me.closeDialog
				} ];
			}
			
		}
		parent.$.modalDialog({
			title : title,
			width : dwidth,
			height : dheight,
			href : href,
			buttons : buttons
		});
	}
	
	function deleteFun() {
		debugger;
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
						dataGrid.datagrid('reload');
					} else {
						parent.$.messager.alert('警告', result.msg, 'warning');
					}
					progressClose();
				}, 'JSON');
			}
		});
	}
	
	//提交form
	function submitForm() {
		//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
		parent.$.modalDialog.openner_dataGrid = dataGrid;
		var f = parent.$.modalDialog.handler.find('#taskEditForm');
		f.submit();
	}

	//关闭窗口
	function closeDialog() {
		parent.$.modalDialog.handler.dialog('close');
	}
	
	function searchFun() {
		var queryParams = $('#dataGrid').datagrid('options').queryParams;
		queryParams.assignerName = "";
		queryParams.pageAssignDtSt = "";
		queryParams.pageAssignDtEt = "";

		var assignerName = $('#assignerName').val();
		var st = $('#pageAssignDtSt').val();
		var et = $('#pageAssignDtEt').val();

		queryParams.assignerName = isEmpty(assignerName) ? "" : assignerName;
		queryParams.pageAssignDtSt = isEmpty(st) ? "" : st;
		queryParams.pageAssignDtEt = isEmpty(et) ? "" : et;
		
		//重新加载datagrid的数据  
		reloadGrid($("#dataGrid"));
	}
	
	function clearFun() {
		$('#assignerName').val('');
		$('#pageAssignDtSt').val('');
		$('#pageAssignDtEt').val('');
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
				test="${fn:contains(sessionInfo.resourceList, '/task/add')}">
				<a onclick="viewFun('<%=GlobalConstant.PAGE_TYPE_ADD%>');" href="javascript:void(0);"
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
				test="${fn:contains(sessionInfo.resourceList, '/task/edit')}">
				<a onclick="viewFun('<%=GlobalConstant.PAGE_TYPE_EDIT%>');" href="javascript:void(0);"
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
		
		<!-- 负责分配的人员没有办理权限,在菜单权限中给普通人员赋予任务管理菜单，不赋予任务添加修改删除的菜单 -->
		<c:if test="${fn:contains(sessionInfo.resourceList, '/task/handler')}">
			<a onclick="viewFun('handler');" href="javascript:void(0);"
				class="easyui-linkbutton"
				data-options="plain:true,iconCls:'icon_toolbar_task_handler'">办理
			</a>
		</c:if>

		<c:choose>
			<c:when
				test="${fn:contains(sessionInfo.resourceList, '/task/detail')}">
				<a onclick="viewFun('<%=GlobalConstant.PAGE_TYPE_DETAIL%>');" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_detail'">详情 </a>
			</c:when>
			<c:otherwise>
				<a href="javascript:void(0);" class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_detail_disabled'"><font
					color="gray">详情</font> </a>
			</c:otherwise>
		</c:choose>
		
		<a onclick="searchFun();" href="javascript:void(0);"
			class="easyui-linkbutton"
			data-options="plain:true,iconCls:'icon_toolbar_search'">搜索</a> 
		<a onclick="clearFun();" href="javascript:void(0);"
			class="easyui-linkbutton"
			data-options="plain:true,iconCls:'icon_toolbar_clear'">清空</a> 

		<table>
			<tr>
				<th>分配人:</th>
				<td><input type="text" id="assignerName"></td>
				<th>分配时间:</th>
				<td><input class="Wdate" type="text" name="pageAssignDtSt" id="pageAssignDtSt"
					style="height: 100%" onfocus="showDate('yyyy-MM-dd')" /> - <input
					class="Wdate" type="text" name="pageAssignDtEt" id="pageAssignDtEt" style="height: 100%"
					onfocus="showDate('yyyy-MM-dd')" /></td>
			</tr>
		</table>
	</div>
</body>
</html>