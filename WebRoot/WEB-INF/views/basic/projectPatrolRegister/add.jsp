<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		$('#projectPatrolRegisterAddForm').form({
			url : '${pageContext.request.contextPath}/projectPatrolRegister/add',
			onSubmit : function() {
				// 表单验证
				progressLoad();
				var isValid = $(this).form('validate');
				if (!isValid) {
					progressClose();
				}
				// 标段多选
				var all= $('#section_show' ).combobox("getValues");
				var vals= "" ;
				for(var i = 0; i <all.length; i++){
					vals+=all[i] + ",";
				}
				$('#section').val(vals);
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
	// 省市县地点选择
	$('#provice').combobox({
		onSelect : function(record) {
			$('#city').combobox({
				url : "${pageContext.request.contextPath}/dictionary/xzqhCombox?pid=" + record.id + "&&lvs=3",
				valueField : 'text', //值字段
				textField : 'text', //显示的字段
				readonly : false,
				required : true,
				editable : false,//不可编辑，只能选择
				onSelect : function(record) {
					$('#county').combobox({
						url : "${pageContext.request.contextPath}/dictionary/xzqhCombox?pid=" + record.id + "&&lvs=4",
						valueField : 'text', //值字段
						textField : 'text', //显示的字段
						panelHeight : 'auto',
						readonly : false,
						required : true,
						editable : false//不可编辑，只能选择
					});
				}
			});
		}
	});

	
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="projectPatrolRegisterAddForm" method="post">
			<!-- 标段多选 -->
			<input id="section" name="section" type="hidden" />
			<table class="grid">
				<tr>
					<th>
						公司名称 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td colspan="2">
						<input id="company" name="company" class="easyui-combobox" style="width: 180px"
		                               data-options="valueField:'text',textField:'text',url:'/dictionary/combox?code=company'">
					</td>
					<th>
						项目名称 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td colspan="2">
						<input name="projectName" id="projectName" type="text" style="width: 100%;"  
							 class="easyui-validatebox span2" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>
						项目所在地 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td colspan="5">
						省：<input id="provice" name="provice" class="easyui-combobox" style="width: 140px"
		                               data-options="required:true,editable:true,valueField:'text',textField:'text',url:'/dictionary/xzqhCombox?pid=&&lvs=2'">
							&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
						市：<input id="city" name="city" class="easyui-combobox" style="width: 140px;" readonly="readonly" />
							&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
						县(区)：<input id="county" name="county" class="easyui-combobox" style="width: 140px;" readonly="readonly" />
					</td>
				</tr>
				<tr>
					<th>
						标段 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td colspan="5">
						<input id="section_show" name="section_show" class="easyui-combobox" style="width: 250px"
		                               data-options="multiple:true,required:true,editable:false,valueField:'text',textField:'text',url:'/dictionary/combox?code=bd'">
					</td>
				</tr>
				<tr>
					<th>
						中标价（元）&nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="price" id="price" type="text" style="width: 100%; height: 100%" 
							class="easyui-numberbox" precision="2" min="0" data-options="required:true" />
					</td>
					<th>
						中标时间&nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="bidTime" id="bidTime" type="text" style="width: 100%; height: 100%"  
							 class="Wdate" data-options="required:true" onfocus="showDate('yyyy-MM-dd')" />
					</td>
					<th>
						工期（天）&nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="timeLimit" id="timeLimit" type="text" style="width: 100%; height: 100%" 
							class="easyui-numberbox" precision="2" min="0" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>
						施工负责人&nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td colspan="2">
						<input name="chargePerson" id="chargePerson" type="text" style="width: 100%; height: 100%" 
							class="easyui-validatebox span2" data-options="required:true" />
					</td>
					<th>
						联系电话&nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td colspan="2">
						<input name="buildPhone" id="buildPhone" type="text" style="width: 100%; height: 100%"  
							 class="easyui-validatebox span2" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>
						建设单位&nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="buildUnit" id="buildUnit" type="text" style="width: 100%; height: 100%" 
							class="easyui-validatebox span2" data-options="required:true" />
					</td>
					<th>
						联系人&nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="buildUnitPerson" id="buildUnitPerson" type="text" style="width: 100%; height: 100%" 
							class="easyui-validatebox span2" data-options="required:true" />
					</td>
					<th>
						联系电话&nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="buildUnitPhone" id="buildUnitPhone" type="text" style="width: 100%; height: 100%" 
							class="easyui-validatebox span2" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>
						监理单位&nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="supervisorUnit" id="supervisorUnit" type="text" style="width: 100%; height: 100%" 
							class="easyui-validatebox span2" data-options="required:true" />
					</td>
					<th>
						联系人&nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="supervisorUnitPerson" id="supervisorUnitPerson" type="text" style="width: 100%; height: 100%" 
							class="easyui-validatebox span2" data-options="required:true" />
					</td>
					<th>
						联系电话&nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="supervisorUnitPhone" id="supervisorUnitPhone" type="text" style="width: 100%; height: 100%" 
							class="easyui-validatebox span2" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>
						设计单位&nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="designUnit" id="designUnit" type="text" style="width: 100%; height: 100%" 
							class="easyui-validatebox span2" data-options="required:true" />
					</td>
					<th>
						联系人&nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="designUnitPerson" id="designUnitPerson" type="text" style="width: 100%; height: 100%" 
							class="easyui-validatebox span2" data-options="required:true" />
					</td>
					<th>
						联系电话&nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="designUnitPhone" id="designUnitPhone" type="text" style="width: 100%; height: 100%" 
							class="easyui-validatebox span2" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>备注&nbsp;</th>
					<td colspan="5">
						<textarea style="width: 100%" rows="2" name="remark"></textarea>
					</td>
				</tr>

			</table>
		</form>
	</div>
</div>