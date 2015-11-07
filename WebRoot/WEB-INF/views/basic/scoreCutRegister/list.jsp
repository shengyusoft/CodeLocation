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
			url : '${ctx}' + '/scoreCutRegister/dataGrid',
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
						return "初始化";
					}else if(value == "1"){
						return '<font color="green">已申请</font>';
					}else if(value == "2"){
						return '<font color="green">会计审批通过</font>';
					}else if(value == "3"){
						return '<font color="green">总经理审批通过</font>';
					}else if(value == "4"){
						return '<font color="green">【财务出纳成功】</font>';
					}else if(value == "-2"){
						return '<font color="red">【会计审核退回】</font>';
					}else if(value == "-3"){
						return '<font color="red">【总经理审核退回】</font>';
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

	// 查询
	function searchFun() {
		var queryParams = $('#dataGrid').datagrid('options').queryParams;
		queryParams.st = "";
		queryParams.et = "";
// 		queryParams.projectName = "";
// 		queryParams.bidder = "";
// 		queryParams.registerName = "";

// 		var projectName = $('#projectName').val();
// 		var bidder = $('#bidder').val();
// 		var registerName = $('#registerName').val();
		var st = $('#st').val();
		var et = $('#et').val();

// 		queryParams.projectName = isEmpty(projectName)?"":projectName;
// 		queryParams.bidder = isEmpty(bidder)?"":bidder;
// 		queryParams.registerName = isEmpty(registerName)?"":registerName;
		queryParams.st = isEmpty(st)?"":st;
		queryParams.et = isEmpty(et)?"":et;
		
		//重新加载datagrid的数据  
		$("#dataGrid").datagrid('reload');
	}

	function clearFun() {
		$('#projectName').val('');
		$('#bidder').val('');
		$('#registerName').val('');
		$('#st').val('');
		$('#et').val('');
	}

	// 添加
	function addFun() {
		parent.$.modalDialog({
			title : '绩效提成',
			width : 700,
			height : 280,
			href : '${ctx}/scoreCutRegister/addPage',
			buttons : [ {
				text : '保存',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
					parent.$.modalDialog.handler.find('#option').val(0);
					var f = parent.$.modalDialog.handler.find('#scoreCutRegisterAddForm');
					f.submit();
				}
			},{
				text : '申请',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = dataGrid;
					parent.$.modalDialog.handler.find('#option').val(1);
					var f = parent.$.modalDialog.handler.find('#scoreCutRegisterAddForm');
					f.submit();
				}
			},{
				text : '退出',
				handler : function() {
					parent.$.modalDialog.handler.dialog('close');
				}
			} ]
		});
	}

	// 删除
	function deleteFun() {
		var selected = getSelected();
		if (isEmpty(selected)) {
			parent.$.messager.alert('警告', '至少选中一条记录!');
			return;
		}
		parent.$.messager.confirm('询问', '确认删除选中的记录吗？', function(b) {
			if (b) {
				progressLoad();
				$.post('${ctx}/scoreCutRegister/delete', {
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
	// 编辑
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
			title : '绩效提成',
			width : 700,
			height : 280,
			href : '${ctx}/scoreCutRegister/editPage?id=' + id,
			buttons : [ {
				text : '编辑',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					parent.$.modalDialog.handler.find('#option').val(2);
					var f = parent.$.modalDialog.handler.find('#scoreCutRegisterEditForm');
					f.submit();
				}
			},{
				text : '申请',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = dataGrid;
					parent.$.modalDialog.handler.find('#option').val(1);
					var f = parent.$.modalDialog.handler.find('#scoreCutRegisterEditForm');
					f.submit();
				}
			},{
				text : '退出',
				handler : function() {
					parent.$.modalDialog.handler.dialog('close');
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
			width : 700,
			height : 280,
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
	
	/*  审核  */
	function approvalFun() {
		var rows = dataGrid.datagrid('getSelections');
		if (rows == null || rows.length == 0) {
			parent.$.messager.alert('警告', '没有审核对象!');
			return;
		}
	
		if (rows.length > 1) {
			parent.$.messager.alert('警告', '只能审核一条记录!');
			return;
		}
		// 流程主键
		var processId = rows[0].processId;
		var id = rows[0].id;
	
		parent.$.modalDialog({
			title : '员工借款审批',
			width : '700',
			height : '450',
			resizable : true,
			href : ctxPath + '/scoreCutRegister/approvalPage?id=' + id + '&processId=' + processId,
			buttons : [{
					text : '通过',
					handler : function () {
						var f = parent.$.modalDialog.handler.find('#scoreCutRegisterApprovalForm');
						parent.$.modalDialog.openner_dataGrid = dataGrid;
						parent.$.modalDialog.handler.find('#option').val(0);
						f.submit();
					}
				}, {
					text : '退回',
					handler : function () {
						var f = parent.$.modalDialog.handler.find('#scoreCutRegisterApprovalForm');
						parent.$.modalDialog.openner_dataGrid = dataGrid;
						parent.$.modalDialog.handler.find('#option').val(1);
						f.submit();
					}
				}, {
					text : '退出',
					handler : function () {
						parent.$.modalDialog.handler.dialog('close');
					}
				}
			]
		});
	}
	
	// 查看流程
	function approvalDetailFun() {
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
			title : '流程详情',
			autoScroll : true,
			width : document.body.clientWidth * 0.7,
			height : document.body.clientHeight * 1,
			href : '${ctx}/scoreCutRegister/approvalDetailPage?id=' + id,
			buttons : [ {
				text : '退出',
				handler : function() {
					//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					parent.$.modalDialog.handler.dialog('close');
				}
			} ]
		});
	}
	// 打印导出
	function printFun(type) {
		var st = $('#st').val();
		var et = $('#et').val();
		if((st != null && st != "") && (et != null && et != "")){
			
			var url = ctxPath + "/report/scoreCutRegister?type=" + type + "&sDate=" + st + "&eDate=" + et;
			console.log(url);
			if(type == 0){
				var tmp = window.open (
						url,
						'newwindow',
						'width='+(window.screen.availWidth-10)+
						',height='+(window.screen.availHeight-30)+ 
						',top=0,left=0,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no'
				);
				
				tmp.focus();
			}else{
				var tmp = window.open(url);
				tmp.focus();
			}
		}else{
			parent.$.messager.alert('警告', '请选择时间段!');
		}
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
				test="${fn:contains(sessionInfo.resourceList, '/scoreCutRegister/add')}">
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
				test="${fn:contains(sessionInfo.resourceList, '/scoreCutRegister/edit')}">
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
				test="${fn:contains(sessionInfo.resourceList, '/scoreCutRegister/delete')}">
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

		<c:choose>
			<c:when
				test="${fn:contains(sessionInfo.resourceList, '/scoreCutRegister/approvalDetail')}">
				<a onclick="approvalDetailFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_detail'">查看流程</a>
			</c:when>
			<c:otherwise>
				<a href="javascript:void(0);" class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_detail_disabled'"><font
					color="gray">查看流程</font> </a>
			</c:otherwise>
		</c:choose>

		<c:choose>
			<c:when
				test="${fn:contains(sessionInfo.resourceList, '/scoreCutRegister/approval')}">
				<a onclick="approvalFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_detail'">审核</a>
			</c:when>
			<c:otherwise>
				<a href="javascript:void(0);" class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_detail_disabled'"><font
					color="gray">审核</font> </a>
			</c:otherwise>
		</c:choose>
		
		<a onclick="printFun(1);" href="javascript:void(0);"
			class="easyui-linkbutton"
			data-options="plain:true,iconCls:'icon_toolbar_detail'">导出Excel</a>
		<a onclick="printFun(0);" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_detail'">打印预览 </a>
		<a onclick="searchFun();" href="javascript:void(0);"
						class="easyui-linkbutton"
						data-options="plain:true,iconCls:'icon_toolbar_search'">搜索</a> 
		<a onclick="clearFun();" href="javascript:void(0);"
						class="easyui-linkbutton"
						data-options="plain:true,iconCls:'icon_toolbar_clear'">清空</a>

		<c:if
			test="${fn:contains(sessionInfo.resourceList, '/scoreCutRegister/search')}">
			<table style="width:900px;overflow: scroll;">
				<tr>
					<!-- <th>项目名称:</th>
					<td><input type="text" id="projectName"></td> -->
<!-- 					<th>投标人:</th> -->
<!-- 					<td><input type="text" id="bidder"></td> -->
<!-- 					<th>登记人:</th> -->
<!-- 					<td><input type="text" id="registerName"></td> -->
					<th>确认时间段:</th>
					<td>
						<input class="Wdate" type="text" name="st" id="st"
						style="height: 100%" onfocus="showDate('yyyy-MM-dd')" /> - 
						<input class="Wdate" type="text" name="et" id="et" style="height: 100%"
						onfocus="showDate('yyyy-MM-dd')" /> 
					</td>
					
				</tr>
			</table>
		</c:if>
	</div>
</body>
</html>