<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script type="text/javascript">
	$(function() {
		var dataGrid;
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
					//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
					parent.$.modalDialog.openner_dataGrid.datagrid('reload');
					parent.$.modalDialog.handler.dialog('close');
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
			idField : 'id',
			sortName : 'id',
			sortOrder : 'asc',
			pageSize : 10,
			pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
			columns : [ [ {
				checkbox : true,
				field : 'id',
				rowspan : 2,
				width : '30',
			}, {
				width : '120',
				title : '项目名称',
				rowspan : 2,
				align : 'center',
				field : 'toAccountFee'
			}, {
				width : '90',
				title : '中标价（元）',
				rowspan : 2,
				sortable : true,
				align : 'center',
				field : 'toAccountDT'
			}, {
				width : '120',
				title : '管理费比例',
				rowspan : 2,
				sortable : true,
				align : 'center',
				field : 'applyFee'
			}, {
				width : '120',
				title : '管理费数额',
				rowspan : 2,
				sortable : true,
				align : 'center',
				field : 'applyDT'
			}, {
				width : '120',
				title : '中标日期',
				rowspan : 2,
				sortable : true,
				align : 'center',
				field : 'actualFee'
			}, {
				width : '90',
				title : '合同工期',
				rowspan : 2,
				align : 'center',
				field : 'actualDT'
			}, {
				width : '90',
				title : '状态',
				rowspan : 2,
				align : 'center',
				field : 'payee'
			} ] ],
			toolbar : '#toolbar'
		});
	});
	
	function addFun() {
		debugger;
		parent.parent.$.modalDialogTwo({
			title : '工程款拨付登记',
			width : document.body.clientWidth*0.75,
			height : 600,
			href : '${ctx}/projectAppropriateReg/editPage',
			buttons : [ {
				text : '添加',
				handler : function() {
					parent.$.modalDialogTwo.openner_dataGrid = dataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
					var f = parent.$.modalDialog.handler
							.find('#projectAppropriateRegAddForm');
					f.submit();
				}
			} ]
		});
	}
	

	$.modalDialogTwo = function(options) {
		if ($.modalDialogTwo.handler == undefined) {// 避免重复弹出
			var opts = $.extend({
				title : '',
				width : 840,
				height : 680,
				modal : true,
				onClose : function() {
					$.modalDialogTwo.handler = undefined;
					$(this).dialog('destroy');
				},
				onOpen : function() {
					// parent.$.messager.progress({
					// title : '提示',
					// text : '数据加载中，请稍后....'
					// }); 
				}
			}, options);
			opts.modal = true;// 强制此dialog为模式化，无视传递过来的modal参数
			return $.modalDialogTwo.handler = $('<div/>').dialog(opts);
		}
	};
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="projectAppropriateRegAddForm" method="post">
			<table class="grid">
				<tr>
					<th>项目名称 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="projectName" style="width: 100%; height: 100%"
						type="text" id="projectName" class="easyui-validatebox span2"
						data-options="required:true" /></td>
					<th>中标价（元） &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="bidPrice" style="width: 100%; height: 100%"
						type="number" id="bidPrice" class="easyui-validatebox span2"
						data-options="required:true" /></td>
					<th>中标日期 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input class="Wdate" type="text" name="bidDT"
						id="bidDT" style="width: 98%; height: 100%;"
						data-options="required:true" onfocus="showDate('yyyy-MM-dd')" /></td>
				</tr>
				<tr>
					<th>合同工期（年） &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="name" style="width: 100%; height: 100%"
						type="number" id="name" class="easyui-validatebox span2"
						data-options="required:true" /></td>
					<th>管理费比例 （%）&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="managerFeeRate" style="width: 100%; height: 100%"
						type="number" id="managerFeeRate" class="easyui-validatebox span2"
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
					<td><input name="contactName" style="width: 100%; height: 100%"
						type="text" id="contactName" class="easyui-validatebox span2"
						data-options="required:true" /></td>
					<th>电话&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="contactTel" style="width: 100%; height: 100%"
						type="text" id="contactTel" class="easyui-validatebox span2"
						data-options="required:true" /></td>
					<th>身份证号&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="contactIdCard" style="width: 100%; height: 100%"
						type="text" id="contactIdCard" class="easyui-validatebox span2"
						data-options="required:true" /></td>
				</tr>
				<tr>
					<th>备注&nbsp;</th>
					<td colspan="5"><textarea style="width: 100%" rows="3"
							name="remark"></textarea></td>
				</tr>
			</table>
		</form>
		<span width="100%" style="font-size:14px;color:blue">工程款到帐及拨付情况表（工程部收到钱时填写）</span>
		<div id='ddg'>
			<table id="dataGrid" data-options="fit:true,border:false"></table>
		</div>
		
		<div style="display: none" id="toolbar" class="mygrid-toolbar" style="inline: true">
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
				test="${fn:contains(sessionInfo.resourceList, '/projectAppropriateReg/confirm')}">
				<a onclick="confirmFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_audit'">处理</a>
			</c:when>
			<c:otherwise>
				<a href="javascript:void(0);" class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_audit_disabled'"><font
					color="gray">处理</font> </a>
			</c:otherwise>
		</c:choose>

		<c:if
			test="${fn:contains(sessionInfo.resourceList, '/projectAppropriateReg/search')}">
			<div id="searchbar" class="search-toolbar">
				<span>项目名称:</span> <input type="text" id="projectName"> <a
					onclick="searchFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_search'">搜索</a> <a
					onclick="clearFun();" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_clear'">清空</a>
			</div>
		</c:if>
	</div>
	</div>
	
	
</div>