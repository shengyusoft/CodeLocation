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
<title>绩效提成</title>
<script type="text/javascript">
	var dataGrid;
	$(function() {
		dataGrid = $('#dataGrid').datagrid({
			url : '${ctx}' + '/scoreCutRegister/dataGrid?processFlag=-31',
			striped : true,
			pagination : true,
			nowrap : true,
			idField : 'id',
			sortName : 'id',
			sortOrder : 'desc',
			pageSize : getDefaultPageSize(),
			pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
			columns : [ [ {
				checkbox : true,
				field : 'id',
				width : '30',
			},{
				title : '序号',
				field : 'index',
				align : 'center',
				width : '40',
				formatter : function(value, row, index) {
					return index+1;
				}
			}, {
				width : '120',
				title : '状态',
				sortable : true,
				align : 'center',
				field : 'processFlag',
				formatter : function(value, row, index) {
					if(value == "0"){
						return "已申请";
					}else if(value == "1"){
						return '<font color="green">核对通过</font>';
					}else if(value == "2"){
						return '<font color="green">审批通过</font>';
					}else if(value == "3"){
						return '<font color="green">办理完成</font>';
					}else if(value == "-1"){
						return '<font color="red">核对不通过</font>';
					}else if(value == "-2"){
						return '<font color="red">审批不通过</font>';
					}else if(value == "-3"){
						return '<font color="red">办理未完成</font>';
					}else{
						return "其他";
					}
				}
			}, {
				width : '150',
				title : '项目名称',
				sortable : true,
				align : 'center',
				field : 'projectName'
			}, {
				width : '90',
				title : '单位',
				sortable : true,
				align : 'center',
				field : 'unit'
			},{
				width : '90',
				title : '数量',
				sortable : true,
				align : 'center',
				field : 'num'
			},{
				width : '90',
				title : '完成时间',
				align : 'center',
				field : 'finishDate',
				formatter : Common.formatter
			},{
				width : '90',
				title : '费用名称',
				align : 'center',
				field : 'costName'
			},{
				width : '120',
				title : '绩效提成金额（元）',
				align : 'center',
				field : 'amount'
			},{
				width : '160',
				title : '备注',
				align : 'center',
				field : 'remark'
			}] ],

			toolbar : '#toolbar'
		});

	});

	function searchFun() {
		var queryParams = $('#dataGrid').datagrid('options').queryParams;
		queryParams.projectName = "";
		queryParams.bidder = "";
		queryParams.registerName = "";
		queryParams.st = "";
		queryParams.et = "";

		var projectName = $('#projectName').val();
		var bidder = $('#bidder').val();
		var registerName = $('#registerName').val();
		var st = $('#st').val();
		var et = $('#et').val();

		queryParams.projectName = isEmpty(projectName)?"":projectName;
		queryParams.bidder = isEmpty(bidder)?"":bidder;
		queryParams.registerName = isEmpty(registerName)?"":registerName;
		queryParams.st = isEmpty(st)?"":st;
		queryParams.et = isEmpty(et)?"":et;
		
		//重新加载datagrid的数据  
		reloadGrid($("#dataGrid"));
	}

	function clearFun() {
		$('#projectName').val('');
		$('#bidder').val('');
		$('#registerName').val('');
		$('#st').val('');
		$('#et').val('');
	}

	function approvalSPFun() {
		var id = null;
		var rows = dataGrid.datagrid('getSelections');
		if (rows == null || rows.length == 0) {
			parent.$.messager.alert('警告', '没有可审批对象!');
			return;
		}

		if (rows.length > 1) {
			parent.$.messager.alert('警告', '每次只能审批一条记录!');
			return;
		}

		id = rows[0].id;

		parent.$.modalDialog({
			title : '工资发放',
			width : 800,
			height : 230,
			href : '${ctx}/scoreCutRegister/approvalSPPage?id=' + id,
			buttons : [ {
				text : '编辑',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					var f = parent.$.modalDialog.handler
							.find('#scoreCutRegisterapprovalSPForm');
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
			title : '绩效提成',
			width : 800,
			height : 320,
			href : '${ctx}/scoreCutRegister/detailPage?id=' + id,
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
				test="${fn:contains(sessionInfo.resourceList, '/scoreCutRegister/approvalSP')}">
				<a onclick="approvalSPFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_add'">审批 </a>
			</c:when>
			<c:otherwise>
				<a href="javascript:void(0);" class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_add_disabled'"><font
					color="gray">审批</font> </a>
			</c:otherwise>
		</c:choose>

		<c:choose>
			<c:when
				test="${fn:contains(sessionInfo.resourceList, '/scoreCutRegister/detail')}">
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

		<c:if
			test="${fn:contains(sessionInfo.resourceList, '/scoreCutRegister/search')}">
			<table style="width:900px;overflow: scroll;">
				<tr>
					<!-- <th>项目名称:</th>
					<td><input type="text" id="projectName"></td> -->
					<th>投标人:</th>
					<td><input type="text" id="bidder"></td>
					<th>登记人:</th>
					<td><input type="text" id="registerName"></td>
					<th>登记时间段:</th>
					<td>
						<input class="Wdate" type="text" name="st" id="st"
						style="height: 100%" onfocus="showDate('yyyy-MM-dd')" /> - 
						<input class="Wdate" type="text" name="et" id="et" style="height: 100%"
						onfocus="showDate('yyyy-MM-dd')" /> 
					</td>
					<td rowspan="2"><a onclick="searchFun();" href="javascript:void(0);"
						class="easyui-linkbutton"
						data-options="plain:true,iconCls:'icon_toolbar_search'">搜索</a> <a
						onclick="clearFun();" href="javascript:void(0);"
						class="easyui-linkbutton"
						data-options="plain:true,iconCls:'icon_toolbar_clear'">清空</a></td>
				</tr>
			</table>
		</c:if>
	</div>
</body>
</html>