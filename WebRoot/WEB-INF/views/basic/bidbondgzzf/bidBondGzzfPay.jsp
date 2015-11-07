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
<title>农民工工资支付保证金缴纳</title>
<script type="text/javascript">
	var dataGrid;
	$(function() {
		dataGrid = $('#dataGrid').datagrid(
			{
				url : '${ctx}' + '/bidBondGzzf/dataGrid',
				striped : true,
				pagination : true,
				nowrap : true,
				queryParams : {
					type : 0
				},
				idField : 'id',
				sortName : 'applyDT',
				sortOrder : 'desc',
				view : detailview,
				detailFormatter : function(index, row) {
					return '<div style="padding:10px"><table title="财务反馈信息" id="ddv-' + index + '"></table></div>';
				},
				onExpandRow : function(index, row) {
					$('#ddv-' + index).datagrid({
						url : '${ctx}'
							+ '/bidBondGzzf/dataGrid',
					queryParams : {
						id : row.id
					},
					striped : true,
					singleSelect : true,
					rownumbers : true,
					loadMsg : '加载中...',
					height : 'auto',
					columns : [ [
							{
								title : '出纳反馈情况',
								colspan : 4,
							},{
								title : '会计反馈情况',
								colspan : 4,
							} ],
							[{
								field : 'toAccountFee',
								align : 'center',
								title : '到帐金额（元）',
								width : 120,
								formatter : Common.formatterDecimal2
							},{
								field : 'toAccountDT',
								align : 'center',
								title : '到帐时间',
								width : 120,
								formatter : Common.formatterTime
							},{
								field : 'handlerName',
								align : 'center',
								title : '办理人',
								width : 120
							},{
								field : 'handlerDT',
								align : 'center',
								title : '办理时间',
								width : 120,
								formatter : Common.formatterTime
							},{
								field : 'outAccountFee',
								align : 'center',
								title : '转出金额',
								width : 120,
								formatter : Common.formatterDecimal2
							},{
								field : 'outAccountDT',
								align : 'center',
								title : '转出时间',
								width : 120,
								formatter : Common.formatterTime
							},{
								field : 'handlerName2',
								align : 'center',
								title : '办理人',
								width : 120
							},{
								field : 'handlerDT2',
								align : 'center',
								title : '办理时间',
								width : 120,
								formatter : Common.formatterTime
							} ] ],
					onResize : function() {$('#dataGrid').datagrid('fixDetailRowHeight',index);},
					onLoadSuccess : function() {
						setTimeout(function() {
							$('#dataGrid').datagrid('fixDetailRowHeight',index);
						}, 0);
					}});
					$('#dataGrid').datagrid('fixDetailRowHeight',index);
				},
				pageSize : 10,
				pageList : [ 10, 20, 30, 40, 50, 100, 200, 300,
						400, 500 ],
				columns : [
						[{
							checkbox : true,
							field : 'id',
							rowspan : 2,
							width : '30'
						},{
							title : '序号',
							field : 'index',
							align : 'center',
							rowspan : 2,
							width : '40',
							formatter : function(value,row, index) {
								return index + 1;
							}
						},{
							width : '140',
							rowspan : 2,
							title : '缴号',
							align : 'center',
							field : 'idNumber'
						},{
							width : '140',
							rowspan : 2,
							title : '项目名称',
							sortable : true,
							align : 'center',
							field : 'projectName'
						},{
							width : '140',
							rowspan : 2,
							title : '标段',
							align : 'center',
							field : 'bdNames'
						},{
							width : '120',
							rowspan : 2,
							title : '保证金数额',
							sortable : true,
							align : 'center',
							field : 'bondFee'
						},{
							width : '90',
							title : '状态',
							rowspan : 2,
							align : 'center',
							field : 'state',
							formatter : function(value,row, index) {
								var reStr ="";
								if(value == 0){
									reStr = '未提交';
								}else if(value == -1){
									reStr = '<font color="red">等待财务确认</font>';
								}else if(value == 1){
									reStr = '<font color="blue">出纳已确认</font>';
								}else if(value == 2){
									reStr = '<font color="green">会计已确认</font>';
								}else{
									reStr = '初始化';
								}
								return reStr;
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
		queryParams.startDT = "";
		queryParams.endDT = "";
		queryParams['applierName'] = "";

		var idNumber = $('#idNumber').val();
		var projectName = $('#projectName').val();
		var startDT = $('#startDT').val();
		var endDT = $('#endDT').val();
		var applierName = $('#applierName').val();

		if (!isEmpty(idNumber)) {
			queryParams.idNumber = idNumber;
		}
		if (!isEmpty(projectName)) {
			queryParams.projectName = projectName;
		}
		if (!isEmpty(applierName)) {
			queryParams['applierName'] = applierName;
		}
		if (!isEmpty(startDT)) {
			//startDT = '1900-01-01';
			queryParams.startDT = startDT;
		}
		if (!isEmpty(endDT)) {
			//endDT = '5000-01-01';
			queryParams.endDT = endDT;
		}
		//重新加载datagrid的数据  
		$("#dataGrid").datagrid('reload');
	}

	function clearFun() {
		$('#idNumber').val('');
		$('#projectName').val('');
		$('#startDT').val('');
		$('#endDT').val('');
		$('#applierName').val('');
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
		var url = ctxPath + "/report/bidBondGzzfPay?id=" + id + "&&type=" + type;
		if (type == 0) {
			var iWidth = 700; //弹出窗口的宽度;
			var iHeight = 600; //弹出窗口的高度;
			id = rows[0].id;
			//获得窗口的垂直位置
			var iTop = (window.screen.availHeight - 30 - iHeight) / 2;
			//获得窗口的水平位置
			var iLeft = (window.screen.availWidth - 10 - iWidth) / 2;
			var tmp = window.open(url, "_blank", "width=700,height=600,top="
					+ iTop + ",left=" + iLeft);
			tmp.focus();
		} else {
			var tmp = window.open(url);
			tmp.focus();
		}
	}

	//统一处理 add,edit,detail,handler
	function viewFun(viewType) {
		var me = this;
		var title = '', href = '${ctx}/bidBondGzzf/viewPage?type=0&viewType='
				+ viewType;
		var buttons = [];
		if ('add' == viewType) {
			title = '投标保证金缴纳申请登记';
			buttons = [ {
				text : '保存',
				handler : me.submitForm
			},{
				text : '提交',
				handler : function() {
					parent.$.messager.confirm('提醒','提交后不能修改,确认提交？',function(b) {
						if (b) {
							parent.$.modalDialog.handler.find('#option').val(1);//提交
							me.submitForm(1);
						}else{
							return;
						}
					});
				}
			}, {
				text : '退出',
				handler : me.closeDialog
			} ];
		} else {
			var rows = dataGrid.datagrid('getSelections');
			if (rows == null || rows.length == 0) {
				parent.$.messager.alert('警告', '没有可查看对象!');
				return;
			}

			if (rows.length > 1) {
				parent.$.messager.alert('警告', '只能查看一条记录!');
				return;
			}

			var id = rows[0].id;
			var state = rows[0].state;
			href += '&id=' + id;
			//编辑
			if ('edit' == viewType) {
				if (state == 1) {
					parent.$.messager.alert('警告', '出纳已提交不可修改!');
					return;
				}
				if (state == 2) {
					parent.$.messager.alert('警告', '会计已提交不可修改!');
					return;
				}
				title = '投标保证金缴纳修改';
				buttons = [ {
					text : '编辑',
					handler : me.submitForm
				},{
					text : '提交',
					handler : function() {
						parent.$.messager.confirm('提醒','提交后不能修改,确认提交？',function(b) {
							if (b) {
								parent.$.modalDialog.handler.find('#option').val(1);//提交
								me.submitForm();
							}else{
								return;
							}
						});
					}
				}, {
					text : '退出',
					handler : me.closeDialog
				} ];
			} else if ('detail' == viewType) {
				title = '投标保证金缴纳详情';
				buttons = [ {
					text : '退出',
					handler : function() {
						me.closeDialog();
					}
				} ];
			} else if ('handler_cn' == viewType) {
				if (state == 0) {
					parent.$.messager.alert('警告', '申请人尚未提交,不可办理!');
					return;
				}
				if (state == 1) {
					parent.$.messager.alert('警告', '已提交不可修改!');
					return;
				}
				if (state == 2) {
					parent.$.messager.alert('警告', '会计已确认不可修改!');
					return;
				}
				title = '投标保证金缴纳->出纳确认';
				buttons = [
						{
							text : '提交',
							handler : function() {
								parent.$.messager.confirm('提醒','必须将转帐截图发到申请人的邮箱（或公司群）!提交后不能修改,确认提交？',function(b) {
									if (b) {
										me.submitForm();
									}else{
										return;
									}
								});
							}
						}, {
							text : '退出',
							handler : closeDialog
						} ];
			} else if ('handler_kj' == viewType) {
				if (state == 0) {
					parent.$.messager.alert('警告', '申请人尚未提交,不可办理!');
					return;
				}
				
				if (state == -1) {
					parent.$.messager.alert('警告', '等待出纳办理!');
					return;
				}
				
				if (state == 2) {
					parent.$.messager.alert('警告', '已提交不可办理!');
					return;
				}
				title = '投标保证金缴纳->会计确认';
				buttons = [
						{
							text : '提交',
							handler : function() {
								parent.$.messager.confirm('提醒','必须将转帐截图发到申请人的邮箱（或公司群）!提交后不能修改,确认提交？',function(b) {
									if (b) {
										me.submitForm();
									} else {
										return;
									}		
								});
							}
						}, {
							text : '退出',
							handler : closeDialog
						} ];
			}

		}

		parent.$.modalDialog({
			title : title,
			width : 1000,
			height : 650,
			resizable : true,
			href : href,
			buttons : buttons
		});
	}

	//提交form
	function submitForm() {
		//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
		parent.$.modalDialog.openner_dataGrid = dataGrid;
		var f = parent.$.modalDialog.handler.find('#bidBondGzzfPayViewForm');
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

		var rows = dataGrid.datagrid('getSelections');
		for ( var i = 0; i < rows.length; i++) {
			var state = rows[i].state;
			if (state == 1) {
				parent.$.messager.alert('警告', '存在已经确认的记录，不能删除!');
				return;
			}
		}
		parent.$.messager.confirm('询问', '确认删除选中的记录吗？', function(b) {
			if (b) {
				progressLoad();
				$.post('${ctx}/bidBondGzzf/delete', {
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

</script>
</head>
<body class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',fit:true,border:false">
		<table id="dataGrid" data-options="fit:true,border:false"></table>
	</div>
	<div id="toolbar" class="mygrid-toolbar" style="inline: true">
		<c:choose>
			<c:when
				test="${fn:contains(sessionInfo.resourceList, '/bidBondGzzf/add')}">
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
				test="${fn:contains(sessionInfo.resourceList, '/bidBondGzzf/edit')}">
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
				test="${fn:contains(sessionInfo.resourceList, '/bidBondGzzf/delete')}">
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
				test="${fn:contains(sessionInfo.resourceList, '/bidBondGzzf/detail')}">
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

		<c:if
			test="${fn:contains(sessionInfo.resourceList, '/bidBondGzzf/handler_cn')}">
			<a onclick="viewFun('handler_cn');" href="javascript:void(0);"
				class="easyui-linkbutton"
				data-options="plain:true,iconCls:'icon_toolbar_detail'">出纳确认 </a>

		</c:if>

		<c:if
			test="${fn:contains(sessionInfo.resourceList, '/bidBondGzzf/handler_kj')}">
			<a onclick="viewFun('handler_kj');" href="javascript:void(0);"
				class="easyui-linkbutton"
				data-options="plain:true,iconCls:'icon_toolbar_detail'">会计确认 </a>

		</c:if>
		<c:if test="${fn:contains(sessionInfo.resourceList, '/bidBondGzzf/print')}">
			<a onclick="printFun(0);" href="javascript:void(0);"
				class="easyui-linkbutton"
				data-options="plain:true,iconCls:'icon_toolbar_detail'">打印预览</a>

			<a onclick="printFun(1);" href="javascript:void(0);"
				class="easyui-linkbutton"
				data-options="plain:true,iconCls:'icon_toolbar_detail'">导出Excel</a>

		</c:if>

		<table>
			<tr>
				<th>缴 号:</th>
				<td><input style="width: 100px" type="text" id="idNumber"></td>
				<th>项目名称:</th>
				<td><input type="text" id="projectName"></td>
				<th>申请人:</th>
				<td><input style="width: 100px" type="text" id="applierName"></td>
				<th>时间范围:</th>
				<td><input class="Wdate" data-options="required:true"
					type="text" name="startDT" id="startDT" style="width: 110px;"
					onfocus="showStart('yyyy-MM-dd')" /> <input class="Wdate"
					data-options="required:true" type="text" name="endDT" id="endDT"
					style="width: 110px;" onfocus="showEnd('yyyy-MM-dd')" /></td>
				<td><a onclick="searchFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_search'">搜索</a> <a
					onclick="clearFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_clear'">清空</a></td>
			</tr>
		</table>
	</div>
</body>
</html>