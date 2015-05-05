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
<title>报销管理</title>
<script type="text/javascript">
	var dataGrid;
	$(function() {
		dataGrid = $('#dataGrid').datagrid({
			url : '${ctx}' + '/reimbursement/dataGrid',
			striped : true,
			rownumbers : true,
			pagination : true,
			nowrap : true,
			idField : 'id',
			sortName : 'id',
			sortOrder : 'asc',
			pageSize : 10,
			pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
			columns : [ [

			{
				checkbox : true,
				field : 'id',
				width : '30',
				rowspan : 2
			}, {
				width : '140',
				title : '时间范围',
				rowspan : 2,
				sortable : true,
				align : 'center',
				field : 'startDT',
				formatter : function(value, row, index) {
					if (isEmpty(value)) {
						return '';
					} else {
						return value.substring(0, value.indexOf(' '));
					}
				}
			}, {
				width : '140',
				title : '地点',
				rowspan : 2,
				align : 'center',
				field : 'placeName'
				/* formatter : function(value, row, index) {
					return value==null?'':value.description;
				} */
			}, {
				width : '120',
				title : '工作',
				rowspan : 2,
				sortable : true,
				align : 'center',
				field : 'workDetail'
			}, {
				width : '150',
				title : '费用明细',
				rowspan : 2,
				align : 'center',
				field : 'costDetail'
			} , {
				title : '费用小计',
				colspan : 8
			}, {
				width : '80',
				title : '状态',
				rowspan : 2,
				align : 'center',
				field : 'process_vo',
				formatter : function(value, row, index) {
					if(value != null){
						switch (value.state){
							case 0 : return '初始化';
							case 1 : return '<font color="green">已申请</font>';
							case 2 : return '<font color="green">会计审批通过</font>';
							case 3 : return '<font color="green">总经理审批通过</font>';
							case 4 : return '<font color="green">【财务出纳成功】</font>';
							case -2 : return '<font color="red">【会计审核退回】</font>';
							case -3 : return '<font color="red">【总经理审核退回】</font>';
						}
					}
				}
			} ],[ {
				width : '80',
				title : '交通费',
				align : 'center',
				field : 'trafficFee'
			}, {
				width : '80',
				title : '就餐费',
				align : 'center',
				field : 'mealFee'
			}, {
				width : '80',
				title : '办公费',
				align : 'center',
				field : 'officeFee'
			}, {
				width : '80',
				title : '招待费',
				align : 'center',
				field : 'receiveFee'
			}, {
				width : '80',
				title : '证章费',
				align : 'center',
				field : 'badgeFee'
			}, {
				width : '80',
				title : '通讯费',
				align : 'center',
				field : 'communicationFee'
			}, {
				width : '80',
				title : '培训费',
				align : 'center',
				field : 'trainFee'
			}, {
				width : '80',
				title : '其他费',
				align : 'center',
				field : 'otherFee'
			}] ],
			toolbar : '#toolbar'
		});

	});

	function searchFun() {
		var queryParams = $('#dataGrid').datagrid('options').queryParams;
		queryParams.name = "";

		var name = $('#name').val();
		if (!isEmpty(name)) {
			queryParams.name = name;
		}
		//重新加载datagrid的数据  
		$("#dataGrid").datagrid('reload');
	}

	function clearFun() {
		$('#name').val('');
		var o=$('#dataGrid').datagrid('getData'); 
	}

	function addFun() {
		parent.$.modalDialog({
			title : '报销申请',
			width : '900',
			height : '500',
			resizable : true,
			href : '${ctx}/reimbursement/addPage',
			buttons : [ /* {
				text : '保存',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
					parent.$.modalDialog.type=0;
					var f = parent.$.modalDialog.handler.find('#reimbursementAddForm');
					f.submit();
				}
			}, */{
				text : '申请',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
					var f = parent.$.modalDialog.handler.find('#reimbursementAddForm');
					parent.$.modalDialog.type=1;
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

	function deleteFun() {
		var selected = getSelected();
		if (isEmpty(selected)) {
			parent.$.messager.alert('警告', '至少选中一条记录!');
			return;
		}
		parent.$.messager.confirm('询问', '确认删除选中的记录吗？', function(b) {
			if (b) {
				progressLoad();
				$.post('${ctx}/reimbursement/delete', {
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

		parent.$
				.modalDialog({
					title : '编辑商品',
					width : '900',
					height : '500',
					href : '${ctx}/reimbursement/editPage?id=' + id,
					buttons : [ {
						text : '编辑',
						handler : function() {
							parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
							var f = parent.$.modalDialog.handler
									.find('#reimbursementEditForm');
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
			title : '商品详情',
			width : '815',
			height : '500',
			href : '${ctx}/reimbursement/detailPage?id=' + id,
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
			<c:when test="${fn:contains(sessionInfo.resourceList, '/reimbursement/add')}">
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
				test="${fn:contains(sessionInfo.resourceList, '/reimbursement/edit')}">
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
				test="${fn:contains(sessionInfo.resourceList, '/reimbursement/delete')}">
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
				test="${fn:contains(sessionInfo.resourceList, '/reimbursement/detail')}">
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

		<c:if test="${fn:contains(sessionInfo.resourceList, '/reimbursement/search')}">
			<div id="searchbar" class="search-toolbar">
				<span>商品名称:</span> <input type="text" id="name"> <a
					onclick="searchFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_search'">搜索</a> <a
					onclick="clearFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_clear'">清空</a>
			</div>
		</c:if>
	</div>
</body>
</html>