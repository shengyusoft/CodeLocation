<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="edge" />
<script type="text/javascript">
	$(function() {
		initAttach();
	});
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
							+ "</u></a>";
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
	style="height: auto; margin-top: 10px">
	<table class="grid">
		<tr>
			<th>附件列表</th>
			<td colspan="3">
				<div id="downloadDiv" style="height: auto;min-height: 100px; vertical-align: middle;"></div>
			</td>
		</tr>
	</table>
</form>
