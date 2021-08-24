<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"  import="java.util.*,com.sun.student.model.vo.*"%>
<%
Student st = (Student) request.getAttribute("st");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

nav{
            background-color:rgb(2, 34, 89);
            margin:5px 0px;
        }
        nav>ul{
            list-style-type: none;
            margin:0;
            padding:0;
            height:100%;
        }
        nav li{
            float:left;
            width:15%;
            height:100%;
            text-align:center;
            font-size:18px;
            line-height:35px;
        }
       nav li a{
            text-decoration:none;
            color:white;
        }
        nav li:hover{
              color: #092d70;
            background-color: white;
            text-decoration:underline;

        }
.heda{
   }
</style>
</head>
<body>
<%@ include file="/views/common/menubar.jsp"%>	
		<br><br>
		  <div class="wrap">
		
		<table border="2">		 
		 <tr>
                <td class="head">학번</td>
                <td><%=st.getUserId()%></td>
               <!-- <td></td>-->
                <!-- <td></td>-->
                <td class="head">이메일</td>
                <td><%=st.getSEmail()%></td>
        </tr>
		    <tr>
				<td class="head">이름</td>
				<td><%=st.getUserName()%></td>
				<!--<td>휴학학기</td>
				 <td></td>-->
				<td class="head">핸드폰 번호</td>
				<td><%=st.getSPhone()%></td>
		    </tr>
		     <tr>
				<td class="head">학부</td>
				<td><%=st.getCNo()%></td>
				<td class="head">입학일</td>
				<td><%=st.getSEDate()%></td>
		    </tr>
		     <tr>
				<td class="head">학년</td>
				<td><%=st.getsLevel()%></td>
				<td class="head">지도 교수</td>
				<td><%=st.getPId()%></td>
			<!-- <td></td>-->
			<!-- <td></td>-->
		    </tr>
		     <!--  <tr>
				<td></td>
				<td></td>
				<td>입학년도(과정년도)</td>
				<td></td>
				<td></td>
				<td></td>
		    </tr>
		    <tr>
				<td></td>
				<td></td>
				<td>취득 학점</td>
				<td></td>
				<td></td>
				<td></td>
		    </tr>-->
		
		</table>
		</div>		
		
		
	    
	<br><br>
	<nav class="menu2">
            <ul>
                <li onclick="idtheft();">신상 정보</li>
                <li onclick="flucadjust()">학적 변동</li>             
                <li onclick="cHistory();">수강 내역</li>
                <li onclick="certificate();">자격증</li> 
            </ul>
    </nav>			
	<script>
	function idtheft(){
		location.href="<%=request.getContextPath()%>/StPersonal";
	}

	function flucadjust(){
		location.href="<%=request.getContextPath()%>/StAcademicFluctuations";
	}
	
	function cHistory(){
		location.href="<%=request.getContextPath()%>/StCourseHistory";
	}
	
	function certificate(){
		location.href="<%=request.getContextPath()%>/StCertificate";
	}

	
	</script>


</body>
</html>