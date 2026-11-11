<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 처리 페이지</title>
</head>
<body>
	<!-- 회원 탈퇴 성공 시 "회원 탈퇴 성공" 출력, 실패 시 "회원 탈퇴 실패" 출력 -->
	<%
		request.setCharacterEncoding("utf-8");
		
		String uid = request.getParameter("deleteID");
		
		//PrepareStatement 방식 sql
		String sql = "DELETE FROM members WHERE id=?";		
		
		//드라이버 이름->이름은 정해져 있음
		String driverName = "com.mysql.jdbc.Driver";
		
		//mysql이 설치되어 있는 DB서버의 주소(url)
		String url = "jdbc:mysql://localhost:3306/shopdb2";
		
		//MySQL 사용자 계정
		String username = "root";
		String password = "12345";
		
		Connection conn = null;
		//Statement stmt = null;
		PreparedStatement pstmt = null;
		
		
		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, username, password);
			
			//stmt = conn.createStatement();			
			//int result = stmt.executeUpdate(sql); //sql문 실행
			
			pstmt = conn.prepareStatement(sql); //sql O
			
			pstmt.setString(1, uid);
			
			int result = pstmt.executeUpdate(); //sql X
			//삭제 성공하면 1이 반환, 실패하면 0이 반환
			
			if(result == 1) {
				out.println("회원 탈퇴 성공!");
			} else {
				out.println("회원 탈퇴 실패!");
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null) {
				pstmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		}
	
	
	%>
	
	<a href="memberList.jsp">회원 전체 목록 보기</a>
</body>
</html>