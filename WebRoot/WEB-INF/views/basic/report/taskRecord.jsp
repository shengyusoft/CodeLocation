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
<title>运维维护档案报表</title>
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
			pageList : [ 10, 20, 30, 40, 50, 100, 200, 300,
					400, 500 ],
			frozenColumns : [ [
					{
						width : '245',
						title : '任务名称',
						align : 'center',
						field : 'name',
						formatter : function(value, row, index) {
							if (isEmpty(value)) {
								return '';
							} else {
								if (isEmpty(row.id)) {
									return value;
								} else {
									var href = "<a href='#' onClick='detailFun("
											+ row.id
											+ ")'>"
											+ value + "</a>";
									return href;
								}
							}
						}
					},
					{
						width : '150',
						title : '运维工程师',
						align : 'center',
						field : 'acceptUserName',
						sortable : true
					},
					{
						width : '210',
						title : '实施地点',
						align : 'center',
						field : 'place',
						sortable : true
					},
					{
						width : '150',
						title : '执行日期',
						align : 'center',
						field : 'excuteDT',
						sortable : true
					},
					{
						width : '90',
						title : '状态',
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
							} else if (value == 5) {
								return '过期';
							} else {
								return '不合法';
							}
						}
					} ] ],
			toolbar : '#toolbar',
		});

	});

	function searchFun() {
		var queryParams = $('#dataGrid').datagrid('options').queryParams;
		queryParams.name = '';
		queryParams.place = '';
		queryParams.acceptUserName = "";
		queryParams.excuteDT = "";
		
		var name = $('#name').val();
		var excuteDT = $('#excuteDT').val();
		var acceptUserName = $('#acceptUserName').val();
		var place = $('#place').val();
		if (!isEmpty(name)) {
			queryParams.name = name;
		}

		if (!isEmpty(excuteDT)) {
			queryParams.excuteDT = excuteDT;
		}
		if (!isEmpty(acceptUserName)) {
			queryParams.acceptUserName = acceptUserName;
		}

		if (!isEmpty(place)) {
			queryParams.place = place;
		}

		//重新加载datagrid的数据  
		$("#dataGrid").datagrid('reload');
	}

	function clearFun() {
		$('#acceptUserName').val('');
		$('#place').val('');
		$('#name').val('');
		$('#excuteDT').val('');
	}

	//任务查看
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
	
	function printFun(){
		
		var acceptUserName = $('#acceptUserName').val();
		var name = $('#name').val();
		var place = $('#place').val();
		var excuteDT = $('#excuteDT').val();
		var url = ctxPath+"/report/print?acceptUserName="
				+acceptUserName+"&&name="
				+name+"&&place="
				+place+"&&excuteDT="+excuteDT;
		
		var tmp=window.open(url);
		tmp.focus();
	}
</script>
</head>
<body class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',fit:true,border:false">
		<table id="dataGrid" data-options="fit:true,border:false"></table>
	</div>
	<div id="toolbar" class="mygrid-toolbar" style="inline: false">
		<span>运维工程师:</span> 
		<input type="text" id="acceptUserName"name="acceptUserName"> 
		
		<span>任务名称:</span> 
		<input type="text" id="name"name="name"> 
		
		<span>实施地点:</span> 
		<input type="text"id="place" name="place"> 
		
		<span>执行日期:</span> <input class="Wdate" type="text" name="excuteDT" id="excuteDT"
			style="width: 120px; height: 100%;" onfocus="showDate('yyyy-MM-dd')" />

		<a onclick="searchFun();"
			href="javascript:void(0);" class="easyui-linkbutton"
			data-options="plain:true,iconCls:'icon_toolbar_search'">搜索</a> <a
			onclick="clearFun();" href="javascript:void(0);"
			class="easyui-linkbutton"
			data-options="plain:true,iconCls:'icon_toolbar_clear'">清空</a>
			
		
		
		<c:if test="${fn:contains(sessionInfo.resourceList, '/report/print')}">
			<div id="searchbar" class="search-toolbar">
				<a onclick="printFun();" href="javascript:void(0);"
						class="easyui-linkbutton"
						data-options="plain:true,iconCls:'icon_toolbar_detail'">打印预览 </a>
			</div>
		</c:if>
	</div>
</body>
</html>