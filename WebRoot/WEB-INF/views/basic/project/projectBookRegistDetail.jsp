<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script type="text/javascript">
	//资质要求
	$('#qualifyRequirement').combobox({
		url : "${pageContext.request.contextPath}/dictionary/combox?code=zzyq",
		parentField : 'dictionaryId',
		valueField : 'id',
		multiple : true,
		textField : 'text',
		panelHeight : 'auto'
	});
	var selectedQFs = [];
	var qfs = '${projectBookRegist.qualifyRequirement}';
	selectedQFs = qfs.split(',');
	$('#qualifyRequirement').combobox('setValues', selectedQFs);
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="projectBookRegistEditForm" method="post">
			<table class="grid">
				<tr>
					<th>项目名称 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input type="hidden" name="id"
						value="${projectBookRegist.id}"></input> <input type="hidden"
						name="registerId" value="${projectBookRegist.registerId}"></input>
						<input name="projectName" value="${projectBookRegist.projectName}"
						style="width: 100%;" type="text" id="projectName"
						class="easyui-validatebox span2" data-options="required:true" /></td>
					<th>预订费用（元）&nbsp;</th>
					<td><input name="bookFee" value="${projectBookRegist.bookFee}"
						type="text" id="bookFee" style="width: 100%; height: 100%"
						class="easyui-validatebox span2" /></td>
				</tr>
				<tr>
					<th>公司名称 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="3"><input name="companyName"
						value="${projectBookRegist.companyName}" style="width: 100%;"
						type="text" id="companyName" class="easyui-validatebox span2"
						readonly="readonly" /></td>
				</tr>
				<tr>
					<th>投标人姓名&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="bidder" value="${projectBookRegist.bidder}"
						type="text" id="bidder" style="width: 100%; height: 100%"
						class="easyui-validatebox span2" data-options="required:true" /></td>
					<th>联系方式 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="contract"
						value="${projectBookRegist.contract}"
						style="width: 100%; height: 100%" data-options="required:true"
						type="text" id="contract" class="easyui-validatebox span2" /></td>
				</tr>
				<tr>
					<th>资质要求&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="3"><select id="qualifyRequirement"
						name="qualifyRequirement" class="easyui-validatebox span2"
						style="width: 550px;" data-options="required:true">
					</select></td>
				</tr>
				<tr>
					<th>登记人&nbsp;</th>
					<td><input name="registerName"
						value="${projectBookRegist.registerName}" type="text"
						readonly="readonly" disabled="disabled" id="registerName"
						style="width: 100%; height: 100%" class="easyui-validatebox span2" /></td>
					<th>登记时间 &nbsp;</th>
					<td><input class="Wdate" type="text" name="registDT"
						value="<fmt:formatDate value="${projectBookRegist.registDT}" pattern="yyyy-MM-dd"/>"
						id="registDT" style="width: 100%; height: 100%"
						readonly="readonly" /></td>
				</tr>
				<tr>
					<th>备注&nbsp;</th>
					<td colspan="3"><textarea style="width: 100%" rows="5"
							name="remark">${projectBookRegist.remark}</textarea></td>
				</tr>
			</table>
		</form>
	</div>
</div>