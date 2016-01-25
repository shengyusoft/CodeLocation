<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.wtkj.common.GlobalConstant"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../../inc.jsp"></jsp:include>
<script type="text/javascript"
	src="${ctx}/jslib/easyui1.3.3/plugins/datagrid-groupview.js"
	charset="utf-8"></script>
<meta http-equiv="X-UA-Compatible" content="edge" />
<title>租车登记</title>
<script type="text/javascript">
	var dataGrid;
	$(function() {
		dataGrid = $('#dataGrid').datagrid({
			url : '${ctx}' + '/carRentalReg/dataGrid',
			striped : true,
			pagination : true,
			nowrap : true,
			idField : 'id',
			sortName : 'id',
			sortOrder : 'desc',
			pageSize : getDefaultPageSize(),
			pageList : [ 10, 20, 30, 40, 50, 100, 200, 300,
					400, 500 ],
			columns : [ [
					{
						checkbox : true,
						field : 'id',
						width : '30'
					},
					{
						title : '序号',
						field : 'index',
						align : 'center',
						width : '40',
						formatter : function(value, row, index) {
							return index + 1;
						}
					},
					{
						width : '60',
						title : '申请人',
						align : 'center',
						field : 'applier',
						formatter : function(val,row,index){
							if(row.process_vo != null){
								return row.process_vo.applyUserName;
							}
							
						}
					},
					{
						width : '75',
						title : '申请时间',
						align : 'center',
						field : 'applierDt',
						formatter : function(val,row,index){
							if(row.process_vo != null && row.process_vo.startDT != null){
								var date = newDate(row.process_vo.startDT);
								return date.format('yyyy-MM-dd');
							}
						}
					},
					{
						width : '60',
						title : '用车人',
						align : 'center',
						field : 'usedName'
					},
					{
						width : '75',
						title : '用车时间',
						sortable : true,
						align : 'center',
						field : 'usedTime',
						formatter : Common.formatter
					},
					{
						width : '400',
						title : '用车事由',
						sortable : true,
						align : 'center',
						field : 'usedReason'
					},
					{
						width : '60',
						title : '车主',
						align : 'center',
						field : 'driver'
					},
					{
						width : '80',
						title : '车号',
						sortable : true,
						align : 'center',
						field : 'license'
					},
					{
						width : '100',
						title : '状态',
						rowspan : 2,
						align : 'center',
						field : 'process_vo',
						formatter : function(value, row, index) {
							if (value != null) {
								switch (value.state) {
								case 0:
									return '初始化';
								case 1:
									return '<font color="green">已申请</font>';
								case 2:
									return '<font color="green">综合部审批通过</font>';
								case -2:
									return '<font color="red">【综合部审核退回】</font>';
								}
							}
						}
					},
					{
						width : '60',
						title : '起点里程',
						sortable : true,
						align : 'center',
						field : 'startingMileage'
					}, {
						width : '60',
						title : '终点里程',
						align : 'center',
						field : 'endMileage'
					}, {
						width : '60',
						title : '行驶里程',
						align : 'center',
						field : 'drivingMileage'
					}, {
						width : '90',
						title : '单价(元/公里)',
						align : 'center',
						field : 'unitPrice'
					}, {
						width : '60',
						title : '合价(元)',
						align : 'center',
						field : 'carCost'
					}, {
						width : '70',
						title : '过路费(元)',
						align : 'center',
						field : 'tolls'
					}, {
						width : '60',
						title : '总计(元)',
						sortable : true,
						align : 'center',
						field : 'totalCost'
					}] ],
			toolbar : '#toolbar'
		});

	});
	
	function searchFun() {
		var queryParams = $('#dataGrid').datagrid('options').queryParams;
		queryParams['process_vo.applyUserName'] = "";
		queryParams.applyStartDt = "";
		queryParams.applyEndDt = "";

		var applicant = $('#applicant').val();
		var st = $('#rentalTimeST').val();
		var et = $('#rentalTimeET').val();

		queryParams['process_vo.applyUserName'] = isEmpty(applicant) ? "" : applicant;
		queryParams.applyStartDt = isEmpty(st) ? "" : st;
		queryParams.applyEndDt = isEmpty(et) ? "" : et;


		//重新加载datagrid的数据  
		reloadGrid($("#dataGrid"));
	}
	
	function clearFun() {
		$('#applicant').val('');
		$('#rentalTimeST').val('');
		$('#rentalTimeET').val('');
	}
	
	//统一处理 add,edit,detail,handler
	function viewFun(viewType) {
		var me = this,dwidth=1000,dheight=500;
		var title = '', href = '${ctx}/carRentalReg/viewPage?viewType='+ viewType;
		var buttons = [];
		if ('add' == viewType) {
			title = '租车登记';
			buttons = [ {
				text : '保存',
				handler : function(){
					parent.$.modalDialog.handler.find('#actionType').val('<%=GlobalConstant.ACTION_ADD%>');
					me.submitForm();
				}
			
			},{
				text : '提交',
				handler : function() {
					parent.$.messager.confirm('提醒','提交后不能修改,确认提交？',function(b) {
						if (b) {
							parent.$.modalDialog.handler.find('#actionType').val('<%=GlobalConstant.ACTION_COMMIT%>');
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
			var state = rows[0].process_vo == null?'':rows[0].process_vo.state;
			href += '&id=' + id;
			//编辑
			if ('edit' == viewType) {
				if (state == 1) {
					parent.$.messager.alert('警告', '已提交不可修改!');
					return;
				}
				if (state == 2) {
					parent.$.messager.alert('警告', '流程结束不可修改!');
					return;
				}
				title = '租车登记修改';
				buttons = [ {
					text : '编辑',
					handler : function(){
						parent.$.modalDialog.handler.find('#actionType').val('<%=GlobalConstant.ACTION_EDIT%>');
						me.submitForm();
					}
				},{
					text : '提交',
					handler : function() {
						parent.$.messager.confirm('提醒','提交后不能修改,确认提交？',function(b) {
							if (b) {
								parent.$.modalDialog.handler.find('#actionType').val('<%=GlobalConstant.ACTION_COMMIT%>');
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
				title = '租车登记详情';
				buttons = [ {
					text : '退出',
					handler : function() {
						me.closeDialog();
					}
				} ];
			} else if ('handler_zhb' == viewType) {//综合部审核
				dwidth = document.body.clientWidth * 0.8;
				dheight = document.body.clientHeight * 0.95;
				if (state <= 0) {
					parent.$.messager.alert('警告', '申请人尚未提交,不可办理!');
					return;
				}
				if (state == 2) {
					parent.$.messager.alert('警告', '流程已结束不可审核');
					return;
				}
				title = '租车登记->综合部审核';
				buttons = [
						{
							text : '通过',
							handler : function() {
								var f = parent.$.modalDialog.handler
										.find('#processForm');
								parent.$.modalDialog.openner_dataGrid = dataGrid;
								parent.$.modalDialog.handler.find('#option').val(0);
								f.submit();
							}
						},{
							text : '退回',
							handler : function() {
								var f = parent.$.modalDialog.handler
										.find('#processForm');
								parent.$.modalDialog.openner_dataGrid = dataGrid;
								parent.$.modalDialog.handler.find('#option').val(1);
								f.submit();
							}
						}, {
							text : '退出',
							handler : closeDialog
						} ];
			} else if ('processChart' == viewType){
				href = '${ctx}/carRentalReg/processChart?id='+ id;
				title = '租车登记流程图';
				dwidth = document.body.clientWidth * 0.8;
				dheight = document.body.clientHeight * 0.9;
				buttons = [ {
					text : '退出',
					handler : function() {
						me.closeDialog();
					}
				} ];
			}
		}
		
		parent.$.modalDialog({
			title : title,
			width : dwidth,
			height : dheight,
			resizable : true,
			href : href,
			buttons : buttons
		});
	}
	
	//提交form
	function submitForm() {
		//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
		parent.$.modalDialog.openner_dataGrid = dataGrid;
		var f = parent.$.modalDialog.handler.find('#carRentalRegEditForm');
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
				$.post('${ctx}/carRentalReg/delete', {
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
		var url = ctxPath + "/report/carRentalReg?type="+type;
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
				test="${fn:contains(sessionInfo.resourceList, '/carRentalReg/add')}">
				<a onclick="viewFun('<%=GlobalConstant.PAGE_TYPE_ADD%>');" href="javascript:void(0);"
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
				test="${fn:contains(sessionInfo.resourceList, '/carRentalReg/edit')}">
				<a onclick="viewFun('<%=GlobalConstant.PAGE_TYPE_EDIT%>');;" href="javascript:void(0);"
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
				test="${fn:contains(sessionInfo.resourceList, '/carRentalReg/delete')}">
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
				test="${fn:contains(sessionInfo.resourceList, '/carRentalReg/detail')}">
				<a onclick="viewFun('<%=GlobalConstant.PAGE_TYPE_DETAIL%>');" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_detail'">详情 </a>
			</c:when>
			<c:otherwise>
				<a href="javascript:void(0);" class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_detail_disabled'"><font
					color="gray">详情</font> </a>
			</c:otherwise>
		</c:choose>
		
		<c:if test="${fn:contains(sessionInfo.resourceList, '/carRentalReg/handler_zhb')}">
			<a onclick="viewFun('handler_zhb');" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_detail'">综合部审核 </a>
		</c:if>
		
		<a onclick="viewFun('processChart');" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_detail'">查看流程</a>
		
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

		<c:if test="${fn:contains(sessionInfo.resourceList, '/carRentalReg/search')}">
			<table>
				<tr>
					<th>申请人:</th>
					<td><input type="text" id="applicant"></td>
					<th>申请时间:</th>
					<td><input class="Wdate" type="text" name="rentalTimeST" id="rentalTimeST"
						style="height: 100%" onfocus="showDate('yyyy-MM-dd')" /> - <input
						class="Wdate" type="text" name="rentalTimeET" id="rentalTimeET" style="height: 100%"
						onfocus="showDate('yyyy-MM-dd')" /></td>
				</tr>
			</table>
		</c:if>
	</div>
</body>
</html>