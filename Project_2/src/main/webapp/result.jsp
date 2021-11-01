<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Web Service Programming Homework</title>
	<link rel="stylesheet" href="resources/register.css" type="text/css"></link>
	
	<style>
	    #before {
			background-color: #FDF2EE;
			text-align: center;
			clear: both;
		}
	</style>
</head>

<body>
	<header id="header2"> 2021 KPU Web Service Programming Community</header>
	<audio src="resources/JohnCena.mp3" autoplay></audio>
	
	<p id=sect>
		가입을 축하합니다!
	</p>
	
	<div>
	<table>
		<tr>
			<th> 계정 </th> <td> <%=request.getAttribute("id") %></td> 
		</tr>
		<tr>
			<th> 이름 </th> <td> <%=request.getAttribute("username") %></td> 
		</tr>
		<tr>
			<th> 학번 </th> <td> <%=request.getAttribute("snum") %></td> 
		</tr>
		<tr>
			<th> 학과 </th> <td> <%=request.getAttribute("depart") %></td> 
		</tr>
		<tr>
			<th> 핸드폰 </th> <td> <%=request.getAttribute("mobile") %></td> 
		</tr>
		<tr>
			<th> 이메일 </th> <td> <%=request.getAttribute("email") %></td> 
		</tr>
	</table>
	</div>
	
	<p id="before">
		<a href="http://localhost:8080/hyunseok_reg/welcome.html" target="_self">메인 페이지 이동</a>
	</p>
</body>
</html>