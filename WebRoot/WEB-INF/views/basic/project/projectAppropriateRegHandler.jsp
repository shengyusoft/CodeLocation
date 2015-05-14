<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script type="text/javascript">
	var dataGrid;
	$(function() {
		var projectAppRegId = '${projectAppropriateReg.id}';
		dataGrid = $('#dataGrid').datagrid({
			url : '${ctx}' + '/projectAppropriateAccount/dataGrid',
			striped : true,
			rownumbers : true,
			pagination : true,
			queryParams:{
            	projectAppRegId : projectAppRegId
            },
			nowrap : true,
			idField : 'id',
			sortName : 'id',
			sortOrder : 'asc',
			pageSize : 5,
			pageList : [ 10, 15],
			columns : [ [ {
				checkbox : true,
				field : 'id',
				width : '30',
			}, {
				width : '120',
				title : '到帐金额（元）',
				align : 'center',
				field : 'toAccountFee'
			}, {
				width : '90',
				title : '到帐时间',
				sortable : true,
				align : 'center',
				field : 'toAccountDT'
			}, {
				width : '120',
				title : '申请拨付金额',
				sortable : true,
				align : 'center',
				field : 'applyFee'
			}, {
				width : '120',
				title : '申请拨付时间',
				sortable : true,
				align : 'center',
				field : 'applyDT'
			}, {
				width : '120',
				title : '实际拨付金额（元）',
				sortable : true,
				align : 'center',
				field : 'actualFee'
			}, {
				width : '90',
				title : '实际拨付时间',
				align : 'center',
				field : 'actualDT'
			}, {
				width : '90',
				title : '状态',
				align : 'center',
				field : 'state',
				formatter : function(value, row, index) {
					return value == 0?'<font color="red">待确认</font>':'<font color="green">已确认</font>';
				}
			}, {
				width : '90',
				title : '收款人',
				align : 'center',
				field : 'payee'
			}, {
				width : '90',
				title : '开户行',
				align : 'center',
				field : 'bank'
			}, {
				width : '90',
				title : '帐号',
				align : 'center',
				field : 'accountNum'
			}, {
				width : '90',
				title : '备注1',
				align : 'center',
				field : 'remark1'
			}, {
				width : '90',
				title : '备注2',
				align : 'center',
				field : 'remark2'
			} ] ],
			toolbar : '#toolbar'
		});
	});
	
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

		parent.$.modalDialogTwo({
			title : '工程款到帐及拨付详情',
			width : document.body.clientWidth*0.75,
			height : 400,
			href : '${ctx}/projectAppropriateAccount/detailPage?id=' + id,
			buttons : [ {
				text : '退出',
				handler : function() {
					//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					parent.$.modalDialogTwo.handler.dialog('close');
				}
			} ]
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

		parent.$.modalDialogTwo({
			title : '会计确认',
			width : document.body.clientWidth*0.75,
			height : 400,
			href : '${ctx}/projectAppropriateAccount/handlerPage?id=' + id,
			buttons : [ {
				text : '确认',
				handler : function() {
					parent.$.modalDialogTwo.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					var f = parent.$.modalDialogTwo.handler
							.find('#projectAppropriateAccountEditForm');
					f.submit();
				}
			}, {
				text : '退出',
				handler : function() {
					//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					parent.$.modalDialogTwo.handler.dialog('close');
				}
			}]
		});
	}
	
</script>
<div class="easyui-layout" data-options="fit:true,border:false" style="overflow: hidden">
	<div data-options="border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="projectAppropriateRegEditForm" method="post">
			<table class="grid">
				<tr>
					<th>项目名称 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input type="hidden" name="id" id="id"
						value="${projectAppropriateReg.id}" /> <input name="projectName"
						style="width: 100%; height: 100%" type="text" id="projectName"
						readonly="readonly" data-options="required:true"
						value="${projectAppropriateReg.projectName}" /></td>
					<th>中标价（元） &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="bidPrice" style="width: 100%; height: 100%"
						type="number" id="bidPrice" readonly="readonly"
						data-options="required:true"
						value="${projectAppropriateReg.bidPrice}" /></td>
					<th>中标日期 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input class="Wdate" type="text" name="bidDT"
						readonly="readonly" id="bidDT" style="width: 98%; height: 100%;"
						value="${projectAppropriateReg.bidDT}"
						data-options="required:true" onfocus="showDate('yyyy-MM-dd')" /></td>
				</tr>
				<tr>
					<th>合同工期（年） &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="name" style="width: 100%; height: 100%"
						type="number" id="name" readonly="readonly"
						data-options="required:true"
						value="${projectAppropriateReg.contractDuration}" /></td>
					<th>管理费比例 （%）&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="managerFeeRate"
						style="width: 100%; height: 100%" type="number"
						id="managerFeeRate" readonly="readonly"
						data-options="required:true"
						value="${projectAppropriateReg.managerFeeRate}" /></td>
					<th>管理费数额（元）&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="managerFee" style="width: 100%; height: 100%"
						type="number" id="managerFee" readonly="readonly"
						data-options="required:true"
						value="${projectAppropriateReg.managerFee}" /></td>
				</tr>
				<tr>
					<td colspan="6">收款人信息</td>
				</tr>
				<tr>
					<th>户名 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="payee" style="width: 100%; height: 100%"
						type="text" id="payee" readonly="readonly"
						data-options="required:true"
						value="${projectAppropriateReg.payee}" /></td>
					<th>开户行&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="bank" style="width: 100%; height: 100%"
						type="text" id="bank" readonly="readonly"
						data-options="required:true" value="${projectAppropriateReg.bank}" /></td>
					<th>帐号&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="accountNum" style="width: 100%; height: 100%"
						type="text" id="accountNum" readonly="readonly"
						data-options="required:true"
						value="${projectAppropriateReg.accountNum}" /></td>
				</tr>
				<tr>
					<td colspan="6">联系人信息</td>
				</tr>
				<tr>
					<th>姓名 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="contactName"
						style="width: 100%; height: 100%" type="text" id="contactName"
						readonly="readonly" data-options="required:true"
						value="${projectAppropriateReg.contactName}" /></td>
					<th>电话&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="contactTel" style="width: 100%; height: 100%"
						type="text" id="contactTel" readonly="readonly"
						data-options="required:true"
						value="${projectAppropriateReg.contactTel}" /></td>
					<th>身份证号&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="contactIdCard"
						style="width: 100%; height: 100%" type="text" id="contactIdCard"
						readonly="readonly" data-options="required:true"
						value="${projectAppropriateReg.contactIdCard}" /></td>
				</tr>
				<tr>
					<th>备注&nbsp;</th>
					<td colspan="5"><textarea style="width: 100%" rows="3"
							readonly="readonly" name="remark">${projectAppropriateReg.remark}</textarea></td>
				</tr>
			</table>
		</form>
	</div>
	<span style="font-size: 14px; color: blue">工程款到帐及拨付情况表（工程部收到钱时填写）</span>
	<div data-options="fit:true,border:false" style="overflow: auto;height: 180px">
		<table id="dataGrid" data-options="fit:true,border:false"></table>
	</div>
	<div id="toolbar" class="mygrid-toolbar" style="inline: true">
		<c:choose>
			<c:when
				test="${fn:contains(sessionInfo.resourceList, '/projectAppropriateAccount/detail')}">
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
					data-options="plain:true,iconCls:'icon_toolbar_audit'">确认拨款</a>
			</c:when>
			<c:otherwise>
				<a href="javascript:void(0);" class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_audit_disabled'"><font
					color="gray">确认拨款</font> </a>
			</c:otherwise>
		</c:choose>
	</div>
</div>