<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청 사용자 정보 수정</title>
</head>
<body>
<a href="../Main/main.jsp"><img id = "homeimage" src="../image/sym_rec.png"></a>
<%@ include file="../Main/top.jsp" %>
<%
if (session_id==null) response.sendRedirect("../Main/login.jsp");
%>

<%
	Connection myConn = null;      PreparedStatement pstmt = null;
	ResultSet myResultSet = null;   String mySQL = "";
	String dburl  = "jdbc:oracle:thin:@localhost:1521:xe";
	String user="db1714435";     String passwd="oracle";
    String dbdriver = "oracle.jdbc.driver.OracleDriver";    

    myConn = DriverManager.getConnection(dburl, user, passwd);
	pstmt = myConn.prepareStatement("select s_id,s_pwd,s_addr,s_major from student where s_id = ?");
	pstmt.setString(1, session_id);
	myResultSet = pstmt.executeQuery();
	if(myResultSet.next()){
		String s_id = myResultSet.getString("s_id");
		String s_pwd = myResultSet.getString("s_pwd");
		String s_addr = myResultSet.getString("s_addr");
		String s_major = myResultSet.getString("s_major");
	
%>
<br>

<table width="50%" align="center" bgcolor="#eeeeee" border>
	<tr>
		<th><div align="center">아이디</div></th>
		<td><div align="center"><%= s_id %></div></td>
		<th><div align="center">전공</div></th>
		<td><div align="center"><%= s_major %></div></td>
	</tr>
</table>
<table width="50%" align="center" border>
	<form method="post" action="update_verify.jsp">
		<th></th><th>현재</th><th>수정내용</th>
		<tr>
			<td><div align="center">패스워드</div></td>
			<td><div align="center"><%= s_pwd %></div></td>
			<td><div align="center"><input type="text" name="userPassword"></div></td>
		</tr>
		<tr>
			<td><div align="center">주소</div></td>
			<td><div align="center"><%= s_addr %></div></td>
			<td><div align="center"><input type="text" name="userAddr"></div></td>
		</tr>
<%	}	%>
		<tr>
			<td colspan="3"><div align="center">
				<input type="submit" name="submit" value="수정">
				<input type="reset" value="취소">
			</div></td>
		</tr>
	</form>
</table>
</body>
</html>