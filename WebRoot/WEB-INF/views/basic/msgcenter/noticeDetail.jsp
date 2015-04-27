<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<jsp:include page="../../inc.jsp"></jsp:include>
<style type="text/css">
.bottom{text-align:left;width:98%;overflow:auto;line-height:20px; max-height:80px; bottom:0; left:0;right:0;font-size:15px; padding:6px; position:absolute;}
.attach{width:100%;max-height: 65px;overflow: auto;overflow-x:hidden;overflow-y:auto;}
div{ word-wrap: break-word; word-break: normal;}
.panel-body{background: #F0F5FB;}
</style>
<script type="text/javascript">
$(function() {
	showAttachments($('#attachmentIds').val());
});
</script>
<div data-options="fit:true,border:false" style="width:100%;height:100%;">
	<div data-options="region:'center',border:false" title="" style="overflow: hidden; padding: 0px;">
		<div id="content" style="width: 100%;height: 100%; overflow:auto;">
			<input type="hidden" name="attachmentIds"
						id="attachmentIds" value="${article.attachmentIds}"> 
			<h1 style="text-align:center;">
				<span style="line-height:1.5;color:#337FE5;font-family:KaiTi_GB2312;font-size: x-large;">${article.title}</span> 
			</h1>
			<p style="text-align:center;">
				<span style="font-family:'Microsoft YaHei';">
				发布时间【${article.createDT}】 &nbsp; &nbsp;
				发布单位:【${article.organizationName}】&nbsp; &nbsp;
				发布人【${article.createUserName}】&nbsp; &nbsp;
				浏览次数【${article.numberOfScan}】
				</span> 
			</p>
			<hr style="width: 80%;height: 1.5;vertical-align: middle;text-align: center;" />
			<div style="margin: 15px">
				${article.html}
			</div>
			
			<div class="bottom" >
			<div style="width: 100%;height: auto;">
				<hr style="border:1px dashed #000; height:1px;width: 45%; float: left">
				<span style="float: left;width: 8%;text-align: center;"><font size="15px" color="red">附件</font></span>
				<hr style="fit:true;border:1px dashed #000; height:1px;width: 45%; float: left">
			</div>
			<div id="downloadDiv" class="attach">
			</div>
		</div>
		</div>
		
	</div>
</div>