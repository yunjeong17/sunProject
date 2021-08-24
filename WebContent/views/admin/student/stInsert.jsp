<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.sun.student.model.vo.*,com.sun.professors.model.vo.* "%>

<%
	ArrayList<Student> cList = (ArrayList<Student>)request.getAttribute("cList");	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Student</title>
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
	<h4 align="center">학생추가</h4>
	<hr>
	<div align="center">
		<form id="enrollForm" action="<%=request.getContextPath()%>/insert.st"
			method="post">
			<table>
				<tr>
					<td width="200px">학생번호</td>
					<td><input type="text" maxlength="10" name="userId" placeholder="2021101001" required></td>
					<td  width="200px"><button type="button" id="idCheckBtn" onclick="checkId();">중복확인</button>
					</td>
				</tr>
				<tr>
					<td width="200px">비밀번호</td>
					<td width="200px"><input type="text" maxlength="10" name="userPwd" required></td>
					<td></td>
				</tr>
				<tr>
					<td  width="200px">학생이름</td>
					<td  width="200px"><input type="text" name="userName" required></td>
				</tr>
				<tr>
				<td  width="200px">지도교수</td>
				<td  width="200px"><input type="text" name="pId" placeholder="교수 ID 입력" required></input> </td>
				<td width="200px"><button type="button" id="idCheckBtn" onclick="checkpId();">교수 확인</button></td>
				</tr>
					
					<tr>
						<td width="200px">학과</td>
						<td width="200px">
						<select id= "cNo" name="cNo">
						<% if(cList.isEmpty()){ %>
							<option value="">존재하는 학과번호가 없습니다.</option>
						<% }else{  %>
							<% for(Student st : cList){ %>
							 <option value="<%=st.getCNo() %>" selected><%=st.getcName()%></option>
							<% } %>
						<% } %>
						</select>
						</td>
					</tr>
				<tr>
					<td width="200px">학년</td>
					<td width="200px"><input type="text" name="sSLevel" maxlength='1' placeholder="1~6 사이의 숫자만 입력" required></td>
				</tr>
			</table>
			<br>
	<div align="center">
			<button type="button" id="goMain" onclick="history.go(-1)">뒤로가기</button>
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
					alert("학번을 입력해주세요.");
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
							alert("사용할 수 없는 학번입니다.");
							userId.focus();
							userId.val("");
						} else {
							if (confirm("사용할 수 있는 학번입니다. 사용하시겠습니까?")) {
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
			function checkpId() {
				var pId = $("#enrollForm input[name=pId]");
				if (pId.val() == "") {
					alert("교수 번호를 입력해주세요.");
					return false;
				}
				$.ajax({
					url : "pIdCheck.me",
					type : "post",
					data : {
						pId : pId.val()
					},
					success : function(result) {
						if (result == "fail") {
							if (confirm("존재하는 지도교수입니다. 사용하시겠습니까?")) {
								pId.attr("readonly", "true");
							//$("#joinBtn").removeAttr("disabled");
							} else {
								pId.focus();
							}
						} else {
							alert("존재하지 않는 지도교수입니다.");
							pId.focus();
							pId.val("");
							
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