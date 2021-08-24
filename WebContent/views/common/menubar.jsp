<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.sun.user.model.vo.User"%>

<%
User loginUser = (User) session.getAttribute("loginUser");
String msg = (String) session.getAttribute("msg");
String contextPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>
<!--login이 안 되어있을 때의 style --> 
body {
	background-color:#dae6f0;
}

form {
	margin-top: 20px;
	margin-left: 100px;
}

td {
	padding-top: 10px;
	padding-right: 8px;
}
span{
	color:black;
}
#find-div>a {
	color: white;
	display: block;
}

#main-container {
	position: absolute;
	display: inline-block;
	margin-top: 100px;
	margin-left: 100px;
	width: 500px;
	height: 500px;
	background-color: #63718b;
}

#main-logo, #main-img {
	display: block;
}

#main-div {
	display: inline-block;
	margin-top: 100px;
	margin-left: 200px;
}

#login-btn {
	height: 70px;
	width: 70px;
	background-color: white;
	border: 0;
	outline: 0;
	border-radius: 4px;
}

#lock-div {
	margin-top: 120px;
	margin-left: 100px;
}

#login-text {
	font-size: 70px;
}

#lock-img {
	display: inline-block;
	vertical-align: text-bottom;
}

#find-div {
	margin-left: 100px;
	margin-top: 20px;
}


<!--login이 되어있을 때의 style -->
 #logo { display:block-inline;
	padding-right: 80%;
	text-decoration-line: none;
}

#login-user-name, #logout {
	font-size: 12px;
}

#topMenu {
	height: 50px;
	width: 100%;
	background-color: #00205b;
}

#topMenu ul li {
	list-style: none;
	color: white;
	background-color: #00205b;
	float: left;
	line-height: 50px;
	vertical-align: middle;
	text-align: center;
	margin-left: 10%;
}

#topMenu .menuLink {
	text-decoration: none;
	color: white;
	display: block;
	width: 125px;
	font-size: 12px;
	font-weight: bold;
}

#topMenu .menuLink:hover {
	color: #092d70;
	background-color: white;
}

</style>


<script>
	$( function(){
		var msg="<%=msg%>";
		if (msg != "null") {
			alert(msg);
			<%session.removeAttribute("msg");%>
	}
	})

	function loginVaildate() {
		console.log("tq,,,,좀 돼라,,,");
		
		if ($("#userId").val().trim().length == 0) {
			alert("아이디를 입력하세요");
			$("#userId").focus();
			return false;
		}
		if ($("#userPwd").val().trim().length == 0) {
			alert("비밀번호를 입력하세요");
			$("#userPwd").focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
		<%
		if (loginUser == null) {
		%>
		<div>
			<div id="main-div">
				<img id="main-logo" src="resources/images/sunLogo1.png" alt=""
					width="200px"> <img id="main-img"
					src="resources/images/sunUni.jpg" alt="" width="500px">
			</div>
			<div id="main-container">
				<div id="lock-div">
					<img id="lock-img" src="resources/images/lock.png" alt=""
						width="100px"> <span id="login-text">LOGIN</span>
				</div>

				<form id="loginForm" action="<%=request.getContextPath()%>/login" method="post" onsubmit="return loginVaildate();">
					<table>
						<tr>
							<th><label for="userId">아이디</label></th>
							<td><input type="text" id="userId" name="userId"></td>

							<td rowspan="2"><button type="submit" id="login-btn">로그인</button></td>
						</tr>
						<tr>
							<th><label for="userPwd">비밀번호</label></th>
							<td><input type="password" id="userPwd" name="userPwd"></td>
						</tr>
					</table>
				</form>

				<div id="find-div">
					<a href="">>학번/교직원 번호 찾기</a> 
					<a href="">>비밀번호 초기화 </a>
				</div>
			</div>
		</div>
		<%
		} else {
		%>
		<div id="top">
		<a id='logo'> <img src="resources/images/sunLogo1.png" width="140px"
			height="70px">
		</a> <span id="login-user-name"> <%=loginUser.getUserName() %>님
			<a href = "<%=contextPath%>/logout">로그아웃</a> <span>
			
	<nav id="topMenu">
	<%
	if (Character.toUpperCase(loginUser.getUserId().charAt(0)) == 'A') { //관리자
	%>
	
	<ul>
		<li><div class="menuLink" onclick="location='<%=contextPath%>/list.st'">학생 관리</div></li>
		<li><div class="menuLink" onclick="goManageProfessors();">교수 관리</div></li>
		<li><div class="menuLink" onclick="goManageClass();">강의 관리</div></li>
	</ul>
	
	<%
	} else if (Character.toUpperCase(loginUser.getUserId().charAt(0)) == 'P') { //교수
	%>
	<ul>
		<li><div class="menuLink" onclick="goProfessorsClass();">강의</div></li>
		<li><div class="menuLink" onclick="goProfessorsGrade();">성적</div></li>
		<li><div class="menuLink" onclick="goProfessorsConsulting();">상담</div></li>
	</ul>

	<%
	} else { // 학생
	%>
	<ul>
		<li><div class="menuLink" onclick="goStudentRegister();">학적</div></li>
		<li><div class="menuLink" onclick="goStudentConsulting();">상담</div></li>
		<li><div class="menuLink" onclick="goStudentGrade();">성적</div></li>
		<li><div class="menuLink" onclick="goCertificate();">증명서발급</div></li>
	</ul>
	<%}%>
	</div>
	<%} %>
	</nav>
	
	<script>
	function goProfessorsClass(){
		location.href="<%=request.getContextPath()%>/classList.pr";
	}

	function goProfessorsGrade(){
		location.href="<%=request.getContextPath()%>/gradeList.pr";
	}
	
	function goProfessorsConsulting(){
		location.href="<%=request.getContextPath()%>/consultingList.pr";
	}
	
	function goStudentRegister(){
		location.href="<%=request.getContextPath()%>/StudentAcademic";
	}

	</script>
</body>
</html>