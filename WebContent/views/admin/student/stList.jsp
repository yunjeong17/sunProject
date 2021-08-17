<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.sun.student.model.vo.*"%>
<%
	ArrayList<Student> list = (ArrayList<Student>)request.getAttribute("list");	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage= pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage=pi.getStartPage();
	int endPage=pi.getEndPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Students Information</title>
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
	width: 1000px;
	margin: auto;
}

.wrap>* {
	width: 100%;
}

table, .head, td {
	border: 1px black solid
}

table {
	width: max-content height= max-content margin= auto
}

.head {
	background: rgb(224, 224, 224)
}

caption {
	padding: 0;
	text-align: left;
}

td {
	text-align: center;
}
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp"%>
	<br>
	<div class="wrap" align="center">
		<table>
			<caption>학생 목록</caption>
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
			<tbody>
				<% if(list.isEmpty()){ %>

				<tr>
					<td colspan="6">존재하는 학생이 없습니다.</td>
				</tr>

				<% }else{  %>
				<% for(Student st : list){ %>
				<tr>
					<td><%=st.getUserId() %></td>
					<td><%=st.getUserName() %></td>
					<td><%=st.getsLevel() %>학년</td>
					<td><%=st.getcName() %></td>
					<td><%=st.getDeptName() %></td>
					<td><%=st.getpName() %></td>
				</tr>
				<% } %>
				<% } %>
			</tbody>
		</table>
	</div>

	<br>

	<!-- 페이징바 만들기 -->
	<div class="pagingArea" align="center">
		<!-- 맨 처음으로 (<<) -->
		<button
			onclick="location.href='<%=contextPath%>/list.st?currentPage=1'">
			&lt;&lt;</button>

		<!-- 이전페이지로(<) -->
		<%if(currentPage == 1){ %>
		<button disabled>&lt;</button>
		<%}else{ %>
		<button
			onclick="location.href='<%= contextPath %>/list.st?currentPage=<%= currentPage-1 %>'">
			&lt;</button>
		<%} %>

		<!-- 페이지 목록 -->
		<%for(int p=startPage; p<=endPage; p++){ %>

		<%if(p == currentPage){ %>
		<button disabled>
			<%= p %>
		</button>
		<%}else{ %>
		<button
			onclick="location.href='<%=contextPath %>/list.st?currentPage=<%= p %>'">
			<%= p %>
		</button>
		<%} %>

		<%} %>

		<!-- 다음페이지로(>) -->
		<%if(currentPage == maxPage){ %>
		<button disabled>&gt;</button>
		<%}else { %>
		<button
			onclick="location.href='<%= contextPath %>/list.st?currentPage=<%= currentPage+1 %>'">
			&gt;</button>
		<%} %>

		<!-- 맨 끝으로 (>>) -->
		<button
			onclick="location.href='<%=contextPath%>/list.st?currentPage=<%=maxPage%>'">
			&gt;&gt;</button>
	</div>
	<br>
	<br>
	<div align="center">
		<%-- if(loginUser != null){ --%>
		<button onclick="location.href='insert.st'">학생 추가</button>
		<button onclick="search();">학번으로 검색</button>
		<%-- } --%>
	</div>
	<script type="text/javascript">
		<%if(! list.isEmpty()){%>
			$(function(){
				$(".listArea>tbody>tr").click(function(){
					var bno = $(this).children().eq(0).text();
				})
			});
		<%}%>
	
	</script>
	
	<script>
		function search(){
			var search = prompt("검색하실 학번을 입력하세요.");
		}
	</script>
</body>
</html>