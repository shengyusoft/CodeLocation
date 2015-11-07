<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script type="text/javascript">
	// 表单加载
	$(function(){
		// 加载表单
		$('#loanApprovalRegisterEditForm').form('load', '/loanApprovalRegister/get?id=${id}');
	});
	
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="loanApprovalRegisterEditForm" method="post">
			<!-- 主键 -->
			<input id="id" name="id" type="hidden" />
			<table class="grid">
				<tr>
					<th>
						借款人  &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="loan" id="loan" type="text" style="width: 100%;" 
							 class="easyui-validatebox span2" data-options="required:true" />
					</td>
					<th>
						借款日期  &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="loanDate" id="loanDate" type="text" style="width: 100%; height: 100%"  
							 class="Wdate" data-options="required:true" onfocus="showDate('yyyy-MM-dd')" />
					</td>
				</tr>
				<tr>
					<th>
						借款金额  &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="loanMoney" id="loanMoney" type="text" style="width: 100%;"  
							 class="easyui-numberbox" data-options="required:true" precision=2 />
					</td>
					<td colspan="2">
						<span id="loanMoneyCap_show"></span>
						<input id="loanMoneyCap" name="loanMoneyCap" type="hidden" />
					</td>
				</tr>
				<tr>
					<th>
						借款事由 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td colspan="3">
						<input name="loanReason" id="loanReason" type="text" style="width: 100%;"  
							 class="easyui-validatebox span2" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th rowspan="3">
						款项支付 &nbsp;<label style="vertical-align: middle; text-align: center;"></label>
					</th>
					<th>
						户名 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td colspan="2">
						<input name="userName" id="userName" type="text" style="width: 100%;"  
							 class="easyui-validatebox span2" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>
						开户行 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td colspan="2">
						<input name="bank" id="bank" type="text" style="width: 100%;"  
							 class="easyui-validatebox span2" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>
						账号 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td colspan="2">
						<input name="account" id="account" type="text" style="width: 100%;"  
							 class="easyui-validatebox span2" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>备注&nbsp;</th>
					<td colspan="3">
						<textarea style="width: 100%" rows="2" name="loanRemark"></textarea>
					</td>
				</tr>

			</table>
		</form>
	</div>
</div>