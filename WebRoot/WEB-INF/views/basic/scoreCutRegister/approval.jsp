<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script type="text/javascript">
	$(function(){
		$('#scoreCutRegisterApprovalForm').form({
			url : '${pageContext.request.contextPath}/scoreCutRegister/approval',
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
		$('#scoreCutRegisterDetailForm').form('load', '/scoreCutRegister/get?id=${id}');
		// 
		$('input,select,textarea',$('form[id="scoreCutRegisterDetailForm"]')).prop('disabled',true);
	});
	
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<!-- 展示详细 -->
		<form id="scoreCutRegisterDetailForm" method="post">
			<table class="grid">
				<tr>
					<th>
						项目名称 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="projectName" id="projectName" type="text" style="width: 100%;"  
							 class="easyui-validatebox span2" data-options="required:true" />
					</td>
					<th>
						单位 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="unit" id="unit" type="text" style="width: 100%;"  
							 class="easyui-validatebox span2" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>
						数量 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;"></label>
					</th>
					<td>
						<input name="num" id="num" type="text" style="width: 100%;"  
							 class="easyui-numberbox" precision=2 />
					</td>
					<th>
						完成时间 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;"></label>
					</th>
					<td>
						<input name="finishDate" id="finishDate" type="text" style="width: 100%; height: 100%"  
							 class="Wdate" data-options="required:true" onfocus="showDate('yyyy-MM-dd')" />
					</td>
				</tr>
				<tr>
					<th>
						费用名称 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;"></label>
					</th>
					<td>
						<input name="costName" id="costName" type="text" style="width: 100%;"  
							 class="easyui-validatebox span2" data-options="required:true" />
					</td>
					<th>
						绩效提成金额（元） &nbsp;<label style="color: red; vertical-align: middle; text-align: center;"></label>
					</th>
					<td>
						<input name="amount" id="amount" type="text" style="width: 100%;"  
							 class="easyui-numberbox" precision=2 />
					</td>
				</tr>
				<tr>
					<th>
						申请人 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input id="applicant" name="applicant" type="text" style="width: 100%;"  
							 class="easyui-validatebox span2" data-options="required:true"  />
						<input id="applicantId" name="applicantId" type="hidden" />
					</td>
					<th>
						申请时间  &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="applicantDate" id="applicantDate" type="text" style="width: 100%; height: 100%"  
							 class="Wdate" data-options="required:true" onfocus="showDate('yyyy-MM-dd')" />
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
		<br>
		<!-- 审批内容 -->
		<form id="scoreCutRegisterApprovalForm" method="post">
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