<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		$('#projectBidAddForm').form({
			url : '${pageContext.request.contextPath}/projectBid/add',
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
	
	$('#typeId').combobox({
		url : "${pageContext.request.contextPath}/dictionary/combox?code=goodstype",
		parentField : 'dictionaryId',
		valueField : 'id',
		textField : 'text',
		panelHeight : 'auto'				
	});
	
	$('#company').combobox({
		url : "${pageContext.request.contextPath}/dictionary/combox?code=company",
		parentField : 'dictionaryId',
		valueField : 'id',
		textField : 'text',
		panelHeight : 'auto'				
	});
	
	$('#bd').combobox({
		url : "${pageContext.request.contextPath}/dictionary/combox?code=bd",
		parentField : 'dictionaryId',
		valueField : 'id',
		textField : 'text',
		panelHeight : 'auto'				
	});
	
	$('#projectMgr').combobox({
		url : "${pageContext.request.contextPath}/dictionary/combox?code=manager",
		parentField : 'dictionaryId',
		valueField : 'id',
		textField : 'text',
		panelHeight : 'auto'				
	});
	
	$('#techniqueMgr').combobox({
		url : "${pageContext.request.contextPath}/dictionary/combox?code=jsjl",
		parentField : 'dictionaryId',
		valueField : 'id',
		textField : 'text',
		panelHeight : 'auto'				
	});
	
	$('#aqy').combobox({
		url : "${pageContext.request.contextPath}/dictionary/combox?code=aqy",
		parentField : 'dictionaryId',
		valueField : 'id',
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
		value:'--请选择--',
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
	    value:'--请选择--'
	});
	
	$('#county').combobox({
    	url : "${pageContext.request.contextPath}/dictionarytype/combox",
	    valueField:'id', //值字段
	    textField:'name', //显示的字段
	    panelHeight:'auto',
	    required:true,
	    editable:true,//不可编辑，只能选择
	    value:'--请选择--'
	});
	
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="projectBidAddForm" method="post" >
			<table class="grid">
				<tr>
					<th>公司名称 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><select id="company" name="company.id" 
						class="easyui-validatebox span2" data-options="editable:false,required:true" style="width: 100%;">
					</select></td>
					<th>项目名称 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="projectName" style="width: 100%;"
						type="text" id="projectName" class="easyui-validatebox span2"
						data-options="required:true" /></td>
				</tr>
				<tr>
					<th>地点 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="3">
						省：<select id="provice" data-options="editable:false,required:true" name="provice.id" class="easyui-validatebox span2" style="width: 100px;">
					</select>
					 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						市：<select id="city" name="city.id" class="easyui-validatebox span2" style="width: 100px;">
					</select>
					 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						县(区)：<select id="county" name="county.id" data-options="editable:false,required:true" class="easyui-validatebox span2" validType="selectValueRequired" style="width: 100px;">
					</select>
					</td>
				</tr>
				<tr>
					<th>标段 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><select id="bd" name="bd.id"
						class="easyui-validatebox span2" style="width: 100%;"
						data-options="editable:false,required:true">
					</select></td>
					<th>中标价&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="bid_cost" style="width: 100%; height: 100%"
						type="text" id="bid_cost" class="easyui-validatebox span2"
						data-options="required:true" /></td>
				</tr>
				<tr>
					<th>管理费&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="manage_cost" style="width: 100%; height: 100%"
						type="text" id="manage_cost" class="easyui-validatebox span2"
						data-options="required:true" /></td>
					
					<th>工期 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input class="Wdate" type="text" name="duration"
						id="duration" style="width: 98%; height: 100%;"
						data-options="required:true" onfocus="showDate('yyyy-MM-dd')" /></td>
				</tr>
				<tr>
					<th>项目经理&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><select id="projectMgr" name="projectMgr.id"
						class="easyui-validatebox span2" style="width: 100%;"
						data-options="editable:false,required:true">
					</select></td>
					<th>技术负责人&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><select id="techniqueMgr" name="techniqueMgr.id"
						class="easyui-validatebox span2" style="width: 100%;"
						data-options="editable:false,required:true">
					</select></td>
				</tr>
				
				<tr>
					<th>安全员&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><select id="aqy" name="aqy.id"
						class="easyui-validatebox span2" style="width: 100%;"
						data-options="editable:false,required:true">
					</select></td>
					<th>项目负责人&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="headman" type="text" id="headman"
						style="width: 100%; height: 100%" class="easyui-validatebox span2"
						data-options="required:true" /></td>
				</tr>
				<tr>
					<th>登记人&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="recordman" type="text" readonly id="recordman" value="${sessionInfo.name}"
						style="width: 100%; height: 100%" class="easyui-validatebox span2"
						data-options="required:true" /></td>
					<th>联系方式 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="tel" style="width: 100%; height: 100%" data-options="required:true"
						type="text" id="tel" class="easyui-validatebox span2"/></td>
				</tr>
				
				<tr>
					<th>备注&nbsp;</th>
					<td colspan="3"><textarea style="width: 100%" rows="5"
							name="remark"></textarea></td>
				</tr>
			</table>
		</form>
	</div>
</div>