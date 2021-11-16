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
	<jsp:useBean id="product" class="jspbook.ch09.Product" scope="session"/>
	<select name="sel">
		<c:forEach items="${prodct.productlist}" var="item">
			<option> ${item} </option>
		</c:forEach>
	</select>
</body>
</html>