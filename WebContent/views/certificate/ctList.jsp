<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.sun.student.model.vo.*"%>

<%
	ArrayList<Certificate> list = (ArrayList<Certificate>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Certificate List</title>
<style>
div {
	/*border: 1px solid red;*/
	box-sizing: border-box;
	display: block;
}
header {
	align: left;
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

tbody>td:hover{
	background: rgb(224, 224, 224);
	
}
</style>
</head>
<body>
	<!-- 학적조회 부분 포함:  -->
	<!-- 리스트, 수정, 삭제 -->
	<%@ include file="/views/common/menubar.jsp"%>
	<%--<%@ include file="/views/common/studentMenubar.jsp"%> --%>
	<br>
	<div class="wrap" align="center">
	<h5>행을 선택하면 해당 자격증 취득 내역을 삭제할 수 있습니다.</h5>
			<div align="right">
				<button id = "add "onclick="location.href='form.ct'"> + </button>
			</div>
		<table>
			<thead>
				<tr>
					<td class="head">순번</td>
					<!-- <td class="head">학번</td> -->
					<td class="head">자격명</td>
					<td class="head">발행처</td>
					<td class="head">취득일</td>
					<td class="head">첨부파일</td>
					<td class="head">식별번호</td>
				</tr>
			</thead>
			<tbody>
					<%
					if (list.isEmpty()) {
					%>

					<tr>
						<td colspan="6">존재하는 자격증 정보가 없습니다.</td>
					</tr>

					<%
					} else {
					%>
					<%
					for (Certificate ct : list) {
					%>
					<tr>
						<td><%=ct.getCfNo()%></td>
						<%--<td><%=ct.getsId()%></td>--%>
						<td><%=ct.getCfName()%></td>
						<td><%=ct.getCfIssue()%></td>
						<td><%=ct.getCfDate()%></td>
						<td><%=ct.getCfAttachment()%></td>
						<td><%=ct.getCfId()%></td>
					</tr>
					<%
					}
					%>
					<%
					}
					%>
				</tbody>
		</table>
		
		<script>
		$(document).ready(function() {
			$(function() {
				$("tbody>tr").click(function() {
					var cfNo = $(this).children().eq(0).text();
					location.href="<%=contextPath%>/remove.ct?cfNo="+cfNo;
				})
			})
		});
		</script>
	
	</div>


</body>
</html>