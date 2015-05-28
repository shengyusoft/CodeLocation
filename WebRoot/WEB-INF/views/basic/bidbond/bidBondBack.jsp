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
	src="${ctx}/jslib/easyui1.3.3/plugins/datagrid-detailview.js"
	charset="utf-8"></script>
<meta http-equiv="X-UA-Compatible" content="edge" />
<title>投标保证金缴纳</title>
<script type="text/javascript">
	var dataGrid;
	$(function() {
		dataGrid = $('#dataGrid').datagrid({
			url : '${ctx}' + '/bidBond/dataGrid',
			striped : true,
			rownumbers : true,
			pagination : true,
			nowrap : true,
			queryParams : {
				type : 1
			},
			idField : 'id',
			sortName : 'id',
			sortOrder : 'asc',
			view: detailview,   
		    detailFormatter:function(index,row){   
		        return '<div style="padding:10px"><table title="财务反馈信息" id="ddv-' + index + '"></table></div>';   
		    },
		    onExpandRow: function(index,row){ 
		        $('#ddv-'+index).datagrid({ 
		            url:'${ctx}' + '/bidBond/dataGrid', 
		            queryParams:{
		            	id : row.id,
		            	type : 1
		            },
		            striped : true,
		            singleSelect:true, 
		            rownumbers:true, 
		            loadMsg:'加载中...', 
		            height:'auto', 
		            columns:[[ 
		                {field:'toAccountFee',title:'到帐金额（元）',width:120}, 
		                {field:'toAccountDT',title:'到帐时间',width:120,formatter:Common.formatter}, 
		                {field:'outAccountFee',title:'转出金额',width:120},
		                {field:'outAccountDT',title:'转出时间',width:120,formatter:Common.formatter},
		                {field:'handlerName',title:'办理人',width:120},
		                {field:'handlerDT',title:'办理时间',width:120,formatter:Common.formatterTime}
		            ]], 
		            onResize:function(){ 
		                $('#dataGrid').datagrid('fixDetailRowHeight',index); 
		            }, 
		            onLoadSuccess:function(){ 
		                setTimeout(function(){ 
		                    $('#dataGrid').datagrid('fixDetailRowHeight',index); 
		                },0); 
		            } 
		        }); 
		        $('#dataGrid').datagrid('fixDetailRowHeight',index); 
		    },
			pageSize : 10,
			pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
			columns : [ [

			{
				checkbox : true,
				field : 'id',
				rowspan : 2,
				width : '30'
			}, {
				width : '140',
				rowspan : 2,
				title : '缴号',
				align : 'center',
				field : 'idNumber'
			}, {
				width : '140',
				rowspan : 2,
				title : '项目名称',
				align : 'center',
				field : 'projectName'
			}, {
				width : '140',
				rowspan : 2,
				title : '标段',
				align : 'center',
				field : 'bdNames'
			}, {
				width : '120',
				rowspan : 2,
				title : '保证金数额',
				sortable : true,
				align : 'center',
				field : 'bondFee'
			}, {
				width : '90',
				title : '状态',
				rowspan : 2,
				align : 'center',
				field : 'state',
				formatter : function(value, row, index) {
					return value == 0?'<font color="red">财务未提交</font>':'<font color="green">财务已提交</font>';
				}
			}, {
				title : '申请信息',
				colspan : 3,
				align : 'center',
			}, {
				title : '付款信息',
				colspan : 2,
				align : 'center',
			}, {
				title : '收款信息',
				colspan : 5,
				align : 'center',
			} ], [ {
				title : '申请人',
				width : '120',
				align : 'center',
				sortable : true,
				field : 'applierName'
			}, {
				title : '联系方式',
				width : '120',
				align : 'center',
				field : 'applierPhone'
			}, {
				title : '申请时间',
				width : '120',
				sortable : true,
				align : 'center',
				field : 'applyDT',
				formatter : Common.formatter
			}, {
				title : '付款人',
				width : '120',
				align : 'center',
				field : 'payer'
			}, {
				title : '联系方式',
				width : '120',
				sortable : true,
				align : 'center',
				field : 'payerPhone'
			}, {
				title : '户  名',
				width : '120',
				align : 'center',
				//sortable : true,
				field : 'payeeAccountName'
			}, {
				title : '开户行',
				width : '120',
				align : 'center',
				field : 'payeeBank'
			}, {
				title : '帐  号',
				width : '120',
				sortable : true,
				align : 'center',
				field : 'payeeAccountNum'
			}, {
				title : '附  言',
				width : '120',
				align : 'center',
				field : 'payeeComments'
			}, {
				title : '办理时间',
				width : '100',
				sortable : true,
				align : 'center',
				field : 'payeeHandleDT',
				formatter : Common.formatter
			} ] ],
			toolbar : '#toolbar'
		});

	});

	function searchFun() {
		var queryParams = $('#dataGrid').datagrid('options').queryParams;
		queryParams.idNumber = "";
		queryParams.projectName = "";

		var idNumber = $('#idNumber').val();
		var projectName = $('#projectName').val();

		if (!isEmpty(idNumber)) {
			queryParams.idNumber = idNumber;
		}
		if (!isEmpty(projectName)) {
			queryParams.projectName = projectName;
		}
		//重新加载datagrid的数据  
		$("#dataGrid").datagrid('reload');
	}

	function clearFun() {
		$('#idNumber').val('');
		$('#projectName').val('');
	}

	function addFun() {
		parent.$.modalDialog({
			title : '投标保证金退还申请登记',
			width : '815',
			height : '565',
			resizable : true,
			href : '${ctx}/bidBond/addPage?type=1',
			buttons : [
					{
						text : '提交',
						handler : function() {
							parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
							var f = parent.$.modalDialog.handler
									.find('#bidBondBackAddForm');
							f.submit();
						}
					}, {
						text : '退出',
						handler : function() {
							//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
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
		
		var rows = dataGrid.datagrid('getSelections');
		for(var i=0;i<rows.length;i++){
			var state = rows[i].state;
			if(state == 1){
				parent.$.messager.alert('警告', '存在已经确认的记录，不能删除!');
				return;
			}
		}
		
		parent.$.messager.confirm('询问', '确认删除选中的记录吗？', function(b) {
			if (b) {
				progressLoad();
				$.post('${ctx}/bidBond/delete', {
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
		var state = rows[0].state;
		
		if(state == 1){
			parent.$.messager.alert('警告', '财务已提交不可修改!');
			return;
		}
		
		parent.$.modalDialog({
			title : '投标保证金退还申请修改',
			width : '830',
			height : '635',
			href : '${ctx}/bidBond/editPage?id=' + id,
			buttons : [
					{
						text : '编辑',
						handler : function() {
							parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
							var f = parent.$.modalDialog.handler
									.find('#bidBondBackEditForm');
							f.submit();
						}
					}, {
						text : '退出',
						handler : function() {
							//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
							parent.$.modalDialog.handler.dialog('close');
						}
					} ]
		});
	}
	
	//财务处理
	function handlerFun() {
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
		var state = rows[0].state;
		if(state == 1){
			parent.$.messager.alert('警告', '财务已提交不可修改!');
			return;
		}
		parent.$.modalDialog({
			title : '投标保证金退还确认',
			width : '830',
			height : '600',
			href : '${ctx}/bidBond/handlerPage?id=' + id,
			buttons : [
					{
						text : '提交',
						handler : function() {
							parent.$.messager.confirm('提醒', '必须将转帐截图发到申请人的邮箱（或公司群）!提交后不能修改,确认提交？', function(b) {
								if (b) {
									//TODO 预留短信接口!
									parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
									var f = parent.$.modalDialog.handler
											.find('#bidBondBackHandlerForm');
									f.submit();
								}else{
									return;
								}
							});
						}
					}, {
						text : '退出',
						handler : function() {
							//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
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
			title : '投标保证金退还申请详情',
			width : '820',
			height : '635',
			href : '${ctx}/bidBond/detailPage?id=' + id,
			buttons : [ {
				text : '退出',
				handler : function() {
					//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					parent.$.modalDialog.handler.dialog('close');
				}
			} ]
		});
	}
	
	function printFun(type) {
		var id = null;
		var rows = dataGrid.datagrid('getSelections');
		if (rows == null || rows.length == 0) {
			parent.$.messager.alert('警告', '没有可查看对象!');
			return;
		}
		if (rows.length > 1) {
			parent.$.messager.alert('警告', '只能对一条记录查看!');
			return;
		}
		id = rows[0].id;
		var url = ctxPath + "/report/bidBondBack?id=" + id+"&&type="+type;
		if(type == 0){
			var iWidth = 700; //弹出窗口的宽度;
			var iHeight = 600; //弹出窗口的高度;
			id = rows[0].id;
			//获得窗口的垂直位置
			var iTop = (window.screen.availHeight - 30 - iHeight) / 2;
			//获得窗口的水平位置
			var iLeft = (window.screen.availWidth - 10 - iWidth) / 2;
			var tmp = window.open(url, "_blank", "width=700,height=600,top=" + iTop
					+ ",left=" + iLeft);
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
				test="${fn:contains(sessionInfo.resourceList, '/bidBond/add')}">
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
				test="${fn:contains(sessionInfo.resourceList, '/bidBond/edit')}">
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
				test="${fn:contains(sessionInfo.resourceList, '/bidBond/delete')}">
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
				test="${fn:contains(sessionInfo.resourceList, '/bidBond/detail')}">
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
				test="${fn:contains(sessionInfo.resourceList, '/bidBond/confirm')}">
				<a onclick="handlerFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_detail'">处理 </a>
			</c:when>
			<c:otherwise>
				<a href="javascript:void(0);" class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_detail_disabled'"><font
					color="gray">处理</font> </a>
			</c:otherwise>
		</c:choose>
		
		<a onclick="printFun(0);" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_detail'">打印预览</a>
					
		<a onclick="printFun(1);" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_detail'">导出Excel</a>

		<c:if
			test="${fn:contains(sessionInfo.resourceList, '/bidBond/search')}">
			<div id="searchbar" class="search-toolbar">
				<span>退 号:</span> <input type="text" id="idNumber" /><span>项目名称:</span>
				<input type="text" id="projectName" /> <a onclick="searchFun();"
					href="javascript:void(0);" class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_search'">搜索</a> <a
					onclick="clearFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_clear'">清空</a>
			</div>
		</c:if>
	</div>
</body>
</html>