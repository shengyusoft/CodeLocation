<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script type="text/javascript">
	//表单加载
	$(function(){
		// 加载表单
		$('#scoreCutRegisterEditForm').form('load', '/scoreCutRegister/get?id=${id}');
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="scoreCutRegisterEditForm" method="post">
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
	</div>
</div>