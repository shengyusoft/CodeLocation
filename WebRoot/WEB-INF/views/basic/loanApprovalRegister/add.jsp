<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script type="text/javascript"
	src="${ctx}/jslib/easyui1.3.3/plugins/datagrid-statistics.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="${ctx}/jslib/easyui1.3.3/plugins/datagrid-statistics.js"
	charset="utf-8"></script>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript">
	$(function() {
		$('#loanApprovalRegisterAddForm').form({
			url : '${pageContext.request.contextPath}/loanApprovalRegister/apply',
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
					$("#loanApprovalRegisterBtn").linkbutton("disable");
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
		$('#loanDate_show').val(d);
	});
	// 转大写
	function toUpperCase(val){
		if(val != null && val != ""){
			var res = toCap(val);
			$('#loanMoneyCap_show').html(res);
			$('#loanMoneyCap').val(res);
		}else{
			$('#loanMoneyCap_show').html("");
			$('#loanMoneyCap').val("");
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
		<form id="loanApprovalRegisterAddForm" method="post">
			<input type="hidden" name="option" id="option" value="" />
			<table class="grid">
				<tr>
					<th>
						借款人  &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="loan" id="loan" type="text" style="width: 100%;"  value="${sessionInfo.name}"
							 class="easyui-validatebox span2" data-options="required:true" readonly="readonly" />
					</td>
					<th>
						借款日期  &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="loanDate_show" id="loanDate_show" type="text" style="width: 100%; height: 100%" disabled="disabled" />
					</td>
				</tr>
				<tr>
					<th>
						借款金额  &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label>
					</th>
					<td>
						<input name="loanMoney" id="loanMoney" type="text" style="width: 100%;"  
							 class="easyui-numberbox" data-options="required:true" precision=2 onblur="toUpperCase(this.value)" />
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