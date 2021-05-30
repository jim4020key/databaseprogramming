<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" media="screen" href="DBdesign.css"/> 
	<meta charset="UTF-8">
	<title>수강신청 시스템 로그인</title>
</head>
<body>
	<a href="main.jsp"><img id = "homeimage" src="../image/sym_rec.png"></a>
	<table width="50%" align="center" bgcolor="#eeeeee" border>
		<tr>
			<td><div align="center">아이디와 패스워드를 입력하세요</div></td>
		</tr>
	</table>
	<table width="50%" align="center" border>
		<form method="post" action="login_verify.jsp">
			<tr>
				<td><div align="center">아이디</div></td>
				<td><div align="center"><input type="text" name="userID"></div></td>
			</tr>
			<tr>
				<td><div align="center">패스워드</div></td>
				<td><div align="center"><input type="password" name="userPassword"></div></td>
			</tr>
			<tr>
				<td colspan="2"><div align="center">
					<input type="submit" name="Sumit" value="로그인">
					<input type="reset" value="취소">
				</div></td>
			</tr>
		</form>
	</table>
		
</body>
</html>
