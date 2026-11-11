<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dto.MemberDto"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모든 가입회원 리스트</title>
</head>
<body>
	<h2>전체 회원 리스트</h2>
	<hr>
	<%
		
		String sql="SELECT * FROM members";
		
		
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/shopdb2";
		String username = "root";
		String password = "12345";
		
		Connection conn = null;		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, username, password);
			
			pstmt = conn.prepareStatement(sql); //sql O
			
			rs = pstmt.executeQuery();
			
			List<MemberDto> memberList = new ArrayList<MemberDto>();
			
			while(rs.next()) {
				String userid = rs.getString("id");
				String userpw = rs.getString("passwd");
				String useremail = rs.getString("email");
				String userdate = rs.getString("signuptime");
				
				//out.println(userid+" / "+userpw+" / "+useremail+" / "+userdate+"<br>");
				
				MemberDto memberDto = new MemberDto(userid, userpw, useremail, userdate);
				
				memberList.add(memberDto);
				
				//MemberDto memberDto = new MemberDto();
				//memberDto.setId(userid);
				//memberDto.setId(userpw);
				//memberDto.setId(useremail);
				//memberDto.setId(userdate);
				
				request.setAttribute("memberList", memberList);
				
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				rs.close();
			}
			if(pstmt != null) {
				pstmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		}	
	%>
	
	<table border="1">
		<thead>
			<tr>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이메일</th>
				<th>가입일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="mdto" items="${memberList}">
				<tr>
					<td>${mdto.id }</td>
					<td>${mdto.passwd }</td>
					<td>${mdto.email }</td>
					<td>${mdto.signuptime }</td>
				</tr>
			</c:forEach>
			
		</tbody>
	</table>
	
	
</body>
</html>