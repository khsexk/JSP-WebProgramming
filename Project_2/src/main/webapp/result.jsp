<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="kpu.web.club.domain.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Web Service Programming Homework</title>
	<link rel="stylesheet" href="resources/student.css" type="text/css"></link>
</head>

<body>
	<header> 2021 KPU Web Service Programming Community </header>
	
	
	<p id=sect><%=request.getAttribute("greetings") %> <br>
	
	<div>
	
		<%
			StudentVO student = (StudentVO)request.getAttribute("student");
		%>
		<table>
		<tr> <td>계정</td> <td>이름</td> <td>학번</td> <td>학과</td> <td>핸드폰</td> <td>메일주소</td></tr>
			<tr> 
				<td><%=student.getId() %></td> 
				<td><%=student.getUsername() %></td> 
				<td><%=student.getSnum() %></td> 
				<td><%=student.getDepart() %></td> 
				<td><%=student.getMobile() %></td> 
				<td><%=student.getEmail() %></td>
			</tr>
		</table>
	</div>
	
	<p align="center">
		<a href="http://localhost:8080/hyunseok_mvcdb/StudentServlet?cmd=list" target="_self">전체 회원 목록 보기</a>
	</p>
</body>
</html>