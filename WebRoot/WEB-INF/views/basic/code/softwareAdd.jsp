<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		$('#softwareAddForm').form({
			url : '${pageContext.request.contextPath}/software/add',
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
	});

	//项目列表
	$('#projectId').combobox({
		url : "${pageContext.request.contextPath}/project/combox",
		parentField : 'projectId',
		valueField : 'id',
		textField : 'name',
		panelHeight : 'auto'
	});

	//软件厂商
	$('#softwareVendorId').combobox({
		url : "${pageContext.request.contextPath}/merchant/combox",
		valueField : 'id',
		textField : 'name',
		panelHeight : 'auto'
	});

	//开发联系人
	$('#contactDeveloperId').combobox({
		url : "${pageContext.request.contextPath}/user/combox",
		valueField : 'id',
		textField : 'name',
		panelHeight : 'auto'
	});

	//运维项目经理
	$('#maintenancePMId').combobox({
		url : "${pageContext.request.contextPath}/user/combox",
		valueField : 'id',
		textField : 'name',
		panelHeight : 'auto'
	});

	//运维厂商
	$('#maintenanceServiceId').combobox({
		url : "${pageContext.request.contextPath}/merchant/combox",
		valueField : 'id',
		textField : 'name',
		panelHeight : 'auto'
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="softwareAddForm" method="post"
			style="width: 800px; height: 330px;">
			<table class="grid">
				<tr>
					<th>软件名称 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="3"><input type="hidden" name="attachmentIds"
						id="attachmentIds"> <input name="name"
						style="width: 100%; height: 100%" type="text" id="name"
						class="easyui-validatebox span2" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>项目名称 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="3"><select id="projectId" name="projectId"
						style="width: 100%;" class="easyui-validatebox span2"
						data-options="required:true">
					</select></td>
				</tr>
				<tr>
					<th>软件厂商 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><select id="softwareVendorId" name="softwareVendorId"
						style="width: 100%;" class="easyui-validatebox span2"
						data-options="required:true">
					</select></td>
					<th>开发联系人&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><select id="contactDeveloperId" name="contactDeveloperId"
						style="width: 100%;" class="easyui-validatebox span2"
						data-options="required:true">
					</select></td>

				</tr>
				<tr>
					<th>运维服务商&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><select id="maintenanceServiceId"
						name="maintenanceServiceId" style="width: 100%;"
						class="easyui-validatebox span2" data-options="required:true">
					</select></td>
					<th>运维项目经理&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><select id="maintenancePMId" name="maintenancePMId"
						style="width: 100%;" class="easyui-validatebox span2"
						data-options="required:true">
					</select></td>

				</tr>
				<tr>
					<th>启用时间&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input class="Wdate" type="text" name="enableTime"
						id="enableTime" style="width: 100%; height: 100%"
						onfocus="showDate('yyyy-MM-dd HH:mm:ss')" /></td>

					<th>维护期限&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="maintenancePeriod" type="text"
						id="maintenancePeriod" style="width: 100%; height: 100%"
						class="easyui-validatebox span2" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>状态</th>
					<td colspan="3"><select id="state" name="state"
						class="easyui-combobox" style="width: 100px;" panelHeight="auto">
							<option value="0">--请选择--</option>
							<option value="1">开发中</option>
							<option value="2">作用中</option>
							<option value="3">已停用</option>
					</select></td>
				</tr>
				<tr>
					<th>内容简介：</th>
					<td colspan="3"><textarea style="width: 100%" rows="5"
							name="summary"></textarea></td>
				</tr>
			</table>
		</form>
		<input type="hidden" id="attachmentType" value="rjgl">
		<jsp:include page="../../upload.jsp"></jsp:include>
	</div>
</div>