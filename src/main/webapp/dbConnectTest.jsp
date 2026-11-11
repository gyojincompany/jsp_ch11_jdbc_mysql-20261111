<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB 연결 테스트</title>
</head>
<body>
	<%
		//DB 연결을 위한 변수 4개 선언
		
		//드라이버 이름->이름은 정해져 있음
		String driverName = "com.mysql.jdbc.Driver";
		
		//mysql이 설치되어 있는 DB서버의 주소(url)
		String url = "jdbc:mysql://localhost:3306/shopdb";
		
		//MySQL 사용자 계정
		String username = "root";
		String password = "12345";
		
		Connection conn = null;
		
		try {
			//MySQL JDBC 드라이버 로딩
			Class.forName(driverName);
			
			//데이터베이스 연결
			conn = DriverManager.getConnection(url, username, password);
			
			System.out.println("데이터베이스 연결 성공!");
			System.out.println(conn);
			
		} catch(Exception e) {
			
			System.out.println("데이터베이스 연결 실패!");
			e.printStackTrace();
			
		} finally {
			
			try {
				if(conn != null) {
					conn.close();
				}	
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
	%>
</body>
</html>