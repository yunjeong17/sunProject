<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String flag = (String)request.getAttribute("flag");
	String msg = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
var flag= "<%=flag%>";
$(function(){
		if( flag=="Y"){
			alert("<%=msg%>");
			window.close();
		}
		else if( flag=="N" ){
			alert("<%=msg%>");
		}
})
</script>
<style>
button {
	border-style: groove;
	border-radius: 10px;
	background: white;
	margin: left;
}
</style>
</head>
<body>
<b>비밀번호 초기화</b>
	<br>
	
	<form id="resetPwdForm" action="<%=request.getContextPath()%>/resetPwd.us" method="post">
		<table>
			<tr>
				<td><label>교원/학생</label></td>
				<td><input type="radio" name="tableName" value="Professors">교원</input></td>
				<td><input type="radio" name="tableName" value="Student"  checked="checked">학생</input></td>
			</tr>
			<tr>
				<td><label for="userId" id="userIdLabel">학번/교원번호</label>
				<td><input type="text" name="userId" id="userId"></td>
			</tr>
			<tr>
				<td><label for="userName">이름</label>
				<td><input type="text" name="userName" id="userName"></td>
			</tr>
			<tr>
				<td><label for="userEmail">이메일</label></td>
				<td><input type="email" name="userEmail" id="userEmail"></td>
			</tr>
		</table>	
		<br>
		<br>
		
		<div class="btns" align="center">
			<button id="find-btn"  onclick="checkNull();">학번/교원번호 찾기</button>
		</div>

	</form>
	
	<script type="text/javascript">
		function checkNull(){
			const userName = $("#userName");
			const userEmail= $("#userEmail");
			if(userId.val().trim()==""){
				alert("학번을 입력하세요");
			}
			if(userName.val().trim()==""){
				alert("이름을 입력하세요");
			}
			if(userEmail.val().trim()==""){
				alert("이메일을 입력하세요");	
			}
			console.log(userName+userEmail);
			$("#findIdForm").submit();
		}

	</script>
</body>
</html>