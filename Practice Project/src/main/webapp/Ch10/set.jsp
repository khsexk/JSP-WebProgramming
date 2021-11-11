<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Set</title>
</head>
<body>
	<div align="center">
		<h3>&lt;c:set&gt;</h3>
		
		<c:set value="Hello World" var="msg" />
		msg: ${msg} <br>
		msg: <%=pageContext.getAttribute("msg") %> <BR>
		
		<c:set target = "${member}" property="email" value="changed@test.net" />
		Member name: ${member.name} <br>
		Member email: ${member.email}
	</div>
</body>
</html>