<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!-- html编辑器,fix bug,第二次进入编辑器时,必须全屏然后才可以获取焦点 -->
<script type="text/javascript">
	$(function(){
		var editor = null;
		initKingEditor(editor);
		$('#noticeEditForm').form({
			url : ctxPath + '/notice/edit',
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
					// 之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
					parent.$.modalDialog.openner_dataGrid.datagrid('reload');
					parent.$.modalDialog.handler.dialog('close');
				} else {
					parent.$.messager.alert('错误', result.msg, 'error');
				}
			}
		});
		updataState();
	});
	
	
	function updataState(){
		var zd = '${article.zd}';
		var publish = '${article.publish}';
		
		if(zd == 'true'){
			$('#zd')[0].checked = true;
		}else{
			$('#zd')[0].checked = false;
		}
		
		if(publish == 'true'){
			$('#publish')[0].checked = true;
		}else{
			$('#publish')[0].checked = false;
		}
		var level = '${article.level}';
		$('#level').val(level);
	}
</script>
<div class="easyui-layout" data-options="fit:true,border:false" >
	<div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
		<form id="noticeEditForm" method="post">
			<table class="grid">
				<tr>
					<td colspan="2" width="100%">
					<input type="hidden" name="id" value="${article.id}"/>
					<input type="hidden" name="createUserID" value="${article.createUserID}"/>
					<input type="hidden" name="dictionaryId" value="${article.dictionaryId}"/>
					<input type="hidden" name="publishDT" value="<fmt:formatDate value="${article.publishDT}" pattern="yyyy-MM-dd"/>"/>
					<input type="hidden" name="createDT" value="<fmt:formatDate value="${article.createDT}" pattern="yyyy-MM-dd"/>"/>
					<input type="hidden" name="attachmentIds" id="attachmentIds" value="${article.attachmentIds}">
					<label style="vertical-align: middle; text-align: center;">标题</label>
						<input name="title" type="text" style="width: 90%;margin-left: 16px; " id="code"
						value="${article.title}"
						class="easyui-validatebox span2" data-options="required:true" /></td>
				</tr>
				<tr>
					<td>
						<label> 
							<input type="checkbox" name="zd" id="zd" value="1" /> 置顶
						</label> 
						<label> 
							<input type="checkbox" name="publish" id="publish" value="1" />发布
						</label>
					</td>
					<td width="217">
						<label style="margin-right: 15px"> 
						 重要等级
						</label> 
						<select id="level" name="level"
							class="easyui-combobox" style="width: 100px;" panelHeight="auto">
								<option value="1">一般</option>
								<option value="2">重要</option>
								<option value="3">紧急</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea rows="20" name="html" id ="html" style="width: 100%">${article.html}</textarea>
						<input type="hidden" name="attachmentId" id="attachmentId" />
					</td>
				</tr>
			</table>
		</form>
		<input type="hidden" id="attachmentType" value="tzgg">
		<jsp:include page="../../upload.jsp"></jsp:include>
	</div>
</div>