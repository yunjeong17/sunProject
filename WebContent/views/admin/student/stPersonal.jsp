<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
		width: 1400px;
		margin: auto;
	    margin-top: 25px;
	}
	.bor{
		margin-left:50px;
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
	
	h4, h6{
		margin-right : 100px;
	}
	
	.btn{
			margin-left : 1100px;
	
	}
</style>
</head>
<body>
<%@ include file="/views/common/menubar.jsp"%>
<div class="outer">
 	<div class="bor">
 	 	<br>
		<form id="enrollForm" action="<%=request.getContextPath()%>/stPersonal.save" method="post">
		<h4 align="center">신상 정보 등록 페이지</h4>
		<h6 align="center"><b id = "back" onclick="history.go(-1)"><mark>여기</mark></b>를 클릭하시면 이전 화면으로 돌아갑니다.</h6>
		<h5><B>*상세 신상정보</B></h5>		 
		<table border="1">
		 <tr>
                <th class="head" style="text-align: center;">핸드폰번호</th>
                <td><input type="text" class="input" name="phone" width="100px" required></td>
                <th class="head"   style="text-align: center;">이메일</th>
                <td><input type="email" class="input" name="email" required></td>
                <th class="head"  style="text-align: center;">병역</th>
                <td><input type="text" class="input" name="military" required></td>
        </tr>
	    <tr>
			<th class="head"  style="text-align: center;">주소</th>
            <td colspan="5"><input type="text" name="address"  maxlength= "20" style="width:1000px; height:40px" placeholder="구까지만 간단히 적으시오." required></td>
	    </tr>
		</table>
		<h5><B>*계좌구분</B></h5>		 
		<table border="1">
		 <tr>
                <th class="head"  style="text-align: center;">계좌번호</th>
                <td><input type="text" class="input" name="account" required></td>
                <th class="head"  style="text-align: center;">은행명</th>
                <td><input type="text" class="input" name="bank" required></td>
                <th class="head"  style="text-align: center;">예금주</th>
                <td><input type="text" class="input" name="holder" required></td>
        </tr>
		</table>
		<div class="btn" >
				<button id="save" type="submit">등록하기</button>
		</div>
		</form>
		
	</div>
	<%--
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
		</script> --%>
	</div>
	<br>
	<br>
</body>
</html>