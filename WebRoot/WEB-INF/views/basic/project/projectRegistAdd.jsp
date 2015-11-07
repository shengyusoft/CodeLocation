<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style type="text/css">
.innerGrid{
  border-bottom: none;
  border-top: none;
  width: 100%;
  padding: 0px;
  margin: 0px;
}
.innerGrid th{
	border : none;
}

.innerGrid td{
  border-bottom: none;
  border-top: none;
}
</style>
<script type="text/javascript">
	$(function() {
		$('#projectRegistAddForm').form({
			url : '${pageContext.request.contextPath}/projectRegist/add',
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
		required : true,
		panelHeight : 'auto'
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
		panelHeight : '300'
	});
	

	$('#certificateB').combobox({
		url : "${pageContext.request.contextPath}/certificate/comboxbytype?type=B",
		parentField : 'card_code',
		valueField : 'id',
		textField : 'card_name',
		panelHeight : '300'
	});

	$('#certificateC').combobox(
	{
		url : "${pageContext.request.contextPath}/certificate/comboxbytype?type=C",
		parentField : 'card_code',
		valueField : 'id',
		textField : 'card_name',
		panelHeight : '200'
	});

	$('#member5Cards').combobox({
		url : "${pageContext.request.contextPath}/certificate/comboxbytype?type=D",
		parentField : 'card_code',
		valueField : 'id',
		multiple : true,
		textField : 'card_name',
		panelHeight : '200'
	});
						

	$('#qualifyRequirement').combobox({
		url : "${pageContext.request.contextPath}/dictionary/combox?code=zzyq",
		parentField : 'dictionaryId',
		valueField : 'id',
		multiple : true,
		textField : 'text',
		panelHeight : 'auto'
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
				panelHeight : 'auto',
				required : true,
				editable : false,//不可编辑，只能选择
				value : '--请选择--',
				onChange : function(city, n) {
					$('#county').combobox({
						url : "${pageContext.request.contextPath}/dictionary/xzqhCombox?pid="+ city+ "&&lvs=4",
						valueField : 'id', //值字段
						textField : 'text', //显示的字段
						panelHeight : 'auto',
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
		panelHeight : 'auto',
		required : true,
		editable : false,//不可编辑，只能选择
		value : '--请选择--'
	});

	$('#county').combobox({
		valueField : 'id', //值字段
		textField : 'text', //显示的字段
		panelHeight : 'auto',
		required : true,
		editable : false,//不可编辑，只能选择
		value : '--请选择--'
	});
	
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="projectRegistAddForm" method="post">
			<table class="grid">
				<tr>
					<td colspan="4" style="padding: 0px;">
						<table cellspacing="0" cellpadding="0" class="innerGrid">
							<tr>
								<th width="91px">公司名称 &nbsp;<label
									style="color: red; vertical-align: middle; text-align: center;">*</label></th>
								<td width="155px"><input type="hidden" name="type" id="type" value="0"></input>
									<select id="company" name="company.id"
									data-options="required:true" class="easyui-validatebox span2"
									style="width: 150px;">
								</select></td>
								<th width="100px">项目名称 &nbsp;<label
									style="color: red; vertical-align: middle; text-align: center;">*</label></th>
								<td><input name="projectName" style="width: 100%;"
									type="text" id="projectName" class="easyui-validatebox span2"
									data-options="required:true" /></td>
							</tr>
						</table>
					</td>
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
					<td><select id="qualifyRequirement" name="qualifyRequirement"
						class="easyui-validatebox span2" style="width: 350px;"
						data-options="editable:false,required:true"></select></td>
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
					<td colspan="3">A证:&nbsp;<select id="certificateA"
						name="certificateA.id" class="easyui-validatebox span2"
						style="width: 150px;" data-options="editable:false,required:true">
					</select>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;B证:&nbsp;<select
						id="certificateB" name="certificateB.id"
						class="easyui-validatebox span2" style="width: 150px;"
						data-options="editable:false,required:true">
					</select>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;C证:&nbsp;<select
						id="certificateC" name="certificateC.id"
						class="easyui-validatebox span2" style="width: 150px;"
						data-options="editable:false,required:true">
					</select></td>
				</tr>
				<tr>
					<td colspan="4">五大员证 :&nbsp;<select id="member5Cards"
						name="member5Cards" class="easyui-validatebox span2"
						style="width: 550px;" data-options="editable:false,required:true">
					</select></td>
				</tr>
				<tr>
					<th>委托人&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input id="delegator" name="delegatorName"
						value="${cuser.name}" class="easyui-validatebox span2"
						style="width: 150px;" data-options="required:true"></input> <input
						type="hidden" name="delegatorId" value="${cuser.id}"></input></td>
					<th>报名时间 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input class="Wdate" type="text" name="registDT"
						id="registDT" style="width: 98%; height: 100%;"
						data-options="required:true" onfocus="showDate('yyyy-MM-dd')" /></td>
				</tr>
				<tr>
					<th>投标人姓名&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="bidder" type="text" id="bidder"
						style="width: 100%; height: 100%" class="easyui-validatebox span2"
						data-options="required:true" /></td>
					<th>联系方式 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="contract" style="width: 100%; height: 100%"
						data-options="required:true" type="text" id="contract"
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
									class="easyui-validatebox span2" /></td>
								<td><input name="head2" type="text" id="head2"
									style="width: 100%; height: 100%"
									class="easyui-validatebox span2" /></td>

								<th>项目经理</th>
								<th>法人</th>
								<td><input name="head3" type="text" id="head3"
									style="width: 100%; height: 100%"
									class="easyui-validatebox span2" /></td>
								<td><input name="head4" type="text" id="head4"
									style="width: 100%; height: 100%"
									class="easyui-validatebox span2" /></td>
							</tr>
							<tr>
								<td><input name="bmFee" type="text" value='0' id="bmFee"
									style="width: 100%; height: 100%" class="easyui-numberbox"
									precision="2" min="0" /></td>
								<td><input name="kbFee" type="text" value='0' id="kbFee"
									style="width: 100%; height: 100%" class="easyui-numberbox"
									precision="2" min="0" /></td>
								<td><input name="head1Fee" type="text" value='0'
									id="head1Fee" style="width: 100%; height: 100%"
									class="easyui-numberbox" precision="2" min="0" /></td>
								<td><input name="head2Fee" type="text" value='0'
									id="head2Fee" style="width: 100%; height: 100%"
									class="easyui-numberbox" precision="2" min="0" /></td>
								<td><input name="zzFee" type="text" value='0' id="zzFee"
									style="width: 100%; height: 100%" class="easyui-numberbox"
									precision="2" min="0" /></td>
								<td><input name="bsFee" type="text" value='0' id="bsFee"
									style="width: 100%; height: 100%" class="easyui-numberbox"
									precision="2" min="0" /></td>
								<td><input name="ysFee" type="text" value='0' id="ysFee"
									style="width: 100%; height: 100%" class="easyui-numberbox"
									precision="2" min="0" /></td>
								<td><input name="xmjlFee" type="text" value='0'
									id="xmjlFee" style="width: 100%; height: 100%"
									class="easyui-numberbox" precision="2" min="0" /></td>
								<td><input name="frFee" type="text" value='0' id="frFee"
									style="width: 100%; height: 100%" class="easyui-numberbox"
									precision="2" min="0" /></td>
								<td><input name="head3Fee" type="text" value='0'
									id="head3Fee" style="width: 100%; height: 100%"
									class="easyui-numberbox" precision="2" min="0" /></td>
								<td><input name="head4Fee" type="text" value='0'
									id="head4Fee" style="width: 100%; height: 100%"
									class="easyui-numberbox" precision="2" min="0" /></td>
								<td><input name="otherFee" type="text" value='0'
									id="otherFee" style="width: 100%; height: 100%"
									class="easyui-numberbox" precision="2" min="0" /></td>
								<td><input name="totalFee" type="text" value='0'
									id="totalFee" style="width: 100%; height: 100%" value="自动统计"
									readonly="readonly" disabled="disabled"
									class="easyui-numberbox" precision="2" min="0" /></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<th>备注&nbsp;</th>
					<td colspan="3"><textarea style="width: 100%" rows="4"
							name="remark"></textarea></td>
				</tr>
			</table>
		</form>
	</div>
</div>