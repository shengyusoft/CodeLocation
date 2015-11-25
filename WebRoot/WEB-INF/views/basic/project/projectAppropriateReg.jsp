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
		            columns : [ [ {
						title : '序号',
						field : 'index',
						align : 'center',
						width : '40',
						rowspan:2,
						formatter : function(val, row, index) {
							if(isEmpty(val)){
								return index + 1;
							}else{
								return val;
							}
						}
					}, {
						title : '<font color="red">以下内容工程部经理填写（单位：元）</font>',
						colspan : 6,
						align : 'center'
					}, {
						title : '<font color="blue">以下内容财务部会计填写（单位：元）</font>',
						colspan : 3,
						align : 'center'
					}, {
						title : '<font color="green">以下内容财务部出纳填写（单位：元）</font>',
						colspan : 3,
						align : 'center'
					}, {
						width : '90',
						rowspan : 2,
						title : '状态',
						align : 'center',
						field : 'state',
						formatter : function(value, row, index) {
							if(value == 0){
								return '<font color="red">未提交</font>';
							}else if(value == 1){
								return '<font color="green">已提交</font>';
							}else if(value == 2){
								return '<font color="green">会计已确认</font>';
							}else if(value == 3){
								return '<font color="green">出纳已确认</font>';
							}else{
								return '';
							}
						}
					} ] , [ {
						width : 110,
						title : '业主本次拨付金额',
						align : 'center',
						field : 'toAccountFee',
						sum : true
					}, {
						width : 110,
						title : '本次计划支付金额',
						sortable : true,
						align : 'center',
						field : 'applyFee'
					}, {
						width : '90',
						title : '收款人',
						rowspan : 2,
						align : 'center',
						field : 'payee'
					}, {
						width : '90',
						title : '开户行',
						rowspan : 2,
						align : 'center',
						field : 'bank'
					}, {
						width : '90',
						title : '帐号',
						rowspan : 2,
						align : 'center',
						field : 'accountNum'
					},{
						width : '90',
						title : '工程部备注',
						align : 'center',
						field : 'remark1'
					}, {
						width : 100,
						title : '实际到帐金额',
						sortable : true,
						align : 'center',
						field : 'actualFee',
						sum : true
					}, {
						width : 100,
						title : '实际到帐时间',
						align : 'center',
						field : 'actualDT',
						formatter:Common.formatter
					}, {
						width : '90',
						title : '会计备注',
						align : 'center',
						field : 'remark2'
					}, {
						width : 110,
						title : '本次实际支付金额',
						sortable : true,
						align : 'center',
						field : 'actualPayFee',
						sum : true
					}, {
						width : '90',
						title : '转出时间',
						align : 'center',
						field : 'toAccountDT',
						formatter:Common.formatter
					}, {
						width : '90',
						title : '出纳备注',
						align : 'center',
						field : 'remark3'
					} ] ],
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
				width : '300',
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
				width : '100',
				title : '管理费比例(%)',
				rowspan : 2,
				sortable : true,
				align : 'center',
				field : 'managerFeeRate'
			}, {
				width : '100',
				title : '管理费数额(元)',
				rowspan : 2,
				sortable : true,
				align : 'center',
				field : 'managerFee'
			}, {
				width : '75',
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
				width : '60',
				title : '状态',
				rowspan : 2,
				align : 'center',
				field : 'state',
				formatter : function(value, row, index) {
					if(value == '-1' || value == -1){
						return '未申请拨款';
					}else if(value == 0){
						return '<font color="red">待拨款</font>';
					}else if(value == 1){
						return '<font color="blue">部分拨付</font>';
					}else if(value == 2){
						return '<font color="green">全部拨付</font>';
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
				width : '50',
				title : '姓名',
				sortable : true,
				align : 'center',
				field : 'contactName'
			}, {
				width : '90',
				title : '电话',
				sortable : true,
				align : 'center',
				field : 'contactTel'
			}, {
				width : '150',
				title : '身份证号',
				align : 'center',
				field : 'contactIdCard'
			},{
				width : '50',
				title : '户名',
				sortable : true,
				align : 'center',
				field : 'payee'
			}, {
				width : '150',
				title : '开户行',
				sortable : true,
				align : 'center',
				field : 'bank'
			}, {
				width : '150',
				title : '帐号',
				align : 'center',
				field : 'accountNum'
			} ] ],
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
		reloadGrid($("#dataGrid"));
	}

	function clearFun() {
		$('#projectName').val('');
		$('#payee').val('');
		$('#contactName').val('');
		$('#state').combobox('clear');
	}
	
	//统一处理 add,edit,detail,handler
	function viewFun(viewType) {
		var me = this;
		var title = '', href = '${ctx}/projectAppropriateReg/viewPage?viewType='+ viewType;
		var buttons = [];
		if ('add' == viewType) {
			title = '工程款拨付登记';
			buttons = [ {
				text : '登记',
				id:'paregBtn',
				handler : me.submitForm
			}, {
				text : '退出',
				handler : me.closeDialog
			} ];
		} else {
			var rows = dataGrid.datagrid('getSelections');
			if (rows == null || rows.length == 0) {
				parent.$.messager.alert('警告', '没有可操作对象!');
				return;
			}

			if (rows.length > 1) {
				parent.$.messager.alert('警告', '只能操作一条记录!');
				return;
			}

			var id = rows[0].id;
			href += '&id=' + id;
			//编辑
			if ('edit' == viewType) {
				title = '工程款拨付修改';
				buttons = [ {
					text : '修改',
					id:'paregBtn',
					handler : me.submitForm
				}, {
					text : '退出',
					handler : me.closeDialog
				} ];
			} else if ('detail' == viewType) {
				title = '工程款拨付详情';
				buttons = [ {
					text : '退出',
					handler : me.closeDialog
				} ];
			}
		}

		parent.$.modalDialog({
			title : title,
			width : 900,
			height : 630,
			resizable : true,
			href : href,
			buttons : buttons
		});
	}

	//提交form
	function submitForm() {
		//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
		parent.$.modalDialog.openner_dataGrid = dataGrid;
		var f = parent.$.modalDialog.handler.find('#projectAppropriateRegViewForm');
		f.submit();
	}

	//关闭窗口
	function closeDialog() {
		parent.$.modalDialog.handler.dialog('close');
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
				<a onclick="viewFun('add');" href="javascript:void(0);"
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
				<a onclick="viewFun('edit');" href="javascript:void(0);"
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
				<a onclick="viewFun('detail');" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_detail'">详情 </a>
			</c:when>
			<c:otherwise>
				<a href="javascript:void(0);" class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_detail_disabled'"><font
					color="gray">详情</font> </a>
			</c:otherwise>
		</c:choose>
		
		<a onclick="printFun(0);" href="javascript:void(0);"
			class="easyui-linkbutton"
			data-options="plain:true,iconCls:'icon_toolbar_detail'">打印预览</a> <a
			onclick="printFun(1);" href="javascript:void(0);"
			class="easyui-linkbutton"
			data-options="plain:true,iconCls:'icon_toolbar_detail'">导出Excel</a>
		
		<a onclick="searchFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_search'">搜索</a> 
					<a onclick="clearFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_clear'">清空</a>

		<table>
			<tr>
				<th>项目名称:</th>
				<td><input style="width: 150px" type="text" id="projectName"></td>
				<th>收款人:</th>
				<td><input style="width: 100px" type="text" id="payee"></td>
				<th>联系人:</th>
				<td><input style="width: 100px" type="text" id="contactName"></td>
			</tr>
		</table>
	</div>
</body>
</html>