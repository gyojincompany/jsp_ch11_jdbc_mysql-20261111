<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보를 DB에 넣는 페이지</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String uid = request.getParameter("userID");
		String upw = request.getParameter("userPW");
		String umail = request.getParameter("userMAIL");
		
		//Statement 방식 sql
		String sql = "INSERT INTO members(id, passwd, email) VALUES('"+uid+"','"+upw+"','"+umail+"')";
		//System.out.println(sql);
		
		//드라이버 이름->이름은 정해져 있음
		String driverName = "com.mysql.jdbc.Driver";
		
		//mysql이 설치되어 있는 DB서버의 주소(url)
		String url = "jdbc:mysql://localhost:3306/shopdb2";
		
		//MySQL 사용자 계정
		String username = "root";
		String password = "12345";
		
		Connection conn = null;
		Statement stmt = null;
		
		
		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, username, password);
			
			stmt = conn.createStatement();
			int result = stmt.executeUpdate(sql); //sql문 실행
			
			if(result == 1) {
				out.println("회원 가입 성공!");
			} else {
				out.println("회원 가입 실패!");
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(stmt != null) {
				stmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		}
		
	
	%>
</body>
</html>