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
		console.log('${viewType}');
	});
	
	$('#receiverId').combobox({
		url : "${ctx}/user/combox",
		valueField : 'id',
		value : '${task.receiverId}',
		textField : 'name',
		panelHeight : 200
	});
	
	function showFinishDate() {
		var assignDt = '${task.assignDt}';
		if(assignDt == null || assignDt == ''){
			assignDt = new Date();
		}
		WdatePicker({
			dateFmt : 'yyyy-MM-dd',
			minDate:assignDt
		});
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
						<td style="display: none">
							<input type="hidden" name="viewType" id="viewType" value="${viewType}"/>
							<input type="hidden" name="id" id="id" value="${task.id}"/>
							<input type="hidden" name="assignerId" id="id" value="${task.assignerId}"/>
						</td>
						<th width="150px">任务主题 &nbsp;<label
							style="color: red; vertical-align: middle; text-align: center;">*</label>
							</th>
						<c:choose>
						<c:when test="${task.handlerState >= 1 || viewType == 'detail'}">
							<td colspan="5">
								<input id="topic" readonly="readonly" name="topic" value="${task.topic}" style="width: 100%;"
								type="text" class="easyui-validatebox span2 disabled" data-options="required:true" />
							</td>
						</c:when>
						<c:otherwise>
							<td colspan="5">
								<input id="topic" name="topic" value="${task.topic}" style="width: 100%;"
								type="text" class="easyui-validatebox span2" data-options="required:true" />
							</td>
						</c:otherwise>
						</c:choose>
					</tr>
					<tr>
						<th>任务描述 &nbsp;</th>
						<c:choose>
						<c:when test="${task.handlerState >= 1 || viewType == 'detail'}">
							<td colspan="5">
								<textarea class="disabled" readonly="readonly" style="width: 100%" rows="2" name="desciption" id="desciption">${task.desciption}</textarea>
							</td>
						</c:when>
						<c:otherwise>
							<td colspan="5">
								<textarea style="width: 100%" rows="2" name="desciption" id="desciption">${task.desciption}</textarea>
							</td>
						</c:otherwise>
						</c:choose>
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

						<c:choose>
							<c:when test="${task.handlerState >= 1 || viewType == 'detail'}">
								<!-- 已经在办理的任务不能修改 -->
								<th>要求完成时间 &nbsp;</th>
								<td><input class="Wdate disabled" type="text" name="demandFinishDt"
									value="<fmt:formatDate value="${task.demandFinishDt}" pattern="yyyy-MM-dd"/>"
									id="demandFinishDt" style="width: 100%; height: 100%" readonly="readonly" />
								</td>
							</c:when>
							<c:otherwise>
								<th>要求完成时间 &nbsp;</th>
								<td><input class="Wdate" type="text" name="demandFinishDt"
									value="<fmt:formatDate value="${task.demandFinishDt}" pattern="yyyy-MM-dd"/>"
									id="demandFinishDt" style="width: 100%; height: 100%"
									onclick="showFinishDate()" />
								</td>
							</c:otherwise>
						</c:choose>
					</tr>
					<tr>
						<th width="150px">承办人 &nbsp;</th>
						<td>
							<c:choose>
								<c:when test="${task.handlerState >= 1 || viewType == 'detail'}">
									<!-- 已经在办理的任务不能修改 -->
									<select id="receiverId" name="receiverId"
										class="easyui-validatebox span2 disabled" readonly="readonly"
										data-options="editable:false" style="width: 180px;">
									</select>
								</c:when>
								<c:otherwise>
									<select id="receiverId" name="receiverId"
										class="easyui-validatebox span2"
										data-options="editable:false" style="width: 180px;">
									</select>
								</c:otherwise>
							</c:choose>
						</td>
						
						<th>承接时间 &nbsp;</th>
						<td><input class="Wdate disabled" type="text" name="receiveDt" readonly="readonly"
							value="<fmt:formatDate value="${task.receiveDt}" pattern="yyyy-MM-dd"/>"
							id="receiveDt" style="width: 100%; height: 100%" />
						</td>

						<th>计划完成时间 &nbsp;</th>
						<td><input class="Wdate disabled" type="text"
							name="planFinishDt" readonly="readonly"
							value="<fmt:formatDate value="${task.planFinishDt}" pattern="yyyy-MM-dd"/>"
							id="planFinishDt" style="width: 100%; height: 100%" /></td>

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
						<th width="150px">办理状态 &nbsp;</th>
						<td colspan="5"><select id="handlerState" readonly="readonly"
							name="handlerState"
							class="easyui-combobox disabled" style="width: 100px;" panelHeight="auto">
								<option value="0">未办理</option>
								<option value="1">办理中</option>
								<option value="2">已办理</option>
						</select></td>
					</tr>
					<tr>
						<th width="150px">完成情况描述&nbsp;<label
							style="color: red; vertical-align: middle; text-align: center;">*</label>
						</th>
						<td colspan="5"><textarea class="disabled" readonly="readonly"
								style="width: 100%" rows="2" name="finshDesc" id="finshDesc">${task.finshDesc}</textarea>
						</td>
					</tr>
				</table>
			</fieldset>
			
			<c:choose>
			<c:when test="${task.handlerState == 2 && viewType=='edit'}">
				<fieldset>
				<legend>任务效果确认</legend>
				<!-- 任务完成后可以编辑 -->
				<table class="grid">
					<tr>
						<th width="150px">效果确认&nbsp;<label
							style="color: red; vertical-align: middle; text-align: center;">*</label>
						</th>
						<td colspan="5">
							<select id="effectState" name="effectState"
								class="easyui-combobox" style="width: 100px;" panelHeight="auto">
									<option value="0">请选择</option>
									<option value="1">较差</option>
									<option value="2">差</option>
									<option value="3">一般</option>
									<option value="4">好</option>
									<option value="5">较好</option>
							</select>
						</td>
					</tr>
				</table>
				</fieldset>
			</c:when>
			<c:otherwise>
				<fieldset>
				<legend>任务效果确认</legend>
				<table class="grid">
					<tr>
						<th width="150px">效果确认&nbsp;<label
							style="color: red; vertical-align: middle; text-align: center;">*</label>
						</th>
						<td colspan="5">
							<select id="effectState" name="effectState" readonly = "readonly"
								class="easyui-combobox disabled" style="width: 100px;" panelHeight="auto">
									<option value="0">请选择</option>
									<option value="1">较差</option>
									<option value="2">差</option>
									<option value="3">一般</option>
									<option value="4">好</option>
									<option value="5">较好</option>
							</select>
						</td>
					</tr>
				</table>
				</fieldset>
			</c:otherwise>
			</c:choose>
		</form>
	</div>
</div>

<!-- 任务详情的编辑菜单按钮 -->
<div id="toolbar" class="mygrid-toolbar" style="inline: true">
	<a href="javascript:void(0);" class="easyui-linkbutton"
		data-options="plain:true,iconCls:'icon_toolbar_add_disabled'"><font
		color="gray">添加</font> </a> <a href="javascript:void(0);"
		class="easyui-linkbutton"
		data-options="plain:true,iconCls:'icon_toolbar_edit_disabled'"><font
		color="gray">编辑</font> </a> <a href="javascript:void(0);"
		class="easyui-linkbutton"
		data-options="plain:true,iconCls:'icon_toolbar_del_disabled'"><font
		color="gray">删除</font> </a>
</div>