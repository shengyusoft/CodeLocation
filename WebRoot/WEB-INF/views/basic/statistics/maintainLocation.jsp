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
<title>运维人员定位</title>
<script type="text/javascript">
	var dataGrid;
	$(function() {
		dataGrid = $('#dataGrid')
				.datagrid(
						{
							url : '${ctx}' + '/taskStatistics/maintainPosGrid',
							striped : true,
							rownumbers : true,
							pagination : true,
							nowrap : true,
							idField : 'id',
							sortName : 'id',
							sortOrder : 'desc',
							pageSize : 10,
							pageList : [ 10, 20, 30, 40, 50, 100, 200, 300,
									400, 500 ],
							frozenColumns : [ [
									{
										width : '150',
										title : '运维工程师',
										align : 'center',
										field : 'acceptUserName',
										sortable : true
									},
									{
										width : '210',
										title : '工作位置',
										align : 'center',
										field : 'place',
										sortable : true
									},
									{
										width : '245',
										title : '工作任务',
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
										title : '时间周期',
										align : 'center',
										field : 'timeLimitText',
										sortable : true
									},
									{
										width : '90',
										title : '状态',
										align : 'center',
										field : 'acceptState',
										sortable : true,
										formatter : function(value, row, index) {
											var content = null;
											if (value > 0) {
												content = '<a href="#" value='+value+' class="easyui-tooltip" style="color: red">异常</a>';
											} else {
												return '正常';
											}
											return content;
										}
									} ] ],
							toolbar : '#toolbar',
							onLoadSuccess : function(data) {
								dataGrid.datagrid('getPanel').find('.easyui-tooltip').each(function(){
									 var state = parseInt($(this).attr('value'));
									 var content = '';
									 if(state == 1){
										 content += '<span>任务过期且没有被接受</span>';
									 }else if(state == 2){
										 content += '<span>任务过期,没有被处理</span>';
									 }else if(state == 3){
										 content += '<span>任务被提前执行</span>';
									 }
									 
									 $(this).tooltip({
									 	content: $('<div style="border:0px;color="red"></div>'),
									 	onUpdate: function(cc){
											 cc.panel({
												 width:200,
												 content:content
											 });
										},
									 	position:'right'
									});
								});
							}
						});

	});

	function searchFun() {
		var queryParams = $('#dataGrid').datagrid('options').queryParams;
		queryParams.acceptUserName = "";
		queryParams.place = '';
		var acceptUserName = $('#acceptUserName').val();
		var place = $('#place').val();
		if (!isEmpty(acceptUserName)) {
			queryParams.acceptUserName = acceptUserName;
		}

		if (!isEmpty(place)) {
			queryParams.place = place;
		}

		//重新加载datagrid的数据  
		reloadGrid($("#dataGrid"));
	}

	function clearFun() {
		$('#acceptUserName').val('');
		$('#place').val('');
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
</script>
</head>
<body class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',fit:true,border:false">
		<table id="dataGrid" data-options="fit:true,border:false"></table>
	</div>
	<div id="toolbar" class="mygrid-toolbar" style="inline: false">
		<span>运维工程师:</span> <input type="text" id="acceptUserName"
			name="acceptUserName"> <span>工作位置:</span> <input type="text"
			id="place" name="place"> <a onclick="searchFun();"
			href="javascript:void(0);" class="easyui-linkbutton"
			data-options="plain:true,iconCls:'icon_toolbar_search'">搜索</a> <a
			onclick="clearFun();" href="javascript:void(0);"
			class="easyui-linkbutton"
			data-options="plain:true,iconCls:'icon_toolbar_clear'">清空</a>
	</div>
</body>
</html>