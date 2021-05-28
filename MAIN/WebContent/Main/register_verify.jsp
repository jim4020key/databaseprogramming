<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userID = request.getParameter("userID");
	String userPassword = request.getParameter("userPassword");
	String userAddr = request.getParameter("userAddr");
	String userMajor = request.getParameter("userMajor");
	
	String dbdriver = "oracle.jdbc.driver.OracleDriver";
	Class.forName(dbdriver);
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Statement stmt = null;
	String mySQL = "";
	
	String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
	String user="db1714435";
	String password="oracle";
	
	try {
		conn = DriverManager.getConnection(dburl, user, password);
		mySQL = "select s_id from student where s_id='" + userID + "'";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(mySQL);
		if (rs.next()) {
			out.println("<script>");
			out.println("alert('사용할 수 없는 아이디입니다.');");
			out.println("location.href='register.jsp';");
			out.println("</script>");
			out.flush();
		}
		else {
			try {
				pstmt = conn.prepareStatement("insert into student values (?,?,?,?)");
				pstmt.setString(1, userID);
				pstmt.setString(2, userPassword);
				pstmt.setString(3, userAddr);
				pstmt.setString(4, userMajor);
				pstmt.executeQuery();
				
				out.println("<script>");
				out.println("alert('회원가입이 완료되었습니다.');");
				out.println("location.href='main.jsp';");
				out.println("</script>");
				out.flush();
			}
			catch(SQLException ex) {
				String sMessage;
				if (ex.getErrorCode() == 20002) sMessage="암호는 4자리 이상이어야 합니다.";
				else if (ex.getErrorCode() == 20003) sMessage="암호에 공란은 입력되지 않습니다.";
				else sMessage="잠시 후 다시 시도하십시오.";
				out.println("<script>");
				out.println("alert('"+sMessage+"');");
				out.println("location.href='register.jsp';");
				out.println("</script>");
				out.flush();
			}
		}
	} catch(Exception e){e.printStackTrace();}finally {
		if (rs!=null)  try {rs.close();} catch (SQLException e) {}
		if (pstmt!=null)  try {pstmt.close();} catch (SQLException e) {}
		if (conn != null) try {conn.close();}  catch (SQLException e) {}
		}

%>