<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.sun.student.model.vo.*"%>
<%
Student st = (Student) request.getAttribute("st");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
       width: 1400px;
       margin: auto;
       margin-top: 50px;
	}
	th{
       background-color: rgb(3,33,89);
       color: white;
       border: 1px solid white;
       width:200px; 
		       
	}
	tr{
		height: 40px;
	}
	td {
		text-align: center;
		color: rgb(3,33,89);
		width:200px; 
	}
	ul li {
		list-style: none;
		float: left;
		line-height: 50px;
		vertical-align: middle;
		text-align: center;
		margin-left: 10%;
	}
	.category{
		aling:center;
		margin-left:200px;
		font-size:20px;
	}
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp"%>
	<br>
	<br>
	<div class="outer">
	<div class="wrap" align="center">
		<table border="1">
			<tr>
				<th style="text-align: center;">학번</th>
				<td><%=st.getUserId() %></td>
				<th style="text-align: center;">이름</th>
				<td><%=st.getcName() %></td>
				<th style="text-align: center;">학년</th>
				<td><%=st.getsLevel() %></td>
			</tr>
			<tr>
				<th style="text-align: center;">이메일</th>
				<%if(st.getSEmail()==null){ %>
					<td></td>
				<%}else{ %>
					<td><%=st.getSEmail() %></td>
				<%} %>
				<th style="text-align: center;">핸드폰번호</th>
				<%if(st.getSEmail()==null){ %>
					<td></td>
				<%}else{ %>
					<td><%=st.getSPhone() %></td>
				<%} %>
				<td colspan="2"></td>
			</tr>
			<tr>
				<th style="text-align: center;">학부</th>
				<td><%=st.getDeptName() %></td>
				<th style="text-align: center;">학과</th>
				<td><%=st.getcName() %></td>
				<th style="text-align: center;">지도교수</th>
				<td><%=st.getpName() %></td>
			</tr>
			<tr>
				<th style="text-align: center;">입학년도</th>
				<td><%=st.getSEDate() %></td>
				<th style="text-align: center;">이수학기</th>
				<td></td>
				<th style="text-align: center;">취득학점</th>
				<td><%=st.getSumCredit() %></td>
			</tr>
		</table>
	<br>
	<br>
	</div>
	<div class="category">
		<ul style="">
			<li onclick="idtheft();"><B><U>신상 정보</U></B></li>
			<li onclick="flucadjust()"><B><U>학적 변동</U></B></li>
			<li onclick="cHistory();"><B><U>수강 내역</U></B></li>
			<li onclick="certificate();"><B><U>자격증</U></B></li>
		</ul>
	
	</div>

	<script>
	function idtheft(){
		<%--location.href="<%=request.getContextPath()%>/stPersonal.save";--%>
		location.href="<%=request.getContextPath()%>/stPersonal.sel";
	}

	function flucadjust(){
		location.href="<%=request.getContextPath()%>/stpage.fl";
	}
	
	function cHistory(){
		location.href="<%=request.getContextPath()%>/stpage.ch";
	}
	
	function certificate(){
		location.href="<%=request.getContextPath()%>/ct.st";
	}

	</script>
</div>
</body>
</html>