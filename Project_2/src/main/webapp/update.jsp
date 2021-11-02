<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="kpu.web.club.domain.StudentVO"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Member Update</title>
</head>
<body>
	<div align="center">
		<header>Member Update</header>
		<HR>
		<form action="http://localhost:8080/hyunseok_mvcdb/StudentServlet?cmd=update" method="post"></form>
			<%
				StudentVO student = (StudentVO)request.getAttribute("student");
			%>
			<fieldset>
				<legend> Information Update </legend>
				<ul>
					<li>ID: <input type="text" name="id" value=<%=student.getId() %> readonly /></li>
				</ul>
			</fieldset>
	</div>
</body>
</html>