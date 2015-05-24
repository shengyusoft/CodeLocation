<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="projectBookRegistEditForm" method="post">
			<table class="grid">
				<tr>
					<th>项目名称 &nbsp;</th>
					<td><input type="hidden" name="id"
						value="${projectBookRegist.id}"></input> <input type="hidden"
						name="registerId" value="${projectBookRegist.registerId}"></input>
						<input type="hidden" name="registDT"
						value="${projectBookRegist.registDT}"></input> <input
						type="hidden" name="id" value="${projectBookRegist.id}"></input> <input
						name="projectName" value="${projectBookRegist.projectName}"
						style="width: 100%;" type="text" id="projectName"
						class="easyui-validatebox span2" readonly="readonly" /></td>
					<th>预订费用（元）&nbsp;</th>
					<td><input name="bookFee" value="${projectBookRegist.bookFee}"
						type="text" id="bookFee" style="width: 100%; height: 100%"
						class="easyui-validatebox span2" readonly="readonly" /></td>

				</tr>
				<tr>
					<th>投标人姓名&nbsp;</th>
					<td><input name="bidder" value="${projectBookRegist.bidder}"
						type="text" id="bidder" style="width: 100%; height: 100%"
						class="easyui-validatebox span2" readonly="readonly" /></td>
					<th>联系方式 &nbsp;</th>
					<td><input name="contract"
						value="${projectBookRegist.contract}"
						style="width: 100%; height: 100%" readonly="readonly" type="text"
						id="contract" class="easyui-validatebox span2" /></td>
				</tr>
				<tr>
					<th>资质要求&nbsp;</th>
					<td colspan="3"><textarea style="width: 100%" rows="5"
							name="qualifyRequirement">${projectBookRegist.qualifyRequirement}</textarea></td>
				</tr>
				<tr>
					<th>备注&nbsp;</th>
					<td colspan="3"><textarea style="width: 100%" rows="5"
							name="remark">${projectBookRegist.remark}</textarea></td>
				</tr>

				<tr>
					<th>登记人&nbsp;</th>
					<td><input name="bidder"
						value="${projectBookRegist.registerName}" type="text"
						id="registerName" style="width: 100%; height: 100%"
						class="easyui-validatebox span2" readonly="readonly" /></td>
					<th>登记时间 &nbsp;</th>
					<td><input name="registDT"
						value="${projectBookRegist.registDT}"
						style="width: 100%; height: 100%" readonly="readonly" type="text"
						id="registDT" class="easyui-validatebox span2" /></td>
				</tr>
			</table>
		</form>
	</div>
</div>