<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<b>학번/교원번호 찾기</b>
	<br>
	
	<form id="findIdForm" action="<%= request.getContextPath() %>/findIdForm.us" method="post">
		<table>
			<tr>
				<td><label>교원/학생</label></td>
				<td><input type="radio" name="chkPs" value="Professors">교원</input></td>
				<td><input type="radio" name="chkPs" value="Student"  checked="checked">학생</input></td>
			</tr>
			<tr>
				<td><label>이름</label>
				<td><input type="text" name="userName" id="userName"></td>
			</tr>
			<tr>
				<td><label>이메일</label></td>
				<td><input type="email" name="userEmail" id="userEmail"></td>
			</tr>
		</table>
		
		<br>
		<br>
		
		<div class="btns" align="center">
			<button id="find-btn">학번/교원번호 찾기</button>
		</div>
	</form>
	
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
		}
		
		$(function(){
			$("#find-btn").click(function(){
				checkNull();
				$.ajax({
					url:"findId.us",
					data:{
						tableName : $("input[name='chkPs']:checked").val(),
						userName : $("#userName").val(),
						userEmail : $("#userEmail").val()
					},
					type:"post",
					success:function(){
						alert("해당 메일로 학번/교직원 번호가 전송되었습니다.");
					},
					error:function(){
						console.log("ajax 통신 실패");
					}
				});
			});
		})
	</script>
</body>
</html>