<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청 삭제 검사</title>
</head>
<body>
<%	
	String s_id = (String)session.getAttribute("userID");
	String c_id = request.getParameter("c_id");
	int c_id_no = Integer.parseInt(request.getParameter("c_id_no"));
		
	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	Class.forName(dbdriver);
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
	
	String user="1813467학번";
	String password="ss2";   

	
	try{
		
		conn = DriverManager.getConnection(dburl, user, password);
		
		pstmt = conn.prepareStatement("delete from enroll where s_id = ? and c_id = ? and c_id_no = ?");
		pstmt.setString(1, s_id);
		pstmt.setString(2, c_id);
		pstmt.setInt(3, c_id_no);
		
		pstmt.executeUpdate();
%>
	<script>	
		alert("취소되었습니다."); 
		location.href="delete.jsp";
	</script>
<%	
		
	}catch(Exception e){e.printStackTrace();}finally{
		if (pstmt!=null)  try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}
		if (conn != null) try {conn.close();}  catch (SQLException e) {e.printStackTrace();}
	}
	
%>

	

</body>
</html>