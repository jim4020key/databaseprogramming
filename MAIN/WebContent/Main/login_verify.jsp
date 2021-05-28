<%@page import="oracle.jdbc.OracleTypes"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%

	String userID=request.getParameter("userID");
	String userPassword=request.getParameter("userPassword");
	String driver = "oracle.jdbc.driver.OracleDriver";
	String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
	
	String user = "db1816526";
	String password = "ss2";

	Connection myConn = null;
	ResultSet rs = null;
	CallableStatement cstmt=null;
	try{
		Class.forName(driver);
		myConn=DriverManager.getConnection(dburl, user, password);
	
		cstmt = myConn.prepareCall("{call Welcome(?,?,?)}");
		cstmt.setString(1, userID);
		cstmt.setString(2, userPassword);
		cstmt.registerOutParameter(3,OracleTypes.CURSOR);
		cstmt.executeQuery();
		rs = (ResultSet)cstmt.getObject(3);
		}catch(ClassNotFoundException e){
			System.out.println("jdbc driver 로딩 실패");
		}catch(SQLException e){
			System.out.println("오라클 연결 실패");
		}finally{
			if(rs != null){
				if (rs.next()){
					session.setAttribute("userID", userID);
%>
			<script> 
					alert("환영합니다.");
					location.href="main.jsp";
				
			</script>
<%				}else{
%>
					<script>
						alert("사용자 아이디 혹은 비밀번호가 틀렸습니다.");
						location.href = "login.jsp";
					</script>	
<% 				}
			}
		}
	cstmt.close();
	myConn.close();
%>