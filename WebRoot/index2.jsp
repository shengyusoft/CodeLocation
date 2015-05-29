<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="imgPath" value="${ctx}/style/images" />
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/WEB-INF/views/inc.jsp"></jsp:include>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
$(function() {
	//创建模板
	$('#process').style.left = '416px';
	$('#process').style.top = '416px';
	$('#process').style.height = '416px';
	$('#process').style.width = '416px';
});
	
</script>
</head>

<body>
	<div style="position: relative; padding: 0px; margin: 0px">
		<img src="${ctx}/style/images/djpd-image.png" />
		
		<div id = 'process'
			style="position: absolute; border: 2px solid red;"></div>
<!-- 			style="position: absolute; left: 416px; top: 16px; height: 45px; width: 110px; border: 2px solid red;"></div> -->
	</div>

</body>
</html>
