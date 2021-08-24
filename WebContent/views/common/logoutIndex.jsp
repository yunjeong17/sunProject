<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
<!--
login이 안 되어있을 때의 style 
-->
body {
	background-color: #dae6f0;
}

form {
	margin-top: 20px;
	margin-left: 100px;
}

td {
	padding-top: 10px;
	padding-right: 8px;
}

span {
	color: black;
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
	background-color: #ffffff;
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
</style>
<script>

	function loginVaildate() {
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

			<form id="loginForm" action="<%=request.getContextPath()%>/login"
				method="post" onsubmit="return loginVaildate();">
				<table>
					<tr>
						<th><label for="userId">아이디</label></th>
						<td><input type="text" id="userId" name="userId"></td>

						<td rowspan="2"><button type="submit" id="login-btn">LOGIN</button></td>
					</tr>
					<tr>
						<th><label for="userPwd">비밀번호</label></th>
						<td><input type="password" id="userPwd" name="userPwd"></td>
					</tr>
				</table>
			</form>

			<div id="find-div">
				<a onclick="findId();">>학번/교직원 번호 찾기</a> <a onclick="resetPwd();">>비밀번호
					초기화 </a>
			</div>
		</div>
	</div>
</body>
</html>