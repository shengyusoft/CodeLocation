<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		$('#projectBidRegistEditForm').form({
			url : '${pageContext.request.contextPath}/projectRegist/edit',
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
					//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
					parent.$.modalDialog.openner_dataGrid.datagrid('reload');
					parent.$.modalDialog.handler.dialog('close');
				} else {
					parent.$.messager.alert('错误', result.msg, 'error');
				}
			}
		});
	});
	
/* 	$('#typeId').combobox({
		url : "${pageContext.request.contextPath}/dictionary/combox?code=goodstype",
		parentField : 'dictionaryId',
		valueField : 'id',
		textField : 'text',
		panelHeight : 'auto'				
	}); */
	$('#company').combobox({
		url : "${pageContext.request.contextPath}/dictionary/combox?code=company",
		parentField : 'dictionaryId',
		valueField : 'id',
		value:'${projectRegist.company.id}',
		textField : 'text',
		panelHeight : 'auto'				
	});
	
	$('#bd').combobox({
		url : "${pageContext.request.contextPath}/dictionary/combox?code=bd",
		parentField : 'dictionaryId',
		valueField : 'id',
		value:'${projectRegist.bd.id}',
		textField : 'text',
		panelHeight : 'auto'				
	});
	
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
	
	$('#member5Card').combobox({
		url : "${pageContext.request.contextPath}/certificate/comboxbytype?type=D",
		parentField : 'card_code',
		valueField : 'id',
		value:'${projectRegist.member5Card.id}',
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
		url : "${pageContext.request.contextPath}/dictionarytype/combox?pid=14",
		parentField : 'pid',
		valueField : 'id',
		textField : 'name',
		panelHeight : 'auto',
		required:true,
		editable:true,//不可编辑，只能选择
		defaultValue:'--请选择--',
		value:'${projectRegist.provice.id}',
		onChange:function(provice){
	    	$('#city').combobox({
	    	url : "${pageContext.request.contextPath}/dictionarytype/combox?pid="+provice,
		    valueField:'id', //值字段
		    textField:'name', //显示的字段
		    panelHeight:'auto',
		    required:true,
		    editable:true,//不可编辑，只能选择
		    value:'--请选择--',
		    onChange:function(city){
		    	$('#county').combobox({
			    	url : "${pageContext.request.contextPath}/dictionarytype/combox?pid="+city,
				    valueField:'id', //值字段
				    textField:'name', //显示的字段
				    panelHeight:'auto',
				    required:true,
				    editable:true,//不可编辑，只能选择
				    value:'--请选择--'
				});
	 		}
	    	
	    });
	   }
	});
	
	$('#city').combobox({
    	url : "${pageContext.request.contextPath}/dictionarytype/combox",
	    valueField:'id', //值字段
	    textField:'name', //显示的字段
	    panelHeight:'auto',
	    required:true,
	    editable:true,//不可编辑，只能选择
	    defaultValue:'--请选择--',
	    value:'${projectRegist.city.id}'
	});
	
	$('#county').combobox({
    	url : "${pageContext.request.contextPath}/dictionarytype/combox",
	    valueField:'id', //值字段
	    textField:'name', //显示的字段
	    panelHeight:'auto',
	    required:true,
	    editable:true,//不可编辑，只能选择
	    defaultValue:'--请选择--',
	    value:'${projectRegist.county.id}'
	});
	
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="projectBidRegistEditForm" method="post" >
			<table class="grid">
				<tr>
					<th>公司名称 &nbsp;</th>
					<td>
					<input name="type" type="hidden" value="${projectRegist.type}"></input>
					<input type="hidden" name="id" id="id" value="${projectRegist.id}"></input>
					<select id="company" name="company.id" 
						class="easyui-validatebox span2" style="width: 100%;">
					</select></td>
					<th>项目名称 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="projectName" value="${projectRegist.projectName}" style="width: 100%;"
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
					<th>资质要求&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="qualifyRequirement" value="${projectRegist.qualifyRequirement}"  style="width: 100%; height: 100%"
						type="text" id="qualifyRequirement" class="easyui-validatebox span2"
						data-options="required:true" /></td>
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
					<td><select id="certificateC" name="certificateC.id"
						class="easyui-validatebox span2" style="width: 100%;"
						data-options="required:true">
					</select></td>
					<th>五大员证 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><select id="member5Card" name="member5Card.id"
						class="easyui-validatebox span2" style="width: 100%;"
						data-options="required:true">
					</select></td>
				</tr>
				<tr>
					<th>委托人&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><select id="delegator" name="delegator.id"
						class="easyui-validatebox span2" style="width: 100%;"
						data-options="required:true">
					</select></td>
					<th>开标时间 &nbsp;<label
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
					<th>投标费用&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="bidCost" value="${projectRegist.bidCost}" type="text" id="bidCost"
						style="width: 100%; height: 100%" class="easyui-validatebox span2"
						data-options="required:true" /></td>
					
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