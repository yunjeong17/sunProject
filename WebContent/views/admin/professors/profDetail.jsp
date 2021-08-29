<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.sun.professors.model.vo.*, java.util.*"%>
<%
Professors prof = (Professors) request.getAttribute("prof");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Professors Detail</title>
<style>
div {
	/*border: 1px solid red;*/
	box-sizing: border-box;
	display: block;
}

header {
	align: left;
}

nav {
	height: 5%;
}

nav {
	background-color: rgb(3, 33, 89);
	margin: 5px 0px;
}

nav>ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	height: 100%;
}

nav li {
	/*float: left;*/
	width: 20%;
	height: 100%;
	text-align: center;
	font-size: 18px;
	line-height: 35px;
	margin: left;
}

.wrap {
	width: 1200px;
	margin: auto;
}

.wrap>* {
	width: 100%;
}

table, .head, td {
	border: 1px rgb(2, 34, 89) solid
}

table {
	width: max-content height= max-content margin= auto
}

.head {
	background: rgb(2, 34, 89);
	color: white;
}

caption {
	padding: 0;
}

td {
	text-align: center;
	color: rgb(2, 34, 89);
}

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

label, input {
	color: rgb(2, 34, 89);
}

form{
	margin:auto;
}

 b:hover{
 	text-decoration : underline;
 }
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp"%>
	<br>
	<h4 align="center">교수 정보 수정</h4>
	<h5 align="center">교수 목록으로 돌아가시려면 <b id = "back" onclick="location.href='list.prof'"><mark>여기</mark></b>를 클릭하세요</h5>
	<div class="wrap" align="center">
		<table>
			<thead> 
				<tr>
					<td class="head">교번</td>
					<td class="head">이름</td>
					<td class="head">학과</td>
					<td class="head">전화번호</td>
					<td class="head">이메일</td>
					
				</tr>
			</thead>
			<tbody class = "prof">
				<%
				if (prof == null) {
				%>

				<tr>
					<td colspan="5">존재하는 교수가 없습니다.</td>
				</tr>

				<%
				} else {
				%>
				<tr>
					<td><%=prof.getUserId()%></td>
					<td><%=prof.getUserName()%></td>
					<td><%=prof.getcNo()%></td>
					<td><%=prof.getpPhone()%></td>
					<td><%=prof.getpEmail()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
		<br>
		
		<div class="profUpdate" align="left">
			<h4>교수 정보 수정하기</h4>
			<h5>
				교수 정보 삭제를 원하시면 <b id="oppositeProf"><mark>여기</mark></b>를 클릭하세요.
			</h5>
				<form  id="update" action="<%=contextPath%>/update.prof" method="post">
					<input type="text" name="userId" value="<%=prof.getUserId()%>" hidden="true"></input>
					<label for="pId">&nbsp;&nbsp; 지도교수 &nbsp;&nbsp; : &nbsp;&nbsp;</label><input
						type="text" name="pId" placeholder="교수 ID 입력" required></input> 
						&nbsp;&nbsp;
						<button type="button" id="idCheckBtn" onclick="checkId();">교수 확인</button>
						&nbsp;&nbsp;&nbsp;
					<button type="submit">수정하기</button>
				</form>
				<br><br>
			</div>
			
			<script>
			function checkId() {
				var pId = $("#update input[name=pId]");
				if (pId.val() == "") {
					alert("아이디를 입력해주세요.");
					return false;
				}
				$.ajax({
					url : "idcheck.prof",
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
		
		<hr>
		
			
		
		
		
		</div>
	</div>
			
			