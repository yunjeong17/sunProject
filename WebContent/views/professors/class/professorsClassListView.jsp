<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.sun.classes.model.vo.Classes"%>
<%
	ArrayList<Classes> list = (ArrayList<Classes>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
button {
	border-style: groove;
	border-radius: 10px;
	background: white;
	margin: left;
}
#class-table {
	margin-top: 50px;
	margin-left:5%;
	width: 90%;
	border: 3px solid #00205b;
	border-collapse: collapse; /* 내부 테두리 없애기 */
}

th {
	padding:30px;
	border: 1px solid white;
	background-color: #00205b;
	color: white;
}
td{
	padding:30px;
	border: 1px solid #00205b;
	background-color: white;
	color: #00205b;
}
#top-div{
text-align:center;

}
</style>
</head>
<body>
	<%@ include file="../../../views/common/menubar.jsp"%>
	<div id="top-div">
	<h3>강의</h3>
		<form id="searchClassForm" action="<%=contextPath%>/classList.pr" method="post">
			<label for="cName">강의명 : </label>
			<input type="text" maxlength="10" id="cName" name="cName"></input>
			<button id="search" onclick="location.href='classList.prr'">검색하기</button>
		</form>
	</div>
	<table id="class-table">
		<thead>
			<tr>
				<th>순번</th>
				<th>연도</th>
				<th>학기</th>
				<th>강좌명</th>
				<th>이수구분</th>
				<th>강의실</th>
			</tr>
		</thead>
		<tbody>
			<%if(list.isEmpty()){ %>
				<tr>
					<td colspan="6">조회된 강의가 없습니다.</td>
				</tr>
				<%}else{ %>
					<% for(Classes c : list){ %>
					<tr>
						<td><%= c.getClassNo() %></td>
						<td><%= c.getClassYear() %></td>
						<td><%= c.getClassSemester() %></td>
						<td><%= c.getClassName() %></td>
						<td><%= c.getClassTypeName()%></td>
						<td><%= c.getClassPlace() %></td>
					</tr>
					<%} %>
				<%} %>	
		</tbody>
	</table>
</body>
</html>