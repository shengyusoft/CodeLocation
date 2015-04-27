<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(function() {
		var ids = '${attachmentIds}';
		showAttachments(ids);
	});
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false" title=""
		style="padding: 3px; overflow: auto;">
		<table class="grid" title="附件列表">
			<tr>
				<td>
					<div id="downloadDiv" style="height: 160px;width:auto; vertical-align: middle;"></div>
				</td>
			</tr>
		</table>
		
	</div>
</div>