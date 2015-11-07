<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script type="text/javascript">
	$(function(){
		$('#payrollRegisterApprovalForm').form({
			url : '${pageContext.request.contextPath}/payrollRegister/approval',
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
					parent.$.messager.alert('提示',result.msg,'success');
					var grid = parent.$.modalDialog.openner_dataGrid;
					if(!isEmpty(grid)){
						grid.datagrid('reload');
					}
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
		$('#payrollRegisterDetailForm').form('load', '/payrollRegister/get?id=${id}');
		// 
		$('input,select,textarea',$('form[id="payrollRegisterDetailForm"]')).prop('disabled',true);
	});
	
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<!-- 展示详细 -->
		<form id="payrollRegisterDetailForm" method="post">
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
		<br>
		<!-- 审批内容 -->
		<form id="payrollRegisterApprovalForm" method="post">
			<input id="docId" name="docId" type="hidden" value="${process.docId}" />
			<table class="grid">
				<tr>
					<th>流程名称 &nbsp;</th>
					<td>
						<!-- 是否通过0：通过；1：退回 -->
						<input type="hidden" name="option" id="option" value="" />
						<input type="hidden" name="id" value="${process.id}" /> 
						<input type="hidden" name="state" value="${process.state}" /> 
						<input type="hidden" name="startDT" value="${process.startDT}" /> 
						<input id="processName" name="processName" value="${process.processName}" type="text"  
							style="width: 100%; height: 100%" class="easyui-validatebox span2" readonly="readonly" />
					</td>
					<th>申请人 &nbsp;</th>
					<td>
						<input type="hidden" name="applyUserId" value="${process.applyUserId}" /> 
						<input id="applyUserName" name="applyUserName" value="${process.applyUserName}" type="text"
						 	style="width: 100%; height: 100%" class="easyui-validatebox span2" readonly="readonly" />
					</td>
				</tr>
				<tr>
					<th>开始时间 &nbsp;</th>
					<td>
						<input class="Wdate" type="text" name="startDT1" readonly="readonly" 
							style="width: 98%; height: 100%;" value="${process.startDT}" />
					</td>
					<th>结束时间 &nbsp;</th>
					<td>
						<input id="endDT" class="Wdate" type="text" name="endDT" readonly="readonly" 
							value="${process.endDT}" style="width: 98%; height: 100%;" />
					</td>
				</tr>
				<tr>
					<th>办理意见&nbsp;</th>
					<td colspan="4"><textarea style="width: 100%" rows="3"
							name="remark" id="remark"></textarea></td>
				</tr>
			</table>
		</form>
	</div>
</div>