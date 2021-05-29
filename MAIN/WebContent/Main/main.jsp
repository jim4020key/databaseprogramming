<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터베이스를 활용한 수강신청 시스템입니다.</title>
<link rel="stylesheet" type="text/css" media="screen" href="DBdesign.css"/>
<script type="text/javascript" src="timeset.js"></script>
</head>
<body>
<body onload="printClock()">
<h1 class="frontpage">
	<img id = "frontimage" src="../image/sym_squ.gif" width = "150" >
	<p id="fronttext">
	&nbsp;<strong>수강신청</strong> 주의사항 <br><br> &nbsp;&nbsp;1. 18학점을 넘을 수 없다.<br>
	&nbsp;&nbsp;2. 동일 시간대에는 한가지 과목만 신청할 수 있다. <br> &nbsp;&nbsp;3. 전공필수과목은 한과목 이상 수강해야 한다. 
	</p>
	<span id="clock"></span>
</h1>
<%@include file="top.jsp" %>

<table id="main_c" width="75%" align="center" height="100%">
<% 
	if(session_id!=null){
%>
	<tr>
		<td align="center"><%=session_id %>님 방문을 환영합니다.</td>
	</tr>
<% 		
	}else{
%>		
	<tr>
		<td align="center">로그인한 후 사용하세요.</td>
	</tr>
	<tr>
		<td align="center"><a href="register.jsp">회원가입</a></td>
	</tr>
<% 		
	}
%>
	
</table>
</body>
</html>
