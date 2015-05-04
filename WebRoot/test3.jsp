<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<script type="text/javascript" src="${ctx}/jslib/jquery-1.7.2.js"></script>
<script type="text/javascript" src="${ctx}/jslib/checkLogin.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>test chart</title>
<script type="text/javascript">
$(function() {
	//创建模板
	$('#process')[0].style.left = '416px';
	$('#process')[0].style.top = '16px';
	$('#process')[0].style.height = '45px';
	$('#process')[0].style.width = '110px';
});
	
</script>
</head>
<body>
	<div style="position: relative; padding: 0px; margin: 0px">
		<img src="${ctx}/style/images/flow/djpd-image.png" />
		<div id = 'process'
			style="position: absolute; border: 2px solid red;"></div>
<!-- 			style="position: absolute; left: 416px; top: 16px; height: 45px; width: 110px; border: 2px solid red;"></div> -->
	</div>
</body>

</html>