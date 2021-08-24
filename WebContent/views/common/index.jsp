<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/92a9092640.js" crossorigin="anonymous"></script>
<style>
	body{
		background-image:url('resources/images/sunUniBackground.png');
		background-repeat:no-repat;
		background-size:cover;
	}
	.outer{
		display: inline-block;
		margin-left:100px;
		width:1200px;
		height:900px;	
	}
	#map{
		margin-top: 80px;
		margin-right: 100px;
		margin-left:200px;
		float: left;
		border: 2px solid gray;
	}
	.weather{
		width: 300px;
		display: inline-block;
		margin-top: 100px;
		background-color: skyblue;
		border-radius: 2em;
		
	}
	.icon{
		margin-top:10px;
		text-align: center;
	}
	.time{
		margin-bottom:20px;
		text-align: center;
		color:white;
		font-weight:900;
		font-size:20px;
	}
	.ctemp{
		margin-bottom:20px;	
		text-align: center;
		margin-left:180px;
		margin-bottom:20px;
		color:white;
		font-weight:900;
		font-size:20px;
	}
	.wayToCome{
		border: 2px solid gray;	
		margin-left:200px;
		width:550px;
		height:280px;
		float: left;
		background-color: #f0f8ff;
	}
	.cal{
		margin-top:200px;
		font-size:20px;
	}
	
</style>
</head>
<body>
	<div class="outer">
		<div class="division"> 
			<div id="map" style="width:550px;height:500px;"></div>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c019dd9a3a4c3ef858ee36d226914efc"></script>
			<script>
				var mapContainer = document.getElementById('map'),
				    mapOption = { 
				        center: new kakao.maps.LatLng(36.3688296, 127.3446797),
				        level: 6 
				    };
				
				var map = new kakao.maps.Map(mapContainer, mapOption); 
				 
				var points = [
				    new kakao.maps.LatLng(36.3688296, 127.3446797),
				];
				
				var bounds = new kakao.maps.LatLngBounds();    
				
				var i, marker;
				for (i = 0; i < points.length; i++) {
				    marker =     new kakao.maps.Marker({ position : points[i] });
				    marker.setMap(map);
				    
				    bounds.extend(points[i]);
				}
				
				function setBounds() {
				    map.setBounds(bounds);
				}
			</script>
			<div class="wayToCome">
				<br>
				<h5 style="text-decoration: underline overline 2px; text-underline-position: under; text-decoration-color: navy; color: navy;">
				&nbsp;&nbsp; <strong>찾아오시는 길</strong>&nbsp;&nbsp;</h5>
				&nbsp;&nbsp;> 주소 : (34134) 대전광역시 유성구 대학로99 충남대학교 (궁동 220)<br>
				&nbsp;&nbsp;> 전화 : 042-821-5114<br><br>
				<br>
				
				<h5 style="text-decoration: underline overline 2px; text-underline-position: under; text-decoration-color: navy; color: navy;">
				&nbsp;&nbsp; <strong>교통편 안내</strong>&nbsp;&nbsp;</h5>
				&nbsp;&nbsp;> <strong>[지하철 : 유성온천역 하차 7번출구 이용]</strong><br>
				&nbsp;&nbsp;택시 또는 순환버스 이용<br>
				&nbsp;&nbsp;> <strong>[시내버스 유성온천역 경유]</strong><br>
				&nbsp;&nbsp;교내 진입 48 / 정문 101, 105, 106, 113/ 서문 704, 911 / 동문(농업생명과학대학) 105, 115<br><br>
			</div>
		</div>
		
		<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
		<div class="division">
			<div class="weather">
				<div class="icon" ></div><!-- <img alt="" src="http://openweathermap.org/img/wn/10d@2x.png"> -->
				<div class="time"><br> </div>
				<div class="ctemp"> </div>
			</div>
			<div class="cal">
			<script type="text/javascript">
		        var today = new Date();
		        var date = new Date();
		        
		        function prevCalendar() {
		         today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
		         buildCalendar();
		        }
		 
		        function nextCalendar() {
		             today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
		             buildCalendar();
		        }
		        function buildCalendar(){
		            var doMonth = new Date(today.getFullYear(),today.getMonth(),1);
		            
		            var lastDate = new Date(today.getFullYear(),today.getMonth()+1,0);
		           
		            var tbCalendar = document.getElementById("calendar");
		            var tbCalendarYM = document.getElementById("tbCalendarYM");
		           
		            tbCalendarYM.innerHTML = today.getFullYear() + "년 " + (today.getMonth() + 1) + "월"; 
		 
		            while (tbCalendar.rows.length > 2) {
		                  tbCalendar.deleteRow(tbCalendar.rows.length-1);
		             }
		             var row = null;
		             row = tbCalendar.insertRow();
		
		             var cnt = 0;
		
		             for (i=0; i<doMonth.getDay(); i++) {
		                  cell = row.insertCell();
		                  cnt = cnt + 1;
		             }
		
		             for (i=1; i<=lastDate.getDate(); i++) { 
		                  cell = row.insertCell();
		                  cell.innerHTML = i;
		                  cnt = cnt + 1;
		              if (cnt % 7 == 1) {
		                cell.innerHTML = "<font color=red>" + i
		            }    
		              if (cnt%7 == 0){
		                  cell.innerHTML = "<font color=red>" + i
		                   row = calendar.insertRow();
		              }
		              if (today.getFullYear() == date.getFullYear()
		                 && today.getMonth() == date.getMonth()
		                 && i == date.getDate()) {
		                cell.bgColor = "#FAF58C";
		               }
		             }
		        }
		    </script>
	   	 	<p></p>
			<table id="calendar" align="center">
			    <tr>
			        <td><label onclick="prevCalendar()"><</label></td>
			        <td align="center" id="tbCalendarYM" colspan="5">yyyy년 m월</td>
			        <td><label onclick="nextCalendar()">></label></td>
			    </tr>
			    <tr>
			        <td align="center"><font color ="red">일</td>
			        <td align="center">월</td>
			        <td align="center">화</td>
			        <td align="center">수</td>
			        <td align="center">목</td>
			        <td align="center">금</td>
			        <td align="center"><font color ="red">토</td>
			    </tr> 
			</table>
			<script language="javascript" type="text/javascript">
		   	 	buildCalendar();
			</script>
			</div>
		</div>
		
		<script>
			$.getJSON('http://api.openweathermap.org/data/2.5/weather?q=Daejeon&APPID=f46d2b55a8b012ccb8136dfcce652893&units=metric' ,function(result){
			
			$('.ctemp').append(result.main.temp+' º');
			//result.weather[0].icon
			var wIconUrl = '<img alt="'+result.weather[0].description+'" src="http://openweathermap.org/img/wn/'+result.weather[0].icon+'@2x.png">'
			$('.icon').html(wIconUrl);
			var ct = result.dt;
			function convertTime(t){
				var ot = new Date(t*1000);
				
				return ot.toLocaleString();
			}
			
			var currentTime = convertTime(ct);
			$('.time').append(currentTime);
			});
		</script>
 	</div>
 	
</body>
</html>