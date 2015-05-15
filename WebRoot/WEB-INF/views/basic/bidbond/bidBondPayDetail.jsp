<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="goodsAddForm" method="post"
			style="width: 800px; height: 330px;">
			<table class="grid">
				<tr>
					<th>品名 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="name" style="width: 100%; height: 100%"
						type="text" id="name" class="easyui-validatebox span2"
						readonly="readonly" value="${goods.name}" /></td>
					<th>单位 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="unit" style="width: 100%; height: 100%"
						type="text" id="unit" class="easyui-validatebox span2"
						readonly="readonly" value="${goods.unit}"  /></td>
				</tr>
				<tr>
					<th>采购价&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="price" type="text" id="contactPerson"
						style="width: 100%; height: 100%" class="easyui-validatebox span2"
						readonly="readonly" value="${goods.price}"  /></td>
					<th>规格 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="standard" style="width: 100%; height: 100%"
						type="text" id="servicePhone" class="easyui-validatebox span2"
						readonly="readonly" value="${goods.standard}" /></td>
				</tr>
				<tr>
					<th>备注&nbsp;</th>
					<td colspan="3"><textarea style="width: 100%" rows="5" readonly="readonly" 
							name="remark">${goods.remark}</textarea></td>
				</tr>
			</table>
		</form>
	</div>
</div>

