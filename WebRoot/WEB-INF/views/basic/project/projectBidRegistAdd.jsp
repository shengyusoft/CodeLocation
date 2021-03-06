<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		$('#projectBidRegistAddForm').form({
			url : '${pageContext.request.contextPath}/projectRegist/add',
			onSubmit : function() {
				progressLoad();
				var isValid = $(this).form('validate');
				//自定义验证
				var state = '${projectRegist.state}';
				if(state == 0){
					var option = $('#option').val();
					var registDT = new Date($('#registDT').val());
					var limitDate = new Date(registDT.getFullYear(),registDT.getMonth(),registDT.getDate()+7);
					var now = new Date();
					if(option == 0){//save
						//超过一周不能上传,只能申请上传
						if(now >= limitDate){
							alert('过期不能上传（注：员工必须在项目开标登记后一周之内上传登记信息，如需上传请申请总经理审批）');
							isValid = false;
						}
					}else{//apply
						if(now < limitDate){
							alert('项目开标时间没有过期，请点击添加!');
							isValid = false;
						}else{
							$('#registDT').val('');
						}
					}
				}
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
		panelHeight : '200'
	});				

	$('#company').combobox({
		url : "${pageContext.request.contextPath}/dictionary/combox?code=company",
		parentField : 'dictionaryId',
		valueField : 'id',
		textField : 'text',
		required : true,
		panelHeight : '200'
	});				

	$('#bd').combobox({
		url : "${pageContext.request.contextPath}/dictionary/combox?code=bd",
		parentField : 'dictionaryId',
		valueField : 'id',
		multiple : true,
		textField : 'text',
		panelHeight : '300'
	});

	$('#projectMgr').combobox({
		url : "${pageContext.request.contextPath}/dictionary/combox?code=manager",
		parentField : 'dictionaryId',
		valueField : 'id',
		textField : 'text',
		panelHeight : '300'		
	});				

	$('#techniqueMgr').combobox({
		url : "${pageContext.request.contextPath}/dictionary/combox?code=jsjl",
		parentField : 'dictionaryId',
		valueField : 'id',
		textField : 'text',
		panelHeight : '300'
	});

	$('#certificateA').combobox({
		url : "${pageContext.request.contextPath}/certificate/comboxbytype?type=A",
		parentField : 'card_code',
		valueField : 'id',
		textField : 'card_owner',
		panelHeight : '200'
	});				

	$('#certificateB').combobox({
		url : "${pageContext.request.contextPath}/certificate/comboxbytype?type=B",
		parentField : 'card_code',
		valueField : 'id',
		textField : 'card_owner',
		panelHeight : '300'
	});				

	$('#certificateC').combobox({
		url : "${pageContext.request.contextPath}/certificate/comboxbytype?type=C",
		parentField : 'card_code',
		valueField : 'id',
		textField : 'card_owner',
		panelHeight : '200'
	});				

	$('#member5Cards').combobox({
		url : "${pageContext.request.contextPath}/certificate/comboxbytype?type=D",
		parentField : 'card_code',
		valueField : 'id',
		multiple : true,
		textField : 'card_owner',
		panelHeight : '200'
	});				

	$('#qualifyRequirement').combobox({
		url : "${pageContext.request.contextPath}/dictionary/combox?code=zzyq",
		parentField : 'dictionaryId',
		valueField : 'id',
		multiple : true,
		textField : 'text',
		panelHeight : '200'
	});

	$('#provice').combobox({
		url : "${pageContext.request.contextPath}/dictionary/xzqhCombox?pid=&&lvs=" + 2,
		parentField : 'pid',
		valueField : 'id',
		textField : 'text',
		panelHeight : 300,
		required : true,
		editable : false,//不可编辑，只能选择
		value : '--请选择--',
		onChange : function(provice) {
			$('#city').combobox({
				url : "${pageContext.request.contextPath}/dictionary/xzqhCombox?pid="+ provice + "&&lvs=3",
				valueField : 'id', //值字段
				textField : 'text', //显示的字段
				panelHeight : '200',
				required : true,
				editable : false,//不可编辑，只能选择
				value : '--请选择--',
				onChange : function(city, n) {
					$('#county').combobox({
						url : "${pageContext.request.contextPath}/dictionary/xzqhCombox?pid="+ city+"&&lvs=4",
						valueField : 'id', //值字段
						textField : 'text', //显示的字段
						panelHeight : '200',
						required : true,
						editable : false,//不可编辑，只能选择
						value : '--请选择--'
					});				
				}
			});
		}
	});				

	$('#city').combobox({
		valueField : 'id', //值字段
		textField : 'text', //显示的字段
		panelHeight : '200',
		required : true,
		editable : false,//不可编辑，只能选择
		value : '--请选择--'
	});

	$('#county').combobox({
		valueField : 'id', //值字段
		textField : 'text', //显示的字段
		panelHeight : '200',
		required : true,
		editable : false,//不可编辑，只能选择
		value : '--请选择--'
	});
	
	$('#projectType').combobox({
		url : "${pageContext.request.contextPath}/dictionary/combox?code=projectType",
		parentField : 'dictionaryId',
		valueField : 'text',
		textField : 'text',
		panelHeight : 'auto'
	});	
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="projectBidRegistAddForm" method="post">
			<table class="grid">
				<tr>
					<th width="100px">项目名称 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="3"><input name="projectName" style="width: 100%;" type="text"
						id="projectName" class="easyui-validatebox span2"
						data-options="required:true" /></td>
				</tr>
				<tr>
					<th width="90px">公司名称 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td>
						<input type="hidden" name="type" id="type" value="1"></input>
						<input type="hidden" name="option" id="option" value="0"></input>
						<select id="company" name="company.id"
						data-options="required:true" class="easyui-validatebox span2"
						style="width:150px;">
					</select></td>
					<th>项目类型 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><select id="projectType" name="projectType"
						class="easyui-validatebox span2"
						data-options="editable:false,required:true" style="width: 180px;">
					</select></td>
				</tr>
				<tr>
					<th>地点 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="3">省：<select id="provice"
						data-options="required:true" name="provice.id"
						class="easyui-validatebox span2" style="width: 140px;">
					</select> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 市：<select id="city"
						name="city.id" class="easyui-validatebox span2"
						style="width: 140px;">
					</select> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 县(区)：<select id="county"
						name="county.id" data-options="required:true"
						class="easyui-validatebox span2" validType="selectValueRequired"
						style="width: 140px;">
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
					<td><input id="delegator" name="delegatorName"
						value="${cuser.name}" class="easyui-validatebox span2"
						style="width: 150px;" data-options="required:true"></input> <input
						type="hidden" name="delegatorId" value="${cuser.id}"></input></td>
					<th>开标时间 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input class="Wdate" type="text" name="registDT"
						id="registDT" style="width: 98%; height: 100%;"
						onfocus="showDate('yyyy-MM-dd')" /></td>
				</tr>
				<tr>
					<th>投标人姓名&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="bidder" type="text" id="bidder" validtype="NAME"
						style="width: 100%; height: 100%" class="easyui-validatebox span2"
						data-options="required:true" /></td>
					<th>联系方式 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="contract" style="width: 100%; height: 100%"
						data-options="required:true" type="text" id="contract"
						class="easyui-validatebox span2" /></td>
				</tr>
				<tr>
					<th>标书编制&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="bsbz" type="text" id="bsbz"
						style="width: 100%; height: 100%" class="easyui-validatebox span2"
						data-options="required:true" /></td>
					<th>预算编制 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="ysbz" style="width: 100%; height: 100%"
						data-options="required:true" type="text" id="ysbz"
						class="easyui-validatebox span2" /></td>
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
								<td><input name="head1" type="text" id="head1"
									style="width: 100%; height: 100%"
									class="easyui-validatebox span2" data-options="required:true"/></td>
								<td><input name="head2" type="text" id="head2"
									style="width: 100%; height: 100%"
									class="easyui-validatebox span2" data-options="required:true" /></td>
								<th>项目经理</th>
								<th>法人</th>
								<td><input name="head3" type="text" id="head3"
									style="width: 100%; height: 100%"
									class="easyui-validatebox span2" data-options="required:true"/></td>
								<td><input name="head4" type="text" id="head4"
									style="width: 100%; height: 100%"
									class="easyui-validatebox span2" data-options="required:true" /></td>
							</tr>
							<tr>
								<td><input name="bmFee" type="text"  id="bmFee"
									style="width: 100%; height: 100%" data-options="required:true"
									class="easyui-numberbox" precision="2" min="0" data-options="required:true" /></td>
								<td><input name="kbFee" type="text"  id="kbFee"
									style="width: 100%; height: 100%" data-options="required:true"
									class="easyui-numberbox" precision="2" min="0" data-options="required:true" /></td>
								<td><input name="head1Fee" type="text" 
									id="head1Fee" style="width: 100%; height: 100%"
									class="easyui-numberbox" precision="2" min="0" data-options="required:true" /></td>
								<td><input name="head2Fee" type="text" 
									id="head2Fee" style="width: 100%; height: 100%"
									class="easyui-numberbox" precision="2" min="0" data-options="required:true" /></td>
								<td><input name="zzFee" type="text"  id="zzFee"
									style="width: 100%; height: 100%" data-options="required:true"
									class="easyui-numberbox" precision="2" min="0" data-options="required:true" /></td>
								<td><input name="bsFee" type="text"  id="bsFee"
									style="width: 100%; height: 100%" data-options="required:true"
									class="easyui-numberbox" precision="2" min="0" data-options="required:true" /></td>
								<td><input name="ysFee" type="text"  id="ysFee"
									style="width: 100%; height: 100%" data-options="required:true"
									class="easyui-numberbox" precision="2" min="0" data-options="required:true" /></td>
								<td><input name="xmjlFee" type="text"  
									id="xmjlFee" style="width: 100%; height: 100%" 
									data-options="required:true"
									class="easyui-numberbox" precision="2" min="0" data-options="required:true" /></td>
								<td><input name="frFee" type="text"  id="frFee"
									style="width: 100%; height: 100%" data-options="required:true"
									class="easyui-numberbox" precision="2" min="0" data-options="required:true" /></td>
								<td><input name="head3Fee" type="text" 
									id="head3Fee" style="width: 100%; height: 100%" 
									class="easyui-numberbox" precision="2" min="0" data-options="required:true" /></td>
								<td><input name="head4Fee" type="text" 
									id="head4Fee" style="width: 100%; height: 100%"
									class="easyui-numberbox" precision="2" min="0" data-options="required:true" /></td>
								<td><input name="otherFee" type="text" 
									id="otherFee" style="width: 100%; height: 100%"
									class="easyui-numberbox" precision="2" min="0" data-options="required:true" /></td>
								<td><input name="totalFee" type="text"  id="totalFee"
									style="width: 100%; height: 100%" value="自动统计"
									readonly="readonly" disabled="disabled"
									class="easyui-numberbox" precision="2" min="0" data-options="required:true" /></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<th>备注&nbsp;</th>
					<td colspan="3"><textarea style="width: 100%" rows="3"
							name="remark"></textarea></td>
				</tr>
			</table>
		</form>
	</div>
</div>