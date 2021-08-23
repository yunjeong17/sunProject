<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.sun.student.model.vo.Student"%>
<%
	ArrayList<Student> sList = (ArrayList<Student>)request.getAttribute("sList");
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
		
	table{
		font-size:14px;
		width: max-content ;
		height: max-content ;
		margin: auto;
	}

	#insert-table input{
		height:100%;
	}
	
	#consulting-table{
		margin-top:50px;
		margin-left:5%;
		width:90%;	
		border: 3px solid #00205b;
		border-collapse: collapse; 
	}
	
	header{
		font-size:14px;
	}
	
	div{
		font-size:14px;
	}

	#consulting-table  th {
	border: 1px solid white;
	background-color: #00205b;
	color: white;
	text-align:center;
	padding : 10px;
	}
	
	#insert-table #select-student{
		padding-right : 30px;
	}
	#consulting-table  td{
	border: 1px solid #00205b;
	background-color: white;
	color: #00205b;
	padding : 10px;
	}
	
	#consulting-table  tfoot{
		text-align:center;
	}
	
	.student-tr:hover{
		background:darkgrey;
		cursor:pointer
	}
	#insert-div{
		display:inline-block;
	}
	#content-div{
		text-align:center;
	}
	
	#delete-btn{
		visibility: hidden;
		display:none;
	}
	#update-btn{
		visibility: hidden;
		display:none;
	}
	h3{
		text-align:center;
	}
