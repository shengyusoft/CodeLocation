<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript">
	$(function() {
		$('#projectRegistEditForm').form({
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
		panelHeight : '300'				
	});
	
	$('#techniqueMgr').combobox({
		url : "${pageContext.request.contextPath}/dictionary/combox?code=jsjl",
		parentField : 'dictionaryId',
		value:'${projectRegist.techniqueMgr.id}',
		valueField : 'id',
		textField : 'text',
		panelHeight : '300'				
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
					<th width="90px">公司名称 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td>
					<input type="hidden" name="id" id="id" value="${projectRegist.id}"></input>
					<input type="hidden" name="type" id="type" value="${projectRegist.type}"></input>
					<select id="company" name="company.id" data-options="required:true"
						class="easyui-validatebox span2" style="width: 100%;">
					</select></td>
					<th width="100px">项目名称 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="projectName" value="${projectRegist.projectName}" style="width: 100%;"
						type="text" id="projectName" class="easyui-validatebox span2"
						data-options="required:true" /></td>
				</tr>
				<tr>
					<th>地点 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="3">
						省：<select id="provice" data-options="required:true" name="provice.id" class="easyui-validatebox span2" style="width: 140px;">
					</select>
					 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						市：<select id="city" name="city.id" class="easyui-validatebox span2" style="width: 140px;">
					</select>
					 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						县(区)：<select id="county" name="county.id" data-options="required:true" class="easyui-validatebox span2" validType="selectValueRequired" style="width: 140px;">
					</select>
					</td>
				</tr>
				<tr>
					<th>资质要求&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><select id="qualifyRequirement"
						name="qualifyRequirement" class="easyui-validatebox span2"
						style="width: 350px;" data-options="editable:false,required:true"></select></td>
					<th>标段 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><select id="bd" name="bds"
						class="easyui-validatebox span2" style="width: 250px;"
						data-options="editable:false,required:true">
					</select></td>
				</tr>
				<tr>
					<th>项目经理&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><select id="projectMgr" name="projectMgr.id"
						class="easyui-validatebox span2" style="width: 150px;"
						data-options="required:true">
					</select></td>
					<th width="90px">技术负责人&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><select id="techniqueMgr" name="techniqueMgr.id"
						class="easyui-validatebox span2" style="width: 150px;"
						data-options="required:true">
					</select></td>
				</tr>
				<tr>
					<th rowspan="2" width="90px">证书要求 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="3">A证:&nbsp;<select id="certificateA" name="certificateA.id"
						class="easyui-validatebox span2" style="width: 150px;"
						data-options="editable:false,required:true">
					</select>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;B证:&nbsp;<select id="certificateB" name="certificateB.id"
						class="easyui-validatebox span2" style="width: 150px;"
						data-options="editable:false,required:true">
					</select>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;C证:&nbsp;<select id="certificateC"
						name="certificateC.id" class="easyui-validatebox span2"
						style="width: 150px;" data-options="editable:false,required:true">
					</select></td>
				</tr>
				<tr>
					<td colspan="4">五大员证 :&nbsp;<select id="member5Cards" name="member5Cards"
						class="easyui-validatebox span2" style="width: 550px;"
						data-options="editable:false,required:true">
					</select></td>
				</tr>
				<tr>
					<th>委托人&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input id="delegator" name="delegator.name" readonly="readonly"
						value="${projectRegist.delegatorName}" class="easyui-validatebox span2"
						style="width: 150px;" data-options="required:true"></input> <input
						type="hidden" name="delegator.id" value="${projectRegist.delegatorId}"></input></td>
					<th>报名时间 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input class="Wdate" type="text" name="registDT" 
						value="<fmt:formatDate value="${projectRegist.registDT}" pattern="yyyy-MM-dd"/>"
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
					<td colspan="4">
						<table class="grid2">
							<tr>
								<th colspan="13">费用明细</th>
							</tr>
							<tr>
								<th colspan="4">路费</th>
								<th rowspan="2">资质费</th>
								<th rowspan="2">标书费</th>
								<th rowspan="2">预算费</th>
								<th colspan="4">人员出场费</th>
								<th rowspan="2">其他费用</th>
								<th rowspan="2">合计</th>
							</tr>
							<tr>
								<th>报名</th>
								<th>开标</th>
								<td><input name="head1" value="${projectRegist.head1}"
									type="text" id="head1" style="width: 100%; height: 100%"
									class="easyui-validatebox span2" /></td>
								<td><input name="head2" value="${projectRegist.head2}"
									type="text" id="head2" style="width: 100%; height: 100%"
									class="easyui-validatebox span2" /></td>

								<th>项目经理</th>
								<th>法人</th>
								<td><input name="head3" value="${projectRegist.head3}"
									type="text" id="head3" style="width: 100%; height: 100%"
									class="easyui-validatebox span2" /></td>
								<td><input name="head4" value="${projectRegist.head4}"
									type="text" id="head4" style="width: 100%; height: 100%"
									class="easyui-validatebox span2" /></td>
							</tr>
							<tr>
								<td><input name="bmFee" value="${projectRegist.bmFee}"
									type="text" id="bmFee" style="width: 100%; height: 100%"
									class="easyui-numberbox" precision="2" min="0"  /></td>
								<td><input name="kbFee" value="${projectRegist.kbFee}"
									type="text" id="kbFee" style="width: 100%; height: 100%"
									class="easyui-numberbox" precision="2" min="0"  /></td>
								<td><input name="head1Fee"
									value="${projectRegist.head1Fee}" type="text" id="head1Fee"
									style="width: 100%; height: 100%"
									class="easyui-numberbox" precision="2" min="0"  /></td>
								<td><input name="head2Fee"
									value="${projectRegist.head2Fee}" type="text" id="head2Fee"
									style="width: 100%; height: 100%"
									class="easyui-numberbox" precision="2" min="0"  /></td>
								<td><input name="zzFee" value="${projectRegist.zzFee}"
									type="text" id="zzFee" style="width: 100%; height: 100%"
									class="easyui-numberbox" precision="2" min="0"  /></td>
								<td><input name="bsFee" value="${projectRegist.bsFee}"
									type="text" id="bsFee" style="width: 100%; height: 100%"
									class="easyui-numberbox" precision="2" min="0"  /></td>
								<td><input name="ysFee" value="${projectRegist.ysFee}"
									type="text" id="ysFee" style="width: 100%; height: 100%"
									class="easyui-numberbox" precision="2" min="0"  /></td>
								<td><input name="xmjlFee" value="${projectRegist.xmjlFee}"
									type="text" id="xmjlFee" style="width: 100%; height: 100%"
									class="easyui-numberbox" precision="2" min="0"  /></td>
								<td><input name="frFee" value="${projectRegist.frFee}"
									type="text" id="frFee" style="width: 100%; height: 100%"
									class="easyui-numberbox" precision="2" min="0"  /></td>
								<td><input name="head3Fee"
									value="${projectRegist.head3Fee}" type="text" id="head3Fee"
									style="width: 100%; height: 100%"
									class="easyui-numberbox" precision="2" min="0"  /></td>
								<td><input name="head4Fee"
									value="${projectRegist.head4Fee}" type="text" id="head4Fee"
									style="width: 100%; height: 100%"
									class="easyui-numberbox" precision="2" min="0"  /></td>
								<td><input name="otherFee"
									value="${projectRegist.otherFee}" type="text" id="otherFee"
									style="width: 100%; height: 100%"
									class="easyui-numberbox" precision="2" min="0"  /></td>
								<td><input name="totalFee"
									value="${projectRegist.totalFee}" type="text" id="totalFee"
									style="width: 100%; height: 100%" readonly="readonly" disabled="disabled"
									class="easyui-numberbox" precision="2" min="0"  /></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<th>备注&nbsp;</th>
					<td colspan="3"><textarea style="width: 100%" rows="4"
							name="remark">${projectRegist.remark}</textarea></td>
				</tr>
			</table>
		</form>
	</div>
</div>