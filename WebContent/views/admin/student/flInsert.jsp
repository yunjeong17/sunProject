<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Fluctuation</title>
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
	<br>
	<h4 align="center">학적 변동 사항 추가</h4>
	<hr>
	<div align="center">
		<form id="enrollForm" action="<%=request.getContextPath()%>/insert.fl"
			method="post">
			<table>
				<tr>	
					<td width="200px">학번 </td>
					<td width="200px"><input type="text" name="sId" required></input></td>
					<td  width="200px"><button type="button" id="idCheckBtn" onclick="checkId();">학생확인</button>
					</td>
				</tr>
				<tr>
					<td width="200px">식별번호</td>
					<td><input type="text" name="flNo" placeholder="정수만 입력"
						required></input></td>
				</tr>
				<tr>
					<td width="200px">변동사항</td>
					<td width="200px"><input type="text" name="flChange" required></input></td>
					<td></td>
				</tr>
				<tr>
					<td width="200px">변동사유</td>
					<td width="200px"><input type="text" name="flReason" required></input></td>
				</tr>

				<tr>
					<td width="200px">연도</td>
					<td width="200px"><input type="text" maxlength="4"
						name="flYear" placeholder="정수만 입력"></input></td>
				</tr>
				<tr>
					<td width="200px">학기</td>
					<td width="200px"><input type="text" maxlength="1"
						name="flSemester" placeholder="정수만 입력"></input></td>
				</tr>
			</table>
			<br>
			<div align="center">
				<button type="button" id="goMain" onclick="location.href='list.st'">학생목록</button>
				<button type="submit" id="joinBtn" disabled>추가하기</button>
			</div>
		</form>
	</div>
	<script>
	function checkId() {
				var userId = $("#enrollForm input[name=sId]");
				if (userId.val() == "") {
					alert("아이디를 입력해주세요.");
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
							if (confirm("존재하는 아이디입니다. 이 아이디에 학적을 추가하시겠습니까?")) {
								userId.attr("readonly", "true");
								$("#joinBtn").removeAttr("disabled");
							} else {
								userId.focus();
							}
						} else {
							alert("존재하지 않는 아이디입니다.");
							userId.focus();
							userId.val("");
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