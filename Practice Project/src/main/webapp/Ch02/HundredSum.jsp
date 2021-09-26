<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>1부터 100까지의 합</title>
</head>
<body>
	<%
		int total = 0;
		for(int i=0 ; i<=100 ; i++)
			total += i;
	%>
	1부터 100까지 더한 값은?<%= total %>
</body>
</html>