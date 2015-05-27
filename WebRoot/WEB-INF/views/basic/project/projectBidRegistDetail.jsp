<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$('#company').combobox({
		url : "${pageContext.request.contextPath}/dictionary/combox?code=company",
		parentField : 'dictionaryId',
		valueField : 'id',
		value:'${projectRegist.company.id}',
		required:true,
		textField : 'text',
		panelHeight : 'auto'				
	});

	//多选列表
	//标段
	$('#bd').combobox({
		url : "${pageContext.request.contextPath}/dictionary/combox?code=bd",
		parentField : 'dictionaryId',
		valueField : 'id',
		multiple:true,
		textField : 'text',
		panelHeight : 'auto'				
	});
	
	var selectedBds=[];
	var bss = '${projectRegist.bds}';
	selectedBds = bss.split(',');
	$('#bd').combobox('setValues',selectedBds); 
	
	//资质要求
	$('#qualifyRequirement').combobox({
		url : "${pageContext.request.contextPath}/dictionary/combox?code=zzyq",
		parentField : 'dictionaryId',
		valueField : 'id',
		multiple:true,
		textField : 'text',
		panelHeight : 'auto'				
	});
	var selectedQFs=[];
	var qfs = '${projectRegist.qualifyRequirement}';
	selectedQFs = qfs.split(',');
	$('#qualifyRequirement').combobox('setValues',selectedQFs); 
	
	//五大员证
	$('#member5Cards').combobox({
		url : "${pageContext.request.contextPath}/certificate/comboxbytype?type=D",
		parentField : 'card_code',
		valueField : 'id',
		multiple:true,
		textField : 'card_name',
		panelHeight : 'auto'				
	});
	var selectedM5ds=[];
	var md5s = '${projectRegist.member5Cards}';
	selectedM5ds = md5s.split(',');
	$('#member5Cards').combobox('setValues',selectedM5ds); 
	
	$('#projectMgr').combobox({
		url : "${pageContext.request.contextPath}/dictionary/combox?code=manager",
		parentField : 'dictionaryId',
		valueField : 'id',
		value:'${projectRegist.projectMgr.id}',
		textField : 'text',
		panelHeight : 'auto'				
	});
	
	$('#techniqueMgr').combobox({
		url : "${pageContext.request.contextPath}/dictionary/combox?code=jsjl",
		parentField : 'dictionaryId',
		value:'${projectRegist.techniqueMgr.id}',
		valueField : 'id',
		textField : 'text',
		panelHeight : 'auto'				
	});
	
	$('#certificateA').combobox({
		url : "${pageContext.request.contextPath}/certificate/comboxbytype?type=A",
		parentField : 'card_code',
		valueField : 'id',
		value:'${projectRegist.certificateA.id}',
		textField : 'card_name',
		panelHeight : 'auto'				
	});
	
	$('#certificateB').combobox({
		url : "${pageContext.request.contextPath}/certificate/comboxbytype?type=B",
		parentField : 'card_code',
		valueField : 'id',
		value:'${projectRegist.certificateB.id}',
		textField : 'card_name',
		panelHeight : 'auto'				
	});
	
	$('#certificateC').combobox({
		url : "${pageContext.request.contextPath}/certificate/comboxbytype?type=C",
		parentField : 'card_code',
		valueField : 'id',
		value:'${projectRegist.certificateC.id}',
		textField : 'card_name',
		panelHeight : 'auto'				
	});
	
	$('#delegator').combobox({
		url : "${pageContext.request.contextPath}/dictionary/combox?code=wtr",
		parentField : 'dictionaryId',
		valueField : 'id',
		value:'${projectRegist.delegator.id}',
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
		value:'${projectRegist.provice.id}',
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
	    value:'${projectRegist.city.id}',
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
	    value:'${projectRegist.county.id}'
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="projectRegistEditForm" method="post" >
			<table class="grid">
				<tr>
					<th>公司名称 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td>
					<input type="hidden" name="id" id="id" value="${projectRegist.id}"></input>
					<input type="hidden" name="type" id="type" value="${projectRegist.type}"></input>
					<select id="company" name="company.id" data-options="required:true"
						class="easyui-validatebox span2" style="width: 100%;">
					</select></td>
					<th>项目名称 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="projectName" value="${projectRegist.projectName}" style="width: 150px;"
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
					<td colspan="3"><select id="bd" name="bds"
						class="easyui-validatebox span2" style="width: 550px;"
						data-options="required:true">
					</select></td>
				</tr>
				<tr>
					<th>资质要求&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="3"><select id="qualifyRequirement" name="qualifyRequirement"
						class="easyui-validatebox span2" style="width: 550px;"
						data-options="required:true">
					</select></td>
				</tr>
				<tr>
					<th>项目经理&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><select id="projectMgr" name="projectMgr.id"
						class="easyui-validatebox span2" style="width: 150px;"
						data-options="required:true">
					</select></td>
					<th>技术负责人&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><select id="techniqueMgr" name="techniqueMgr.id"
						class="easyui-validatebox span2" style="width: 150px;"
						data-options="required:true">
					</select></td>
				</tr>
				<tr>
					<th>A证 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><select id="certificateA" name="certificateA.id"
						class="easyui-validatebox span2" style="width: 100%;"
						data-options="required:true">
					</select></td>
					<th>B证&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><select id="certificateB" name="certificateB.id"
						class="easyui-validatebox span2" style="width: 100%;"
						data-options="required:true">
					</select></td>
				</tr>
				<tr>
					<th>C证&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="3"><select id="certificateC" name="certificateC.id"
						class="easyui-validatebox span2" style="width: 100%;"
						data-options="required:true">
					</select></td>
				</tr>
				<tr>
					<th>五大员证 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="3"><select id="member5Cards" name="member5Cards"
						class="easyui-validatebox span2" style="width: 550px;"
						data-options="required:true">
					</select></td>
				</tr>
				<tr>
					<th>委托人&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><select id="delegator" name="delegator.id"
						class="easyui-validatebox span2" style="width: 150px;"
						data-options="required:true">
					</select></td>
					<th>报名时间 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input class="Wdate" type="text" name="registDT" value="${projectRegist.registDT}"
						id="registDT" style="width: 98%; height: 100%;"
						data-options="required:true" onfocus="showDate('yyyy-MM-dd')" /></td>
				</tr>
				<tr>
					<th>投标人姓名&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="bidder" value="${projectRegist.bidder}" type="text" id="bidder"
						style="width: 100%; height: 100%" class="easyui-validatebox span2"
						data-options="required:true" /></td>
					<th>联系方式 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="contract" value="${projectRegist.contract}" style="width: 100%; height: 100%" data-options="required:true"
						type="text" id="contract" class="easyui-validatebox span2"/></td>
				</tr>
				<tr>
					<th>投标费用（元）&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="bidCost" value="${projectRegist.bidCost}" type="text" id="bidCost"
						style="width: 100%; height: 100%" class="easyui-validatebox span2"
						data-options="required:true" /></td>
					
				</tr>
				<tr>
					<th>备注&nbsp;</th>
					<td colspan="3"><textarea style="width: 100%" rows="2"
							name="remark">${projectRegist.remark}</textarea></td>
				</tr>
			</table>
		</form>
	</div>
</div>