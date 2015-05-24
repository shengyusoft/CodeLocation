<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script type="text/javascript">
	var dataGrid;
	$(function() {
		$('#projectAppropriateRegAddForm').form({
			url : '${pageContext.request.contextPath}/projectAppropriateReg/add',
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
					$("#paregBtn").linkbutton("disable");
					if(result.obj){
						console.log(result.obj);
						console.log(result.obj.id);
						$('#projectAppRegId').val(result.obj.id);
					}
					//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
					parent.$.modalDialog.openner_dataGrid.datagrid('reload');
					//parent.$.modalDialog.handler.dialog('close');
				} else {
					parent.$.messager.alert('错误', result.msg, 'error');
				}
			}
		});
		
		dataGrid = $('#dataGrid').datagrid({
			url : '${ctx}' + '/projectAppropriateAccount/dataGrid',
			striped : true,
			rownumbers : true,
			pagination : true,
			nowrap : true,
			queryParams:{
            	projectAppRegId : isEmpty($('#projectAppRegId').val())?0:$('#projectAppRegId').val()
            },
			idField : 'id',
			sortName : 'id',
			sortOrder : 'asc',
			pageSize : 10,
			pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
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
			} ,{field : 'projectAppRegName',hidden:true},
            {field : 'projectAppRegId',hidden:true},
            {field : 'times',hidden:true} ] ],
			toolbar : '#toolbar'
		});
	});
	
	//拨付情况表方法
	function addFun() {
		var pid = $('#projectAppRegId').val();
		if(isEmpty(pid)){
			parent.$.messager.alert('警告', '请先进行工程款拨付登记!');
			return;
		}
		parent.$.modalDialogTwo({
			title : '工程款到帐及拨付登记',
			width : 700,
			height : 450,
			href : '${ctx}/projectAppropriateAccount/addPage',
			buttons : [ {
				text : '添加',
				handler : function() {
					parent.$.modalDialogTwo.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
					var f = parent.$.modalDialogTwo.handler
							.find('#projectAppropriateAccountAddForm');
					var projectAppRegId = parent.$.modalDialogTwo.handler
					.find('#projectAppRegId');
					if(projectAppRegId){
						projectAppRegId.val(pid);
					}
					f.submit();
				}
			}, {
				text : '退出',
				handler : function() {
					//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					parent.$.modalDialogTwo.handler.dialog('close');
				}
			} ]
		});
	}
	
	function deleteFun() {
		var selected = parent.getSelecteds(dataGrid);
		if (isEmpty(selected)) {
			parent.$.messager.alert('警告', '至少选中一条记录!');
			return;
		}
		parent.$.messager.confirm('询问', '确认删除选中的记录吗？', function(b) {
			if (b) {
				progressLoad();
				$.post('${ctx}/projectAppropriateAccount/delete', {
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

		parent.$.modalDialogTwo({
			title : '工程款到帐及拨付修改',
			width : 700,
			height : 450,
			href : '${ctx}/projectAppropriateAccount/editPage?id=' + id,
			buttons : [ {
				text : '编辑',
				handler : function() {
					parent.$.modalDialogTwo.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
					var f = parent.$.modalDialogTwo.handler
							.find('#projectAppropriateAccountEditForm');
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

		parent.$.modalDialogTwo({
			title : '工程款到帐及拨付详情',
			width : 700,
			height : 450,
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
</script>
<div class="easyui-layout" data-options="fit:true,border:false" style="overflow: hidden">
	<div data-options="border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="projectAppropriateRegAddForm" method="post">
			<table class="grid">
				<tr>
					<th>项目名称 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input id="projectAppRegId" type="hidden"
						name="projectAppRegId"></input> <input name="projectName"
						style="width: 100%; height: 100%" type="text" id="projectName"
						class="easyui-validatebox span2" data-options="required:true" /></td>
					<th>中标价（元） &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="bidPrice" style="width: 100%; height: 100%"
						type="number" id="bidPrice" class="easyui-validatebox span2"
						data-options="required:true" /></td>
					<th>中标日期 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input class="Wdate" type="text" name="bidDT" id="bidDT"
						style="width: 98%; height: 100%;" data-options="required:true"
						onfocus="showDate('yyyy-MM-dd')" /></td>
				</tr>
				<tr>
					<th>合同工期（年） &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="contractDuration" style="width: 100%; height: 100%"
						type="number" id="contractDuration" class="easyui-validatebox span2"
						data-options="required:true" /></td>
					<th>管理费比例 （%）&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="managerFeeRate"
						style="width: 100%; height: 100%" type="number"
						id="managerFeeRate" class="easyui-validatebox span2"
						data-options="required:true" /></td>
					<th>管理费数额（元）&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="managerFee" style="width: 100%; height: 100%"
						type="number" id="managerFee" class="easyui-validatebox span2"
						data-options="required:true" /></td>
				</tr>
				<tr>
					<td colspan="6">收款人信息</td>
				</tr>
				<tr>
					<th>户名 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="payee" style="width: 100%; height: 100%"
						type="text" id="accountNum" class="easyui-validatebox span2"
						data-options="required:true" /></td>
					<th>开户行&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="bank" style="width: 100%; height: 100%"
						type="text" id="bank" class="easyui-validatebox span2"
						data-options="required:true" /></td>
					<th>帐号&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="accountNum" style="width: 100%; height: 100%"
						type="text" id="accountNum" class="easyui-validatebox span2"
						data-options="required:true" /></td>
				</tr>
				<tr>
					<td colspan="6">联系人信息</td>
				</tr>
				<tr>
					<th>姓名 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="contactName"
						style="width: 100%; height: 100%" type="text" id="contactName"
						class="easyui-validatebox span2" data-options="required:true" /></td>
					<th>电话&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="contactTel" style="width: 100%; height: 100%"
						type="text" id="contactTel" class="easyui-validatebox span2"
						data-options="required:true" /></td>
					<th>身份证号&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="contactIdCard"
						style="width: 100%; height: 100%" type="text" id="contactIdCard"
						class="easyui-validatebox span2" data-options="required:true" /></td>
				</tr>
				<tr>
					<th>备注&nbsp;</th>
					<td colspan="5"><textarea style="width: 100%" rows="3"
							name="remark"></textarea></td>
				</tr>
			</table>
		</form>
	</div>
	<span style="font-size: 14px; color: blue">工程款到帐及拨付情况表（工程部收到钱时填写）</span>
	
	<div data-options="fit:true,border:false" style="overflow: auto;height: 180px">
		<table id="dataGrid" data-options="fit:true,border:false"></table>
	</div>

	<div style="display: none" id="toolbar" class="mygrid-toolbar"
		style="inline: true">
		<c:choose>
			<c:when
				test="${fn:contains(sessionInfo.resourceList, '/projectAppropriateAccount/add')}">
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
				test="${fn:contains(sessionInfo.resourceList, '/projectAppropriateAccount/edit')}">
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
				test="${fn:contains(sessionInfo.resourceList, '/projectAppropriateAccount/delete')}">
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
	</div>
</div>