<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%	int num1= 0, num2= 0, result=0; 
	
	if(request.getMethod().equals("POST")){
		String op = request.getParameter("operator");
		
		num1 = Integer.parseInt(request.getParameter("num1"));
		num2 = Integer.parseInt(request.getParameter("num2"));
		
		if(op.equals("+")) { result = num1+num2; }
		else if(op.equals("-")) { result = num1-num2; }
		else if(op.equals("*")) { result = num1*num2; }
		else if(op.equals("/")) { result = num1/num2; }
	}
%>
<html>
<head>
<meta charset="EUC-KR">
<title>����</title>
</head>
<body>
	<div align="center">
	<H3>����: ��ũ��Ʈ�� ���</H3>
	<form name=form1 action='calculate.jsp' method=post>
		<input type="text" NAME="num1" width=200 size="5">
		<select NAME="operator">
			<option selected>+</option>
			<option>-</option>
			<option>*</option>
			<option>/</option>
		</select>
		<INPUT TYPE="text" NAME="num2" width=200 size="5">
		<input type="submit" value="���" name="B1">
		<input type="reset" value="�ٽ� �Է�" name="B2">
	</form>
	<HR>
	�����: <%= result %>
	</div>
</body>
</html>