<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	String jdbc_driver = "com.mysql.cj.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost/jspdb?allowPublicKeyRetrieval=true&useUnicode=true&characterEncoding=utf8&useSSL=false&serverTimezone=UTC";
	
	ArrayList<String> arrList = new ArrayList<String>();
	
	try{
		Class.forName(jdbc_driver);
		conn = DriverManager.getConnection(jdbc_url, "jspbook", "rhgustjr9402!");
		
		StringBuilder sb = new StringBuilder("select * from student where username='").append(request.getParameter("username")).append("\'"); 
		String sql = sb.toString();
		pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()){
			arrList.add(rs.getString(1));
			arrList.add(rs.getString(2));
			arrList.add(rs.getString(3));
			arrList.add(rs.getString(4));
			arrList.add(rs.getString(5));
			arrList.add(rs.getString(6));
			arrList.add(rs.getString(7));
		}

	
		rs.close();
		pstmt.close();
		conn.close();
	} catch(Exception e){
		System.out.println("Error: " + e);
	}
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>JDBC TEST JSP</title>
</head>

<body>
	<div align="center">
		<H2>테이블 student에서 이름으로 조회하는 프로그램</H2>
		<HR>
		<H3>학생정보 조회</H3><BR>
		<table border="1">
			<tr>
				<th> 아이디 </th> <td> 암호 </td> <td> 이름 </td> <td> 학번 </td> <td> 학과 </td> <td> 휴대폰 </td> <td> 이메일 </td>
			</tr>
			<tr>
				<th> <%= arrList.get(0) %> </th> 
				<td> <%= arrList.get(1) %> </td> 
				<td> <%= arrList.get(2) %> </td> 
				<td> <%= arrList.get(3) %> </td> 
				<td> <%= arrList.get(4) %> </td> 
				<td> <%= arrList.get(5) %> </td> 
				<td> <%= arrList.get(6) %> </td>
			</tr>
		</table>	
	</div>
</body>
</html>