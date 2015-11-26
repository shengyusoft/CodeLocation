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
				
				//自定义验证
				var option = $('#option').val();
				var bidDt = new Date($('#bidDt').val());
				var signDt = new Date($('#signDt').val());
				var duration = new Date($('#duration').val());
				var limitDate = new Date(bidDt.getFullYear(),bidDt.getMonth(),bidDt.getDate()+7);
				var limitDate2 = new Date(signDt.getFullYear(),signDt.getMonth(),signDt.getDate()+7);
				var limitDate3 = new Date(duration.getFullYear(),duration.getMonth(),duration.getDate()+7);
				var now = new Date();
				if(option == 0){//save
					debugger;
					//超过一周不能上传,只能申请上传
					var msg = '';
					if(now >= limitDate || now > limitDate2 || now > limitDate3){
						msg = '过期不能上传（注：员工必须在报名登记后一周之内上传登记信息，如需上传请申请总经理审批）';
					}else{
						if(isEmpty($('#bidDt').val())){
							msg = '中标时间不能为空';
						}else if(isEmpty($('#signDt').val())){
							msg = '合同签订时间不能为空';
						}else if(isEmpty($('#duration').val())){
							msg = '工期结束时间不能为空';
						}
					}
					
					if(!isEmpty(msg)){
						alert(msg);
						isValid = false;
					}
				}else{//apply
					if(now < limitDate && now < limitDate2 && now < limitDate3 ){
						alert('项目中标时间没有过期，请点击添加!');
						isValid = false;
					}else if(now >= limitDate){
						$('#bidDt').val('');
					}else if(now >= limitDate2){
						$('#signDt').val('');
					}else if(now >= limitDate3){
						$('#duration').val('');
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
		multiple:true,
		textField : 'text',
		panelHeight : '200'				
	});
	
	$('#projectMgr').combobox({
		url : "${pageContext.request.contextPath}/dictionary/combox?code=manager",
		parentField : 'dictionaryId',
		//multiple:true,
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
	
	$('#aqy').combobox({
		url : "${pageContext.request.contextPath}/certificate/comboxbytype?type=C",
		parentField : 'card_code',
		valueField : 'id',
		textField : 'card_name',
		panelHeight : '300'
	});
	
	$('#provice').combobox({
		url : "${pageContext.request.contextPath}/dictionary/xzqhCombox?pid=&&lvs="+2,
		parentField : 'pid',
		valueField : 'id',
		textField : 'text',
		panelHeight : 300,
		required:true,
		editable:false,//不可编辑，只能选择
		value:'--请选择--',
		onChange:function(provice){
	    	$('#city').combobox({
	    	url : "${pageContext.request.contextPath}/dictionary/xzqhCombox?pid="+provice+"&&lvs=3",
		    valueField:'id', //值字段
		    textField:'text', //显示的字段
		    panelHeight : 300,
		    required:true,
		    editable:false,//不可编辑，只能选择
		    value:'--请选择--',
		    onChange:function(city,n){
		    	$('#county').combobox({
			    	url : "${pageContext.request.contextPath}/dictionary/xzqhCombox?pid="+city+"&&lvs=4",
				    valueField:'id', //值字段
				    textField:'text', //显示的字段
				    panelHeight : 300,
				    required:true,
				    editable:false,//不可编辑，只能选择
				    value:'--请选择--'
				});
	 		}
	    });
	   }
	});
	
	$('#city').combobox({
    	//url : "${pageContext.request.contextPath}/dictionary/xzqhCombox",
	    valueField:'id', //值字段
	    textField:'text', //显示的字段
	    panelHeight : 300,
	    required:true,
	    editable:false,//不可编辑，只能选择
	    value:'--请选择--'
	});
	
	$('#county').combobox({
    	//url : "${pageContext.request.contextPath}/dictionary/xzqhCombox",
	    valueField:'id', //值字段
	    textField:'text', //显示的字段
	    panelHeight:'auto',
	    required:true,
	    editable:false,//不可编辑，只能选择
	    value:'--请选择--'
	});
	
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="projectBidAddForm" method="post" >
			<table class="grid">
				<tr>
					<th width="120px">公司名称 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
						
						
					<td>
						<input type="hidden" name="option" id="option" value="0"></input>
						<select id="company" name="company.id" class="easyui-validatebox span2" 
							data-options="editable:false,required:true" style="width: 180px;">
						</select>
					</td>
					
					<th width="120px">标段 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><select id="bd" name="bds"
						class="easyui-validatebox span2" style="width: 150px;"
						data-options="editable:false,required:true">
					</select></td>
				</tr>
				<tr>
					<th width="150px">项目名称 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="5"><input name="projectName" style="width: 100%;"
						type="text" id="projectName" class="easyui-validatebox span2"
						data-options="required:true" /></td>
				</tr>
				<tr>
					<th>地点 &nbsp;<label style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td colspan="5">
						省：<select id="provice" data-options="editable:false,required:true" name="provice.id" class="easyui-validatebox span2" style="width: 140px;">
					</select>
					 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						市：<select id="city" name="city.id" class="easyui-validatebox span2" style="width: 140px;">
					</select>
					 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
						县(区)：<select id="county" name="county.id" data-options="editable:false,required:true" 
						class="easyui-validatebox span2" validType="selectValueRequired" style="width: 140px;">
					</select>
					</td>
				</tr>
				<tr>
					<th>中标价（元）&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="bid_cost" style="width: 100%; height: 100%"
						type="text" id="bid_cost" class="easyui-numberbox" precision="2" min="0"
						data-options="required:true" /></td>
						
					<th>中标时间 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input class="Wdate" type="text" name="bidDt"
						id="bidDt" style="width: 98%; height: 100%;"
						onfocus="showDate('yyyy-MM-dd')" /></td>
						
					<th>合同签订时间 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input class="Wdate" type="text" name="signDt"
						id="signDt" style="width: 98%; height: 100%;"
						onfocus="showDate('yyyy-MM-dd')" /></td>
				</tr>
				<tr>
					<th width="140px">工期结束时间 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input class="Wdate" type="text" name="duration"
						id="duration" style="width: 98%; height: 100%;"
						onfocus="showDate('yyyy-MM-dd')" /></td>
						
					<th>管理费比例（%）&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="manageFeeRate"
						style="width: 100%; height: 100%" max="100" min="0"
						type="text" id="manageFeeRate" precision="2"
						class="easyui-numberbox" data-options="required:true" /></td>
						
					<th width="120px">管理费数额（元）&nbsp;</th>
					<td><input name="manageFee" style="width: 100%; height: 100%"
						type="text" id="manageFee" class="easyui-validatebox span2"
						disabled="disabled" /></td>
				</tr>
				<tr>
					<th>项目经理&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><select id="projectMgr" name="projectMgr.id"
						class="easyui-validatebox span2" style="width: 180px;"
						data-options="required:true">
					</select></td>
					<th>技术负责人&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><select id="techniqueMgr" name="techniqueMgr.id"
						class="easyui-validatebox span2" style="width: 180px;"
						data-options="required:true">
					</select></td>
					<th>专职安全员&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><select id="aqy" name="aqy.id"
						class="easyui-validatebox span2" style="width: 180px;"
						data-options="editable:false,required:true">
					</select></td>
				</tr>
				
				<tr>
					
					<th>施工负责人&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="headman" type="text" id="headman" validtype="NAME"
						style="width: 100%; height: 100%" class="easyui-validatebox span2"
						data-options="required:true" /></td>
					<th>联系方式 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="tel" style="width: 100%; height: 100%" data-options="required:true"
						type="text" id="tel" class="easyui-validatebox span2"/></td>
					<th >身份证号&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td ><input name="headmanIdCard" type="text" id="headmanIdCard"
						style="width: 100%; height: 100%" class="easyui-validatebox span2" value="${projectBid.headmanIdCard}"
						data-options="required:true" validtype="ID_CARD" /></td>
				</tr>
				<tr>
					<th>登记人&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="recordman" type="text" readonly id="recordman" value="${sessionInfo.name}"
						style="width: 100%; height: 100%" class="easyui-validatebox span2 disabled"
						data-options="required:true" /></td>
						
					<th>发包人&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="sender" type="text" id="sender"style="width: 100%; height: 100%" 
						class="easyui-validatebox span2" validtype="NAME" data-options="required:true" /></td>
				</tr>
				
				<tr>
					<th>备注&nbsp;</th>
					<td colspan="5"><textarea style="width: 100%" rows="6"
							name="remark"></textarea></td>
				</tr>
			</table>
		</form>
	</div>
</div>