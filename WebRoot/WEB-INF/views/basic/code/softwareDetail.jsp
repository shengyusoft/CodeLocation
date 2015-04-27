<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
$(function() {
	showAttachments($('#attachmentIds').val());
});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="softwareAddForm" method="post"
			style="width: 800px; height: 330px;">
			<table class="grid">
				<tr>
					<th>软件名称</th>
					<td colspan="3">
					<input type="hidden" name="attachmentIds"
						id="attachmentIds" value="${software.attachmentIds}"> 
					<input name="name" style="width: 100%; height: 100%" type="text" id="name"
						value="${software.name}" class="easyui-validatebox span2"
						readonly="readonly" /></td>
				</tr>
				<tr>
					<th>项目名称</th>
					<td colspan="3"><input name="name"
						style="width: 100%; height: 100%" type="text"
						value="${software.projectName}" class="easyui-validatebox span2"
						readonly="readonly" /></td>
				</tr>
				<tr>
					<th>软件厂商</th>
					<td><input name="name" style="width: 100%; height: 100%"
						type="text" value="${software.softwareVendorName}"
						class="easyui-validatebox span2" readonly="readonly" /></td>
					<th>开发联系人</th>
					<td><input name="contactDeveloperName"
						style="width: 100%; height: 100%" type="text"
						value="${software.softwareVendorName}"
						class="easyui-validatebox span2" readonly="readonly" /></td>

				</tr>
				<tr>
					<th>运维服务商</th>
					<td><input name="maintenanceServiceName"
						style="width: 100%; height: 100%" type="text"
						value="${software.softwareVendorName}"
						class="easyui-validatebox span2" readonly="readonly" /></td>
					<th>运维项目经理</th>
					<td><input name="maintenancePMName"
						style="width: 100%; height: 100%" type="text"
						value="${software.softwareVendorName}"
						class="easyui-validatebox span2" readonly="readonly" /></td>

				</tr>
				<tr>
					<th>启用时间</th>
					<td><input type="text" name="enableTime"
						value="${software.enableTime}" id="enableTime"
						style="width: 100%; height: 100%" readonly="readonly" /></td>

					<th>维护期限</th>
					<td><input name="maintenancePeriod" type="text"
						style="width: 100%; height: 100%"
						value="${software.maintenancePeriod}"
						class="easyui-validatebox span2" readonly="readonly" /></td>
				</tr>
				<tr>
					<th>状态</th>
					<td colspan="3"><input name="state" type="text"
						style="width: 100%; height: 100%" value="${software.state}"
						class="easyui-validatebox span2" readonly="readonly" /></td>
				</tr>
				<tr>
					<th>内容简介：</th>
					<td colspan="3"><textarea style="width: 100%" rows="5"
							name="summary">${software.summary}</textarea></td>
				</tr>
				<tr>
					<th>附件列表</th>
					<td colspan="3">
						<div id="downloadDiv" style="height: auto; vertical-align: middle;width: 100%"></div>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>