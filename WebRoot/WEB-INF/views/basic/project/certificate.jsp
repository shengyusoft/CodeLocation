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
<title>证书管理</title>
<script type="text/javascript">
	var dataGrid;
	$(function() {
		dataGrid = $('#dataGrid').datagrid({
			url : '${ctx}' + '/certificate/dataGrid',
			striped : true,
			pagination : true,
			nowrap : false,
			idField : 'id',
			sortName : 'id',
			sortOrder : 'desc',
			pageSize : getDefaultPageSize(),
			pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
			columns : [ [

			{
				checkbox : true,
				field : 'id',
				width : '30',
			}, {
				width : '120',
				title : '证书编号',
				align : 'center',
				field : 'card_code'
			},{
				width : '180',
				title : '证书名称',
				align : 'center',
				field : 'card_name'
			}, {
				width : '90',
				title : '到期时间',
				sortable : true,
				align : 'center',
				field : 'card_enddate',
				formatter : Common.formatter
			}, {
				width : '160',
				title : '发证单位',
				align : 'center',
				field : 'card_issuer'
			}, {
				width : '80',
				//title : '证书所有人',
				title : '持证人',
				align : 'center',
				field : 'card_owner'
			}, {
				width : '80',
				title : '证书类型',
				align : 'center',
				field : 'card_type'
			}, {
				width : '160',
				//title : '证书等级',
				title : '所属公司',
				align : 'center',
				field : 'card_level'
			},  {
				width : '80',
				title : '证书状态',
				align : 'center',
				field : 'card_status'
			},{
				width : '210',
				title : '备注',
				align : 'center',
				field : 'remark'
			} ] ],
			toolbar : '#toolbar'
		});

	});

	function searchFun() {
		var queryParams = $('#dataGrid').datagrid('options').queryParams;
		queryParams.card_name = "";
		queryParams.card_code = "";
		queryParams.card_owner = "";

		var card_name = $('#card_name').val();
		var card_owner = $('#card_owner').val();
		var card_code = $('#card_code').val();
		if (!isEmpty(card_code)) {
			queryParams.card_code = card_code;
		}
		if (!isEmpty(card_name)) {
			queryParams.card_name = card_name;
		}
		if (!isEmpty(card_owner)) {
			queryParams.card_owner = card_owner;
		}
		//重新加载datagrid的数据  
		reloadGrid($("#dataGrid"));
	}

	function clearFun() {
		$('#card_code').val('');
		$('#card_name').val('');
		$('#card_owner').val('');
	}

	function addFun() {
		parent.$.modalDialog({
			title : '添加新证书',
			width : '815',
			height : '500',
			resizable : true,
			href : '${ctx}/certificate/addPage',
			buttons : [ {
				text : '添加新证书',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
					var f = parent.$.modalDialog.handler
							.find('#certificateAddForm');
					f.submit();
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
				$.post('${ctx}/certificate/delete', {
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

		parent.$.modalDialog({
			title : '编辑证书',
			width : '815',
			height : '500',
			href : '${ctx}/certificate/editPage?id=' + id,
			buttons : [ {
				text : '编辑',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					var f = parent.$.modalDialog.handler
							.find('#certificateEditForm');
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
			title : '证书详情',
			width : '815',
			height : '500',
			href : '${ctx}/certificate/detailPage?id=' + id,
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
		var selected = "";
		var rows = dataGrid.datagrid('getSelections');
		if (rows != null && rows.length != 0) {
			selected = getSelected();
		}
		var url = ctxPath + "/report/tbCertificate?type=" + type + "&ids=" + selected;
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
				test="${fn:contains(sessionInfo.resourceList, '/certificate/add')}">
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
				test="${fn:contains(sessionInfo.resourceList, '/certificate/edit')}">
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
				test="${fn:contains(sessionInfo.resourceList, '/certificate/delete')}">
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
				test="${fn:contains(sessionInfo.resourceList, '/certificate/detail')}">
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

		<c:if test="${fn:contains(sessionInfo.resourceList, '/certificate/search')}">
			<table>
				<tr>
					<th>证书编号:</th>
					<td><input type="text" id="card_code"></td>
					<th>证书名称:</th>
					<td><input type="text" id="card_name"></td>
					<th>持证人:</th>
					<td><input type="text" id="card_owner"></td>
				</tr>
			</table>
		</c:if>
	</div>
</body>
</html>