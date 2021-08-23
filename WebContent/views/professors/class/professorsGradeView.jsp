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
button {
	border-style: groove;
	border-radius: 10px;
	background: white;
	margin: left;
}
#student-table {
	margin-top: 50px;
	margin-left:5%;
	width: 90%;
	border: 3px solid #00205b;
	border-collapse: collapse; /* 내부 테두리 없애기 */
}

header{
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	background-color:white;
}

#content{
	padding-top:180px;
	margin-top:30px;
	margin-bottom:100px;
}

#footer-div{
	position:fixed;
    bottom:0;
    width:100%;
    height:70px;   
    background:white;
}

th {
	border: 1px solid white;
	background-color: #00205b;
	color: white;
	text-align:center;
}

td{
	padding:0;
	border: 1px solid #00205b;
	background-color: white;
	color: #00205b;
	height:100%;
}

input{
	border: 0; 
	margin:0;
	width:100%;
	height:100%;
}

input:focus{
     outline: none;
}

</style>
</head>
<body>
	<header>
	<%@ include file="../../../views/common/menubar.jsp"%>
	<h3>성적</h3>
	<div>
	<label>강의명 : </label>
	<select id="className" name="className">
		<%if(!classList.isEmpty()){ %>
			<%for(Classes c : classList){ %>
				<option value="<%= c.getClassNo() %>"><%= c.getClassName() %>(<%= c.getClassNo() %>)</option>
			<%} %>
		<%} else{%>
			<option value="">조회된 강의가 없습니다.</option>
		<%} %>
	</select>
	<button id="select-class-btn">선택</button>
	</div>
	</header>
	<div id="content">
		<table id="student-table">
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
	<div id="footer-div">
		<button id="save-btn">저장</button>
	</div>
	<script>
	let originMap= new Map();
	$(function(){
		
		/*저장버튼 눌렀을때*/
		$("#save-btn").click(function(){
			let chList=new Array();
			const trLength=	$("#student-table > tbody>tr").length;
			
			for(let i=1; i<=trLength;i++){
				let sId = $('#student-table>tbody>tr:nth-child('+i+')>td').eq(0).text();
				let cgPoint = $('#student-table>tbody>tr:nth-child('+i+')>td>.point-input').val();
				
				console.log(originMap.get(sId)!=cgPoint);
				console.log(originMap.get(sId)+"        "+cgPoint);
				
				if(originMap.get(sId)!=cgPoint){
					cgPoint= cgPoint!=""? cgPoint:"0";
					chList.push(sId+","+cgPoint);
				}
			}
			
			console.log("chList"+chList);
			
			$.ajax({
				url:"updatechList.pr",
				data:{
					chList:chList
				},
				type:"post",
				success:function(){
					selectchList();
					alert("저장이 완료되었습니다.");
				},
				error:function(){
					console.log("ajax 통신 실패");
				}
			});
			console.log(chList);
		});
		
		
		/* 검색 */
		$("#select-class-btn").click(function(){
			selectchList();
		})
		
	})
	
	/* 리스트 보여주는 function */
	function selectchList(){
		$("#classHistoryListArea").empty();
		$.ajax({
			url:"chList.pr",
			data:{
				cId:$("#className").val()
			},
			type:"get",
			success:function(list){
				var value="";
				
				$.each(list, function(index, obj){
					const sId = $("<td  class='sId-td'>").text(obj.sId);
					const sName = $("<td>").text(obj.sName);
					const cateName = $("<td>").text(obj.cateName);
					const cgPoint= $("<td>").append($("<input type='text'class='point-input'>").val(obj.cgPoint!=0?obj.cgPoint:""));
					const tr = $("<tr class='student-tr'>").append(sId, sName, cateName, cgPoint);
					originMap.set(obj.sId,obj.cgPoint);
					$("#classHistoryListArea").append(tr);
					
				});
			},
			error:function(){
				console.log("ajax 통신 실패");
			}
			
		})
	}
	
	</script>


</body>
</html>