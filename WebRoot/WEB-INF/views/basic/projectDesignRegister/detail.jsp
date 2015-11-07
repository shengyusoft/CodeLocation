<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script type="text/javascript">
	// 表单加载
	$(function(){
		// 加载表单
		$('#projectDesignRegisterEditForm').form('load', '/projectDesignRegister/get?id=${id}');
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="projectDesignRegisterEditForm" method="post">
		<!-- 主键 -->
		<input id="id" name="id" type="hidden" />
			<table class="grid">
				<tr>
					<th>
						项目名称 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td colspan="3">
						<input name="projectName" id="projectName" type="text" style="width: 100%;"  
							 class="easyui-validatebox span2" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>
						项目所在地 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td colspan="3">
						省：<input id="provice" name="provice" class="easyui-combobox" style="width: 140px"
		                               data-options="required:true,editable:true,valueField:'text',textField:'text',url:'/dictionary/xzqhCombox?pid=&&lvs=2'">
							&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
						市：<input id="city" name="city" class="easyui-combobox" style="width: 140px;" />
							&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
						县(区)：<input id="county" name="county" class="easyui-combobox" style="width: 140px;" />
					</td>
				</tr>
				<tr>
					<th>
						业务负责人&nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="chargePerson" id="chargePerson" type="text" style="width: 100%; height: 100%" 
							class="easyui-validatebox span2" data-options="required:true" />
					</td>
					<th>
						联系电话&nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="contactPhone" id="contactPhone" type="text" style="width: 100%; height: 100%"  
							 class="easyui-validatebox span2" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>
						设计费用&nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="designCost" id="designCost" type="text" style="width: 100%; height: 100%" 
							class="easyui-numberbox" precision="2" min="0" data-options="required:true" />
					</td>
					<th>
						预付费用 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="prepayCost"  id="prepayCost" type="text" style="width: 100%; height: 100%" 
							class="easyui-numberbox" precision="2" min="0" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>
						付款方式&nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="payWay" id="payWay" type="text" style="width: 100%; height: 100%" 
							class="easyui-validatebox span2" data-options="required:true" />
					</td>
					<th>
						设计负责人 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="designPerson" id="designPerson" type="text" style="width: 100%; height: 100%" 
							class="easyui-validatebox span2" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>
						设计内容&nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td colspan="3">
						<input name="designContent" id="designContent" type="text" style="width: 100%; height: 100%" 
							class="easyui-validatebox span2" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>
						设计进度&nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td colspan="3">
						<input name="designProgress" id="designProgress" type="text" style="width: 100%; height: 100%" 
							class="easyui-validatebox span2" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>备注&nbsp;</th>
					<td colspan="3">
						<textarea style="width: 100%" rows="2" name="remark"></textarea>
					</td>
				</tr>

			</table>
		</form>
	</div>
</div>