<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sun.student.model.vo.Student"%>
<%
	Student per = (Student)request.getAttribute("per");
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
	.bor{
		margin-left:100px;
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
	.input{
		width:200px;
		height:40px;
	}
	#save{
		border-style: groove;
		border-radius: 10px;
		background: white;
		margin: left;
		float:right;
		width:80px;
		height:30px;
		
	}
</style>
</head>
<body>
<%@ include file="/views/admin/student/stmenu.jsp"%>
<div class="outer">
 	<div class="bor">
 	<br>
		<h5><B>*상세 신상정보</B></h5>		 
		<table border="1">
		 <tr>
                <th style="text-align: center;">핸드폰번호</td>
                <td><input type="text" class="input" id="phone" width="100px" value="<%=per.getsPhone() %>" ></td>
                <th style="text-align: center;">이메일</td>
                <td><input type="text" class="input" id="email" value="<%=per.getsEmail() %>"></td>
                <th style="text-align: center;">병역</td>
                <td><input type="text" class="input" id="military" value="<%=per.getMilitary() %>"></td>
        </tr>
	    <tr>
			<th style="text-align: center;">주소</td>
            <td colspan="5"><input type="text" id="address" style="width:1000px; height:40px" value="<%=per.getAddress() %>"></td>
	    </tr>
		</table>
		<h5><B>*계좌구분</B></h5>		 
		<table border="1">
		 <tr>
                <th style="text-align: center;">계좌번호</td>
                <td><input type="text" class="input" id="account" value="<%=per.getAccount() %>"></td>
                <th style="text-align: center;">은행명</td>
                <td><input type="text" class="input" id="bank" value="<%=per.getBank() %>"></td>
                <th style="text-align: center;">예금주</td>
                <td><input type="text" class="input" id="holder" value="<%=per.getHolder() %>"></td>
        </tr>
		</table>
		<button id="save" type="submit">저장</button>
	</div>
		<script>
			$("#save").click(function(){
				$.ajax({
					url:"stPersonal.save",
					data:{
						phone:$("#phone").val(),
						email:$("#email").val(),
						military:$("#military").val(),
						address:$("#address").val(),
						account:$("#account").val(),
						bank:$("#bank").val()
						holder:$("#holder").val()
					},
					type:"post",
					success:function(){
						selectConsultingList();
						alert("저장이 완료되었습니다.");
					},
					error:function(){
						console.log("ajax 통신 실패");
					}
				});
			});
		</script>
	<br>
	<br>
	<br>
</div>
</body>
</html>