<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> include action</title>
</head>
<body>
	<h2>include_action.jsp에서 footer.jsp를 include</h2>
	<hr>
	include_action.jsp에서 호출한 메시지입니다<br>
	
	<jsp:include page="footer.jsp">
	<jsp:param value="tesk@kpu.net" name="email"/>
	<jsp:param value="000-7777-0000" name="tel"/>
	</jsp:include>
</body>
</html>