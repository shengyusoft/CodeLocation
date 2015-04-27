<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
				<th>项目编码</th>
				<td>
					<input type="hidden" name="attachmentIds"
						id="attachmentIds" value="${project.attachmentIds}"> 
					<input name="code" type="text" style="width: 98%"
						id="code" value="${project.code}" class="easyui-validatebox span2"
						readonly="readonly" /></td>

				<th>项目类别</th>
				<td><input type="text" style="width: 98%"
					value="${project.dictionaryText}" class="easyui-validatebox span2"
					readonly="readonly"></td>
			</tr>

			<tr>
				<th>项目名称</th>
				<td><input name="name" type="text" style="width: 98%"
					value="${project.name}" class="easyui-validatebox span2"
					readonly="readonly"></td>

				<th>项目经理</th>
				<td><input type="text" style="width: 98%"
					value="${project.projectMangerName}"
					class="easyui-validatebox span2" readonly="readonly"></td>
			</tr>

			<tr>
				<th>项目金额</th>
				<td><input name="projectAmount" type="text"
					style="width: 98%" value="${project.projectAmount}"
					class="easyui-validatebox span2" readonly="readonly"></td>

				<th>项目开始时间</th>
				<td><input class="Wdate" type="text" name="startDT"
					id="startDT" style="width: 98%; height: 98%" readonly="readonly"
					value="${project.startDT}" onfocus="showDate('yyyy-MM-dd')" /></td>
			</tr>
			<tr>
				<th>项目结束时间</th>
				<td><input class="Wdate" type="text" name="endDT" id="endDT"
					style="width: 98%; height: 98%" readonly="readonly"
					value="${project.endDT}" onfocus="showDate('yyyy-MM-dd')" /></td>

				<th>项目验收时间</th>
				<td><input class="Wdate" type="text" name="checkDT"
					id="checkDT" style="width: 98%; height: 98%" readonly="readonly"
					value="${project.checkDT}" onfocus="showDate('yyyy-MM-dd')" /></td>
			</tr>

			<tr>
				<th>承包单位</th>
				<td colspan="3"><input type="text" style="width: 98%"
					value="${project.merchantText}" class="easyui-validatebox span2"
					readonly="readonly"></td>
			</tr>

			<tr>
				<th>联系人</th>
				<td><input name="contactPerson" type="text"
					style="width:98%" value="${project.contactPerson}"
					class="easyui-validatebox span2" readonly="readonly"></td>

				<th>联系电话</th>
				<td><input name="contactPhone" type="text" style="width: 98%"
					value="${project.contactPhone}" class="easyui-validatebox span2"
					readonly="readonly"></td>

			</tr>

			<tr>
				<th>项目简介</th>
				<td colspan="3"><textarea rows="5" name="summry"
						readonly="readonly" style="width: 98%;">${project.summry}</textarea></td>
			</tr>
			
			<tr>
				<th>附件列表</th>
				<td colspan="3">
					<div id="downloadDiv" style="height: auto; vertical-align: middle;width: 98%"></div>
				</td>
			</tr>
		</table>
	</div>
</div>