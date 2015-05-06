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
		$('#process')[0].style.left = '416px';
		$('#process')[0].style.top = '16px';
		$('#process')[0].style.height = '45px';
		$('#process')[0].style.width = '110px';
	});

	function loadProcessHistories() {
		var processId = $('#processId').val();
		if (isEmpty(processId)) {
			processId = 0;
		}
		dataGrid = $('#dataGrid').datagrid({
			url : ctxPath + '/processHistory/dataGrid',
			striped : true,
			rownumbers : true,
			nowrap : true,
			idField : 'id',
			sortName : 'id',
			sortOrder : 'asc',
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
	<div data-options="region:'center',fit:true,collapsed:false"
		style="overflow: hidden; width: 1000px; border: none">
		<div style="position: relative; padding: 0px; margin: 0px">
			<img src="${ctx}/style/images/flow/djpd-image.png" />
			<div id='process' style="position: absolute; border: 2px solid red;"></div>
		</div>
		<div style="color: green;size: 18px;font-size: 18px;">历史记录</div>
		<table id="dataGrid" data-options="fit:true,border:false">
			<tr>
				<td><input type="hidden" name="processId" id="processId"
					value="${reimbursement.process_vo.id}"></td>
			</tr>
		</table>
	</div>

</div>