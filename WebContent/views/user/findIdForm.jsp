<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String uId= (String)request.getAttribute("userId");
	String flag = (String)request.getAttribute("flag");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학번/교원번호 찾기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
var uId="<%=uId%>";
$(function(){
		if(uId != "null"){
			alert("아이디는 [ <%=uId%> ]입니다.");
			window.close();
		}
		if("<%=flag%>"=="N"){
			alert("존재하지 않는 유저입니다. 다시 시도해주십시오.");
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

h1{
	font-size:14px;
	background-color:#00205b;
	color:white;
	padding-top:4px;
	padding-bottom:4px;
}
#content{
	text-align:center;
}
table {
    margin:auto; 
}
</style>
</head>
<body>
<div id="content">
<b>학번/교원번호 찾기</b>
	<br>
	
	<form id="findIdForm" action="<%=request.getContextPath()%>/findId.us" method="post">
		<table>
			<tr>
				<td><label>교원/학생</label></td>
				<td><input type="radio" name="tableName" value="Professors">교원</input></td>
				<td><input type="radio" name="tableName" value="Student"  checked="checked">학생</input></td>
			</tr>
			<tr>
				<td><label for="userName">이름</label>
				<td colspan="2"><input type="text" name="userName" id="userName"></td>
			</tr>
			<tr>
				<td><label for="userEmail">이메일</label></td>
				<td colspan="2"><input type="email" name="userEmail" id="userEmail"></td>
			</tr>
		</table>	
		<br>
		
		<div class="btns" align="center">
			<button id="find-btn"  onclick="checkNull();">학번/교원번호 찾기</button>
		</div>

	</form>
</div>	
	<script type="text/javascript">
		function checkNull(){
			const userName = $("#userName");
			const userEmail= $("#userEmail");
			
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