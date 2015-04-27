<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		showAttachments($('#attachmentIds').val());
		
		var taskState = '${task.taskState}';
		var text = getTextByTaskState(taskState);
		$('#taskState').val(text);
		
		var documented = '${task.documented}';
		if(documented == 0){
			$('#documented').val('未存档');
		}else{
			$('#documented').val('存档');
		}
		
		
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="overflow-x: hidden; overflow-y: scroll;; padding: 3px;">

		<div class="easyui-accordion" style="width: auto; height: auto;">
			<div title="任务详情" data-options="iconCls:'icon-detail'"
				style="overflow: auto; padding: 10px;">
				<table class="grid">
					<tr>
						<th width="10%">任务名称</th>
						<td width="30%"><input name="name" value="${task.name}"
							style="width: 98%; height: 98%" type="text" id="name"
							class="easyui-validatebox span2" readonly="readonly" /> <input
							type="hidden" name="attachmentIds" id="attachmentIds"
							value="${task.attachmentIds}" /></td>

						<th width="10%">任务地点</th>
						<td width="30%"><input name="place" value="${task.place}"
							style="width: 98%; height: 98%" type="text" id="place"
							class="easyui-validatebox span2" readonly="readonly" /></td>
					</tr>
					<tr>
						<th>任务模块</th>
						<td><input name="taskModule" style="width: 98%; height: 98%"
							value="${task.taskModule}" type="text" id="taskModule"
							class="easyui-validatebox span2" readonly="readonly" /></td>

						<th>负责人</th>
						<td><input name="acceptUserId"
							style="width: 98%; height: 98%" value="${task.acceptUserName}"
							type="text" id="acceptUserId" class="easyui-validatebox span2"
							readonly="readonly" /></td>
					</tr>
					<tr>

						<th>任务执行日期</th>
						<td><input class="Wdate" type="text" name="excuteDT"
							value="${task.excuteDT}" id="excuteDT"
							style="width: 98%; height: 98%" readonly="readonly" /></td>

						<th>时间段</th>
						<td colspan="3"><input class="Wdate" type="text"
							value="${task.startTime}" name="startTime" id="startTime"
							style="width: 45%; height: 98%" readonly="readonly" /> -- <input
							class="Wdate" type="text" name="endTime" id="endTime"
							value="${task.endTime}" style="width: 45%; height: 98%"
							readonly="readonly" /></td>

					</tr>

					<tr>
						<th>维护类型</th>
						<td><input name="taskTypeId" style="width: 98%; height: 98%"
							value="${task.taskTypeName}" type="text" id="taskModule"
							class="easyui-validatebox span2" readonly="readonly" /></td>
						<th>重要等级&nbsp;<label
							style="color: red; vertical-align: middle; text-align: center;">*</label></th>
						<td><c:choose>
								<c:when test="${task.level == 1}">
									<c:set var="levelText" value="一般" />
								</c:when>
								<c:when test="${task.level == 2}">
									<c:set var="levelText" value="重要" />
								</c:when>
								<c:when test="${task.level == 3}">
									<c:set var="levelText" value="紧急" />
								</c:when>
								<c:otherwise>
									<c:set var="levelText" value="" />
								</c:otherwise>
							</c:choose> <input name="taskTypeId" style="width: 98%; height: 98%"
							value="${levelText}" type="text" id="taskTypeId"
							class="easyui-validatebox span2" readonly="readonly" /></td>
					</tr>
					<tr>
						<th>是否收费</th>
						<td><c:choose>
								<c:when test="${task.charge == 1}">
									<c:set var="chargeText" value="是" />
								</c:when>
								<c:otherwise>
									<c:set var="chargeText" value="否" />
								</c:otherwise>
							</c:choose> <input name="charge" style="width: 98%; height: 98%"
							value="${chargeText}" type="text" id="charge"
							class="easyui-validatebox span2" readonly="readonly" /></td>

						<th>收费金额</th>
						<td><input name="money" type="text" id="money"
							value="${task.money}" style="width: 98%; height: 98%"
							class="easyui-validatebox span2" readonly="readonly" /></td>
					</tr>
					<tr>
						<th>合同</th>
						<td><input name="contractId" style="width: 98%; height: 98%"
							value="${task.contractName}" type="text" id="contractId"
							class="easyui-validatebox span2" readonly="readonly" /></td>

						<th>联系业主</th>
						<td>姓名: <input name="contactUser" type="text"
							id="contactUser" style="width: 36%;"
							class="easyui-validatebox span2" readonly="readonly"
							value="${task.contactUser}" /> &nbsp;号码: <input
							name="contactPhone" value="${task.contactPhone}" type="text"
							id="contactPhone" style="width: 36%;"
							class="easyui-validatebox span2" readonly="readonly" />
						</td>
					</tr>
					<tr>
						<th>问题描述</th>
						<td colspan="3"><textarea style="width: 98%" rows="5"
								name="describle" readonly="readonly">${task.describle}</textarea></td>
					</tr>

					<tr>
						<th>维护任务</th>
						<td colspan="3"><textarea style="width: 98%" rows="5"
								readonly="readonly" name="taskdetail">${task.taskdetail}</textarea></td>
					</tr>
					<tr>
						<th>附件列表</th>
						<td colspan="3">
							<div id="downloadDiv"
								style="height: auto; vertical-align: middle; width: 100%"></div>
						</td>
					</tr>
				</table>
			</div>
			<div title="处理详情" data-options="iconCls:'icon-detail'"
				style="overflow: hidden; padding: 10px;">
				<form id="taskHandlerForm" method="post"
					style="width: 830px; height: auto;">
					<table class="grid">
						<tr>
							<th>处理过程</th>
							<td colspan="3"><textarea style="width: 98%" rows="5"
									readonly="readonly" name="handlerProcess">${task.handlerProcess}</textarea></td>
						</tr>

						<tr>
							<th>处理结果</th>
							<td colspan="3"><textarea style="width: 98%" rows="5"
									readonly="readonly" name="handlerResult">${task.handlerResult}</textarea></td>
						</tr>

						<tr>
							<th>备注 &nbsp;<label
								style="color: red; vertical-align: middle; text-align: center;">*</label></th>
							<td colspan="3"><textarea style="width: 98%" rows="5"
									readonly="readonly" name="remark">${task.remark}</textarea></td>
						</tr>
						<tr>
							<th>处理状态</th>
							<td><input name="taskState" style="width: 98%; height: 98%"
								type="text" id="taskState"
								class="easyui-validatebox span2" readonly="readonly" /></td>

							<th>是否存档 </th>
							<td>
							<input name="documented" style="width: 98%; height: 98%"
								type="text" id="documented"
								class="easyui-validatebox span2" readonly="readonly" />
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>

	</div>
</div>