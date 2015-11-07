<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script type="text/javascript">
	$(function(){
		$('#payrollRegisterEditForm').form({
			url : '${pageContext.request.contextPath}/payrollRegister/apply',
			onSubmit : function() {
				// 表单验证
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
					parent.$.messager.alert('提示', result.msg, 'info');
					parent.$.modalDialog.openner_dataGrid.datagrid('reload');
					parent.$.modalDialog.handler.dialog('close');
				} else {
					parent.$.messager.alert('错误', result.msg, 'error');
				}
			}
		});
	});
	// 表单加载
	$(function(){
		// 加载表单
		$('#payrollRegisterEditForm').form('load', '/payrollRegister/get?id=${id}');
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="payrollRegisterEditForm" method="post">
			<!-- 主键 -->
			<input id="id" name="id" type="hidden" />
			<input id="creatTime" name="creatTime" type="hidden" />
			<input id="creater" name="creater" type="hidden" />
			<input id="createrName" name="createrName" type="hidden" />
			<input id="processId" name="processId" type="hidden" />
			<input id="processFlag" name="processFlag" type="hidden" />
			<input id="delFlag" name="delFlag" type="hidden" />
			<input id="option" name="option" type="hidden" />
			<table class="grid">
				<tr>
					<th>
						姓名 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="name" id="name" type="text" style="width: 100%;"  
							 class="easyui-validatebox span2" data-options="required:true" />
					</td>
					<th>
						基本工资 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="basePay" id="basePay" type="text" style="width: 100%;"  
							 class="easyui-numberbox" precision=2 data-options="required:true" />
					</td>
					<th>
						工龄工资 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="agePay" id="agePay" type="text" style="width: 100%;"  
							 class="easyui-numberbox" precision=2 data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>
						绩效提成 &nbsp;<label style="vertical-align: middle; text-align: center;"></label>
					</th>
					<td>
						<input name="royalty" id="royalty" type="text" style="width: 100%;"  
							 class="easyui-numberbox" precision=2 data-options="required:true" />
					</td>
					<th>
						养老保险 &nbsp;<label style="vertical-align: middle; text-align: center;"></label>
					</th>
					<td>
						<input name="pensionInsurance" id="pensionInsurance" type="text" style="width: 100%;"  
							 class="easyui-numberbox" precision=2 data-options="required:true" />
					</td>
					<th>
						工伤保险 &nbsp;<label style="vertical-align: middle; text-align: center;"></label>
					</th>
					<td>
						<input name="injuryInsurance" id="injuryInsurance" type="text" style="width: 100%;"  
							 class="easyui-numberbox" precision=2 data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>
						医疗保险 &nbsp;<label style="vertical-align: middle; text-align: center;"></label>
					</th>
					<td>
						<input name="medicalInsurance" id="medicalInsurance" type="text" style="width: 100%;"  
							 class="easyui-numberbox" precision=2 data-options="required:true" />
					</td>
					<th>
						失业保险 &nbsp;<label style="vertical-align: middle; text-align: center;"></label>
					</th>
					<td>
						<input name="joblessInsurance" id="joblessInsurance" type="text" style="width: 100%;"  
							 class="easyui-numberbox" precision=2 data-options="required:true" />
					</td>
					<th>
						住房公积金 &nbsp;<label style="vertical-align: middle; text-align: center;"></label>
					</th>
					<td>
						<input name="homeFund" id="homeFund" type="text" style="width: 100%;"  
							 class="easyui-numberbox" precision=2 data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>
						其它 &nbsp;<label style="vertical-align: middle; text-align: center;"></label>
					</th>
					<td>
						<input name="other" id="other" type="text" style="width: 100%;"  
							 class="easyui-numberbox" precision=2 data-options="required:true" />
					</td>
					<th>
						应发工资 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="shouldPay" id="shouldPay" type="text" style="width: 100%;"  
							 class="easyui-numberbox" precision=2 data-options="required:true" />
					</td>
					<th>
						代扣代缴 &nbsp;<label style="vertical-align: middle; text-align: center;"></label>
					</th>
					<td>
						<input name="withhold" id="withhold" type="text" style="width: 100%;"  
							 class="easyui-numberbox" precision=2 data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>
						罚款 &nbsp;<label style="vertical-align: middle; text-align: center;"></label>
					</th>
					<td>
						<input name="fine" id="fine" type="text" style="width: 100%;"  
							 class="easyui-numberbox" precision=2 data-options="required:true" />
					</td>
					<th>
						实发工资 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="realPay" id="realPay" type="text" style="width: 100%;"  
							 class="easyui-numberbox" precision=2 data-options="required:true" />
					</td>
					<td colspan="2"></td>
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