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
<title>工资发放登记</title>
<script type="text/javascript">
	var dataGrid;
	$(function() {
		dataGrid = $('#dataGrid').datagrid({
			url : '${ctx}' + '/payrollRegister/dataGrid?processFlag=12',
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
				title : '姓名',
				sortable : true,
				align : 'center',
				field : 'name'
			}, {
				width : '90',
				title : '基本工资',
				sortable : true,
				align : 'center',
				field : 'basePay'
			},{
				width : '90',
				title : '工龄工资',
				sortable : true,
				align : 'center',
				field : 'agePay'
			},{
				width : '90',
				title : '绩效提成',
				align : 'center',
				field : 'royalty'
			},{
				width : '90',
				title : '养老保险',
				align : 'center',
				field : 'pensionInsurance'
			},{
				width : '90',
				title : '工伤保险',
				align : 'center',
				field : 'injuryInsurance'
			},{
				width : '90',
				title : '医疗保险',
				align : 'center',
				field : 'medicalInsurance'
			},{
				width : '90',
				title : '失业保险',
				align : 'center',
				field : 'joblessInsurance'
			},{
				width : '90',
				title : '住房公积金',
				align : 'center',
				field : 'homeFund'
			},{
				width : '90',
				title : '其它',
				align : 'center',
				field : 'other'
			},{
				width : '90',
				title : '应发工资',
				align : 'center',
				field : 'shouldPay'
			},{
				width : '90',
				title : '代扣代缴',
				align : 'center',
				field : 'withhold'
			},{
				width : '90',
				title : '罚款',
				align : 'center',
				field : 'fine'
			},{
				width : '90',
				title : '实发工资',
				align : 'center',
				field : 'realPay'
			},{
				width : '150',
				title : '备注',
				align : 'center',
				field : 'remark'
			}] ],

			toolbar : '#toolbar'
		});

	});

	function searchFun() {
		var queryParams = $('#dataGrid').datagrid('options').queryParams;
		queryParams.creatTime = "";
		var creatTime = $('#creatTime').val();
		queryParams.creatTime = isEmpty(creatTime) ? "" : creatTime;
		//重新加载datagrid的数据  
		reloadGrid($("#dataGrid"));
	}

	function clearFun() {
		$('#creatTime').val('');
	}

	function approvalCNFun() {
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
			href : '${ctx}/payrollRegister/approvalCNPage?id=' + id,
			buttons : [ {
				text : '编辑',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					var f = parent.$.modalDialog.handler
							.find('#payrollRegisterApprovalCNForm');
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
			title : '工资发放登记',
			width : 800,
			height : 320,
			href : '${ctx}/payrollRegister/detailPage?id=' + id,
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
				test="${fn:contains(sessionInfo.resourceList, '/payrollRegister/approvalCN')}">
				<a onclick="approvalCNFun();" href="javascript:void(0);"
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
				test="${fn:contains(sessionInfo.resourceList, '/payrollRegister/detail')}">
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
			test="${fn:contains(sessionInfo.resourceList, '/payrollRegister/search')}">
			<table style="width:900px;overflow: scroll;">
				<tr>
					<th>日期:</th>
					<td>
						<input class="Wdate" type="text" name=creatTime id="creatTime" style="height: 100%"
						onfocus="showDate('yyyy-MM')" /> 
					</td>
					<td><a onclick="searchFun();" href="javascript:void(0);"
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