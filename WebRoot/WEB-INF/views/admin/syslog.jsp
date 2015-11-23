<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../inc.jsp"></jsp:include>
<meta http-equiv="X-UA-Compatible" content="edge" />
<title>日志管理</title>
<script type="text/javascript">
	var dataGrid;
	$(function() {
		dataGrid = $('#dataGrid').datagrid({
			url : '${ctx}' + '/syslog/dataGrid',
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
				width : '300',
				title : '登录账号',
				align : 'center',
				field : 'loginUserAccount'
			}, {
				width : '300',
				title : '用户名',
				align : 'center',
				field : 'loginUserName'
			}, {
				width : '220',
				title : '登录时间',
				align : 'center',
				field : 'loginDT',
				sortable : true,
				formatter : function(value, row, index) {
					if(isEmpty(value)){
						return '';
					}else{
						return value.substring(0,value.indexOf(' '));
					}
				}
			}, {
				width : '220',
				title : '登录IP地址',
				align : 'center',
				field : 'clientIP'
			}] ],
			toolbar : '#toolbar'
		});

	});

	function searchFun() {
		var queryParams = $('#dataGrid').datagrid('options').queryParams;
		queryParams.loginUserName = "";
		queryParams.clientIP = "";
		
		var loginUserName = $('#loginUserName').val();
		var clientIP = $('#clientIP').val();
		if (!isEmpty(loginUserName)) {
			queryParams.loginUserName = loginUserName;
		}

		if (!isEmpty(clientIP)) {
			queryParams.clientIP = clientIP;
		}

		//重新加载datagrid的数据  
		reloadGrid($("#dataGrid"));
	}
	
	function clearFun() {
		$('#loginUserName').val('');
		$('#clientIP').val('');
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
				$.post('${ctx}/syslog/delete', {
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
	
	function clearLogFun() {
		parent.$.messager.confirm('询问', '确认清空日志吗？', function(b) {
			if (b) {
				progressLoad();
				$.post('${ctx}/syslog/clear', function(result) {
					if (result.success) {
						parent.$.messager.alert('提示', result.msg, 'info');
						//删除成功后,前台删除行,防止下次再删除的时候可以取到之前选到的行
						var item = dataGrid.datagrid('getRows');
			            if (item) {
			                for (var i = item.length - 1; i >= 0; i--) {
			                    var index = dataGrid.datagrid('getRowIndex', item[i]);
			                    dataGrid.datagrid('deleteRow', index);
			                }
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
	<div id="toolbar" class="mygrid-toolbar" style="inline:true">
		<c:choose>
			<c:when test="${fn:contains(sessionInfo.resourceList, '/syslog/delete')}">
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
			<c:when test="${fn:contains(sessionInfo.resourceList, '/syslog/clear')}">
			<a onclick="clearLogFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_clear'">清空日志 </a>
			</c:when>
			<c:otherwise>
			<a  href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_clear'"><font color="gray">清空日志</font> </a>
			</c:otherwise>
		</c:choose>
		
		<c:if test="${fn:contains(sessionInfo.resourceList, '/syslog/search')}">
			<div id="searchbar" class = "search-toolbar">
				<span>用户名称:</span> 
				<input type="text" id="loginUserName"> 
				<span>ip地址:</span> 
				<input type="text" id="clientIP"> 
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