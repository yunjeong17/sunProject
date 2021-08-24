<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	User u = (User) session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
	<%@ include file="views/common/menubar.jsp" %>
	<% if(u!=null){%>	
		<%@ include file="views/common/index.jsp" %>
	<%} %>
</body>
</html>