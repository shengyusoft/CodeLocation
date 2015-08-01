<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script type="text/javascript"
	src="${ctx}/jslib/easyui1.3.3/plugins/datagrid-statistics.js"
	charset="utf-8"></script>
<script type="text/javascript">
	var dataGrid;
	$(function() {
		$('#projectAppropriateRegViewForm').form({
			url : '${pageContext.request.contextPath}/projectAppropriateReg/save?viewType=${viewType}',
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
					//$("#paregBtn").linkbutton("disable");
					if(result.obj){
						$('#projectAppRegId').val(result.obj.id);
					}
					//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
					parent.$.modalDialog.openner_dataGrid.datagrid('reload');
					//parent.$.modalDialog.handler.dialog('close');
				} else {
					parent.$.messager.alert('错误', result.msg, 'error');
				}
			}
		});
		
		var projectAppRegId = '';
		console.log('${viewType}');
		if('add' == '${viewType}'){
			projectAppRegId = isEmpty($('#projectAppRegId').val())?0:$('#projectAppRegId').val();
		}else{
			projectAppRegId = '${projectAppropriateReg.id}';
		}
		
		dataGrid = $('#dataGrid').datagrid({
			url : '${ctx}' + '/projectAppropriateAccount/dataGrid',
			queryParams:{
            	projectAppRegId : projectAppRegId
            },
			striped : true,
			pagination : true,
			showFooter : true,
			nowrap : true,
			queryParams:{
            	projectAppRegId : isEmpty(projectAppRegId)?0:projectAppRegId
            },
			idField : 'id',
			sortName : 'id',
			sortOrder : 'asc',
			pageSize : 10,
			pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
			columns : [ [ {
				checkbox : true,
				rowspan : 2,
				field : 'id',
				width : '30',
			}, {
				title : '序号',
				field : 'index',
				align : 'center',
				width : '40',
				rowspan:2,
				formatter : function(val, row, index) {
					if(isEmpty(val)){
						return index + 1;
					}else{
						return val;
					}
				}
			}, {
				title : '<font color="red">以下内容工程部经理填写（单位：元）</font>',
				colspan : 6,
				align : 'center'
			}, {
				title : '<font color="blue">以下内容财务部会计填写（单位：元）</font>',
				colspan : 3,
				align : 'center'
			}, {
				title : '<font color="green">以下内容财务部出纳填写（单位：元）</font>',
				colspan : 3,
				align : 'center'
			}, {
				width : '90',
				rowspan : 2,
				title : '状态',
				align : 'center',
				field : 'state',
				formatter : function(value, row, index) {
					if(value == 0){
						return '<font color="red">未提交</font>';
					}else if(value == 1){
						return '<font color="green">已提交</font>';
					}else if(value == 2){
						return '<font color="green">会计已确认</font>';
					}else if(value == 3){
						return '<font color="green">出纳已确认</font>';
					}else{
						return '';
					}
				}
			} ] , [ {
				width : 150,
				title : '业主本次拨付金额',
				align : 'center',
				field : 'toAccountFee',
				sum : true
			}, {
				width : '120',
				title : '本次计划支付金额',
				sortable : true,
				align : 'center',
				field : 'applyFee'
			}, {
				width : '90',
				title : '收款人',
				rowspan : 2,
				align : 'center',
				field : 'payee'
			}, {
				width : '90',
				title : '开户行',
				rowspan : 2,
				align : 'center',
				field : 'bank'
			}, {
				width : '90',
				title : '帐号',
				rowspan : 2,
				align : 'center',
				field : 'accountNum'
			},{
				width : '90',
				title : '工程部备注',
				align : 'center',
				field : 'remark1'
			}, {
				width : '120',
				title : '实际到帐金额',
				sortable : true,
				align : 'center',
				field : 'actualFee',
				sum : true
			}, {
				width : '90',
				title : '实际到帐时间',
				align : 'center',
				field : 'actualDT',
				formatter:Common.formatter
			}, {
				width : '90',
				title : '会计备注',
				align : 'center',
				field : 'remark2'
			}, {
				width : 150,
				title : '本次实际支付金额',
				sortable : true,
				align : 'center',
				field : 'actualPayFee',
				sum : true
			}, {
				width : '90',
				title : '转出时间',
				align : 'center',
				field : 'toAccountDT',
				formatter:Common.formatter
			}, {
				width : '90',
				title : '出纳备注',
				align : 'center',
				field : 'remark3'
			} ] ],
			onLoadSuccess:function(){ 
	            $('#dataGrid').datagrid('statistics');
	        },
			toolbar : '#toolbar'
		});
	});
	//统一处理 add,edit,detail,handler
	function viewFun(viewType) {
		var me = this;
		var title = '', href = '${ctx}/projectAppropriateAccount/viewPage?viewType='+ viewType;
		var buttons = [];
		if ('add' == viewType) {
			var pid = $('#projectAppRegId').val();
			if(isEmpty(pid)){
				parent.$.messager.alert('警告', '请先进行工程款拨付登记!');
				return;
			}
			title = '工程款到帐及拨付登记';
			buttons = [ {
				text : '保存',
				handler : function(){
					parent.$.modalDialogTwo.openner_dataGrid = dataGrid;
					var f = parent.$.modalDialogTwo.handler.find('#projectAppropriateAccountViewForm');
					var projectAppRegId = parent.$.modalDialogTwo.handler.find('#projectAppRegId');
					debugger;
					if(projectAppRegId){
						projectAppRegId.val(pid);
					}
					f.submit();
				}
			},{
				text : '提交',
				handler : function() {
					parent.$.messager.confirm('提醒','提交后不能修改,确认提交？',function(b) {
						if (b) {
							parent.$.modalDialogTwo.openner_dataGrid = dataGrid;
							parent.$.modalDialogTwo.handler.find('#option').val(1);//提交
							var f = parent.$.modalDialogTwo.handler.find('#projectAppropriateAccountViewForm');
							var projectAppRegId = parent.$.modalDialogTwo.handler.find('#projectAppRegId');
							if(projectAppRegId){
								projectAppRegId.val(pid);
							}
							f.submit();
						}else{
							return;
						}
					});
				}
			}, {
				text : '退出',
				handler : me.closeDialog
			} ];
		} else {
			var rows = dataGrid.datagrid('getSelections');
			if (rows == null || rows.length == 0) {
				parent.$.messager.alert('警告', '没有可操作对象!');
				return;
			}

			if (rows.length > 1) {
				parent.$.messager.alert('警告', '只能操作一条记录!');
				return;
			}

			var id = rows[0].id;
			var state = rows[0].state;
			href += '&id=' + id;
			//编辑
			if ('edit' == viewType) {
				if (state == 1) {
					parent.$.messager.alert('警告', '工程部已提交不可修改!');
					return;
				}
				if (state == 2) {
					parent.$.messager.alert('警告', '会计已提交不可修改!');
					return;
				}
				if (state == 3) {
					parent.$.messager.alert('警告', '出纳已提交不可修改!');
					return;
				}
				title = '工程款到帐及拨付修改';
				buttons = [ {
					text : '编辑',
					handler : me.submitForm
				},{
					text : '提交',
					handler : function() {
						parent.$.messager.confirm('提醒','提交后不能修改,确认提交？',function(b) {
							if (b) {
								parent.$.modalDialogTwo.handler.find('#option').val(1);//提交
								me.submitForm();
							}else{
								return;
							}
						});
					}
				}, {
					text : '退出',
					handler : me.closeDialog
				} ];
			} else if ('detail' == viewType) {
				title = '工程款到帐及拨付详情';
				buttons = [ {
					text : '退出',
					handler : function() {
						me.closeDialog();
					}
				} ];
			} else if ('handler_kj' == viewType) {
				if (state == 0) {
					parent.$.messager.alert('警告', '申请人尚未提交,不可办理!');
					return;
				}
				if (state == 2) {
					parent.$.messager.alert('警告', '已经办理不可重复办理!');
					return;
				}
				if (state == 3) {
					parent.$.messager.alert('警告', '出纳已提交，不可办理!');
					return;
				}
				title = '工程款到帐及拨付->会计确认';
				buttons = [
					{
						text : '提交',
						handler : function() {
							parent.$.messager.confirm('提醒','提交后不能修改,确认提交？',function(b) {
								if (b) {
									me.submitForm();
								} else {
									return;
								}		
							});
						}
					}, {
						text : '退出',
						handler : closeDialog
					} 
				];
			}else if ('handler_cn' == viewType) {
				if (state == 0) {
					parent.$.messager.alert('警告', '申请人尚未提交,不可办理!');
					return;
				}
				if (state == 1) {
					parent.$.messager.alert('警告', '等待会计办理!');
					return;
				}
				if (state == 3) {
					parent.$.messager.alert('警告', '已经办理，不可重复办理!');
					return;
				}
				title = '工程款到帐及拨付->出纳确认';
				buttons = [
						{
							text : '提交',
							handler : function() {
								parent.$.messager.confirm('提醒','提交后不能修改,确认提交？',function(b) {
									if (b) {
										me.submitForm();
									}else{
										return;
									}
								});
							}
						}, {
							text : '退出',
							handler : closeDialog
						} ];
			} 

		}

		parent.$.modalDialogTwo({
			title : title,
			width : 850,
			height : 450,
			resizable : true,
			href : href,
			buttons : buttons
		});
	}

	//提交form
	function submitForm() {
		//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
		parent.$.modalDialogTwo.openner_dataGrid = dataGrid;
		var f = parent.$.modalDialogTwo.handler.find('#projectAppropriateAccountViewForm');
		f.submit();
	}

	//关闭窗口
	function closeDialog() {
		parent.$.modalDialogTwo.handler.dialog('close');
	}
	
	function deleteFun() {
		var selected = parent.getSelecteds(dataGrid);
		if (isEmpty(selected)) {
			parent.$.messager.alert('警告', '至少选中一条记录!');
			return;
		}
		var rows = dataGrid.datagrid('getSelections');
		for(var i=0;i<rows.length;i++){
			var state = rows[i].state;
			if(state >= 1){
				parent.$.messager.alert('警告', '存在已经确认或者提交的记录，不能删除!');
				return;
			}
		}
		
		parent.$.messager.confirm('询问', '确认删除选中的记录吗？', function(b) {
			if (b) {
				progressLoad();
				$.post('${ctx}/projectAppropriateAccount/delete', {
					ids : selected
				}, function(result) {
					if (result.success) {
						parent.$.messager.alert('提示', result.msg, 'info');
						//删除成功后,前台删除行,防止下次再删除的时候可以取到之前选到的行
						removeSelectedRow(dataGrid);
						dataGrid.datagrid('reload');
					} else {
						parent.$.messager.alert('警告', result.msg, 'warning');
					}
					progressClose();
				}, 'JSON');
			}
		});
	}
