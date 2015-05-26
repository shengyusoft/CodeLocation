<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$('#company').combobox({
		url : "${pageContext.request.contextPath}/dictionary/combox?code=company",
		parentField : 'dictionaryId',
		valueField : 'id',
		value:'${projectBid.company.id}',
		textField : 'text',
		panelHeight : 'auto'				
	});
	
	$('#bd').combobox({
		url : "${pageContext.request.contextPath}/dictionary/combox?code=bd",
		parentField : 'dictionaryId',
		valueField : 'id',
		value:'${projectBid.bd.id}',
		textField : 'text',
		panelHeight : 'auto'				
	});
	
	$('#projectMgr').combobox({
		url : "${pageContext.request.contextPath}/dictionary/combox?code=manager",
		parentField : 'dictionaryId',
		valueField : 'id',
		value:'${projectBid.projectMgr.id}',
		textField : 'text',
		panelHeight : 'auto'				
	});
	
	$('#techniqueMgr').combobox({
		url : "${pageContext.request.contextPath}/dictionary/combox?code=jsjl",
		parentField : 'dictionaryId',
		value:'${projectBid.techniqueMgr.id}',
		valueField : 'id',
		textField : 'text',
		panelHeight : 'auto'				
	});
	
	
	$('#aqy').combobox({
		url : "${pageContext.request.contextPath}/dictionary/combox?code=aqy",
		parentField : 'dictionaryId',
		valueField : 'id',
		value:'${projectBid.aqy.id}',
		textField : 'text',
		panelHeight : 'auto'				
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
		value:'${projectBid.provice.id}',
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
	    value:'${projectBid.city.id}'
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
	    value:'${projectBid.county.id}'
	});
	
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="projectBidEditForm" method="post" >
			<table class="grid">
				<tr>
					<th>公司名称 &nbsp;</th>
					<td>
					<input type="hidden" name="id" id="id" value="${projectBid.id}"></input>
					<select id="company" name="company.id" 
						class="easyui-validatebox span2" style="width: 100%;">
					</select></td>
					<th>项目名称 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="projectName" value="${projectBid.projectName}" style="width: 100%;"
						type="text" id="projectName" class="easyui-validatebox span2"
						data-options="required:true" /></td>
				</tr>
				<tr>
					<th>地点 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="3">
						省：<select id="provice" data-options="required:true" name="provice.id" class="easyui-validatebox span2" style="width: 100px;">
					</select>
					 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						市：<select id="city" name="city.id" class="easyui-validatebox span2" style="width: 100px;">
					</select>
					 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						县(区)：<select id="county" name="county.id" data-options="required:true" class="easyui-validatebox span2" validType="selectValueRequired" style="width: 100px;">
					</select>
					</td>
				</tr>
				<tr>
					<th>标段 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><select id="bd" name="bd.id" 
						class="easyui-validatebox span2" style="width: 100%;"
						data-options="required:true">
					</select></td>
					<th>中标价&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="bid_cost" style="width: 100%; height: 100%"
						type="text" id="bid_cost" value="${projectBid.bid_cost}" class="easyui-validatebox span2"
						data-options="required:true" disabled/></td>
				</tr>
				<tr>
					<th>管理费(%)&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="manage_cost" style="width: 100%; height: 100%" value="${projectBid.manage_cost}"
						type="text" id="manage_cost" class="easyui-validatebox span2" disabled
						data-options="required:true" /></td>
					
					<th>工期 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input class="Wdate" type="text" name="duration" value="${projectBid.duration}"
						id="duration" style="width: 98%; height: 100%;" disabled
						data-options="required:true" onfocus="showDate('yyyy-MM-dd')" /></td>
				</tr>
				<tr>
					<th>项目经理&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><select id="projectMgr" name="projectMgr.id"
						class="easyui-validatebox span2" style="width: 100%;"
						data-options="required:true">
					</select></td>
					<th>技术负责人&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><select id="techniqueMgr" name="techniqueMgr.id"
						class="easyui-validatebox span2" style="width: 100%;"
						data-options="required:true">
					</select></td>
				</tr>
				<tr>
					<th>安全员&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><select id="aqy" name="aqy.id"
						class="easyui-validatebox span2" style="width: 100%;"
						data-options="required:true">
					</select></td>
					<th>项目负责人&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="headman" type="text" id="headman"
						style="width: 100%; height: 100%" class="easyui-validatebox span2" value="${projectBid.headman}"
						data-options="required:true" /></td>
				</tr>
				<tr>
					<th>登记人&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="recordman" type="text" readonly id="recordman" value="${sessionInfo.name}"
						style="width: 100%; height: 100%" class="easyui-validatebox span2" value="${projectBid.recordman}"
						data-options="required:true" /></td>
					<th>联系方式 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="tel" style="width: 100%; height: 100%" data-options="required:true"
						type="text" id="tel" value="${projectBid.tel}" class="easyui-validatebox span2"/></td>
				</tr>
				
				<tr>
					<th>备注&nbsp;</th>
					<td colspan="3"><textarea style="width: 100%" rows="5"
							name="remark">${projectRegist.remark}</textarea></td>
				</tr>
			</table>
		</form>
	</div>
</div>