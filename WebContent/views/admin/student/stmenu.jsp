<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.sun.student.model.vo.Student"%>
<%
	Student st = (Student)request.getAttribute("st");
	Student stp = (Student)request.getAttribute("stp");
	
	String emp="";

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
	.wrap{
		float:left;
		margin-left:100px;
	}
	h5{
		text-align:left;
	}
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp"%>
	<br>
	<br>
	<div class="outer">
	<div class="category">
		<ul style="">
			<li onclick="idtheft();"><B><U>신상 정보</U></B></li>
			<li onclick="flucadjust()"><B><U>학적 변동</U></B></li>
			<li onclick="cHistory();"><B><U>수강 내역</U></B></li>
			<li onclick="certificate();"><B><U>자격증</U></B></li>
		</ul>
	
	</div>
	<br><br><br>
	<div class="wrap" align="center">
	<h5><B>*학적조회</B></h5>	
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
				<th style="text-align: center;">취득학점</th>
				<td><%=st.getSumCredit() %></td>
				<td colspan="2"></td>
			</tr>
		</table>
		<br><br>
		<h5><B>*신상정보</B></h5>
		<table border="1">
		 <tr>
                <th style="text-align: center;">핸드폰번호</td>
                <%if(st.getsPhone()!=null){ %>
                	<td><%=st.getsPhone() %></td>
                <%}else{ %>
                	<td><%=emp %></td>
                <%} %>
                <th style="text-align: center;">이메일</td>
                 <%if(st.getsEmail()!=null){ %>
                	<td><%=st.getsEmail() %></td>
                <%}else{ %>
	                <td><%=emp %></td>
                <%} %>
                <th style="text-align: center;">병역</td>
                <%if(stp.getMilitary()!=null){ %>
                	<td><%=stp.getMilitary() %></td>
                <%}else{ %>
	                <td><%=emp %></td>
                <%} %>
        </tr>
	    <tr>
			<th style="text-align: center;">주소</td>
            <%if(stp.getAddress()!=null){ %>
                	<td><%=stp.getAddress() %></td>
                <%}else{ %>
		            <td colspan="5"><%=emp %></td>
                <%} %>
	    </tr>
		</table>
		<br><br>
		<h5><B>*계좌구분</B></h5>		 
		<table border="1">
		 <tr>
                <th style="text-align: center;">계좌번호</td>
                <%if(stp.getAccount()!=null){ %>
                	<td><%=stp.getAccount() %></td>
                <%}else{ %>
	                <td><%=emp %></td>
                <%} %>
                <th style="text-align: center;">은행명</td>
                <%if(stp.getBank()!=null){ %>
                	<td><%=stp.getBank() %></td>
                <%}else{ %>
	                <td><%=emp %></td>
                <%} %>
                <th style="text-align: center;">예금주</td>
                <%if(stp.getHolder()!=null){ %>
                	<td><%=stp.getHolder() %></td>
                <%}else{ %>
	                <td><%=emp %></td>
                <%} %>
        </tr>
		</table>
	<br>
	<br>
	<br>
	<br>
	</div>
	

	<script>
	function idtheft(){
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