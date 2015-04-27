<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="supplierAddForm" method="post"
			style="width: 800px; height: 330px;">
			<table class="grid">
				<tr>
					<th>供应商名称 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="name" style="width: 100%; height: 100%"
						type="text" id="name" class="easyui-validatebox span2"
						data-options="required:true" readonly="readonly"
						value="${supplier.name}" /></td>
					<th>供应商编码 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="code" style="width: 100%; height: 100%"
						value="${supplier.code}" type="text" id="code"
						class="easyui-validatebox span2" readonly="readonly" /></td>
				</tr>
				<tr>
					<th>地址&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="place" type="text" id="place"
						readonly="readonly" value="${supplier.place}"
						style="width: 100%; height: 100%" class="easyui-validatebox span2"
						data-options="required:true" /></td>
					<th>传真 &nbsp;</th>
					<td><input name="fax" style="width: 100%; height: 100%"
						type="text" id="fax" class="easyui-validatebox span2"
						data-options="required:true" readonly="readonly"
						value="${supplier.fax}" /></td>
				</tr>

				<tr>
					<th>邮政编码&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="zip" type="text" id="zip" readonly="readonly"
						value="${supplier.zip}" style="width: 100%; height: 100%"
						class="easyui-validatebox span2" /></td>
					<th>邮件地址 &nbsp;</th>
					<td><input name="email" style="width: 100%; height: 100%"
						value="${supplier.email}" type="text" id="email"
						readonly="readonly" class="easyui-validatebox span2" /></td>
				</tr>
				<tr>
					<th>联络人&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="contactPerson" type="text" id="contactPerson"
						value="${supplier.contactPerson}" readonly="readonly"
						style="width: 100%; height: 100%" class="easyui-validatebox span2" /></td>
					<th>联络电话 &nbsp;</th>
					<td><input name="phone" style="width: 100%; height: 100%"
						readonly="readonly" value="${supplier.phone}" type="text"
						id="phone" class="easyui-validatebox span2" /></td>
				</tr>
				<tr>
					<th>简介&nbsp;</th>
					<td colspan="3"><textarea style="width: 100%" rows="5"
							readonly="readonly" name="remark">${supplier.remark}</textarea></td>
				</tr>
			</table>
		</form>
	</div>
</div>
