<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
	<h2>회원가입</h2>
	<hr>
	<form action="signup_process.jsp" method="post">
		아이디 : <input type="text" name="userID"><br><br>
		비밀번호 : <input type="password" name="userPW"><br><br>
		이메일 : <input type="email" name="userMAIL"><br><br>
		<input type="submit" value="가입하기">
	</form>
</body>
</html>