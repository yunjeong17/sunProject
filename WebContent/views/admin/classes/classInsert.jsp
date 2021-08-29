<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.sun.classes.model.vo.*,com.sun.professors.model.vo.* "%>

<%
	ArrayList<Class> cList = (ArrayList<Class>)request.getAttribute("cList");	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Class</title>
<style>
button {
	/*color: white;*/
	border-style: groove;
	border-radius: 10px;
	background: white;
	margin: left;
}

button:hover {
	background: rgb(224, 224, 224);
	border-style: groove;
	border-radius: 10px;
}

.outer {
	background: white;
	width: 600px;
	height: 500px;
	margin-top: 50px;
	margin-left: auto;
	margin-right: auto;
	color: black;
}

#enrollForm {
	/* border:1px solid white; */
	width: 100%;
	margin-left: auto;
	margin-right: auto;
}

#enrollForm td:nth-child(1) {
	text-align: right;
}

#enrollForm input {
	margin: 3px;
}
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp"%>
	<br><br>
	<h4 align="center">강의추가</h4>
	<hr>
	<div align="center">
		<form id="enrollForm" action="<%=request.getContextPath()%>/insert.class"
			method="post">
			<table>
				<tr>
					<td width="200px">강의번호</td>
					<td><input type="text" maxlength="10" name="userId" required></td>
					<td  width="200px"><button type="button" id="idCheckBtn" onclick="checkId();">중복확인</button>
					</td>
				</tr>
				<tr>
					<td width="200px">강의명</td>
					<td width="200px"><input type="text" maxlength="10" name="userPwd" required></td>
					<td></td>
				</tr>
				<tr>
					<td  width="200px">강의실</td>
					<td  width="200px"><input type="text" name="userName" required></td>
				</tr>
					
					<tr>
						<td width="200px">강의타입</td>
						<td width="200px"><input type="text" name="cName" required></td>
						
						</td>
					</tr>
				<tr>
					<td width="200px">담당교수</td>
					<td width="200px"><input type="text" name="pEmail" required></td>
				</tr>
					<tr>
						<td width="200px">개설연도</td>
						<td width="200px"><input type="text" name="pEmail" required></td>
					</tr>
				<tr>
					<td width="200px">개설학기</td>
					<td width="200px"><input type="text" name="pEmail" required></td>
				</tr>
				
				
			</table>
			<br>
	<div align="center">
			<button type="button" id="goMain" onclick="history.go(-1)">강의목록</button>
			<button type="submit" id="joinBtn" disabled>추가하기</button>
	</div>
		</form>
	</div>
	<script>
		function joinValidate(){
				
				if(!(/^[a-z][a-z\d]{3,11}$/i.test($("#enrollForm input[name=userId]").val()))){
					$("#enrollForm input[name=userId]").focus();
			        return false;
				}
				
				if(!(/^[가-힣]{2,}$/.test($("#enrollForm input[name=userName]").val()))){
					 $("#enrollForm input[name=userName]").focus();
			        return false;
				 }
				 
				 return true;
						
			}
	
			function checkId() {
				var userId = $("#enrollForm input[name=userId]");
				if (userId.val() == "") {
					alert("강의번호를 입력해주세요.");
					return false;
				}
				$.ajax({
					url : "idCheck.me",
					type : "post",
					data : {
						userId : userId.val()
					},
					success : function(result) {
						if (result == "fail") {
							alert("사용할 수 없는 강의번호입니다.");
							userId.focus();
							userId.val("");
						} else {
							if (confirm("사용할 수 있는 강의번호입니다. 사용하시겠습니까?")) {
								userId.attr("readonly", "true");
								$("#joinBtn").removeAttr("disabled");
							} else {
								userId.focus();
							}

						}
					},
					error : function() {
						console.log("서버통신실패");
					},
				})
			}
		</script>
		
</body>
</html>