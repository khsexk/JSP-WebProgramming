<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="i" items="${members}" begin="0" varStatus="status">
		index: ${status.index} /
		count: ${status.count} <BR>
		name: ${i.name} <BR>
		email: ${i.email} <BR>
		<HR>
	</c:forEach>
	<c:forTokens items="홍길동, 011-211-0090, 서울" delims="," var="sel">
	 ${sel} <BR>
	 </c:forTokens>
</body>
</html>