<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.Date"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<style type="text/css">
</style>
<script type="text/javascript">
	$(function() {
		$('#taskEditForm').form({
			url : '${ctx}/task/save',
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
		detailGridRegist();
		$('#handlerState').val('${task.handlerState}');
		$('#effectState').val('${task.effectState}');
	});
	
	//任务详情编辑
	function viewFun(viewType) {
		var me = this,dwidth=600,dheight=400,id=null;
		var title = '', href = '${ctx}/taskDetail/viewPage?viewType='+ viewType;
		var buttons = [];
		if ('add' == viewType) {
			title = '添加任务详情';
			buttons = [ {
				text : '保存',
				handler : me.submitForm
			}, {
				text : '退出',
				handler : me.closeDialog
			} ];
		}else{
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
			href += '&id=' + id;
			buttons = [ {
				text : '编辑',
				handler : me.submitForm
			}, {
				text : '退出',
				handler : me.closeDialog
			} ];
		}
		parent.$.modalDialogTwo({
			title : title,
			width : dwidth,
			height : dheight,
			href : href,
			buttons : buttons
		});
	}
	
	function submitForm(){
		parent.$.modalDialogTwo.openner_dataGrid = dataGrid;
		var f = parent.$.modalDialogTwo.handler
				.find('#taskDetailForm');
		var taskId = parent.$.modalDialogTwo.handler.find('#taskId');
		if(taskId){
			taskId.val($('#id').val());
		}
		f.submit();
	}
	function closeDialog(){
		parent.$.modalDialogTwo.handler.dialog('close');
	}
	
	//任务详情列表
	function detailGridRegist(){
		dataGrid = $('#dataGrid').datagrid({
			url : '${ctx}/taskDetail/dataGrid',
			striped : true,
			forceFit : true,
			pagination : true,
			nowrap : true,
			queryParams:{
            	taskId : isEmpty($('#id').val())?-1:$('#id').val()
            },
			idField : 'id',
			sortName : 'id',
			sortOrder : 'desc',
			showFooter : true,
			pageSize : getDefaultPageSize(),
			pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
			columns : [ [

			{
				checkbox : true,
				field : 'id',
				width : 30
			}, {
				title : '序号',
				field : 'index',
				align : 'center',
				width : 40,
				formatter : function(val, row, index) {
					if(isEmpty(val)){
						return index + 1;
					}else{
						return val;
					}
				}
			}, {
				width : 120,
				title : '时间节点',
				sortable : true,
				align : 'center',
				field : 'timeLine',
				formatter : Common.formatter
			}, {
				width : 300,
				title : '完成内容',
				align : 'center',
				field : 'finshContent'
			} ] ],
			toolbar : '#toolbar'
		});
	}
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""style="overflow: auto; padding: 3px;">
		<form id="taskEditForm" method="post">
			<fieldset>
				<legend>任务分配：</legend>
				<table class="grid">
					<tr>
						<th width="150px">任务主题 &nbsp;<label
							style="color: red; vertical-align: middle; text-align: center;">*</label>
						</th>

						<td colspan="5">
							<input type="hidden" name="id" id="id"value="${task.id}" /> 
							<input type="hidden" name="receiverId" id="receiverId" value="${task.receiverId}" /> 
							<input type="hidden" name="assignerId" id="assignerId" value="${task.assignerId}" /> 
							<input id="topic" readonly="readonly" name="topic"
							value="${task.topic}" style="width: 100%;" type="text"
							class="easyui-validatebox span2 disabled"
							data-options="required:true" />
						</td>
					</tr>
					<tr>
						<th>任务描述 &nbsp;</th>
						<td colspan="5"><textarea class="disabled"
								readonly="readonly" style="width: 100%" rows="2"
								name="desciption" id="desciption">${task.desciption}</textarea>
						</td>
					</tr>
					<tr>
						<th width="150px">分配人 &nbsp;<label
							style="color: red; vertical-align: middle; text-align: center;">*</label></th>
						<td><input id="assignerName" readonly="readonly" name="assignerName" value="${task.assignerName}"
							class="easyui-validatebox span2 disabled"  style="width: 180px;"></td>
						
						<th>分配时间 &nbsp;</th>
						<td><input class="Wdate disabled" type="text" name="assignDt" readonly="readonly"
							value="<fmt:formatDate value="${task.assignDt}" pattern="yyyy-MM-dd"/>"
							id="assignDt" style="width: 100%; height: 100%" />
						</td>
						
						<th>要求完成时间 &nbsp;</th>
						<td><input class="Wdate" type="text" name="demandFinishDt"
							value="<fmt:formatDate value="${task.demandFinishDt}" pattern="yyyy-MM-dd"/>"
							id="demandFinishDt" style="width: 100%; height: 100%" />
						</td>
					</tr>
					<tr>
						<th width="150px">承办人 &nbsp;</th>
						<td><input name="receiverName" type="text"
							readonly="readonly" class="easyui-validatebox span2 disabled"
							value="${task.receiverName}"></input></td>

						<th>承接时间 &nbsp;</th>
						<td><input class="Wdate disabled" type="text" name="receiveDt" readonly="readonly"
							value="<fmt:formatDate value="${task.receiveDt}" pattern="yyyy-MM-dd"/>"
							id="receiveDt" style="width: 100%; height: 100%" />
						</td>

						<th>计划完成时间 &nbsp;</th>
						<td><input class="Wdate" type="text" name="planFinishDt"
							value="<fmt:formatDate value="${task.planFinishDt}" pattern="yyyy-MM-dd"/>"
							id="planFinishDt" style="width: 100%; height: 100%"
							onclick="showDate('yyyy-MM-dd')" /></td>
					</tr>
				</table>
			</fieldset>
			<fieldset>
				<legend>任务办理</legend>
				<div data-options="fit:true,border:false" style="overflow: auto;height: 225px">
					<table id="dataGrid" data-options="fit:true,border:false"></table>
				</div>
				<table class="grid">
					<tr>
						<th width="150px">办理状态 &nbsp;<label
							style="color: red; vertical-align: middle; text-align: center;">*</label>
						</th>
						<td colspan="5"><select id="handlerState" name="handlerState"
							class="easyui-combobox" style="width: 100px;" panelHeight="auto">
								<option value="0">未办理</option>
								<option value="1">办理中</option>
								<option value="2">已办理</option>
						</select></td>
					</tr>
					<tr>
						<th width="150px">完成情况描述&nbsp;<label
							style="color: red; vertical-align: middle; text-align: center;">*</label>
						</th>
						<td colspan="5"><textarea style="width: 100%" rows="2"
								name="finshDesc" id="finshDesc">${task.finshDesc}</textarea></td>
					</tr>
				</table>
			</fieldset>

			<fieldset>
				<legend>任务效果确认</legend>
				<table class="grid">
					<tr>
						<th width="150px">效果确认&nbsp;
						</th>
						<td colspan="5"><select id="effectState" name="effectState"
							readonly="readonly" class="easyui-combobox disabled"
							style="width: 100px;" panelHeight="auto">
								<option value="0">请选择</option>
								<option value="1">较差</option>
								<option value="2">差</option>
								<option value="3">一般</option>
								<option value="4">好</option>
								<option value="5">较好</option>
						</select></td>
					</tr>
				</table>
			</fieldset>
		</form>
	</div>
</div>
<!-- 任务详情的编辑菜单按钮 -->
<div id="toolbar" class="mygrid-toolbar" style="inline: true">
	<c:choose>
		<c:when
			test="${fn:contains(sessionInfo.resourceList, '/taskDetail/add')}">
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
			test="${fn:contains(sessionInfo.resourceList, '/taskDetail/edit')}">
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
			test="${fn:contains(sessionInfo.resourceList, '/taskDetail/delete')}">
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
</div>