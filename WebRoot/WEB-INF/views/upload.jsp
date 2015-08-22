<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="edge" />
<script type="text/javascript">
	$(function() {
		$('#fileAddForm').form({
			url : ctxPath + '/fileup/add',
			onSubmit : function() {
				progressLoad();
				var attachType = $('#attachmentType').val();
				$('#attachmentTypeCode').val(attachType);
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
					var path = ctxPath + "/fileup/download?id="
							+ result.obj.id;
					
					var ids = $('#attachmentIds').val();
					if (isEmpty(ids)) {
						ids = '';
						ids = result.obj.id;
					}else{
						ids += ','+result.obj.id;
					}
					
					$('#attachmentIds').val(ids);
					
					var href = "<div id='" + result.obj.id + "'>"
							+ "<a style=\"margin:5px;\" href=" + path+ "><u>"
							+ result.obj.uiName
							+ "</u></a><a href=\"#\" onClick=\"delAttach('"
							+ result.obj.id + "')\">删除</a></div>";
					$("#downloadDiv").append(href);
					parent.$.messager.alert('恭喜', result.msg,
							'success');
				} else {
					parent.$.messager.alert('错误', result.msg,
							'error');
				}
			}
		});
		
		initAttach();
	});

	function delAttach(id) {
		$.ajax({
			type : "post",
			url : ctxPath + "/fileup/delete",
			cache : false,
			data : {
				ids : id
			},
			dataType : "json",
			success : function(result) {
				parent.$.messager.alert('恭喜', result.msg, 'success');
				var ids = $('#attachmentIds').val();

				//更新表单中的隐藏域 attachmentIds的值
				if (ids.indexOf(id) > 0) {
					ids = ids.replace(',' + id, '');
				} else {
					//第一个元素
					ids = ids.replace(id + ',', '');
				}
				$('#attachmentIds').val(ids);
				var childNode = document.getElementById(id);
				$('#downloadDiv')[0].removeChild(childNode);
			},
			error : function(error) {
				alert(error);
			}

		});
	}

	function initAttach() {
		var ids = $('#attachmentIds').val();
		if (isEmpty(ids)) {
			return;
		}

		$.ajax({
			type : "post",
			url : ctxPath + "/fileup/findByIds",
			cache : false,
			data : {
				ids : ids
			},
			dataType : "json",
			success : function(result) {
				var attachs = result.obj;
				var ids = '';
				for ( var i = 0; i < attachs.length; i++) {
					var attach = attachs[i];
					var path = ctxPath + "/fileup/download?id=" + attach.id;
					var href = "<div id='" + attach.id + "'>"
							+ "<a style=\"margin:5px;\" href=" + path+ "><u>"
							+ attach.uiName
							+ "</u></a><a href=\"#\" onClick=\"delAttach('"
							+ attach.id + "')\">删除</a></div>";
					$("#downloadDiv").append(href);
					ids += attach.id + ',';
				}
			},
			error : function(error) {
				alert(error);
			}

		});
	}
</script>

<form id="fileAddForm" method="post" enctype="multipart/form-data"
	style="height: 200px;margin-top: 10px">
	<table class="grid">
		<tr>
			<th>上传文件</th>
			<td colspan="3">
				<input type="hidden" name="attachmentTypeCode" id="attachmentTypeCode" value="htgl"> 
				<input type='text'disabled="disabled" name='textfield' id='textfield' class='txt' />
				<input type='button' class='btn' onclick="document.getElementById('myfile').click()" value='浏览...' />
				<input type="file" name="myfile" class="file" id="myfile"style="display: none"
				onchange="document.getElementById('textfield').value=this.value" />
				<input type="submit" name="myfile" class="btn" value="上传" /></td>
		</tr>
		<tr>
			<th>附件列表</th>
			<td colspan="3">
				<div id="downloadDiv" style="min-height: 80px; vertical-align: middle;"></div>
			</td>
		</tr>
	</table>
</form>
