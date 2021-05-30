<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" media="screen" href="DBdesign.css"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<a href="main.jsp"><img id = "homeimage" src="../image/sym_rec.png"></a>
	<%@ include file="top.jsp" %>
	<br>
	<table width="50%" align="center" bgcolor="#eeeeee" border>
		<tr>
			<td><div align="center">회원정보를 입력하세요</div></td>
		</tr>
	</table>
	<table width="50%" align="center" border>
		<form method="post" action="register_verify.jsp">
			<tr>
				<td><div align="center">아이디</div></td>
				<td><div align="center"><input type="text" name="userID" required></div></td>
			</tr>
			<tr>
				<td><div align="center">패스워드</div></td>
				<td><div align="center"><input type="password" name="userPassword" required></div></td>
			</tr>
			<tr>
				<td><div align="center">주소</div></td>
				<td><div align="center"><input type="text" name="userAddr" required></div></td>
			</tr>
			<tr>
				<td><div align="center">전공</div></td>
				<td><div align="center"><input type="text" name="userMajor" required></div></td>
			</tr>
			<tr>
				<td colspan="2"><div align="center">
					<input type="submit" name="Sumit" value="가입">
					<input type="reset" value="취소">
				</div></td>
			</tr>
		</form>
	</table>
</body>
</html>
