<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캘린더</title>
<script charset="UTF-8" src="https://cdn.jsdelivr.net/npm/fullcalendar@5.5.1/main.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="${path }/resources/main.min.css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/gcal.js"></script>
<script type="text/javascript">
	
	document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
	   	initialView: 'dayGridMonth',
		googleCalendarApiKey : 'AIzaSyAolCAndxuOM-aZnbCkElq-Nbh5151Hkl8', 
		/* header: { left: '', center: 'prev, title, next', 
		// right: 'month, basicWeek, agendaDay' 
		right: '' 
		}, 
		monthYearFormat: 'MMMM YYYY', 
		ventLimit: true, 
		fixedWeekCount: false, 
		defaultView: 'month', 
		dayNamesShort: ["S","M","T","W","T","F","S"],  */
		buttonText: { today : "오늘", month : "월별", week : "주별", day : "일별", }, 
		eventSources : // 한국 기념일 ko.south_korea 추가 
		[   
			{ googleCalendarId : 'kkulsevf1t2lua1kea39jrpvlg@group.calendar.google.com',
				className : 'user'
			}, 
			{ googleCalendarId : 'qansohiecib58ga9k1bmppvt5oi65b1q@import.calendar.google.com' ,
				className : 'ko_event', 
				color : '#d40000' 
			}
	    ],
	    events: 
	    	[
	    		{
	    			title: 'test',
	    			start: '2021-03-23'
	    		}
	    	]
    	});
    calendar.render();
	});
	
	function chkValue() {
		var arr = Request("Attendence");
		alert(arr);
	}
	
</script>
</head>
<body>
	
	<div>
		<h1>${ID } 님의 캘린더</h1>
		<div id='calendar'></div>
	</div>
	
	<div>
		<button onclick="chkValue()">값 확인</button>
	</div>
	
</body>
</html>