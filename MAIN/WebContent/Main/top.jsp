<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" media="screen" href="DBdesign.css"/>    
<style type="text/css">
	#home, #home:visited{
		font-family:s-core-dream-thin;
		text-decoration: none;
		font-size:1.2dm;
	}
</style>
<% 
	String session_id = (String)session.getAttribute("userID");
	String log;
	
	if (session_id == null) log = "<a href='../Main/login.jsp'>로그인</a>";
	else log = "<a href='../Main/logout.jsp'>로그아웃</a>";
%>

<table id="home" width="75%" align="center" bgcolor="#eeeeee" border>
	<tr>
		<td align="center"><b><%=log %></b></td>
		<td align="center"><b><a href="../Update/update.jsp">사용자 정보 수정</a></b></td>
		<td align="center"><b><a href="../Insert/insert.jsp">수강신청 입력</a></b></td>
		<td align="center"><b><a href="../Delete/delete.jsp">수강신청 삭제</a></b></td>
		<td align="center"><b><a href="../Select/select.jsp">수강신청 조회</a></b></td>
		<td align="center"><b><a href="../Main/timetable.jsp">강의 시간표 조회</a></b></td>
	</tr>
</table>
