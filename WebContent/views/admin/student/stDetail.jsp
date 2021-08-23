<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.sun.student.model.vo.*, java.util.*"%>
<%
Student st = (Student) request.getAttribute("st");
ArrayList<Fluctuation> fl = (ArrayList<Fluctuation>) request.getAttribute("fl");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Detail</title>
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
	<h4 align="center">학생 정보 수정</h4>
	<h5 align="center">학생 목록으로 돌아가시려면 <b id = "back" onclick="location.href='list.st'"><mark>여기</mark></b>를 클릭하세요</h5>
	<div class="wrap" align="center">
		<table>
			<thead> 
				<tr>
					<td class="head">학번</td>
					<td class="head">이름</td>
					<td class="head">학년</td>
					<td class="head">학과</td>
					<td class="head">학부</td>
					<td class="head">지도교수</td>
				</tr>
			</thead>
			<tbody class = "st">
				<%
				if (st == null) {
				%>

				<tr>
					<td colspan="6">존재하는 학생이 없습니다.</td>
				</tr>

				<%
				} else {
				%>
				<tr>
					<td><%=st.getUserId()%></td>
					<td><%=st.getUserName()%></td>
					<td><%=st.getsLevel()%>학년</td>
					<td><%=st.getcName()%></td>
					<td><%=st.getDeptName()%></td>
					<td><%=st.getpName()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
		<br>
		<div class="stUpdate" align="left">
			<h4>학생 정보 수정하기</h4>
				<form  id="update" action="<%=contextPath%>/update.st" method="post">
					<input type="text" name="userId" value="<%=st.getUserId()%>" hidden="true"></input>
					<label for="pId">&nbsp;&nbsp; 지도교수 &nbsp;&nbsp; : &nbsp;&nbsp;</label><input
						type="text" name="pId" placeholder="교수 ID 입력" required></input> 
						&nbsp;&nbsp;
						<button type="button" id="idCheckBtn" onclick="checkId();">교수 확인</button>
						&nbsp;&nbsp;&nbsp;
					<button type="submit">수정하기</button>
				</form>
		<br>
			<h4>학생 정보 삭제</h4>
				<form id="delete" action="<%=contextPath%>/delete.st" method="post">
					<input type="text" name="userId" value="<%=st.getUserId()%>" hidden="true"></input>
					&nbsp;&nbsp; 위 학생 정보를 삭제하시려면 <button type="button" id="deleteBtn" onclick="deleteStudent();">삭제하기</button> 를 눌러주세요.
				</form>
				</div>
				<br><br>
		
		<script type="text/javascript">		
		function deleteStudent(){
			
				var val = confirm("정말 삭제하시겠습니까?");
				
				if(val){
					location.href="<%=request.getContextPath()%>/delete.st";
				}
		}

		</script>
			
		<script>
		function checkId() {
				var pId = $("#update input[name=pId]");
				if (pId.val() == "") {
					alert("아이디를 입력해주세요.");
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
		
		<hr>
		
		<!-- 학적 -->
		<h4 align="center">학적 변동 사항 수정</h4>
		<br>
		<table>
			<thead>
				<tr>
					<td class="head">식별번호</td>
					<td class="head">학번</td>
					<td class="head">변동사항</td>
					<td class="head">변동사유</td>
					<td class="head">연도</td>
					<td class="head">학기</td>
					<td class="head">변동일자</td>
				</tr>
			</thead>
			<tbody class="fl">
				<%
				if (fl == null) {
				%>
				<tr>
					<td colspan="7">존재하는 학적 변동 사항이 없습니다.</td>
				</tr>
				<%
				} else {
				%>
				<%
				for (Fluctuation all : fl) {
				%>
				<tr>
					<td><%=all.getFlNo()%></td>
					<td><%=all.getsId()%></td>
					<td><%=all.getFlChange()%></td>
					<td><%=all.getFlReason()%></td>
					<td><%=all.getFlYear()%></td>
					<td><%=all.getFlSemester()%></td>
					<td><%=all.getFlDate()%></td>
				</tr>
				<%
				}
				%>
				<%
				}
				%>
			</tbody>
		</table>

		<div class="flUpdate" align="left">
			<br>
			<h4>학적 수정하기</h4>
			<h5>
				학적 추가를 원하시면 <b onclick= "location.href='form.fl'"><mark>여기</mark></b>를 클릭하세요.
			</h5>
				<form  action="<%=contextPath%>/update.fl" method="post">
					<input type="text" name="getsId" value="<%=st.getUserId()%>" hidden="true"></input>
						<label for="flNo"> &nbsp;&nbsp; 식별번호 &nbsp;&nbsp; : &nbsp;&nbsp;</label> <input
						type="text" maxlength="2" name="flNo" placeholder="변경할 학적의 식별번호" required></input> <label
						for="flChange">&nbsp;&nbsp; 변동사항 &nbsp;&nbsp; :
						&nbsp;&nbsp;</label> <input type="text" name="flChange" required></input>
					<label for="flReason">&nbsp;&nbsp; 변동사유 &nbsp;&nbsp; :
						&nbsp;&nbsp;</label> <input type="text" name="flReason" required></input>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="submit">수정하기</button>
				</form>
			</div>
		</div>
		<br><br>
</body>
</html>