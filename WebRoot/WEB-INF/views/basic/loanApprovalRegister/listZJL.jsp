<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../inc.jsp"></jsp:include>
<script type="text/javascript" src="${ctx}/jslib/easyui1.3.3/plugins/datagrid-groupview.js" charset="utf-8"></script>
<meta http-equiv="X-UA-Compatible" content="edge" />
<title>员工借款审批</title>
<script type="text/javascript">
	var dataGrid;
	$(function() {
		dataGrid = $('#dataGrid').datagrid({
			url : '${ctx}' + '/loanApprovalRegister/dataGrid?processFlag=-20',
			striped : true,
			pagination : true,
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
						return '<font color="green">总经理已通过</font>';
					}else if(value == "2"){
						return '<font color="green">出纳已通过</font>';
					}else if(value == "-1"){
						return '<font color="red">总经理已退回</font>';
					}else if(value == "-2"){
						return '<font color="red">出纳已退回</font>';
					}else{
						return "其他";
					}
				}
			}, {
				width : '120',
				title : '借款人',
				sortable : true,
				align : 'center',
				field : 'loan'
			}, {
				width : '100',
				title : '借款日期',
				sortable : true,
				align : 'center',
				field : 'loanDate',
				formatter : Common.formatter
			},{
				width : '100',
				title : '借款金额',
				sortable : true,
				align : 'center',
				field : 'loanMoney'
			},{
				width : '180',
				title : '借款事由',
				align : 'center',
				field : 'loanReason'
			}] ],

			toolbar : '#toolbar'
		});

	});

	function searchFun() {
		var queryParams = $('#dataGrid').datagrid('options').queryParams;
		queryParams.loan = "";
		queryParams.creatTime = "";

		var loan = $('#loan').val();
		var creatTime = $('#creatTime').val();

		queryParams.loan = isEmpty(loan) ? "" : loan;
		queryParams.creatTime = isEmpty(creatTime) ? "" : creatTime;
		
		//重新加载datagrid的数据  
		$("#dataGrid").datagrid('reload');
	}

	function clearFun() {
		$('#loan').val('');
		$('#creatTime').val('');
	}

	// 审批
	function approvalZJLFun() {
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
			title : '员工借款审批',
			width : 700,
			height : 250,
			href : '${ctx}/loanApprovalRegister/approvalZJLPage?id=' + id,
			buttons : [ {
				text : '提交',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					var f = parent.$.modalDialog.handler
							.find('#loanApprovalRegisterApprovalZJLForm');
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
			title : '员工借款审批',
			width : 800,
			height : 320,
			href : '${ctx}/loanApprovalRegister/detailPage?id=' + id,
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
				test="${fn:contains(sessionInfo.resourceList, '/loanApprovalRegister/approvalZJL')}">
				<a onclick="approvalZJLFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_edit'">审批 </a>
			</c:when>
			<c:otherwise>
				<a href="javascript:void(0);" class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_add_disabled'"><font
					color="gray">审批</font> </a>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when
				test="${fn:contains(sessionInfo.resourceList, '/loanApprovalRegister/detail')}">
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
			test="${fn:contains(sessionInfo.resourceList, '/loanApprovalRegister/search')}">
			<table style="width:900px;overflow: scroll;">
				<tr>
					<th>借款人:</th>
					<td><input type="text" id="loan"></td>
					<th>创建时间:</th>
					<td>
						<input class="Wdate" type="text" name="creatTime" id="creatTime" style="height: 100%"
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