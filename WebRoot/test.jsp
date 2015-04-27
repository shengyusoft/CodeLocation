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
</head>
<body>
	<div class="loginMain">
		<img src="${ctx}/chart/showChart"
			style="float: left; margin-top: 6px; margin-left: 5px;" />
	</div>
</body>

</html>