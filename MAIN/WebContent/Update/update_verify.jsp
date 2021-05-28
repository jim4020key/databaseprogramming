<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 수강신청 사용자 정보 수정 </title>
</head>
<body>
<%@ include file="../Main/top.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	String userPassword = request.getParameter("userPassword");
	String userAddr = request.getParameter("userAddr");

	Connection myConn = null;      PreparedStatement pstmt = null;
	ResultSet myResultSet = null;   String mySQL = "";
	String dburl  = "jdbc:oracle:thin:@localhost:1521:xe";
	String user="1813467학번";     String passwd="ss2";
    String dbdriver = "oracle.jdbc.driver.OracleDriver";

    myConn = DriverManager.getConnection(dburl, user, passwd);
    pstmt = myConn.prepareStatement("select s_id,s_pwd,s_addr,s_major from student where s_id = ?");
	pstmt.setString(1, session_id);
	myResultSet = pstmt.executeQuery();
	
	if(myResultSet.next()) {
		String s_pwd = myResultSet.getString("s_pwd");
		String s_addr = myResultSet.getString("s_addr");
		if("".equals(userPassword)) userPassword=s_pwd;
		if("".equals(userAddr)) userAddr=s_addr;
	    try {
			pstmt = myConn.prepareStatement("update student set s_pwd = ?,s_addr = ? where s_id = ?");
			pstmt.setString(1, userPassword);
			pstmt.setString(2, userAddr);
			pstmt.setString(3, session_id);
			myResultSet = pstmt.executeQuery();
%>
<script>
	alert("변경이 완료되었습니다."); 
	location.href="../Main/main.jsp";  
</script>
<%
		} catch(SQLException ex) {
			String sMessage;
			if (ex.getErrorCode() == 20002) sMessage="암호는 4자리 이상이어야 합니다.";
			else if (ex.getErrorCode() == 20003) sMessage="암호에 공란은 입력되지 않습니다.";
			else sMessage="잠시 후 다시 시도하십시오.";
			out.println("<script>");
			out.println("alert('"+sMessage+"');");
			out.println("location.href='update.jsp';");
			out.println("</script>");
			out.flush();
		} finally{
			if(pstmt != null) try{pstmt.close();} catch(SQLException e) {}
			if(myConn != null) try{myConn.close();} catch(SQLException e) {}   
		}
	}
%>
</body>
</html>