</style>
</head>
<body>

	<%@ include file="../../../views/common/menubar.jsp"%>

	<header id="select-div">
	<h3>상담</h3>

	
	</header>
	
	<div id="content-div">
	<div id="insert-div">
		<table id="insert-table">
			<tr>
				<td rowspan="4" id="select-student">
				
					<label>학생명 : </label>
					<select id="studentId">
						<%if( sList.isEmpty() ) {%>
							<option value="">학생 정보 없음</option>
						<%} else{%>
							<%for(Student s : sList){ %>
								<option value="<%=s.getUserId() %>" > <%=s.getUserName() %> (<%=s.getUserId() %>) </option>
							<%} %>
						<%} %>		
					</select>
					<button id="select-student-btn">선택</button>
			</td>
				<td><label for="consult-type" >상담 구분</label></td>
				<td><input type="text" id="consult-type" name="consult-category"  disabled/></td>
				<td rowspan="4"><label for="consult-content">상담 내용</label></td>
				<td rowspan="4"><textArea id="consult-content" name="consultContent" cols="50" rows="6" style="resize: none;" disabled></textArea></td>
				<td style="display: none;"><input type="hidden" id="consult-csNo"/></td>
			</tr>
			<tr>
				<td><label for="consult-time">상담 시간</label></td>
				<td><input type="text" id="consult-time" name="consult-time"  disabled/></td>
			</tr>
			<tr>
				<td><label for="consult-date">상담 날짜</label></td>
				<td><input type="text" id="consult-date" name="consult-date"  disabled/></td>
			</tr>
			<tr>
				<td><label for="consult-date">상담 방식</label></td>
				<td><input type="text" id="consult-way" name="consult-way"  disabled/></td>
			</tr>
		</table>
		<br>
		<button id="insert-btn" type="submit">추가</button>
		<button id="update-btn" type="submit">수정</button>
		<button id='delete-btn' type='submit'>삭제</button>
		<br>
	</div>
	<br>
	<table id="consulting-table">
		<thead>
			<tr>
				<th>순번</th>
				<th>상담 내용</th>
				<th>상담 날짜</th>
				<th>상담 방식</th>
				<th>상담 시간</th>
				<th>상담 구분</th>
			</tr>
		</thead>
		<tbody id="consultingListArea">
		</tbody>
		<tfoot>
			<tr>
			<td colspan="6"><button id="area-reset-btn">추가하기</button></td>
			</tr>
		</tfoot>
	</table>
	</div>
	
	
	<script>



	$(function(){
		$.datepicker.setDefaults($.datepicker.regional['ko']); 
	    $("#consult-date" ).datepicker({
	         changeMonth: true, 
	         changeYear: true,
	         nextText: '다음 달',
	         prevText: '이전 달', 
	         dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
	         dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
	         monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	         dateFormat: "yy-mm-dd",
	         maxDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
	         onClose: function( selectedDate ) {    
	         }    

	    });
	    
	    
		/*동적으로 생긴 버튼은 이런식으로 on을 써줘야함*/
		/* consulting 테이블의 row를 클릭했을때 이벤트 발생 */
		$(document).on("click",".consulting-tr",function(){
			
			$('#delete-btn').css('display','inline-block');
			$('#update-btn').css('display','inline-block');
			$('#insert-btn').css('display','none');
			
			$('#delete-btn').css('visibility','visible');
			$('#update-btn').css('visibility','visible');
			$('#insert-btn').css('visibility','hidden');
			
			const sId= $('#studentId').val();		
			const content =$(this).children().eq(1).text();
			const date = $(this).children().eq(2).text();
			const way = $(this).children().eq(3).text();
			const time = $(this).children().eq(4).text();
			const type = $(this).children().eq(5).text();
			const csNo=  $(this).children().eq(6).text();
			
			$("#consult-type").val(type);
			$("#consult-content").val(content);
			$("#consult-time").val(time);
			$("#consult-date").val(date);
			$("#consult-way").val(way);
			$("#consult-csNo").val(csNo);
			
 
		});

		
		/* 추가하기 버튼 눌렀을 때 */
		$("#area-reset-btn").click(function(){

			$('#delete-btn').css('display','none');
			$('#update-btn').css('display','none');
			$('#insert-btn').css('display','inline-block');
			
			$('#delete-btn').css('visibility','hidden');
			$('#update-btn').css('visibility','hidden');
			$('#insert-btn').css('visibility','visible');
			
			$("#consult-type").val("");
			$("#consult-content").val("");
			$("#consult-time").val("");
			$("#consult-date").val("");
			$("#consult-way").val("");
			$("#consult-csNo").val("");

			$("#consult-type").attr("disabled", false);
			$("#consult-content").attr("disabled", false);
			$("#consult-time").attr("disabled", false);
			$("#consult-date").attr("disabled", false);
			$("#consult-way").attr("disabled", false);
			
		})
		
		
		/* 추가 버튼 눌렀을때*/
		$("#insert-btn").click(function(){
			$.ajax({
				url:"insertConsulting.pr",
				data:{
					sId:$("#studentId").val(),
					type:$("#consult-type").val(),
					content:$("#consult-content").val(),
					time:$("#consult-time").val(),
					date:$("#consult-date").val(),
					way:$("#consult-way").val()
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
	
		
		
		/* 수정하기 버튼 눌렀을 때 */
		$("#update-btn").click(function(){
			
			$.ajax({
				url:"updateConsulting.pr",
				data:{
					sId:$("#studentId").val(),
					type:$("#consult-type").val(),
					content:$("#consult-content").val(),
					time:$("#consult-time").val(),
					date:$("#consult-date").val(),
					way:$("#consult-way").val(),
					csNo:$("#consult-csNo").val()
				},
				type:"post",
				success:function(){
					selectConsultingList();
					
					$("#consult-type").val("");
					$("#consult-content").val("");
					$("#consult-time").val("");
					$("#consult-date").val("");
					$("#consult-way").val("");
					$("#consult-csNo").val("");
					$("#consult-type").attr("disabled", true);
					$("#consult-content").attr("disabled", true);
					$("#consult-time").attr("disabled", true);
					$("#consult-date").attr("disabled", true);
					$("#consult-way").attr("disabled", true);
					
					alert("수정이 완료되었습니다.");
				},
				error:function(){
					console.log("ajax 통신 실패");
				}
			});
		});
	
		/* 삭제 버튼 눌렀을 때 */
		$("#delete-btn").click(function(){
			$.ajax({
				url:"deleteConsulting.pr",
				data:{
					csNo:$("#consult-csNo").val()
				},
				type:"post",
				success:function(){
					selectConsultingList();
					$("#consult-type").val("");
					$("#consult-content").val("");
					$("#consult-time").val("");
					$("#consult-date").val("");
					$("#consult-way").val("");
					$("#consult-csNo").val("");
					$("#consult-type").attr("disabled", true);
					$("#consult-content").attr("disabled", true);
					$("#consult-time").attr("disabled", true);
					$("#consult-date").attr("disabled", true);
					$("#consult-way").attr("disabled", true);
					alert("삭제가 완료되었습니다.");
				},
				error:function(){
					console.log("ajax 통신 실패");
				}
			});
		});
		
		
		
		/* 학생 선택 후 선택 버튼 클릭 시  */
		$("#select-student-btn").click(function(){
			$("#consult-type").val("");
			$("#consult-content").val("");
			$("#consult-time").val("");
			$("#consult-date").val("");
			$("#consult-way").val("");
			$("#consult-csNo").val("");
			
			$("#consult-type").attr("disabled", false);
			$("#consult-content").attr("disabled", false);
			$("#consult-time").attr("disabled", false);
			$("#consult-date").attr("disabled", false);
			$("#consult-way").attr("disabled", false);
			selectConsultingList();
		})
	
	})
	
	function selectConsultingList(){
		$("#consultingListArea").empty();
		$.ajax({
			url:"selectConsultingList.pr",
			data:{
				sId:$("#studentId").val()
			},
			type:"get",
			success:function(list){
				console.log(list);
				$.each(list, function(index, obj){
					const csNo= $("<td  class='no-td' style='visibility:hidden;display:none;position:absolute;'>").text(obj.csNo);
					const idx= $("<td  class='index-td'>").text(index+1);
					const date = $("<td  class='date-td'>").text(obj.csDate);
					const content = $("<td  class='content-td'>").text(obj.csContent);
					const time = $("<td  class='time-td'>").text(obj.csTime);
					const way = $("<td  class='way-td'>").text(obj.csWay);
					const type = $("<td  class='type-td'>").text(obj.csType);
					
					
					const tr = $("<tr class='consulting-tr'>").append(idx, content, date, way , time, type,csNo);
					$("#consultingListArea").append(tr);
					
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