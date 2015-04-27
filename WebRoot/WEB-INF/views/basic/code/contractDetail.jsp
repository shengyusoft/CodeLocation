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
		<table class="grid">
			<tr>
				<th>合同名称</th>
				<td colspan="3">
				<input type="hidden" name="attachmentIds"
					id="attachmentIds" value="${contract.attachmentIds}"> 
				<input name="name" value="${contract.name}"
					style="width: 100%; height: 100%" type="text" id="name"
					class="easyui-validatebox span2" readonly="readonly" /></td>
			</tr>
			<tr>
				<th>合同编号</th>
				<td colspan="3"><input name="code" value="${contract.code}"
					style="width: 100%; height: 100%" type="text" id="code"
					class="easyui-validatebox span2" readonly="readonly" /></td>
			</tr>
			<tr>
				<th>项目</th>
				<td><input name="projectId" type="text" id="projectId"
					value="${contract.projectName}" style="width: 100%; height: 100%"
					class="easyui-validatebox span2" readonly="readonly" /></td>
				<th>合同金额：</th>
				<td><input name="money" type="text" id="money"
					value="${contract.money}" style="width: 100%; height: 100%"
					class="easyui-validatebox span2" readonly="readonly" /></td>

			</tr>
			<tr>
				<th>受托方</th>
				<td><input name="trusteeId" type="text" id="trusteeId"
					value="${contract.trusteeName}" style="width: 100%; height: 100%"
					class="easyui-validatebox span2" readonly="readonly" /></td>
				<th>委托方</th>
				<td><input name="entrusteId" type="text" id="entrusteId"
					value="${contract.entrusteName}" style="width: 100%; height: 100%"
					class="easyui-validatebox span2" readonly="readonly" /></td>

			</tr>
			<tr>
				<th>签订时间</th>
				<td><input name="signTime" type="text" id="signTime"
					value="${contract.signTime}" style="width: 100%; height: 100%"
					class="easyui-validatebox span2" readonly="readonly" /></td>

				<th>签订地点</th>
				<td><input name="signPlace" type="text" id="signPlace"
					value="${contract.signPlace}" style="width: 100%; height: 100%"
					class="easyui-validatebox span2" readonly="readonly" /></td>
			</tr>
			<tr>
				<th>开始时间</th>
				<td><input name="startTime" type="text" id="startTime"
					value="${contract.startTime}" style="width: 100%; height: 100%"
					class="easyui-validatebox span2" readonly="readonly" /></td>

				<th>结束时间</th>
				<td><input name="endTime" type="text" id="endTime"
					value="${contract.endTime}" style="width: 100%; height: 100%"
					class="easyui-validatebox span2" readonly="readonly" /></td>
			</tr>
			<tr>
				<th>内容简介：</th>
				<td colspan="3"><textarea style="width: 100%" rows="5" readonly="readonly"
						name="summary">${contract.summary}</textarea></td>
			</tr>
			<tr>
				<th>附件列表</th>
				<td colspan="3">
					<div id="downloadDiv" style="height: auto; vertical-align: middle;width: 100%"></div>
				</td>
			</tr>
		</table>
	</div>
</div>