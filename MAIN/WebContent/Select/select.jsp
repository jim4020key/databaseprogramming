<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head> 
	<meta charset="UTF-8">
	<title>수강신청 조회</title>
	<script>
		function onSearch() {
			var fr = document.getElementById("select_form");
			var search_year = fr.search_year.value;
			var search_semester = fr.search_semester.value;
			location.href = "select.jsp?search_year=" + search_year + "&search_semester=" + search_semester;
		}
	</script>
</head>
<body>
<a href="../Main/main.jsp"><img id = "homeimage" src="../image/sym_rec.png"></a>
<%@ include file="../Main/top.jsp" %>
<%
	if (session_id == null) 
		response.sendRedirect("../Main/login.jsp");
%>
<% 
	String search_year = request.getParameter("search_year");
	String search_semester = request.getParameter("search_semester");
 	if (search_year == null)
		search_year = "2021";
	if (search_semester == null)
		search_semester = "2";
	String course_id;
	int course_id_no;
	String course_name = "";
	int course_unit = 0;
	int class_count = 0;
	String int_course_day = "";
	String str_course_day = "";
	String course_time = "";
	String course_place = "";
	String course_class = "";
	int max_student_num = 0;
	int total_course = 0;
	int total_unit = 0;
	Connection conn = null;		
	PreparedStatement pstmt = null;
	CallableStatement cstmt = null; 
	ResultSet rs = null;
	ResultSet sub_rs = null;
	String sql;
	String sub_sql;
	String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "1813467학번";                                       
	String passwd = "ss2";
%>
	<form method="post" width="75%" align="center" id="select_form" action="select.jsp"> 
		<br/>
		<br/>
		년도 <input type="text" name="search_year" value="<%=search_year %>" size="10"/>
		학기 <input type="text" name="search_semester" value="<%=search_semester %>" size="10"/>
		<input type="button" value="SEARCH" onclick="onSearch()"/>
	</form>
	<br>
	<table width="75%" align="center" border = "1" id="select_table">
		<tr>
			<th>과목번호</th><th>분반</th><th>과목명</th><th>강의유형</th><th>시간</th>
			<th>강의장소</th><th>학점</th>
		</tr>
<%
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");            
		conn = DriverManager.getConnection(dburl, user, passwd);
		
		sql = "SELECT c_id, c_id_no FROM enroll WHERE s_id = ? and e_year = ? and e_semester = ?";

		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, session_id);
		pstmt.setInt(2, Integer.parseInt(search_year));
		pstmt.setInt(3, Integer.parseInt(search_semester));
		rs = pstmt.executeQuery();
		while (rs.next()) {
			course_id = rs.getString("c_id");
			course_id_no = rs.getInt("c_id_no");
			
			sub_sql = "SELECT c_name, c_unit, c_class FROM course WHERE c_id = ? and c_id_no = ?";
			pstmt = conn.prepareStatement(sub_sql);
			pstmt.setString(1, course_id);
			pstmt.setInt(2, course_id_no);
			sub_rs = pstmt.executeQuery();
			if (sub_rs.next()) {
				course_name = sub_rs.getString("c_name");
				course_unit = sub_rs.getInt("c_unit");
				course_class = sub_rs.getString("c_class");
				total_unit = total_unit + course_unit;
				total_course++;
			}
			if( course_class.equals("전공필수"))
				class_count = class_count +1;
			sub_sql = "SELECT t_day, t_time, t_classroom, t_max FROM teach WHERE c_id = ? and c_id_no = ?";
			pstmt = conn.prepareStatement(sub_sql);
			pstmt.setString(1, course_id);
			pstmt.setInt(2, course_id_no);
			sub_rs = pstmt.executeQuery();
			if (sub_rs.next()) {
				int_course_day = "" + sub_rs.getInt("t_day");
				String str_t = null;
				int st_m = sub_rs.getInt("t_time");
				course_time = " " +st_m + " 교시";
				course_place = sub_rs.getString("t_classroom");
				max_student_num = sub_rs.getInt("t_max");
			}
						
			sub_sql = "SELECT s_id FROM enroll WHERE c_id = ? and c_id_no = ?";
			pstmt = conn.prepareStatement(sub_sql);
			pstmt.setString(1, course_id);
			pstmt.setInt(2, course_id_no);
			sub_rs = pstmt.executeQuery();
			
			sql = "{? = call getDay(?)}";
			cstmt = conn.prepareCall(sql);
			cstmt.registerOutParameter(1, java.sql.Types.VARCHAR);
			cstmt.setString(2, int_course_day);
			cstmt.execute();
			str_course_day = cstmt.getString(1);
			
%>
		<tr>
			<td align="center"><%=course_id %></td>
			<td align="center"><%=course_id_no %></td>
			<td align="center"><%=course_name %></td>
			<td align="center"><%=course_class %></td>
			<td align="center"><%=str_course_day %><%= course_time%></td>
			<td align="center"><%=course_place %></td>
			<td align="center"><%=course_unit %></td>
		
<%


		}
		rs.close();
		pstmt.close();
		conn.close();
	} 
	catch(SQLException ex) { 
		System.err.println("SQLException: " + ex.getMessage());
	}

%>
		 </tr>
		
	</table>
	<br/>
	<br/>
	<div width="75%" align="center">
		<p><%=search_year %>년 <%=search_semester %>학기 수강신청 검색 결과 : </p>
		<p>현재까지 전공필수 <%=class_count %>개, 총 <%=total_course %>과목, <%=total_unit %>학점 수강신청 했습니다. </p>
		<p>전공필수 개수를 확인해주세요.</p>
	</div>
<%
	
	
%>
	</table>
</body>
</html>