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
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/gcal.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="${path }/resources/main.min.css">
<script type="text/javascript">
	
	document.addEventListener('DOMContentLoaded', function() {
    	var calendarEl = document.getElementById('calendar');
    	var calendar = new FullCalendar.Calendar(calendarEl, {
	   		initialView: 'dayGridMonth',
	   		
	   		// 사용자 정의 버튼 생성
            customButtons: {
                myCustomButton: {
                  text: '출석하기',
                  click: function() {
                    $.ajax({
                    	url: 'setAttendance',
                    	dataType: 'json',
                    	success:function(result) {
                    		if(result.result == 'overlap'){
                    			alert("이미 출석하셨습니다");
                    		}else{
                    			alert("출석체크 완료!");
                    			calendar.refetchEvents();
                    		}
    					}
    				});
                  }
                }
             },
             // 버튼 등의 기능을 배치할 위치 지정
             headerToolbar: {
            	    left: 'prev,next today',
            	    center: 'title',
            	    right: 'myCustomButton'
           	},
           	
           	// google 캘린더 api 적용
			googleCalendarApiKey : 'AIzaSyAolCAndxuOM-aZnbCkElq-Nbh5151Hkl8',
			buttonText: { today : "오늘", month : "월별", week : "주별", day : "일별", }, 
			eventSources : 
				[   
					{ googleCalendarId : 'kkulsevf1t2lua1kea39jrpvlg@group.calendar.google.com',
						className : 'user'
					}, 
					{ googleCalendarId : 'qansohiecib58ga9k1bmppvt5oi65b1q@import.calendar.google.com',
						className : 'ko_event',
						color : '#d40000'
					}
	    		],
	    		
	    	// db에서 데이터를 가져와 캘린더에 출석 정보 표시
	    	events:function(info, successCallback, failureCallback){
            	$.ajax({
                	url: 'getAttendance',
                	dataType: 'json',
                	success:function(result) {
                		
                		var events = [];
                		
                        	if(result!=null){
                                
                        		$.each(result, function(index, element){
                        			var startdate = element.attendDate;
                        			
                        			events.push({
                        				customHtml: "<img src='resources/bg_etc.png' style='width:100%; height:100%;'>",
                        				start: startdate,
                        				display: 'background',
                        				backgroundColor: '#FFFFFF'
                        			});
                        		});
                        		
                             	console.log(events);
                        	}
                        	successCallback(events);
					}
				});
			},
			
			// 출석 도장 출력
            eventContent: function(eventInfo) {
            	console.log(eventInfo);
            	if(eventInfo.event.extendedProps.customHtml	 == "<img src='resources/bg_etc.png' style='width:100%; height:100%;'>"){
                	return { html: eventInfo.event.extendedProps.customHtml }
            	}
            }
		});
    		calendar.render();
	});
	
</script>
</head>
<body>
	
	<div>
		<h1>${ID } 님의 캘린더</h1>
		<div id='calendar'></div>
	</div>
	
</body>
</html>