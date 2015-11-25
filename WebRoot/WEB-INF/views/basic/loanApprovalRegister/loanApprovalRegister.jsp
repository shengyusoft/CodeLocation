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
<title>借款管理</title>
<script type="text/javascript">
	var dataGrid;
	$(function() {
		dataGrid = $('#dataGrid').datagrid({
			url : '${ctx}' + '/loanApprovalRegister/dataGrid',
			striped : true,
			pagination : true,
			nowrap : true,
			idField : 'id',
			sortName : 'id',
			sortOrder : 'desc',
			pageSize : 10,
			pageList : [ 10, 20, 30, 40, 50, 100, 200, 300,
					400, 500 ],
			columns : [ [
					{
						checkbox : true,
						field : 'id',
						width : '30'
					}, {
						title : '序号',
						field : 'index',
						align : 'center',
						width : '30',
						formatter : function(value, row, index) {
							return index + 1;
						}
					}, {
						width : '90',
						title : '申请人',
						align : 'center',
						field : 'applier',
						formatter : function(val,row,index){
							if(row.process_vo != null){
								return row.process_vo.applyUserName;
							}
							
						}
					}, {
						width : '90',
						title : '申请时间',
						align : 'center',
						field : 'applierDt',
						formatter : function(val,row,index){
							if(row.process_vo != null && row.process_vo.startDT != null){
								var date = newDate(row.process_vo.startDT);
								return date.format('yyyy-MM-dd');
							}
						}
					}, {
						width : '90',
						title : '借款人',
						sortable : true,
						align : 'center',
						field : 'loan'
					}, {
						width : '90',
						title : '借款日期',
						sortable : true,
						align : 'center',
						field : 'loanDate',
						formatter : Common.formatter
					}, {
						width : '100',
						title : '借款金额',
						sortable : true,
						align : 'center',
						field : 'loanMoney'
					}, {
						width : '220',
						title : '借款事由',
						align : 'center',
						field : 'loanReason'
					}, {
						width : '140',
						title : '状态',
						rowspan : 2,
						align : 'center',
						field : 'process_vo',
						formatter : function(value, row, index) {
							if (value != null) {
								switch (value.state) {
								case 0:
									return '未申请';
								case 1:
									return '<font color="green">已申请</font>';
								case 2:
									return '<font color="green">总经理审批通过</font>';
								case -2:
									return '<font color="red">【总经理审核退回】</font>';
								case 3:
									return '<font color="green">会计审批通过</font>';
								case -3:
									return '<font color="red">【会计审核退回】</font>';
								case 4:
									return '<font color="green">出纳审批通过</font>';
								case -4:
									return '<font color="red">【出纳审核退回】</font>';
								}
							}
						}
					}] ],
			toolbar : '#toolbar'
		});

	});
	
	function searchFun() {
		var queryParams = $('#dataGrid').datagrid('options').queryParams;
		//queryParams['process_vo.applyUserName'] = "";
		queryParams.loan = "";
		queryParams.loanDateSt = "";
		queryParams.loanDateEt = "";

		var loan = $('#loan').val();
		var st = $('#loanDateSt').val();
		var et = $('#loanDateEt').val();

		queryParams.loan = isEmpty(loan) ? "" : loan;
		queryParams.loanDateSt = isEmpty(st) ? "" : st;
		queryParams.loanDateEt = isEmpty(et) ? "" : et;
		
		//重新加载datagrid的数据  
		reloadGrid($("#dataGrid"));
	}
	
	function clearFun() {
		$('#loan').val('');
		$('#loanDateSt').val('');
		$('#loanDateEt').val('');
	}
	
	//统一处理 add,edit,detail,handler
	function viewFun(viewType) {
		var me = this,dwidth=1000,dheight=500;
		var title = '', href = '${ctx}/loanApprovalRegister/viewPage?viewType='+ viewType;
		var buttons = [];
		if ('add' == viewType) {
			title = '借款登记';
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
				}else if(state >= 2 && state <4){
					parent.$.messager.alert('警告', '流程审批中不可修改!');
					return;
				}else if (state == 4) {
					parent.$.messager.alert('警告', '流程结束不可修改!');
					return;
				}
				
				title = '借款登记修改';
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
				title = '借款登记详情';
				buttons = [ {
					text : '退出',
					handler : function() {
						me.closeDialog();
					}
				} ];
			} else if ('handler' == viewType) {//审核
				dwidth = document.body.clientWidth * 0.8;
				dheight = document.body.clientHeight;
				if (state <= 0) {
					parent.$.messager.alert('警告', '申请人尚未提交,不可办理!');
					return;
				}
				if (state == 4) {
					parent.$.messager.alert('警告', '流程已结束不可审核');
					return;
				}
				title = '员工借款审核';
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
				href = '${ctx}/loanApprovalRegister/processChart?id='+ id;
				title = '员工借款流程图';
				dwidth = document.body.clientWidth * 0.8;
				dheight = 550;
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
		var f = parent.$.modalDialog.handler.find('#loanApprovalRegisterEditForm');
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
				$.post('${ctx}/loanApprovalRegister/delete', {
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
		var rows = dataGrid.datagrid('getSelections');
		if (rows == null || rows.length == 0) {
			parent.$.messager.alert('警告', '未选中数据!');
			return;
		}
		var selected = getSelected();
		var url = "${ctx}/report/loanApprovalRegister?type=" + type + "&ids=" + selected;
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
				test="${fn:contains(sessionInfo.resourceList, '/loanApprovalRegister/add')}">
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
				test="${fn:contains(sessionInfo.resourceList, '/loanApprovalRegister/edit')}">
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
				test="${fn:contains(sessionInfo.resourceList, '/loanApprovalRegister/delete')}">
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
				test="${fn:contains(sessionInfo.resourceList, '/loanApprovalRegister/detail')}">
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
		
		<c:if test="${fn:contains(sessionInfo.resourceList, '/loanApprovalRegister/handler')}">
			<a onclick="viewFun('handler');" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_detail'">审核 </a>
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

		<table>
			<tr>
				<th>借款人:</th>
				<td><input type="text" id="loan"></td>
				<th>借款时间:</th>
				<td><input class="Wdate" type="text" name="loanDateSt"
					id="loanDateSt" style="height: 100%"
					onfocus="showDate('yyyy-MM-dd')" /> - <input class="Wdate"
					type="text" name="loanDateEt" id="loanDateEt"
					style="height: 100%" onfocus="showDate('yyyy-MM-dd')" /></td>
			</tr>
		</table>
	</div>
</body>
</html>