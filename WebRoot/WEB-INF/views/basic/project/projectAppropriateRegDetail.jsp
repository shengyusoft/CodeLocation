<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="cylinderFillDetailForm" method="post"
			style="width: 800px; height: 330px;">
			<table class="grid">
				<tr>
					<th>文件名称 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="name" style="width: 100%; height: 100%"
						type="text" id="name" class="easyui-validatebox span2"
						readonly="readonly" value="${cylinderFill.fileName}" /></td>
					<th>区域代码 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="unit" style="width: 100%; height: 100%"
						type="text" id="unit" class="easyui-validatebox span2"
						readonly="readonly" value="${cylinderFill.fillAreaCode}"  /></td>
				</tr>
				<tr>
					<th>加气时间&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="price" type="text" id="contactPerson"
						style="width: 100%; height: 100%" class="easyui-validatebox span2"
						readonly="readonly" value="${cylinderFill.fillDateTime}"  /></td>
					<th>加气用时 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="standard" style="width: 100%; height: 100%"
						type="text" id="servicePhone" class="easyui-validatebox span2"
						readonly="readonly" value="${cylinderFill.fillTimes}" /></td>
				</tr>
				<tr>
					<th>加气站代码&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="price" type="text" id="contactPerson"
						style="width: 100%; height: 100%" class="easyui-validatebox span2"
						readonly="readonly" value="${cylinderFill.fillDeptCode}"  /></td>
					<th>重装人员代码 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="standard" style="width: 100%; height: 100%"
						type="text" id="servicePhone" class="easyui-validatebox span2"
						readonly="readonly" value="${cylinderFill.fillPsnlCode}" /></td>
				</tr>
				<tr>
					<th>电子标签代码&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="price" type="text" id="contactPerson"
						style="width: 100%; height: 100%" class="easyui-validatebox span2"
						readonly="readonly" value="${cylinderFill.labelUid}"  /></td>
					<th>POS机编码 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="standard" style="width: 100%; height: 100%"
						type="text" id="servicePhone" class="easyui-validatebox span2"
						readonly="readonly" value="${cylinderFill.fillPosUid}" /></td>
				</tr>
				<tr>
					<th>加气枪号&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="price" type="text" id="contactPerson"
						style="width: 100%; height: 100%" class="easyui-validatebox span2"
						readonly="readonly" value="${cylinderFill.fillGunNum}"  /></td>
					<th>加气方量&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="standard" style="width: 100%; height: 100%"
						type="text" id="servicePhone" class="easyui-validatebox span2"
						readonly="readonly" value="${cylinderFill.fillAmount}" /></td>
				</tr>
				<tr>
					<th>车牌号&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="price" type="text" id="contactPerson"
						style="width: 100%; height: 100%" class="easyui-validatebox span2"
						readonly="readonly" value="${cylinderFill.fillVehicleNum}"  /></td>
					<th>压力&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="standard" style="width: 100%; height: 100%"
						type="text" id="servicePhone" class="easyui-validatebox span2"
						readonly="readonly" value="${cylinderFill.gasPressure}" /></td>
				</tr>
			</table>
		</form>
	</div>
</div>

