<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script type="text/javascript">
	
	$(function() {
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
		
		$('#projectDataReorganizeRegisterEditForm').form({
			url : '${pageContext.request.contextPath}/projectDataReorganizeRegister/edit',
			onSubmit : function() {
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

	$(function(){
		// 加载表单
		$('#projectDataReorganizeRegisterEditForm').form('load', '/projectDataReorganizeRegister/get?id=${id}');
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="projectDataReorganizeRegisterEditForm" method="post">
			<!-- 标段多选 -->
			<input id="section" name="section" type="hidden" />
			<!-- 主键 -->
			<input id="id" name="id" type="hidden" />
			<table class="grid">
				<tr>
					<th>
						公司名称 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input id="company" name="company" class="easyui-combobox" style="width: 180px"
		                               data-options="valueField:'text',textField:'text',url:'/dictionary/combox?code=company'">
					</td>
					<th>
						项目名称 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="projectName" id="projectName" type="text" style="width: 100%;"  
							 class="easyui-validatebox span2" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>
						地点 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td colspan="3">
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
					<td colspan="3">
						<input id="section_show" name="section_show" class="easyui-combobox" style="width: 250px"
		                               data-options="multiple:true,required:true,editable:true,valueField:'text',textField:'text',url:'/dictionary/combox?code=bd'">
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
						联系方式 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="contactPhone" id="contactPhone" type="text" style="width: 100%; height: 100%"  
							 class="easyui-validatebox span2" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>
						整编费用(元)&nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="reorganizeCost" id="reorganizeCost" type="text" style="width: 100%; height: 100%" 
							class="easyui-numberbox" precision="2" min="0" data-options="required:true" />
					</td>
					<th>
						预付费用(元) &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
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
						资料编制负责人 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="dataChargePerson" id="dataChargePerson" type="text" style="width: 100%; height: 100%" 
							class="easyui-validatebox span2" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>
						整编内容&nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td colspan="3">
						<input name="reorganizeContent" id="reorganizeContent" type="text" style="width: 100%; height: 100%" 
							class="easyui-validatebox span2" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>
						整编进度&nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td colspan="3">
						<input name="reorganizeProgress" id="reorganizeProgress" type="text" style="width: 100%; height: 100%" 
							class="easyui-validatebox span2" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>备注&nbsp;</th>
					<td colspan="3">
						<textarea style="width: 100%" rows="5" name="remark"></textarea>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>