</script>
<div class="easyui-layout" data-options="fit:true,border:false"
	style="overflow: hidden;">
	<div data-options="border:false" title=""
		style="overflow: hidden; padding: 3px;">
		<form id="projectAppropriateRegViewForm" method="post">
			<table class="grid">
				<tr>
					<th>项目名称 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input id="projectAppRegId" type="hidden"
						value="${projectAppropriateReg.id}"></input> <input type="hidden"
						name="id" id="id" value="${projectAppropriateReg.id}" /> <input
						name="projectName" style="width: 100%; height: 100%" type="text"
						id="projectName" class="easyui-validatebox span2"
						data-options="required:true"
						value="${projectAppropriateReg.projectName}" /></td>
					<th>中标价（元） &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="bidPrice" style="width: 100%; height: 100%"
						type="number" id="bidPrice" class="easyui-validatebox span2"
						data-options="required:true"
						value="${projectAppropriateReg.bidPrice}" /></td>
					<th>中标日期 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input class="Wdate" type="text" name="bidDT" id="bidDT"
						style="width: 98%; height: 100%;"
						value="${projectAppropriateReg.bidDT}"
						data-options="required:true" onfocus="showDate('yyyy-MM-dd')" /></td>
				</tr>
				<tr>
					<th>合同工期（天） &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="contractDuration"
						style="width: 100%; height: 100%" type="number"
						id="contractDuration" class="easyui-validatebox span2"
						data-options="required:true"
						value="${projectAppropriateReg.contractDuration}" /></td>
					<th>管理费比例（%）&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="managerFeeRate"
						style="width: 90%; height: 100%" max="100" min="0" type="text"
						id="managerFeeRate" precision="2"
						value="${projectAppropriateReg.managerFeeRate}"
						class="easyui-numberbox" data-options="required:true" /></td>
					<th>管理费数额（元）&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="managerFee" style="width: 100%; height: 100%"
						type="number" id="managerFee" class="easyui-validatebox span2"
						readonly="readonly" disabled="disabled" precision="2"
						value="${projectAppropriateReg.managerFee}" /></td>
				</tr>
				<tr>
					<td colspan="6">收款人信息</td>
				</tr>
				<tr>
					<th>户名 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="payee" style="width: 100%; height: 100%"
						type="text" id="payee" class="easyui-validatebox span2"
						data-options="required:true"
						value="${projectAppropriateReg.payee}" /></td>
					<th>开户行&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="bank" style="width: 100%; height: 100%"
						type="text" id="bank" class="easyui-validatebox span2"
						data-options="required:true" value="${projectAppropriateReg.bank}" /></td>
					<th>帐号&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="accountNum" style="width: 100%; height: 100%"
						type="text" id="accountNum" class="easyui-validatebox span2"
						data-options="required:true"
						value="${projectAppropriateReg.accountNum}" /></td>
				</tr>
				<tr>
					<td colspan="6">联系人信息</td>
				</tr>
				<tr>
					<th>姓名 &nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="contactName"
						style="width: 100%; height: 100%" type="text" id="contactName"
						class="easyui-validatebox span2" data-options="required:true"
						value="${projectAppropriateReg.contactName}" /></td>
					<th>电话&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="contactTel" style="width: 100%; height: 100%"
						type="text" id="contactTel" class="easyui-validatebox span2"
						data-options="required:true"
						value="${projectAppropriateReg.contactTel}" /></td>
					<th>身份证号&nbsp;<label
						style="color: red; vertical-align: middle; text-align: center;">*</label></th>
					<td><input name="contactIdCard"
						style="width: 100%; height: 100%" type="text" id="contactIdCard"
						class="easyui-validatebox span2" data-options="required:true"
						value="${projectAppropriateReg.contactIdCard}" /></td>
				</tr>
				<tr>
					<th>备注&nbsp;</th>
					<td colspan="5"><textarea style="width: 100%" rows="3"
							name="remark">${projectAppropriateReg.remark}</textarea></td>
				</tr>
			</table>
		</form>
	</div>
	<span style="font-size: 14px; color: blue">工程款到帐及拨付情况表</span>
	<div data-options="fit:true,border:false"
		style="overflow: auto; height: 250px">
		<table id="dataGrid" data-options="fit:true,border:false"></table>
	</div>

	<div id="toolbar" class="mygrid-toolbar" style="inline: true">
		<c:if test="${viewType != 'detail'}">
			<c:choose>
				<c:when
					test="${fn:contains(sessionInfo.resourceList, '/projectAppropriateAccount/add')}">
					<a onclick="viewFun('add');" href="javascript:void(0);"
						class="easyui-linkbutton"
						data-options="plain:true,iconCls:'icon_toolbar_add'">添加 </a>
				</c:when>
				<c:otherwise>
					<a href="javascript:void(0);" class="easyui-linkbutton"
						data-options="plain:true,iconCls:'icon_toolbar_add_disabled'"><font
						color="gray">添加</font> </a>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when
					test="${fn:contains(sessionInfo.resourceList, '/projectAppropriateAccount/edit')}">
					<a onclick="viewFun('edit');" href="javascript:void(0);"
						class="easyui-linkbutton"
						data-options="plain:true,iconCls:'icon_toolbar_edit'">编辑</a>
				</c:when>
				<c:otherwise>
					<a href="javascript:void(0);" class="easyui-linkbutton"
						data-options="plain:true,iconCls:'icon_toolbar_edit_disabled'"><font
						color="gray">编辑</font> </a>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when
					test="${fn:contains(sessionInfo.resourceList, '/projectAppropriateAccount/delete')}">
					<a onclick="deleteFun();" href="javascript:void(0);"
						class="easyui-linkbutton"
						data-options="plain:true,iconCls:'icon_toolbar_del'">删除 </a>
				</c:when>
				<c:otherwise>
					<a href="javascript:void(0);" class="easyui-linkbutton"
						data-options="plain:true,iconCls:'icon_toolbar_del_disabled'"><font
						color="gray">删除</font> </a>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when
					test="${fn:contains(sessionInfo.resourceList, '/projectAppropriateAccount/detail')}">
					<a onclick="viewFun('detail');" href="javascript:void(0);"
						class="easyui-linkbutton"
						data-options="plain:true,iconCls:'icon_toolbar_detail'">详情 </a>
				</c:when>
				<c:otherwise>
					<a href="javascript:void(0);" class="easyui-linkbutton"
						data-options="plain:true,iconCls:'icon_toolbar_detail_disabled'"><font
						color="gray">详情</font> </a>
				</c:otherwise>
			</c:choose>

			<c:if
				test="${fn:contains(sessionInfo.resourceList, '/projectAppropriateAccount/handler_kj')}">
				<a onclick="viewFun('handler_kj');" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_detail'">会计确认 </a>
			</c:if>

			<c:if
				test="${fn:contains(sessionInfo.resourceList, '/projectAppropriateAccount/handler_cn')}">
				<a onclick="viewFun('handler_cn');" href="javascript:void(0);"
					class="easyui-linkbutton"
					data-options="plain:true,iconCls:'icon_toolbar_detail'">出纳确认 </a>
			</c:if>
		</c:if>
	</div>
</div>