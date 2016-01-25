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
<script type="text/javascript">
	var resourceTree;
	var dataGrid;
	$(function() {
		loadResources();
		loadShotcuts();
	});

	$('#resourceForm').form({
		url : '${ctx}/role/grant',
		onSubmit : function() {
			progressLoad();
			var isValid = $(this).form('validate');
			if (!isValid) {
				progressClose();
			}
			var checknodes = resourceTree.tree('getChecked');
			var ids = [];
			if (checknodes && checknodes.length > 0) {
				for ( var i = 0; i < checknodes.length; i++) {
					ids.push(checknodes[i].id);
				}
			}
			$('#resourceIds').val(ids);
			return isValid;
		},
		success : function(result) {
			progressClose();
			result = $.parseJSON(result);
			if (result.success) {
				parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
				parent.$.modalDialog.handler.dialog('close');
			} else {
				parent.$.messager.alert('错误', result.msg, 'error');
			}
		}
	});

	//加载左边资源列表
	function loadResources() {
		resourceTree = $('#resourceTree').tree({
			url : '${ctx}/resource/treeShotcut',
			parentField : 'pid',
			lines : true,
			checkbox : true,
			onClick : function(node) {
			}
		});
	}

	//加载右边快键列表
	var editRow = 'undefined';
	function loadShotcuts() {
		dataGrid = $('#dataGrid')
				.datagrid(
						{
							url : ctxPath + '/shotcut/dataGrid',
							striped : true,
							rownumbers : true,
							pagination : true,
							nowrap : true,
							idField : 'id',
							sortName : 'id',
							sortOrder : 'asc',
							pageSize : getDefaultPageSize(),
							pageList : [ 10, 20, 30, 40, 50, 100, 200, 300,
									400, 500 ],
							frozenColumns : [ [
									{
										checkbox : true,
										field : 'id',
										width : '30',
									},
									{
										width : '150',
										title : '添加人',
										align : 'center',
										field : 'userName'
									},
									{
										width : '150',
										title : '快键资源',
										align : 'center',
										field : 'resourceName'
									},
									{
										width : '150',
										title : '更新时间',
										align : 'center',
										field : 'updateDT'
									} ,
									{
										width : '120',
										title : '快键图标',
										align : 'center',
										sortable : true,
										field : 'iconUrl',
										formatter : function(value, row, index) {
											return '<img style="margin: 0px; width: 25px; height: 25px; border: 0px; opacity: 1;" src="${ctx}/style/images'
													+ value + '"</img>';
										}
									},{
										field : 'action',
										title : '操作',
										width : 100,
										formatter : function(value, row, index) {
											var tip = '添加图标';
											if (!isEmpty(row.iconUrl)) {
												tip = '修改图标';
											}
											var str = $.formatString(
													'<a href="javascript:void(0)" onclick="uploadIcon(\'{0}\');" >'
															+ tip + '</a>',
													row.id);
											return str;
										}
									}  ] ],
							toolbar : '#toolbar'
						});
	}

	function checkAll() {
		var nodes = resourceTree.tree('getChecked', 'unchecked');
		if (nodes && nodes.length > 0) {
			for ( var i = 0; i < nodes.length; i++) {
				resourceTree.tree('check', nodes[i].target);
			}
		}
	}

	function uncheckAll() {
		var nodes = resourceTree.tree('getChecked');
		if (nodes && nodes.length > 0) {
			for ( var i = 0; i < nodes.length; i++) {
				resourceTree.tree('uncheck', nodes[i].target);
			}
		}
	}

	function checkInverse() {
		var unchecknodes = resourceTree.tree('getChecked', 'unchecked');
		var checknodes = resourceTree.tree('getChecked');
		if (unchecknodes && unchecknodes.length > 0) {
			for ( var i = 0; i < unchecknodes.length; i++) {
				resourceTree.tree('check', unchecknodes[i].target);
			}
		}
		if (checknodes && checknodes.length > 0) {
			for ( var i = 0; i < checknodes.length; i++) {
				resourceTree.tree('uncheck', checknodes[i].target);
			}
		}
	}

	function addShotcut() {
		var checknodes = resourceTree.tree('getChecked');

		if (isEmpty(checknodes)) {
			parent.$.messager.alert('提示', '没有选择快键资源', 'icon_success');
			return;
		}

		var ids = [];
		if (checknodes && checknodes.length > 0) {
			for ( var i = 0; i < checknodes.length; i++) {
				ids.push(checknodes[i].id);
			}
		}
		//批量添加到快键表
		$.ajax({
			type : "post",
			url : ctxPath + "/shotcut/add?resourceIds=" + ids,
			cache : false,
			data : {
				ids : ids
			},
			dataType : "json",
			success : function(result) {
				if (result.success) {
					parent.$.messager.alert('提示', result.msg, 'icon_success');
					//var node = resourceTree.tree('getChecked');
					//resourceTree.tree('remove', node);
					refresh();

				}
			},
			error : function(error) {
				alert(error);
			}

		});
	}

	function removeShotcut() {
		var selected = getSelected();
		if (isEmpty(selected)) {
			parent.$.messager.alert('警告', '至少选中一条记录!');
			return;
		}
		parent.$.messager.confirm('询问', '确认移除选中的快键吗？', function(b) {
			if (b) {
				progressLoad();
				$.post('${ctx}/shotcut/delete', {
					ids : selected
				}, function(result) {
					if (result.success) {
						parent.$.messager.alert('提示', result.msg, 'info');
						//删除成功后,前台删除行,防止下次再删除的时候可以取到之前选到的行
						//UI remove
						removeSelectedRow(dataGrid);
						refresh();
					}
					progressClose();
				}, 'JSON');
			}
		});
	}

	function uploadIcon(id) {
		parent.$.modalDialog({
			title : '图标上传',
			width : 560,
			height : 240,
			href : '${ctx}/shotcut/iconPage?id=' + id,
			buttons : [ {
				text : '提交',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
					var f = parent.$.modalDialog.handler.find('#shotcutForm');
					f.submit();
					dataGrid.datagrid('reload');
				}
			} ]
		});

	}

	function refresh() {
		resourceTree.tree('reload');
		dataGrid.datagrid('reload');
	}
</script>
<body class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'west'" title="我的功能模块" style="width: 200px;"
		data-options="fit:true,border:false">
		<div class="well well-small">
			<form id="resourceForm" method="post">
				<ul id="resourceTree"></ul>
				<input id="resourceIds" name="resourceIds" type="hidden" />
			</form>
		</div>
	</div>
	<div data-options="region:'center'" title="操作"
		style="width: 30px; padding: 1px; text-align: center;">
		<div
			style="vertical-align: middle; text-align: center; margin-top: 160px">
			<button onclick="addShotcut()">==添加快键==》</button>
		</div>

		<div
			style="vertical-align: middle; text-align: center; margin-top: 20px">
			<button onclick="removeShotcut()">《==移除快键==</button>
		</div>
	</div>
	<div data-options="region:'east',fit:true" title="我的快捷方式"
		style="overflow: hidden; width: 840px">
		<table id="dataGrid" style="height: 95%"
			data-options="fit:true,border:false"></table>
	</div>
</body>