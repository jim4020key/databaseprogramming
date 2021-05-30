<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청 삭제</title>
</head>
<body>
	<a href="../Main/main.jsp"><img id = "homeimage" src="../image/sym_rec.png"></a>
<%@ include file="../Main/top.jsp" %>
<% 	
	request.setCharacterEncoding("UTF-8");
	if (session_id==null) response.sendRedirect("../Main/login.jsp");  
%>
	<br>
	<table width="75%" align="center" border="1">
		<tr>
			<th>과목번호</th>
			<th>분반</th>
			<th>과목명</th>
			<th>학점</th>
			<th>강의종류</th>
			<th>수강취소</th>
		</tr>
<%

	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	Class.forName(dbdriver);
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ResultSet rs2 = null;
	
	String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
	

	String user="1813467학번";
	String password="ss2";
	
	try {
		
		Class.forName(dbdriver);
	    conn =  DriverManager.getConnection (dburl, user, password);
		pstmt = conn.prepareStatement("SELECT * FROM enroll WHERE s_id = ?");
		pstmt.setString(1, session_id);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			
			String delete_c_id = rs.getString("c_id");
			int delete_c_id_no = rs.getInt("c_id_no");
			
			pstmt = conn.prepareStatement("SELECT * FROM course WHERE c_id = ? and c_id_no = ?");
			pstmt.setString(1, delete_c_id);
			pstmt.setInt(2, delete_c_id_no);
			rs2 = pstmt.executeQuery();
			
			while(rs2.next()){
			
				String delete2_c_id = rs2.getString("c_id");
				int delete2_c_id_no = rs2.getInt("c_id_no");			
				String delete2_c_name = rs2.getString("c_name");
				int delete2_c_unit = rs2.getInt("c_unit");
				String delete2_c_class = rs2.getString("c_class");
			
%>
		<tr>	
			<td align="center"><%=delete2_c_id %></td>
			<td align="center"><%=delete2_c_id_no %></td>
			<td align="center"><%=delete2_c_name %></td>
			<td align="center"><%=delete2_c_unit %></td>
			<td align="center"><%=delete2_c_class %></td>
			<td align="center"><a href="delete_verify.jsp?c_id=<%= delete_c_id %>&c_id_no=<%= delete_c_id_no %>">삭제</a></td>
		</tr>
<%
						
			}
			
		}		
		
    }catch(Exception e){e.printStackTrace();} finally{
		if (rs!=null)  try {rs.close();} catch (SQLException e) {e.printStackTrace();}
		if (pstmt!=null)  try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
		if (conn != null) try {conn.close();}  catch (SQLException e) {e.printStackTrace();}
	}
	
%>

	</table>

</body>
</html>
