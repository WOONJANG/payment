<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mid = (String)session.getAttribute("mid");
	String mname = (String)session.getAttribute("mname");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test.java에 있는 session 로드</title>
</head>
<body>
	로그인테스트
	<%=mid%>
	<%=mname%>
	<%-- 
	${mid}
	${mname} 
	--%>
</body>
</html>