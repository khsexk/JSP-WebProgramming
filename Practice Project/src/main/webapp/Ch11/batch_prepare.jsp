<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*, javax.naming.*, javax.sql.*" %>
<!DOCTYPE html>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	try{
		Context initContext = new InitialContext();
		Context envContext = (Context)initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource)envContext.lookup("jdbc/mysql");
		conn = ds.getConnection();
		conn.setAutoCommit(false);
		
		if(request.getParameter("username1") != null & request.getParameter("username2") != null){
			String sql = "insert into jdbc_test values(?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("username1"));
			pstmt.setString(2, request.getParameter("email1"));
			pstmt.addBatch();
			
			pstmt.setString(1, request.getParameter("username2"));
			pstmt.setString(2, request.getParameter("email2"));
			pstmt.addBatch();
			pstmt.executeBatch();
			pstmt.clearBatch();
			conn.commit();
		}
	} catch(Exception e){
		System.out.println(e);
		System.out.println("RollBack");
		conn.rollback();
	} 
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Batch</title>
</head>

<body>
	<div align = "center">
		<H2>이벤트 등록: rollback test</H2>
		<HR>
		<form name=form1 method=POST>
			등록이름: <input type=TEXT name=username1>
			주소: <input type=text name=email1 size=20> <br>
			
			등록이름: <input type=TEXT name=username2>
			주소: <input type=text name=email2 size=20>
			<input type=submit value="등록">
		</form>
	</div>
	#등록 목록<P>
	<%
		try{
			String sql="select username, email from jdbc_test";
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			int i = 1;
			
			while(rs.next()){
				out.println(i + ":" + rs.getString(1) + "," + rs.getString(2) + "<BR>");
				i++;
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e){
			System.out.println(e);
		}
	%>
</body>
</html>