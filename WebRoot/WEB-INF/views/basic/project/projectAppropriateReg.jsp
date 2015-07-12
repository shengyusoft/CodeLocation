<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${ctx}/jslib/easyui1.3.3/themes/default/easyui.css">
<jsp:include page="../../inc.jsp"></jsp:include>
<script type="text/javascript"
	src="${ctx}/jslib/easyui1.3.3/plugins/datagrid-detailview.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="${ctx}/jslib/easyui1.3.3/plugins/datagrid-statistics.js"
	charset="utf-8"></script>
<meta http-equiv="X-UA-Compatible" content="edge" />
<title>工程款拨付登记管理</title>
<script type="text/javascript">
	var dataGrid;
	$(function() {
		dataGrid = $('#dataGrid').datagrid({
			url : '${ctx}' + '/projectAppropriateReg/dataGrid',
			striped : true,
			pagination : true,
			nowrap : true,
			idField : 'id',
			sortName : 'id',
			sortOrder : 'desc',
			pageSize : 10,
			view: detailview,   
		    detailFormatter:function(index,row){   
		        return '<div style="padding:2px"><table id="ddv-' + index + '"></table></div>';   
		    },
		    onExpandRow: function(index,row){ 
		        $('#ddv-'+index).datagrid({ 
		            url:'${ctx}' + '/projectAppropriateAccount/dataGrid', 
		            queryParams:{
		            	projectAppRegId : row.id
		            },
		            striped : true,
		            singleSelect:true, 
		            loadMsg:'', 
		            height:'auto', 
		            showFooter : true,
		            columns:[[ 
						{title : '序号',field : 'index',align : 'center',width : '60',
							formatter : function(val, row, index) {
								if(isEmpty(val)){
									return index + 1;
								}else{
									return val;
								}
							}
						},
		                {field:'toAccountFee',title:'到帐金额（元）',width:100,align:'center',sum : true,}, 
		                {field:'toAccountDT',title:'到帐时间',width:150,align:'center'}, 
		                {field:'applyFee',title:'申请拨付金额',width:120,align:'center',sum : true,},
		                {field:'applyDT',title:'申请拨付时间',width:100,align:'center'},
		                {field:'actualFee',title:'实际拨付金额（元）',width:150,align:'center',sum : true,},
		                {field:'actualDT',title:'实际拨付时间',width:100,align:'center'},
		                {field:'payee',title:'收款人',width:100,align:'center'},
		                {
		    				width : '120',
		    				title : '状态',
		    				align : 'center',
		    				field : 'state',
		    				formatter : function(value, row, index) {
		    					debugger;
		    					if(isEmpty(value)){
		    						return '';
		    					}
		    					return value == 0?'<font color="red">待确认</font>':'<font color="green">已确认</font>';
		    				}
		    			},
		                {field:'bank',title:'开户行',width:120,align:'center'},
		                {field:'accountNum',title:'帐号',width:150,align:'center'},
		                {field:'remark1',title:'备注1',width:200,align:'center'},
		                {field:'remark2',title:'备注2',width:200,align:'center'},
		                {field : 'id',hidden:true},
		                {field : 'projectAppRegName',hidden:true},
		                {field : 'projectAppRegId',hidden:true},
		                {field : 'times',hidden:true}
		            ]], 
		            onResize:function(){ 
		                $('#dataGrid').datagrid('fixDetailRowHeight',index); 
		            }, 
		            onLoadSuccess:function(){ 
		                setTimeout(function(){ 
		                    $('#dataGrid').datagrid('fixDetailRowHeight',index); 
		                },0); 
		                $('#ddv-'+index).datagrid('statistics');
		            } 
		        }); 
		        $('#dataGrid').datagrid('fixDetailRowHeight',index); 
		    },
			pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
			columns : [ [ {
				checkbox : true,
				field : 'id',
				rowspan : 2,
				width : '30',
			}, {
				title : '序号',
				rowspan : 2,
				field : 'index',
				align : 'center',
				width : '40',
				formatter : function(value, row, index) {
					return index + 1;
				}
			}, {
				width : '120',
				title : '项目名称',
				rowspan : 2,
				align : 'center',
				field : 'projectName'
			}, {
				width : '90',
				title : '中标价（元）',
				rowspan : 2,
				sortable : true,
				align : 'center',
				field : 'bidPrice'
			}, {
				width : '120',
				title : '管理费比例(%)',
				rowspan : 2,
				sortable : true,
				align : 'center',
				field : 'managerFeeRate'
			}, {
				width : '120',
				title : '管理费数额(元)',
				rowspan : 2,
				sortable : true,
				align : 'center',
				field : 'managerFee'
			}, {
				width : '100',
				title : '中标日期',
				rowspan : 2,
				sortable : true,
				align : 'center',
				field : 'bidDT',
				formatter : Common.formatter
			}, {
				width : '90',
				title : '合同工期(天)',
				rowspan : 2,
				align : 'center',
				field : 'contractDuration'
			}, {
				width : '90',
				title : '状态',
				rowspan : 2,
				align : 'center',
				field : 'state',
				formatter : function(value, row, index) {
					if(value == '-1' || value == -1){
						return '未申请拨款';
					}else if(value == 0){
						return '<font color="red">待拨款</font>';
					}else{
						return '<font color="green">已拨付</font>';
					}
				}
			}, {
				title : '联系人信息',
				colspan : 3,
				align : 'center'
			}, {
				title : '收款人信息',
				colspan : 3,
				align : 'center'
			}, {
				width : '90',
				title : '备注',
				rowspan : 2,
				align : 'center',
				field : 'remark'
			} ], [ {
				width : '80',
				title : '姓名',
				sortable : true,
				align : 'center',
				field : 'contactName'
			}, {
				width : '120',
				title : '电话',
				sortable : true,
				align : 'center',
				field : 'contactTel'
			}, {
				width : '120',
				title : '身份证号',
				align : 'center',
				field : 'contactIdCard'
			},{
				width : '90',
				title : '户名',
				sortable : true,
				align : 'center',
				field : 'payee'
			}, {
				width : '120',
				title : '开户行',
				sortable : true,
				align : 'center',
				field : 'bank'
			}, {
				width : '120',
				title : '帐号',
				align : 'center',
				field : 'accountNum'
			} ] ],

			/* columns : [ [ {
				title : '联系人信息',
				colspan : 3,
				align : 'center'
			}, {
				title : '收款人信息',
				colspan : 3,
				align : 'center'
			}, {
				width : '90',
				title : '备注',
				rowspan : 2,
				align : 'center',
				field : 'remark'
			} ], [ {
				width : '80',
				title : '姓名',
				rowspan : 2,
				sortable : true,
				align : 'center',
				field : 'contactName'
			}, {
				width : '120',
				title : '电话',
				rowspan : 2,
				sortable : true,
				align : 'center',
				field : 'contactTel'
			}, {
				width : '120',
				title : '身份证号',
				rowspan : 2,
				align : 'center',
				field : 'contactIdCard'
			},{
				width : '100',
				title : '户名',
				rowspan : 2,
				sortable : true,
				align : 'center',
				field : 'payee'
			}, {
				width : '120',
				title : '开户行',
				rowspan : 2,
				sortable : true,
				align : 'center',
				field : 'bank'
			}, {
				width : '120',
				title : '帐号',
				rowspan : 2,
				align : 'center',
				field : 'accountNum'
			} ] ], */

			toolbar : '#toolbar'
		});

	});

	function searchFun() {
		var queryParams = $('#dataGrid').datagrid('options').queryParams;
		queryParams.projectName = "";
		queryParams.payee = "";
		queryParams.contactName = "";
		var projectName = $('#projectName').val();
		var payee = $('#payee').val();
		var contactName = $('#contactName').val();
		if (!isEmpty(projectName)) {
			queryParams.projectName = projectName;
		}
		if (!isEmpty(payee)) {
			queryParams.payee = payee;
		}
		if (!isEmpty(contactName)) {
			queryParams.contactName = contactName;
		}
		//重新加载datagrid的数据  
		$("#dataGrid").datagrid('reload');
	}

	function clearFun() {
		$('#projectName').val('');
		$('#payee').val('');
		$('#contactName').val('');
		$('#state').combobox('clear');
	}

	function addFun() {
		parent.$.modalDialog({
			title : '工程款拨付登记',
			width : document.body.clientWidth*0.9,
			height : 600,
			//height : document.body.clientHeight*0.9,
			href : '${ctx}/projectAppropriateReg/addPage',
			buttons : [ {
				text : '登记',
				id:'paregBtn',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
					var f = parent.$.modalDialog.handler
							.find('#projectAppropriateRegAddForm');
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
		parent.$.messager.confirm('询问', '确认删除选中的记录吗？', function(b) {
			if (b) {
				progressLoad();
				$.post('${ctx}/projectAppropriateReg/delete', {
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
		parent.$.modalDialog({
			title : '工程款拨付处理',
			width : document.body.clientWidth*0.9,
			height : 600,
			//height : document.body.clientHeight*0.9,
			href : '${ctx}/projectAppropriateReg/handlerPage?id=' + id,
			buttons : [ {
				text : '退出',
				handler : function() {
					//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					parent.$.modalDialog.handler.dialog('close');
				}
			} ]
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
			title : '工程款拨付修改',
			width : document.body.clientWidth*0.9,
			//height : document.body.clientHeight*0.9,
			height : 600,
			href : '${ctx}/projectAppropriateReg/editPage?id=' + id,
			buttons : [ {
				text : '编辑',
				id:'paregBtn',
				handler : function() {
					parent.$.modalDialog.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					var f = parent.$.modalDialog.handler
							.find('#projectAppropriateRegEditForm');
					f.submit();
				}
			},{
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
			title : '工程款拨付详情',
			width : document.body.clientWidth*0.9,
			height : 600,
			//height : document.body.clientHeight*0.9,
			href : '${ctx}/projectAppropriateReg/detailPage?id=' + id,
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
		var url = ctxPath + "/report/projectAReg?id=" + id+"&&type="+type;
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
				test="${fn:contains(sessionInfo.resourceList, '/projectAppropriateReg/add')}">
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
				test="${fn:contains(sessionInfo.resourceList, '/projectAppropriateReg/edit')}">
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
				test="${fn:contains(sessionInfo.resourceList, '/projectAppropriateReg/delete')}">
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
				test="${fn:contains(sessionInfo.resourceList, '/projectAppropriateReg/detail')}">
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
				test="${fn:contains(sessionInfo.resourceList, '/projectAppropriateAccount/handler')}">
				<a onclick="handlerFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_audit'">处理</a>
			</c:when>
			<c:otherwise>
				<a href="javascript:void(0);" class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_audit_disabled'"><font
					color="gray">处理</font> </a>
			</c:otherwise>
		</c:choose>

		<a onclick="printFun(0);" href="javascript:void(0);"
			class="easyui-linkbutton"
			data-options="plain:true,iconCls:'icon_toolbar_detail'">打印预览</a> <a
			onclick="printFun(1);" href="javascript:void(0);"
			class="easyui-linkbutton"
			data-options="plain:true,iconCls:'icon_toolbar_detail'">导出Excel</a>
		<table>
			<tr>
				<th>项目名称:</th>
				<td><input style="width:150px" type="text" id="projectName"></td>
				<th>收款人:</th>
				<td><input style="width:100px" type="text" id="payee"></td>
				<th>联系人:</th>
				<td><input style="width:100px" type="text" id="contactName"></td>
				<td>
					<a onclick="searchFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_search'">搜索</a> 
					<a onclick="clearFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_clear'">清空</a>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>