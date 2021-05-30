<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>사용자 시간표 조회</title>	
	<style>
		#time_table{table-layout: fixed;}
		td{text-align: center; height:"60"; width:"50%";}
	</style>
</head>
<body>
<a href="main.jsp"><img id = "homeimage" src="image/sym_rec.png"></a>
<%@ include file="top.jsp" %>
<%
	if (session_id == null) 
		response.sendRedirect("login.jsp");
%>
<% 
	int start =0;
	int remember=0;
	String course_id;
	int course_id_no;
	String course_name = "";
	int course_day = 0;
	int course_time = 0;
	
	Connection conn = null;		
	PreparedStatement pstmt = null;
	CallableStatement cstmt = null; 
	ResultSet rs = null;
	ResultSet sub_rs = null;
	String sql;
	String sub_sql;
	String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "db1811458";                       
	String passwd = "oracle";
%>
<br><br>
	<table width="60%" height="600" align="center" id="time_table" border>
<% 

%>
		<tr width=20% height="50">
			<th width = "70"> 교시 </th><th>월요일</th><th>화요일</th><th>수요일</th>
			<th>목요일</th><th>금요일</th>
		</tr>
<%
	
	
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");            
		conn = DriverManager.getConnection(dburl, user, passwd);
		
		sql = "SELECT c_id, t_time, t_day FROM teach T WHERE T.c_id IN ( SELECT c_id FROM enroll WHERE s_id = ?) order by 2,3";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, session_id);
		rs = pstmt.executeQuery();
		
		while (rs.next()) {			
			course_id = rs.getString("c_id");
			course_day = rs.getInt("t_day");
			course_time = rs.getInt("t_time");
			sub_sql = "SELECT c_name FROM course WHERE c_id = ?";
			pstmt = conn.prepareStatement(sub_sql);
			pstmt.setString(1, course_id);
			sub_rs = pstmt.executeQuery();
			if (sub_rs.next()) {
				course_name = sub_rs.getString("c_name");
			}
			
%>
				<%
				switch(course_time){
				case 1:
					remember = 1;
					if(start ==0){
						%><tr><th>1</th><%
					}
					if(start<course_day){
						for(int i =1;i<course_day-start;i++)
							%><td></td><%
						start = course_day;
					}
					if(start == course_day){
						%><td><%=course_name%></td><%
						if(start==5){
							%></tr><%
							start=0;
						}
						break;
					}
					else{
						%><td></td><%
					}
				case 2:
					if(start < 5){
						if(course_time - remember == 1){
							for( int j = start ;j <5;j++)
								%><td></td><%
							%></tr><%
							start = 0;
						}
					}
					remember = 2;
					if(start ==0){
						%><tr><th>2</th><%
					}
					if(start<course_day){
						for(int i =1;i<course_day-start;i++)
							%><td></td><%
						start = course_day;
					}
					if(start == course_day){
						%><td><%=course_name%></td><%
						if(start==5){
							%></tr><%
							start=0;
						}
						break;
					}
					else{
						%><th></th><%
					}
				case 3:
					if(start < 5){
						if(course_time - remember == 1){
							for( int j = start ;j <5;j++)
								%><td></td><%
							%></tr><%
							start = 0;
						}
					}
					remember = 3;
					if(start ==0){
						%><tr><th>3</th><%
					}
					if(start<course_day){
						for(int i =1;i<course_day-start;i++)
							%><td></td><%
						start = course_day;
					}
					if(start == course_day){
						%><td><%=course_name%></td><%
						if(start==5){
							%></tr><%
							start=0;
						}
						break;
					}
					else{
						%><th></th><%
					}
				case 4: 
					if(start < 5){
						if(course_time - remember == 1){
							for( int j = start ;j <5;j++)
								%><td></td><%
							%></tr><%
							start = 0;
						}
					}
					remember = 4;
					if(start ==0){
						%><tr><th>4</th><%
					}
					if(start<course_day){
						for(int i =1;i<course_day-start;i++)
							%><td></td><%
						start = course_day;
					}
					if(start == course_day){
						%><td><%=course_name%></td><%
						if(start==5){
							%></tr><%
							start=0;
						}
						break;
					}
					else{
						%><th></th><%
					}
				case 5:
					if(start < 5){
						if(course_time - remember == 1){
							for( int j = start ;j <5;j++)
								%><td></td><%
							%></tr><%
							start = 0;
						}
					}
					remember = 5;
					if(start ==0){
						%><tr><th>5</th><%
					}
					if(start<course_day){
						for(int i =1;i<course_day-start;i++)
							%><td></td><%
						start = course_day;
					}
					if(start == course_day){
						%><td><%=course_name%></td><%
						if(start==5){
							%></tr><%
							start=0;
						}
						break;
					}
					else{
						%><th></th><%
					}
				}
						
		}
		if(start <5){
			for( int j = start ;j <5;j++)
				%><td></td><%
			%></tr><%
		}
		if(remember<5){
			for(int j=remember; j<5;j++){
				%><tr><th><%=remember+1%></th><%
				for(int i = 0;i<5;i++)
					%><td></td><%
				%></tr><%
			}
		}
		rs.close();
		pstmt.close();
		conn.close();
	} 
	catch(SQLException ex) { 
		System.err.println("SQLException: " + ex.getMessage());
	}
		%>
		</table>
	</body>
</html>