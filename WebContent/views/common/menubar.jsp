<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String loginUser = "";
loginUser = (String) session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
a.#logo{display:block-inline;}
	
@media (max-width: 600px) {
	<!--세로-->
	ul {list-style-type: none;margin: 0;padding: 0;width: 200px;background-color: #00205b;}
	li a {display: block;color: #000;padding: 8px 16px;text-decoration: none;}
	li a.active {background-color: #4CAF50;color: white;}
	li a:hover:not(.active) {background-color: #555;color: white;}
}

@media () {
	<!--가로-->
	ul {list-style-type: none;margin: 0;padding: 0;background-color: #00205b;}
	ul:after{content:'';display: block;clear:both;}
	li {float: left;}
	li a {display: block;color: white;text-align: center;padding: 14px 16px;text-decoration: none;}
	li a:hover:not(.active) {background-color: #111;}
	.active {background-color: #4CAF50;}
}

</style>
</head>
<body>
	<a id='logo'>
		<img src="resources/images/logo/sunLogo1.png" width="300px" height="150px">
	</a>
	<% if (loginUser.charAt(0) == 'A') { //관리자 %>
		<ul>
			<li>학생 관리</li>
			<li>교수 관리</li>
			<li>강의 관리</li>
		</ul>
	<%} else if (loginUser.charAt(0) == 'P') { //교수 %>
		<ul>
			<li>강의</li>
			<li>성적</li>
			<li>상담</li>
		</ul>
	<%} else { // 학생 %>
		<ul>
			<li>학적</li>
			<li>상담</li>
			<li>성적</li>
			<li>증명서 발급</li>
		</ul>
	<%}%>
</body>
</html>