<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청 삭제</title>
</head>
<body>
<%@ include file="../Main/top.jsp" %>
<% 	
	request.setCharacterEncoding("UTF-8");
	if (session_id==null) response.sendRedirect("login.jsp");  
%>

	

</body>
</html>