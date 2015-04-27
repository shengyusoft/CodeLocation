var dataGrid;
function init() {
	$('#dictionaryId').combobox({
		url : ctxPath + "/dictionary/combox?code=fwstype",
		parentField : 'dictionaryId',
		valueField : 'id',
		textField : 'text',
		panelHeight : 'auto'
	});
	
	dataGrid = $('#dataGrid').datagrid({
		url : ctxPath + '/merchant/dataGrid',
		striped : true,
		rownumbers : true,
		pagination : true,
		nowrap : true,
		idField : 'id',
		sortName : 'id',
		sortOrder : 'asc',
		pageSize : 10,
		pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
		frozenColumns : [ [

		{
			checkbox : true,
			field : 'id',
			width : '30',
		}, {
			width : '90',
			title : '服务商编码',
			align : 'center',
			field : 'code'
		}, {
			width : '90',
			title : '服务商类型',
			align : 'center',
			field : 'dictionaryText'
		}, {
			width : '120',
			title : '服务商名称',
			field : 'name',
			align : 'center'
		}, {
			width : '120',
			title : '地址',
			align : 'center',
			field : 'address'
		}, {
			width : '120',
			title : '电子邮件',
			align : 'center',
			field : 'email'
		}, {
			width : '90',
			title : '邮编',
			align : 'center',
			field : 'postCode'
		}, {
			width : '90',
			title : '办公电话',
			align : 'center',
			field : 'officeNumber'
		}, {
			width : '90',
			title : '手机号码',
			align : 'center',
			field : 'mobilePhone'
		} ] ],
		toolbar : '#toolbar'
	});
}

function searchFun() {
	var queryParams = $('#dataGrid').datagrid('options').queryParams;
	queryParams.dictionaryId = "";
	queryParams.name = "";
	var projectType = $('#dictionaryId').combobox('getValue');
	var merchantName = $('#merchantName').val();
	if (!isEmpty(projectType)) {
		queryParams.dictionaryId = projectType;
	}

	if (!isEmpty(merchantName)) {
		queryParams.name = merchantName;
	}

	// 重新加载datagrid的数据
	$("#dataGrid").datagrid('reload');
}

function clearFun() {
	$('#dictionaryId').combobox('clear');
	$('#merchantName').val('');
}

function initAdd() {
	$('#merchantAddForm').form({
		url : ctxPath+'/merchant/add',
		onSubmit : function() {
			progressLoad();
			var isValid = $(this).form('validate');
			if (!isValid) {
				progressClose();
			}
			return isValid;
		},
		success : function(result) {
			progressClose();
			result = $.parseJSON(result);
			if (result.success) {
				//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
				parent.$.modalDialog.openner_dataGrid.datagrid('reload');
				parent.$.modalDialog.handler.dialog('close');
			} else {
				parent.$.messager.alert('错误', result.msg, 'error');
			}
		}
	});
	
	$('#dictionaryId1').combobox({
	    url : ctxPath+"/dictionary/combox?code=fwstype",
	    valueField : 'id',
	    textField : 'text',
	    panelHeight : 'auto'
	});
}

function addFun() {
	parent.$.modalDialog({
		title : '添加服务商',
		width : 700,
		height : 600,
		href : ctxPath + '/merchant/addPage',
		buttons : [ {
			text : '添加',
			handler : function() {
				parent.$.modalDialog.openner_dataGrid = dataGrid;// 因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
				var f = parent.$.modalDialog.handler.find('#merchantAddForm');
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
			$.post(ctxPath + '/merchant/delete', {
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
		title : '编辑服务商',
		width : 700,
		height : 600,
		href : ctxPath + '/merchant/editPage?id=' + id,
		buttons : [ {
			text : '编辑',
			handler : function() {
				parent.$.modalDialog.openner_dataGrid = dataGrid;// 因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
				var f = parent.$.modalDialog.handler.find('#merchantAddForm');
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
		title : '详情',
		width : 700,
		height : 600,
		href : ctxPath + '/merchant/detailPage?id=' + id,
		buttons : [ {
			text : '退出',
			handler : function() {
				// 因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
				parent.$.modalDialog.handler.dialog('close');
			}
		} ]
	});
}