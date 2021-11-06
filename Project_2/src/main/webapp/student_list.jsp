<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="kpu.web.club.domain.*, java.util.List"%>
<!DOCTYPE html>
<jsp:useBean id="StudentList" class="kpu.web.club.persistence.StudentDAO"/>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="resources/student.css" type="text/css"></link>
	<title> Student List </title>
</head>
<body>
	<header>Member List</header>
	<p align="center">
		<a href="http://localhost:8080/hyunseok_mvcdb/welcome.html" target="_self">메인 페이지 이동</a>
	</p>
	<table>
		<tr> <td>계정</td> <td>이름</td> <td>학번</td> <td>학과</td> <td>핸드폰</td> <td>메일주소</td></tr>
		<%
			List<StudentVO> studentList = (List<StudentVO>)request.getAttribute("studentList");
			for(StudentVO vo : studentList){
		%>
			<tr> 
				<td><a href="http://localhost:8080/hyunseok_mvcdb/StudentServlet?cmd=update&id=<%=vo.getId() %>" target="_self"> <%=vo.getId() %> </a></td> 
				<td><%=vo.getUsername() %></td> 
				<td><%=vo.getSnum() %></td> 
				<td><%=vo.getDepart() %></td> 
				<td><%=vo.getMobile() %></td> 
				<td><%=vo.getEmail() %></td>
			</tr>
		<%
			}
		%>
	</table>
</body>
</html>