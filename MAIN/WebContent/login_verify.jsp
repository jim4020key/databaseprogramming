<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%

	String userID = request.getParameter("userID");
	String userPassword = request.getParameter("userPassword");
	
	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	Class.forName(dbdriver);
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
	
	
	// 여기 변경하고 하세요!!
	String user="db1714435";
	String password="oracle";
	//
	
	
	try{
		
		conn = DriverManager.getConnection(dburl, user, password);
		pstmt = conn.prepareStatement("select s_id from student where s_id = ? and s_pwd = ?");
		pstmt.setString(1, userID);
		pstmt.setString(2, userPassword);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			session.setAttribute("userID", userID);
	%>
		<script>
			location.href = "main.jsp";
		</script>
	<%		
		}else{
			
	%>
		<script>
			history.go(-1);
		</script>
	<%		
		}
		
	}catch(Exception e){e.printStackTrace();}finally{
		if (rs!=null)  try {rs.close();} catch (SQLException e) {e.printStackTrace();}
		if (pstmt!=null)  try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
		if (conn != null) try {conn.close();}  catch (SQLException e) {e.printStackTrace();}
	}
%>