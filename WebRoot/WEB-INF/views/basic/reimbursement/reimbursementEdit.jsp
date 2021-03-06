<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script type="text/javascript">
	$(function() {
		$('#reimbursementEditForm').form({
			url : '${pageContext.request.contextPath}/reimbursement/apply',
			onSubmit : function() {
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
					//批量报销和单独报销两种情况
					if(parent.$.modalDialogTwo.openner_dataGrid){
						parent.$.modalDialogTwo.openner_dataGrid.datagrid('reload');
						parent.$.modalDialogTwo.handler.dialog('close');
					}else if(parent.$.modalDialog.openner_dataGrid){
						parent.$.modalDialog.openner_dataGrid.datagrid('reload');
						parent.$.modalDialog.handler.dialog('close');
					}
				} else {
					parent.$.messager.alert('错误', result.msg, 'error');
				}
			}
		});
	});
	
	$('#provice').combobox({
		url : "${pageContext.request.contextPath}/dictionary/xzqhCombox?pid=&&lvs="+2,
		parentField : 'pid',
		valueField : 'id',
		textField : 'text',
		panelHeight : 300,
		required:true,
		editable:false,//不可编辑，只能选择
		defaultValue:'--请选择--',
		value:'${reimbursement.proviceId}',
		onChange:function(provice){
	    	$('#city').combobox({
	    	url : "${pageContext.request.contextPath}/dictionary/xzqhCombox?pid="+provice+"&&lvs=3",
		    valueField:'id', //值字段
		    textField:'text', //显示的字段
		    panelHeight:'auto',
		    required:true,
		    editable:false,//不可编辑，只能选择
		    value:'--请选择--',
		    onChange:function(city,n){
		    	$('#county').combobox({
			    	url : "${pageContext.request.contextPath}/dictionary/xzqhCombox?pid="+city+"&&lvs=4",
				    valueField:'id', //值字段
				    textField:'text', //显示的字段
				    panelHeight:'auto',
				    required:true,
				    editable:false,//不可编辑，只能选择
				    value:'--请选择--'
				});
	 		}
	    });
	   }
	});
	
	
	var provice = $('#provice').combobox('getValue');
	$('#city').combobox({
    	url : "${pageContext.request.contextPath}/dictionary/xzqhCombox?pid="+provice+"&&lvs=3",
    	parentField : 'pid',
	    valueField:'id', //值字段
	    textField:'text', //显示的字段
	    panelHeight:'auto',
	    required:true,
	    editable:false,//不可编辑，只能选择
	    defaultValue:'--请选择--',
	    value:'${reimbursement.cityId}',
	    onChange:function(city,n){
	    	$('#county').combobox({
		    	url : "${pageContext.request.contextPath}/dictionary/xzqhCombox?pid="+city+"&&lvs=4",
			    valueField:'id', //值字段
			    textField:'text', //显示的字段
			    panelHeight:'auto',
			    required:true,
			    editable:false,//不可编辑，只能选择
			    value:'--请选择--'
			});
 		}
	});
	
	var city = $('#city').combobox('getValue');
	$('#county').combobox({
    	url : "${pageContext.request.contextPath}/dictionary/xzqhCombox?pid="+city+"&&lvs=4",
    	parentField : 'pid',
	    valueField:'id', //值字段
	    textField:'text', //显示的字段
	    panelHeight:'auto',
	    required:true,
	    editable:false,//不可编辑，只能选择
	    defaultValue:'--请选择--',
	    value:'${reimbursement.countyId}'
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="reimbursementEditForm" method="post">
			<table class="grid">
				<tr>
					<th>时间范围 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input type="hidden" name="option" id="option" value="2" />
						<input type="hidden" name="batchId" id="batchId" value="${reimbursement.batchId}" /> 
						<input type="hidden" name="type" id="type" value="${reimbursement.type}" /> 
						<input type="hidden" name="id" value="${reimbursement.id}" /> 
						<input type="hidden" name="process.id" value="${reimbursement.process_vo.id}" /> 
						<input id="startDT" class="Wdate" data-options="required:true" type="text" name="startDT"
						value="<fmt:formatDate value="${reimbursement.startDT}" pattern="yyyy-MM-dd"/>"
						style="width: 68%; height: 100%;" onfocus="showStart('yyyy-MM-dd')" /></td>
					<td><input id="endDT" class="Wdate" data-options="required:true" type="text" name="endDT" 
						value="<fmt:formatDate value="${reimbursement.endDT}" pattern="yyyy-MM-dd"/>"
						style="width: 68%; height: 100%;" onfocus="showEnd('yyyy-MM-dd')" />
					</td>
				</tr>
				<tr>
					<th>地点 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="2">省：<select id="provice"
						data-options="editable:false,required:true" name="provice.id"
						class="easyui-validatebox span2" style="width: 150px;">
					</select> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 市：<select id="city"
						name="city.id" class="easyui-validatebox span2"
						style="width: 150px;">
					</select> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 县(区)：<select id="county"
						name="county.id" data-options="editable:false,required:true"
						class="easyui-validatebox span2" validType="selectValueRequired"
						style="width: 150px;">
					</select>
					</td>
				</tr>
				<tr>
					<th>工作事情&nbsp;</th>
					<td colspan="4"><textarea style="width: 100%" rows="5"
							name="workDetail" id="workDetail"> ${reimbursement.workDetail}
						</textarea></td>
				</tr>
				<tr>
					<th>费用明细&nbsp;</th>
					<td colspan="4"><textarea style="width: 100%" rows="8" maxlength="2000"
							name="costDetail" id="costDetail">${reimbursement.costDetail}</textarea></td>
				</tr>
				<tr>
					<th>费用小计&nbsp;</th>
					<td colspan="3">
						<table title="费用小计" width="800">
							<tr>
								<th width="80">交通费（元）&nbsp;</th>
								<td><input name="trafficFee"
									value="${reimbursement.trafficFee}" type="text" id="trafficFee"
									data-options="required:true" style="width: 100%; height: 100%"
									class="easyui-numberbox" precision="2" min="0" /></td>
								<th width="80">就餐费（元）&nbsp;</th>
								<td><input name="mealFee" value="${reimbursement.mealFee}"
									type="text" id="mealFee" style="width: 100%; height: 100%"
									class="easyui-numberbox" precision="2" min="0" /></td>
								<th width="80">办公费（元）&nbsp;</th>
								<td><input name="officeFee"
									value="${reimbursement.officeFee}" type="text" id="officeFee"
									style="width: 100%; height: 100%" class="easyui-numberbox"
									precision="2" min="0" /></td>
								<th width="80">招待费（元）&nbsp;</th>
								<td><input name="receiveFee"
									value="${reimbursement.receiveFee}" type="text" id="receiveFee"
									style="width: 100%; height: 100%" class="easyui-numberbox"
									precision="2" min="0" /></td>
							</tr>
							<tr>
								<th width="80">刻章费（元）&nbsp;</th>
								<td><input name="badgeFee"
									value="${reimbursement.badgeFee}" type="text" id="badgeFee"
									style="width: 100%; height: 100%" class="easyui-numberbox"
									precision="2" min="0" /></td>
								<th width="80">通讯费（元）&nbsp;</th>
								<td><input name="communicationFee"
									value="${reimbursement.communicationFee}" type="text"
									id="communicationFee" style="width: 100%; height: 100%"
									class="easyui-numberbox" precision="2" min="0" /></td>
								<th width="80">物品购置费（元）&nbsp;</th>
								<td><input name="trainFee"
									value="${reimbursement.trainFee}" type="text" id="trainFee"
									style="width: 100%; height: 100%" class="easyui-numberbox"
									precision="2" min="0" /></td>
								<th width="80">其它费（元）&nbsp;</th>
								<td><input name="otherFee"
									value="${reimbursement.otherFee}" type="text" id="otherFee"
									style="width: 100%; height: 100%" class="easyui-numberbox"
									precision="2" min="0" /></td>
							</tr>
							<tr>
								<th width="80">文印费（元）&nbsp;</th>
								<td><input name="wyFee" value="${reimbursement.wyFee}"
									type="text" id="wyFee" style="width: 100%; height: 100%"
									class="easyui-numberbox" precision="2" min="0" /></td>
								<th width="80">制证费（元）&nbsp;</th>
								<td><input name="zzFee" type="text" id="zzFee"
									value="${reimbursement.zzFee}"
									style="width: 100%; height: 100%" class="easyui-numberbox"
									precision="2" min="0" /></td>
								<th width="120">住宿费（元）&nbsp;</th>
								<td><input name="zsFee" value="${reimbursement.zsFee}"
									type="text" id="zsFee" style="width: 100%; height: 100%"
									class="easyui-numberbox" precision="2" min="0" /></td>
								<th width="80">快递费（元）&nbsp;</th>
								<td><input name="kdFee" value="${reimbursement.kdFee}"
									type="text" id="kdFee" style="width: 100%; height: 100%"
									class="easyui-numberbox" precision="2" min="0" /></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>