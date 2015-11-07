<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<script type="text/javascript"
	src="${ctx}/jslib/easyui1.3.3/plugins/datagrid-groupview.js"
	charset="utf-8"></script>
<script type="text/javascript">
	var dataGrid;
	$(function() {
		loadProcessHistories();
		//创建模板
		initProcessImg();
		
	});
	
	function initProcessImg(){
		var state = $('#processFlag').val();
		if(isEmpty(state)){
			return;
		}
		if(state <= 0){
			//申请
			$('#process')[0].style.left = '47px';
			$('#process')[0].style.top = '86px';
			$('#process')[0].style.height = '42px';
			$('#process')[0].style.width = '76px';
		}else if(state == 1){
			//会计
			$('#process')[0].style.left = '170px';
			$('#process')[0].style.top = '86px';
			$('#process')[0].style.height = '42px';
			$('#process')[0].style.width = '70px';
		}else if(state == 2){
			//总经理
			$('#process')[0].style.left = '399px';
			$('#process')[0].style.top = '86px';
			$('#process')[0].style.height = '42px';
			$('#process')[0].style.width = '84px';
		}else if(state == 3){
			//出纳
			$('#process')[0].style.left = '643px';
			$('#process')[0].style.top = '86px';
			$('#process')[0].style.height = '43px';
			$('#process')[0].style.width = '83px';
		}
	}

	function loadProcessHistories() {
		var processId = $('#processId').val();
		if (isEmpty(processId)) {
			processId = 0;
		}
		dataGrid = $('#dataGrid').datagrid({
			url : ctxPath + '/processHistory/dataGrid',
			striped : true,
			fitColumns : true,
			rownumbers : true,
			pagination : true,
			nowrap : false,
			idField : 'id',
			sortName : 'id',
			sortOrder : 'asc',
			pageSize : 5,
			pageList : [ 10, 15 ],
			queryParams : {
				'process.id' : processId
			},
			columns : [ [ {
				width : '100',
				title : '操作人',
				align : 'center',
				field : 'operatorName'
			}, {
				width : '140',
				title : '操作时间',
				align : 'center',
				field : 'operateDT'
			}, {
				width : '300',
				title : '操作详情',
				align : 'center',
				field : 'operateDetail'
			}, {
				width : '120',
				title : '审批意见',
				align : 'center',
				field : 'remark'
			} ] ],
			toolbar : '#toolbar'
		});
	}
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',fit:true,collapsed:false" style="overflow: hidden; border: none">
		<div title="流程图" style="position: relative; padding: 0px; margin: 0px; border-bottom: 1px">
			<img src="${ctx}/style/images/flow/flow_bx2.png" />
			<div id='process' style="position: absolute; border: 2px solid red;"></div>
		</div>
		<div style="color: green; size: 18px; font-size: 18px;">历史记录</div>
		<div data-options="fit:true,border:true" style="overflow: auto; height: 180px">
			<table id="dataGrid" data-options="fit:true,border:false">
				<tr>
					<td>
						<input type="hidden" name="processId" id="processId" value="${loanApprovalRegister.processId}"> 
						<input type="hidden" name="processFlag" id="processFlag" value="${loanApprovalRegister.processFlag}">
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>