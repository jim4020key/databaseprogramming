<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청 사용자 정보 수정</title>
</head>
<body>
<%@ include file="../Main/top.jsp" %>
<%
if (session_id==null) response.sendRedirect("login.jsp");
%>

<%
	Connection myConn = null;      PreparedStatement pstmt = null;
	ResultSet myResultSet = null;   String mySQL = "";
	String dburl  = "jdbc:oracle:thin:@localhost:1521:xe";
	String user="1813467학번";     String passwd="ss2";
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
<h2 align="center">수정내용을 입력하세요</h2>
<table width="50%" align="center" border>
	<form method="post" action="update_verify.jsp">
		<th></th><th>수정 전</th><th>수정 후</th>
		<tr>
			<td><div align="center">아이디</div></td>
			<td><div align="center"><%= s_id %></div></td>
			<td><div align="center">수정불가</div></td>
		</tr>
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
		<tr>
			<td><div align="center">전공</div></td>
			<td><div align="center"><%= s_major %></div></td>
			<td><div align="center">수정불가</div></td>
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