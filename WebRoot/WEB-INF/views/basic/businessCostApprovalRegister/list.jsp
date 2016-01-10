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
<title>业务费用支付</title>
<script type="text/javascript">
	var dataGrid;
	$(function() {
		dataGrid = $('#dataGrid').datagrid({
			url : '${ctx}' + '/businessCostApprovalRegister/dataGrid',
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
			}, {
				title : '序号',
				field : 'index',
				align : 'center',
				width : '40',
				formatter : function(value, row, index) {
					return index+1;
				}
			}, {
				width : '100',
				title : '申请人',
				align : 'center',
				field : 'applicant'
			}, {
				width : '100',
				title : '申请时间',
				align : 'center',
				field : 'applicantDate',
				formatter : Common.formatter
			}, {
				width : '220',
				title : '费用名称',
				sortable : true,
				align : 'center',
				field : 'costName'
			}, {
				width : '100',
				title : '申请支付时间',
				sortable : true,
				align : 'center',
				field : 'applypayDate',
				formatter : Common.formatter
			}, {
				width : '120',
				title : '申请支付金额(元)',
				align : 'center',
				field : 'applyCost'
			}, {
				width : '240',
				title : '备注',
				align : 'center',
				field : 'remark'
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
						return '<font color="green">总经理审批通过</font>';
					}else if(value == "3"){
						return '<font color="green">会计审批通过</font>';
					}else if(value == "4"){
						return '<font color="green">【财务出纳已办理】</font>';
					}else if(value == "-2"){
						return '<font color="red">【总经理审核退回】</font>';
					}else if(value == "-3"){
						return '<font color="red">【会计审核退回】</font>';
					}
				}
			}] ],

			toolbar : '#toolbar'
		});

	});

	function searchFun() {
		var queryParams = $('#dataGrid').datagrid('options').queryParams;
		queryParams.applicant = "";
		queryParams.creatTime = "";

		var applicant = $('#applicant').val();
		var creatTime = $('#creatTime').val();

		queryParams.applicant = isEmpty(applicant) ? "" : applicant;
		queryParams.creatTime = isEmpty(creatTime) ? "" : creatTime;
		
		//重新加载datagrid的数据  
		reloadGrid($("#dataGrid"));
	}

	function clearFun() {
		$('#applicant').val('');
		$('#creatTime').val('');
	}

	function addFun() {
		parent.$.modalDialog({
			title : '业务费用支付',
			width : 800,
			height : 480,
			href : '${ctx}/businessCostApprovalRegister/addPage',
			buttons : [ {
				text : '保存',
				id : 'businessCostApprovalRegisterBtn',
				handler : function() {
					//传入后台区分是保存还是申请
					parent.$.modalDialog.openner_dataGrid = dataGrid;
					parent.$.modalDialog.handler.find('#option').val(0);
					var f = parent.$.modalDialog.handler.find('#businessCostApprovalRegisterAddForm');
					f.submit();
				}
			},{
				text : '申请',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = dataGrid;
					parent.$.modalDialog.handler.find('#option').val(1);
					var f = parent.$.modalDialog.handler.find('#businessCostApprovalRegisterAddForm');
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
				$.post('${ctx}/businessCostApprovalRegister/delete', {
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
		
		var state = rows[0].processFlag;
		if (!isEmpty(state) && state > 0) {
			parent.$.messager.alert('提示', '申请已提交，不可编辑!');
			return;
		}

		parent.$.modalDialog({
			title : '业务费用支付',
			width : 800,
			height : 480,
			href : '${ctx}/businessCostApprovalRegister/editPage?id=' + id,
			buttons : [ {
				text : '编辑',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					parent.$.modalDialog.handler.find('#option').val(2);
					var f = parent.$.modalDialog.handler.find('#businessCostApprovalRegisterEditForm');
					f.submit();
				}
			},{
				text : '申请',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = dataGrid;
					parent.$.modalDialog.handler.find('#option').val(1);
					var f = parent.$.modalDialog.handler.find('#businessCostApprovalRegisterEditForm');
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
	// 详情
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
			title : '业务费用支付',
			width : 800,
			height : 480,
			href : '${ctx}/businessCostApprovalRegister/detailPage?id=' + id,
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
			title : '费用支付审批',
			width : '800',
			height : '620',
			resizable : true,
			href : ctxPath + '/businessCostApprovalRegister/approvalPage?id=' + id + '&processId=' + processId,
			buttons : [{
					text : '通过',
					handler : function () {
						var f = parent.$.modalDialog.handler.find('#businessCostApprovalRegisterApprovalForm');
						parent.$.modalDialog.openner_dataGrid = dataGrid;
						parent.$.modalDialog.handler.find('#option').val(0);
						f.submit();
					}
				}, {
					text : '退回',
					handler : function () {
						var f = parent.$.modalDialog.handler.find('#businessCostApprovalRegisterApprovalForm');
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
			width : document.body.clientWidth * 0.85,
			height : document.body.clientHeight * 1,
			href : '${ctx}/businessCostApprovalRegister/approvalDetailPage?id=' + id,
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
		var rows = dataGrid.datagrid('getSelections');
		if (rows == null || rows.length == 0) {
			parent.$.messager.alert('警告', '未选中数据!');
			return;
		}
		var selected = getSelected();
		var url = ctxPath + "/report/businessCostApprovalRegister?type=" + type + "&ids=" + selected;
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
				test="${fn:contains(sessionInfo.resourceList, '/businessCostApprovalRegister/add')}">
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
				test="${fn:contains(sessionInfo.resourceList, '/businessCostApprovalRegister/edit')}">
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
				test="${fn:contains(sessionInfo.resourceList, '/businessCostApprovalRegister/delete')}">
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
				test="${fn:contains(sessionInfo.resourceList, '/businessCostApprovalRegister/detail')}">
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
				test="${fn:contains(sessionInfo.resourceList, '/businessCostApprovalRegister/approvalDetail')}">
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
				test="${fn:contains(sessionInfo.resourceList, '/businessCostApprovalRegister/approval')}">
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
		
		<a onclick="printFun(0);" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_detail'">打印预览 </a>
		<a onclick="printFun(1);" href="javascript:void(0);"
			class="easyui-linkbutton"
			data-options="plain:true,iconCls:'icon_toolbar_detail'">导出Excel</a>
			
		<a onclick="searchFun();" href="javascript:void(0);"
						class="easyui-linkbutton"
						data-options="plain:true,iconCls:'icon_toolbar_search'">搜索</a>
		<a onclick="clearFun();" href="javascript:void(0);"
						class="easyui-linkbutton"
						data-options="plain:true,iconCls:'icon_toolbar_clear'">清空</a>

		<c:if
			test="${fn:contains(sessionInfo.resourceList, '/businessCostApprovalRegister/search')}">
			<table>
				<tr>
					<th>申请人:</th>
					<td><input type="text" id="applicant"></td>
					<th>申请时间:</th>
					<td>
						<input class="Wdate" type="text" name="creatTime" id="creatTime"
						style="height: 100%" onfocus="showDate('yyyy-MM-dd')" />
					</td>
					
				</tr>
			</table>
		</c:if>
	</div>
</body>
</html>