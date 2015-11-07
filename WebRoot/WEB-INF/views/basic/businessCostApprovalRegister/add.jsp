<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		$('#businessCostApprovalRegisterAddForm').form({
			url : '${pageContext.request.contextPath}/businessCostApprovalRegister/apply',
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
					parent.$.modalDialog.openner_dataGrid.datagrid('reload');
					parent.$.modalDialog.handler.dialog('close');
				} else {
					parent.$.messager.alert('错误', result.msg, 'error');
				}
			}
		});
		// 借款日期
		var d = new Date();
		d = d.format('yyyy-MM-dd');
		$('#show_date').val(d);
		$('#applicantDate_show').val(d);
	});

	// 转大写
	function toUpperCase(val){
		if(val != null && val != ""){
			var res = toCap(val);
			$('#applyCost_show').html(res);
			$('#applyCostCap').val(res);
		}else{
			$('#applyCost_show').html("");
			$('#applyCostCap').val("");
		}
	}
	function toCap(n) {
		if (!/^(0|[1-9]\d*)(\.\d+)?$/.test(n)){
			return "数据非法";
		}
		var unit = "千百拾亿千百拾万千百拾元角分", str = "";
		n += "00";
		var p = n.indexOf('.');
		if (p >= 0){
			n = n.substring(0, p) + n.substr(p + 1, 2);
		}
		unit = unit.substr(unit.length - n.length);
		for ( var i = 0; i < n.length; i++){
			str += '零壹贰叁肆伍陆柒捌玖'.charAt(n.charAt(i)) + unit.charAt(i);
		}
		return str.replace(/零(千|百|拾|角)/g, "零").replace(/(零)+/g, "零")
			.replace(/零(万|亿|元)/g, "$1").replace(/(亿)万|壹(拾)/g, "$1$2")
			.replace(/^元零?|零分/g, "").replace(/元$/g, "元整");
	}
	
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="businessCostApprovalRegisterAddForm" method="post">
		<input type="hidden" name="option" id="option" value="" />
			<table class="grid" style="width: 100%">
				<tr>
					<th>
						费用名称  &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td width="320px">
						<input name="costName" id="costName" type="text" style="width: 100%;"  
							 class="easyui-validatebox span2" data-options="required:true" />
					</td>
					<th>
						申请支付时间 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="show_date" id="show_date" type="text" style="width: 100%; height: 100%" disabled="disabled" />
					</td>
				</tr>
				<tr>
					<th>
						事由  &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td colspan="3">
						<textarea name="reason" id="reason" style="width: 100%;" rows="1" 
							 class="easyui-validatebox=" data-options="required:true"></textarea>
					</td>
				</tr>
				<tr>
					<th>
						申请支付金额(元)  &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="applyCost" id="applyCost" type="text" style="width: 100%;"  
							 class="easyui-numberbox" data-options="required:true" precision=2 onblur="toUpperCase(this.value)" />
					</td>
					<td colspan="2">
						<span id="applyCost_show"></span>
						<input id="applyCostCap" name="applyCostCap" type="hidden" />
					</td>
				</tr>
				<tr>
					<td colspan="4" align="center"><b><font size="5">收款人信息</font></b></td>
				</tr>
				<tr>
					<th>
						户名  &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td colspan="3">
						<input name="userName" id="userName" type="text" style="width: 100%;"  
							 class="easyui-validatebox span2" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>
						开户行  &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td colspan="3">
						<input name="bank" id="bank" type="text" style="width: 100%;"  
							 class="easyui-validatebox span2" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>
						账号  &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td colspan="3">
						<input name="account" id="account" type="text" style="width: 100%;"  
							 class="easyui-validatebox span2" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>
						联系人  &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td width="320px">
						<input name="contactPerson" id="contactPerson" type="text" style="width: 100%;"  
							 class="easyui-validatebox span2" data-options="required:true" />
					</td>
					<th>
						联系方式  &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="contactWay" id="contactWay" type="text" style="width: 100%;"  
							 class="easyui-validatebox span2" data-options="required:true" />
					</td>
				</tr>
				<tr>
					<th>
						申请人  &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td width="320px">
						<input value="${name}" type="text" style="width: 100%; height: 100%" disabled="disabled" />
					</td>
					<th>
						申请时间  &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="applicantDate_show" id="applicantDate_show" type="text" style="width: 100%; height: 100%" disabled="disabled" />
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