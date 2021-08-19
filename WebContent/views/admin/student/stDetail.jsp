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

#opposite, #oppositeSt{
	color: orchid;
}

form{
	margin:auto;
}
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp"%>
	<br>
	<h4 align="center">학생 정보 수정</h4>
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
		<div align="center" class="stButtons">
			<button onclick="history.go(-1)">학생 목록</button>
			<button onclick="location.href='delete.st'">학생 정보 삭제</button>
		</div>
		<div hidden="true" class="stUpdate" align="left" hidden="true" >
			<h4>학생 정보 수정하기</h4>
			<h5>
				학생 정보 수정을 원하지 않으시면 <b id="oppositeSt">여기</b>를 클릭하세요.
			</h5>
				<form  action="<%=contextPath%>/update.st" method="post">
					<label for="sId">학번 &nbsp;&nbsp; : &nbsp;&nbsp;</label> <input
						type="text" name="sId" placeholder="변경할 대상 학생의 학번" required></input> <label
						for="flNo"> &nbsp;&nbsp; 식별번호 &nbsp;&nbsp; : &nbsp;&nbsp;</label> <input
						type="text" maxlength="2" name="flNo" placeholder="변경할 학적의 식별번호" required></input> <label
						for="flChange">&nbsp;&nbsp; 변동사항 &nbsp;&nbsp; :
						&nbsp;&nbsp;</label> <input type="text" name="flChange" required></input>
					<label for="flReason">&nbsp;&nbsp; 변동사유 &nbsp;&nbsp; :
						&nbsp;&nbsp;</label> <input type="text" name="flReason" required></input>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="submit">수정하기</button>
				</form>
				<br><br>
			</div>
		
		
		<script>
		$(function() {
			$('.st>tr').click(function() {
				$('.stUpdate').show();
				$('.stButtons').hide();
				$('.flUpdate').hide();
			})
		})
		</script>
		<script>
			$(function() {
				$('#oppositeSt').click(function() {
					$('.stUpdate').hide();
					$('.stButtons').show();
				})
			})
		</script>
		
		<hr>
		
		<!-- 학적 -->

		<h4 align="center">학적 변동 사항 추가</h4>
		<h5 align="center">수정하고자 하는 학생을 선택하면 학적 정보 수정이 가능합니다.</h5>
		
		<div align="left" id="flDetail">
		<form action="<%=contextPath%>/insert.fl"
			method="post">
			<label for="flChange">변동사항 &nbsp;&nbsp; : &nbsp;&nbsp;</label> <input
				type="text" maxlength="10" name="flChange"></input> <label
				for="flReason">&nbsp;&nbsp; 변동사유 &nbsp;&nbsp; : &nbsp;&nbsp;</label>
			<input type="text" maxlength="10" name="flReason"></input> <label
				for="flYear">&nbsp;&nbsp; 연도 &nbsp;&nbsp; : &nbsp;&nbsp;</label> <input
				type="text" maxlength="10" name="flYear"></input> <label
				for="flSemester">&nbsp;&nbsp; 학기 &nbsp;&nbsp; : &nbsp;&nbsp;</label>
			<input type="text" maxlength="10" name="flSemester"></input>&nbsp;&nbsp;
			<button onclick="location.href='insert.fl'">추가하기</button>
		</form>
		</div>
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

		<div hidden="true" class="flUpdate" align="left">
			<br>
			<h4>학적 수정하기</h4>
			<h5>
				학적 수정을 원하지 않으시면 <b id="opposite">여기</b>를 클릭하세요.
			</h5>
				<form  action="<%=contextPath%>/update.fl" method="post">
					<label for="sId">학번 &nbsp;&nbsp; : &nbsp;&nbsp;</label> <input
						type="text" name="sId" placeholder="변경할 대상 학생의 학번" required></input> <label
						for="flNo"> &nbsp;&nbsp; 식별번호 &nbsp;&nbsp; : &nbsp;&nbsp;</label> <input
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
	<script>
		$(function() {
			$('.fl>tr').click(function() {
				$('.flUpdate').show();
				$('#flDetail').hide();
				$('.stUpdate').hide();
			})
		})
	</script>
	<script>
		$(function() {
			$('#opposite').click(function() {
				$('.flUpdate').hide();
				$('#flDetail').show();
				
			})
		})
	</script>
</body>
</html>