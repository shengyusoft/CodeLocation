<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="certificateAddForm" method="post"
			style="width: 800px; height: 330px;">
			<table class="grid">
				<tr>
					<th>证书名称 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="card_name" style="width: 100%; height: 100%"
						type="text" disabled="disabled" id="card_name" class="easyui-validatebox span2"
						data-options="required:true" readonly="readonly"
						value="${certificate.card_name}" /></td>
					<th>证书编码 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="card_code" style="width: 100%; height: 100%"
						value="${certificate.card_code}" type="text" disabled="disabled" id="card_code"
						class="easyui-validatebox span2" readonly="readonly" /></td>
				</tr>
				<tr>
					<th>证书获取时间&nbsp;</th>
					<td><input name="card_getdate" type="text" disabled="disabled" id="card_getdate"
						readonly="readonly" value="${certificate.card_getdate}"
						style="width: 100%; height: 100%" class="easyui-validatebox span2"
						data-options="required:true" /></td>
					<th>证书到期时间 &nbsp;</th>
					<td><input name="card_enddate" style="width: 100%; height: 100%"
						type="text" disabled="disabled" id="card_enddate" class="easyui-validatebox span2"
						data-options="required:true" readonly="readonly"
						value="${certificate.card_enddate}" /></td>
				</tr>

				<tr>
					<th>发证单位&nbsp;</th>
					<td><input name="card_issuer" type="text" disabled="disabled" id="card_issuer" readonly="readonly"
						value="${certificate.card_issuer}" style="width: 100%; height: 100%"
						class="easyui-validatebox span2" /></td>
					<th>证书所有人 &nbsp;</th>
					<td><input name="card_owner" style="width: 100%; height: 100%"
						value="${certificate.card_owner}" type="text" disabled="disabled" id="card_owner"
						readonly="readonly" class="easyui-validatebox span2" /></td>
				</tr>
				<tr>
					<th>证书类型&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="card_type" type="text" disabled="disabled" id="card_type"
						value="${certificate.card_type}" readonly="readonly"
						style="width: 100%; height: 100%" class="easyui-validatebox span2" /></td>
					<th>证书等级 &nbsp;</th>
					<td><input name="card_level" style="width: 100%; height: 100%"
						readonly="readonly" value="${certificate.card_level}" type="text" disabled="disabled"
						id="card_level" class="easyui-validatebox span2" /></td>
				</tr>
				<tr>
					<th>证书状态&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="card_status" type="text" disabled="disabled" id="card_status"
						value="${certificate.card_status}" readonly="readonly"
						style="width: 100%; height: 100%" class="easyui-validatebox span2" /></td>
				</tr>
				<tr>
					<th>备注&nbsp;</th>
					<td colspan="3"><textarea style="width: 100%" rows="5"
							readonly="readonly" disabled="disabled" name="remark">${certificate.remark}</textarea></td>
				</tr>
			</table>
		</form>
	</div>
</div>
