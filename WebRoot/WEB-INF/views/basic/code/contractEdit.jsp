<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		$('#contractEditForm').form({
			url : '${pageContext.request.contextPath}/contract/edit',
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

	$('#projectId').combobox({
		url : "${pageContext.request.contextPath}/project/combox",
		parentField : 'projectId',
		valueField : 'id',
		textField : 'name',
		value : '${contract.projectId}',
		panelHeight : 'auto'
	});

	$('#trusteeId').combobox({
		url : "${pageContext.request.contextPath}/merchant/combox",
		parentField : 'trusteeId',
		valueField : 'id',
		value : '${contract.trusteeId}',
		textField : 'name',
		panelHeight : 'auto'
	});

	$('#entrusteId').combobox({
		url : "${pageContext.request.contextPath}/merchant/combox",
		parentField : 'entrusteId',
		valueField : 'id',
		value : '${contract.entrusteId}',
		textField : 'name',
		panelHeight : 'auto'
	});

</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="contractEditForm" method="post"
			style="width: 800px; height: 330px;">
			<table class="grid">
				<tr>
					<th>合同名称 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="3"><input type="hidden" name="attachmentIds"
						id="attachmentIds" value="${contract.attachmentIds}"> 
						<input type="hidden" name="id"
						id="id" value="${contract.id}"> 
						<input name="name" value="${contract.name}"
						style="width: 100%; height: 100%" type="text" id="name"
						class="easyui-validatebox span2" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>合同编号 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="3"><input name="code" value="${contract.code}"
						style="width: 100%; height: 100%" type="text" id="code"
						class="easyui-validatebox span2" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>项目 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><select id="projectId" name="projectId"
						style="width: 100%;" class="easyui-validatebox span2"
						data-options="required:true">
					</select></td>
					<th>合同金额：</th>
					<td><input name="money" type="text" id="money" value="${contract.money}"
						style="width: 100%; height: 100%" class="easyui-validatebox span2"
						data-options="required:true" /></td>

				</tr>
				<tr>
					<th>受托方&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><select id="trusteeId" name="trusteeId"
						style="width: 100%;" class="easyui-validatebox span2"
						data-options="required:true">
					</select></td>
					<th>委托方</th>
					<td><select id="entrusteId" name="entrusteId"
						style="width: 100%;" class="easyui-validatebox span2"
						data-options="required:true">
					</select></td>

				</tr>
				<tr>
					<th>签订时间</th>
					<td><input class="Wdate" type="text" name="signTime"
						id="signTime" style="width: 100%; height: 100%"
						value="${contract.signTime}"
						onfocus="showDate('yyyy-MM-dd HH:mm:ss')" /></td>

					<th>签订地点</th>
					<td><input name="signPlace" type="text" id="signPlace"
						value="${contract.signPlace}"
						style="width: 100%; height: 100%" class="easyui-validatebox span2"
						data-options="required:true" /></td>
				</tr>
				<tr>
					<th>开始时间</th>
					<td><input class="Wdate" type="text" name="startTime"
						id="startTime" style="width: 100%; height: 100%"
						value="${contract.startTime}"
						onfocus="showDate('yyyy-MM-dd HH:mm:ss')" /></td>

					<th>结束时间</th>
					<td><input class="Wdate" type="text" name="endTime"
						id="endTime" style="width: 100%; height: 100%"
						value="${contract.endTime}"
						onfocus="showDate('yyyy-MM-dd HH:mm:ss')" /></td>
				</tr>
				<tr>
					<th>内容简介：</th>
					<td colspan="3"><textarea style="width: 100%;font-size: 16px" rows="5"
							name="summary">${contract.summary}</textarea></td>
				</tr>
			</table>
		</form>
		<input type="hidden" id="attachmentType" value="htgl">
		<jsp:include page="../../upload.jsp"></jsp:include>
	</div>
</div>