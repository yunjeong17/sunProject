<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.sun.student.model.vo.*"%>

<%
	ArrayList<Student> pList = (ArrayList<Student>)request.getAttribute("pList");	
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

#joinBtn {
	background: #63718b;
	color: white;
}

#goMain {
	background: #63718b;
	color: white;
}
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp"%>
	<br><br>
	<h4 align="center">학생추가</h4>
	<div align="center">
		<form id="enrollForm" action="<%=request.getContextPath()%>/insert.st"
			method="post">
			<table>
				<tr>
					<td width="200px">학생번호</td>
					<td><input type="text" maxlength="10" name="userId" required></td>
					<td width="200px">
						<button type="button" id="idCheckBtn" onclick="checkId();">중복확인</button>
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="text" maxlength="10" name="userPwd" required></td>
					<td></td>
				</tr>
				<tr>
					<td>학생이름</td>
					<td><input type="text" name="userName"></td>
				</tr>
					<tr>
						<td>담당교원</td>
						<% if(pList.isEmpty()){ %>
							<td>존재하는 교원이 없습니다.</td>
						<% }else{  %>
						
							<% for(Student st : pList){ %>
							<td><%=st.getPId()%></td>
							<td><%=st.getpName()%></td>
							<%--
						<select name="pId">
						 <option value="<%=st.getPId() %>" selected><%=st.getpName()%></option>
						 </select> --%>
							<% } %>
						
						<% } %>
					</tr>
					<tr>
						<td>학과번호</td>
						<% if(cList.isEmpty()){ %>
							<td>존재하는 학번이 없습니다.</td>
						<% }else{  %>
							<% for(Student st : cList){ %>
							<td><%=st.getCNo()%></td>
							<td><%=st.getcName()%></td>
							<%--
						<select name="cNo">
						 <option value="<%=st.getCNo() %>" selected><%=st.getcName()%></option>
						 </select> --%>
							<% } %>
						<% } %>
					</tr>
				<tr>
					<td>학년</td>
					<td><input type="text" name="sSLevel"></td>
				</tr>
			</table>
			<br>

			<button type="button" id="goMain" onclick="history.go(-1)">학생목록</button>
			<button type="submit" id="joinBtn" disabled>추가하기</button>
		</form>
	</div>
	<script>
			function checkId() {
				var userId = $("#enrollForm input[name=userId]");
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
							alert("사용할 수 없는 아이디입니다.");
							userId.focus();
							userId.val("");
						} else {
							if (confirm("사용할 수 있는 아이디입니다. 사용하시겠습니까?")) {
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