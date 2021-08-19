<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" 
	import="java.util.ArrayList,com.sun.classes.model.vo.Classes" %>
<%	
	ArrayList<Classes> classList = (ArrayList<Classes>)request.getAttribute("classList");
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
	<div>
	<select id="className" name="className">
		<%if(!classList.isEmpty()){ %>
			<%for(Classes c : classList){ %>
				<option value="<%= c.getClassNo() %>"><%= c.getClassName() %></option>
			<%} %>
		<%} else{%>
			<option value="">조회된 강의가 없습니다.</option>
		<%} %>
	</select>
	<button id="select-class-btn">선택</button>
	</div>
	<div>
		<table id="class-table">
		<thead>
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>학과명</th>
				<th>성적</th>
			</tr>
		</thead>
		<tbody id="classHistoryListArea">
		</tbody>
	</table>
	</div>
	
	<script>
	$(function(){
		$("#select-class-btn").click( function(){
			$("#classHistoryListArea").empty();
			$.ajax({
				url:"chList.pr",
				data:{
					cId:$("#className").val()
				},
				type:"get",
				success:function(list){
					console.log(list);
					var value="";
					$.each(list, function(index, obj){
						var sId = $("<td>").text(obj.sId);
						var sName = $("<td>").text(obj.sName);
						var cateName = $("<td>").text(obj.cateName);
						var cgPoint= $("<td>").text(obj.cgPoint);
						var tr = $("<tr>").append(sId, sName, cateName, cgPoint);
						
						$("#classHistoryListArea").append(tr);
						
					});
				},
				error:function(){
					console.log("ajax 통신 실패");
				}
				
			})
		})
	})

	</script>


</body>
</html>