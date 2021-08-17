<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, com.sun.classes.model.vo.Classes"%>
<%
	ArrayList<Classes> list = (ArrayList<Classes>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
</style>
</head>
<body>
	<%@ include file="../../../views/common/menubar.jsp"%>
	<h3>강의 목록 조회</h3>
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
		</thead>
		<tbody>
		</tbody>
	</table>
</body>
</html>