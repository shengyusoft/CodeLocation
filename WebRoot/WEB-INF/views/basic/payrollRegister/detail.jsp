<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script type="text/javascript">
	//表单加载
	$(function(){
		// 加载表单
		$('#payrollRegisterEditForm').form('load', '/payrollRegister/get?id=${id}');
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="payrollRegisterEditForm" method="post">
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
						绩效提成 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="royalty" id="royalty" type="text" style="width: 100%;"  
							 class="easyui-numberbox" precision=2 data-options="required:true" />
					</td>
					<th>
						养老保险 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="pensionInsurance" id="pensionInsurance" type="text" style="width: 100%;"  
							 class="easyui-numberbox" precision=2 data-options="required:true" />
					</td>
					<th>
						工伤保险 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="injuryInsurance" id="injuryInsurance" type="text" style="width: 100%;"  
							 class="easyui-numberbox" precision=2 data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>
						医疗保险 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="medicalInsurance" id="medicalInsurance" type="text" style="width: 100%;"  
							 class="easyui-numberbox" precision=2 data-options="required:true" />
					</td>
					<th>
						失业保险 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="joblessInsurance" id="joblessInsurance" type="text" style="width: 100%;"  
							 class="easyui-numberbox" precision=2 data-options="required:true" />
					</td>
					<th>
						住房公积金 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="homeFund" id="homeFund" type="text" style="width: 100%;"  
							 class="easyui-numberbox" precision=2 data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>
						其它 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
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
						代扣代缴 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="withhold" id="withhold" type="text" style="width: 100%;"  
							 class="easyui-numberbox" precision=2 data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>
						罚款 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
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