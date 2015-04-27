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
<title>文章信息管理</title>
<script type="text/javascript">
var dataGrid;
var zdTag = false;
$(function() {
	dataGrid = $('#dataGrid').datagrid({
		url : ctxPath + '/notice/dataGrid?zdTag='+zdTag,
		striped : true,
		rownumbers : true,
		pagination : true,
		nowrap : true,
		idField : 'id',
		sortName : 'createDT',
		sortOrder : 'desc',
		pageSize : 10,
		pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400,
				500 ],
		frozenColumns : [ [

				{
					checkbox : true,
					field : 'id',
					width : '30',
				},
				{
					width : '300',
					title : '标题',
					align : 'center',
					field : 'title'
				},
				{
					width : '220',
					title : '发布时间',
					align : 'center',
					sortable : true,
					field : 'publishDT',
					formatter : function(value, row, index) {
						if (!isEmpty(value)) {
							var date = '';
							if(value.indexOf(' ') > 0){
								date = value.substring(0,value.indexOf(' '));
							}
							return date;
						} else {
							return "未发布";
						}
					}

				},
				{
					width : '160',
					title : '创建人',
					align : 'center',
					field : 'createUserName'
				},
				{
					width : '160',
					title : '重要等级',
					field : 'level',
					align : 'center',
					sortable : true,
					formatter : function(value, row, index) {
						if (value == 1) {
							return "一般";
						} else if (value == 2) {
							return "重要";
						} else if (value == 3) {
							return "紧急";
						} else {
							return "不合法";
						}
					}
				}, {
					width : '130',
					title : '发布状态',
					align : 'center',
					field : 'publish',
					sortable : true,
					formatter : function(value, row, index) {
						if (value == 0) {
							return '未发布';
						} else if (value == 1) {
							return '已发布';
						} else {
							return "非法值";

						}
					}
				} ] ],
		toolbar : '#toolbar'
	});
});

function searchFun() {
	var queryParams = $('#dataGrid').datagrid('options').queryParams;
	queryParams.level = -1;
	queryParams.title = "";
	var level = $('#level').combobox('getValue');
	var title = $('#title').val();
	if (!isEmpty(level)) {
		queryParams.level = level;
	}

	if (!isEmpty(title)) {
		queryParams.title = title;
	}

	// 重新加载datagrid的数据
	$("#dataGrid").datagrid('reload');
}

function clearFun() {
	$('#level').combobox('clear');
	$('#title').val('');
}

function addFun() {
	parent.$.modalDialog({
		title : '添加通知公告',
		width : 715,
		height : 600,
		href : ctxPath + '/notice/addPage',
		buttons : [ {
			text : '添加',
			iconCls:'icon_add',
			handler : function() {
				parent.$.modalDialog.openner_dataGrid = dataGrid;// 因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
				var f = parent.$.modalDialog.handler.find('#noticeAddForm');
				f.submit();
			}
		} ]
	});
}

//发布通知
function publishFun() {
	var selected = getSelected();
	if (isEmpty(selected)) {
		parent.$.messager.alert('警告', '至少选中一条记录!');
		return;
	}
	parent.$.messager.confirm('询问', '确认选中的通知吗？', function(b) {
		if (b) {
			progressLoad();
			$.post(ctxPath + '/notice/publish', {
				ids : selected
			}, function(result) {
				if (result.success) {
					parent.$.messager.alert('提示', '发布通知成功!', 'info');
					dataGrid.datagrid('reload');
				}
				progressClose();
			}, 'JSON');
		}
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
			$.post(ctxPath + '/notice/delete', {
				ids : selected
			}, function(result) {
				if (result.success) {
					parent.$.messager.alert('提示', result.msg, 'info');
					// 删除成功后,前台删除行,防止下次再删除的时候可以取到之前选到的行
					var rows = dataGrid.datagrid("getSelections");
					for ( var i = 0; i < rows.length; i++) {
						var index = dataGrid.datagrid('getRowIndex', rows[i]);
						dataGrid.datagrid('deleteRow', index);
					}
					dataGrid.datagrid('reload');
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
		title : '编辑',
		width : 715,
		height : 600,
		href : ctxPath + '/notice/editPage?id=' + id,
		buttons : [ {
			text : '编辑',
			iconCls:'icon_edit',
			handler : function() {
				parent.$.modalDialog.openner_dataGrid = dataGrid;// 因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
				var f = parent.$.modalDialog.handler.find('#noticeEditForm');
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

	$.ajax({
		type : "post",
		url : ctxPath + "/notice/get",
		cache : false,
		data : {
			id : id
		},
		dataType : "json",
		success : function(article) {
			var title = article.title;
			if (title.length > 4) {
				title = title.substring(0, 4) + '...';
			}

			addTab({
				url : ctxPath + '/notice/detailPage?id=' + id,
				title : title + '详情',
				background : '#F0F5FB'
			});
		},
		error : function(error) {
			alert(error);
		}

	});
}

</script>
</head>
<body class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',fit:true,border:false">
		<table id="dataGrid" data-options="fit:true,border:false"></table>
	</div>
	<div id="toolbar" class="mygrid-toolbar" style="inline:true">

		<c:choose>
			<c:when test="${fn:contains(sessionInfo.resourceList, '/notice/add')}">
			<a onclick="addFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_add'">添加 </a>
			</c:when>
			<c:otherwise>
			<a href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_add_disabled'"><font color="gray">添加</font> </a>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${fn:contains(sessionInfo.resourceList, '/notice/edit')}">
			<a onclick="editFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_edit'">编辑</a>
			</c:when>
			<c:otherwise>
			<a href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_edit_disabled'"><font color="gray">编辑</font> </a>
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${fn:contains(sessionInfo.resourceList, '/notice/delete')}">
			<a onclick="deleteFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_del'">删除 </a>
			</c:when>
			<c:otherwise>
			<a  href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_del_disabled'"><font color="gray">删除</font> </a>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${fn:contains(sessionInfo.resourceList, '/notice/detail')}">
			<a onclick="detailFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_detail'">详情 </a>
			</c:when>
			<c:otherwise>
			<a  href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_detail_disabled'"><font color="gray">详情</font> </a>
			</c:otherwise>
		</c:choose>
		
		<c:if test="${fn:contains(sessionInfo.resourceList, '/notice/publish')}">
			<a onclick="publishFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_task_handler'">发布 </a>
		</c:if>
		
		<c:if test="${fn:contains(sessionInfo.resourceList, '/notice/search')}">
			<div id="searchbar" class = "search-toolbar">
				<span>重要等级:</span>
				<select id="level" class = "easyui-combobox" name="level"
					style="width: 100px;" panelHeight="auto">
					<option value="0">--请选择--</option>
					<option value="1">一般</option>
					<option value="2">重要</option>
					<option value="3">紧急</option>
				</select> 
				
				<span>标题关键字:</span> 
				<input type="text" id="title" name="title"> 
				
				<a onclick="searchFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_search'">搜索</a> 
					
				<a onclick="clearFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_clear'">清空</a> 
			</div>
		</c:if>

	</div>

</body>
</html>