<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		$('#projectAddForm').form({
			url : '${pageContext.request.contextPath}/project/add',
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
	
	$('#dictionaryId').combobox({
		url : "${pageContext.request.contextPath}/dictionary/combox?code=xmlxtype",
		parentField : 'dictionaryId',
		valueField : 'id',
		textField : 'text',
		panelHeight : 'auto'				
	});

	$('#projectMangerId').combobox({
		url : "${pageContext.request.contextPath}/user/combox",
		valueField : 'id',
		textField : 'name',
		panelHeight : 'auto'
	});

	$('#merchantId').combobox({
		url : "${pageContext.request.contextPath}/merchant/combox",
		valueField : 'id',
		textField : 'name',
		panelHeight : 'auto'
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="projectAddForm" method="post">
			<table class="grid">
				<tr>
					<th>项目编码 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input type="hidden" name="attachmentIds"
						id="attachmentIds"><input name="code" type="text"
						style="width: 98%; height: 100%" id="code"
						class="easyui-validatebox span2" data-options="required:true" />
					</td>

					<th>项目类别 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><select id="dictionaryId" name="dictionaryId"
						class="easyui-validatebox span2" style="width: 98%;"
						data-options="required:true">
					</select></td>
				</tr>

				<tr>
					<th>项目名称 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="name" type="text"
						style="width: 98%; height: 100%" class="easyui-validatebox span2"
						data-options="required:true"></td>

					<th>项目经理 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><select id="projectMangerId" name="projectMangerId"
						class="easyui-validatebox span2" style="width: 98%;"
						data-options="required:true">
					</select></td>
				</tr>

				<tr>
					<th>项目金额 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="projectAmount" type="text"
						style="width: 98%; height: 100%" class="easyui-validatebox span2"
						data-options="required:true"></td>

					<th>项目开始时间 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input class="Wdate" type="text" name="startDT"
						id="startDT" style="width: 98%; height: 100%;"
						data-options="required:true" onfocus="showDate('yyyy-MM-dd')" />
					</td>
				</tr>
				<tr>
					<th>项目结束时间 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input class="Wdate" type="text" name="endDT" id="endDT"
						style="width: 98%; height: 100%;" data-options="required:true"
						onfocus="showDate('yyyy-MM-dd')" /></td>

					<th>项目验收时间 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input class="Wdate" type="text" name="checkDT"
						id="checkDT" style="width: 98%; height: 100%;"
						data-options="required:true" onfocus="showDate('yyyy-MM-dd')" />
					</td>
				</tr>

				<tr>
					<th>承包单位 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="3"><select id="merchantId" name="merchantId"
						class="easyui-validatebox span2" style="width: 98%;"
						data-options="required:true">
					</select></td>
				</tr>

				<tr>
					<th>联系人</th>
					<td><input name="contactPerson" type="text"
						style="width: 98%; height: 100%" class="easyui-validatebox span2"></td>

					<th>联系电话</th>
					<td><input name="contactPhone" type="text"
						style="width: 98%; height: 100%" class="easyui-validatebox span2"></td>

				</tr>

				<tr>
					<th>项目简介</th>
					<td colspan="3"><textarea rows="5" name="summry"
							style="width: 98%;"></textarea></td>
				</tr>
			</table>
		</form>
		<input type="hidden" id="attachmentType" value="xmgl">
		<jsp:include page="../../upload.jsp"></jsp:include>
	</div>
</div>