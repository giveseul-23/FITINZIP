<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	window.onload = function(){
		var start_year = "1930"; /* 시작할 년도 */
		var today = new Date();
		var today_year = today.getFullYear();
		var index = 0;
		for(var y = today_year; y >= start_year; y--) { /* start_year ~ 현재 년도 */
			document.getElementById('select_year').options[index] = new Option(y, y);
			index++;
		}
		index=0;
		
		for(var m = 1; m <= 12; m++) {
			document.getElementById('select_month').options[index] = new Option(m, m); 
		index++;
		}
			
		lastday();
	}
	function lastday() { /* 년과 월에 따라 마지막 일 구하기 */
		var Year = document.getElementById('select_year').value;
		var Month = document.getElementById('select_month').value;
		var day = new Date (new Date (Year, Month, 1) - 86400000).getDate();
		var dayindex_len=document.getElementById('select_day').length;
		if(day > dayindex_len) {
			for (var i = (dayindex_len + 1); i <= day; i++){
				document.getElementById('select_day').options[i-1] = new Option(i, i);
			}
		}
		else if (day < dayindex_len) {
			for (var i = dayindex_len; i >= day; i--){
				document.getElementById('select_day').options[i] = null;
			}
		}
		
		birth();
	}
	
	function birth() {
		var Year = document.getElementById('select_year').value;
		var Month = document.getElementById('select_month').value;
		var day = document.getElementById('select_day').value;
		if (Month < 10) { Month = "0" + Month; }
		if (Month < 10) { day = "0" + day; }
		document.getElementById('birth').value = Year + Month + day;
	}
	
</script>

<script>
	$(function(){
		$("#sendData").on("click", function () {
			
			var id = $("#id").val();
			var name = $("#name").val();
			var phone = $("#phone").val();
			var gender = $("#gender").val();
			var birth = $("#birth").val();
	
			var kakaoInfo = {
					"id" : id,
					"name" : name,
					"phone" : phone,
					"gender" : gender,
					"birth" : birth
			}
			
			$.ajax({
				anyne: true,
				url: "/kakaoJoin",
				method: "post",
				data: JSON.stringify(kakaoInfo),
				dataType: "text",
				success : function(data) {
			        alert("가입이 완료되었습니다.");
			        // 추카추카 페이지로가서 쿠폰을 발급합시다. 
			        location.href = "joinSuccess"
			    },
			    error : function(error) {
			    	alert("오류가 발생했습니다.\n고객센터로 문의해주세요.");
			    	// 메인으로 보내주세요 제발 
				}
			});
		});
	});
</script>


</head>
<body>
	<div class="page_title">
		<h2>추가정보입력</h2>
		<p>실시간 소통형<br>라이브 홈트레이닝 클래스 피클</p>
	</div>
	<div class="kakao-add">
	    <article class="clearfix mt50">
	        <div class="fl flat">
	        	<input type="checkbox" id="agreeA" name="agreeA" ref="agreeA">
        		<label for="agreeA">
	        		<span>
			        	<a href="/policy/agreement" target="_blank" class="btn_text">이용약관</a> 및
						<a href="/policy/policy_personal" target="_blank" class="btn_text">개인정보 처리방침</a> 동의
					</span>
				</label>
			</div>
   		</article>
    	<article class="clearfix mt5">
        	<div class="fl flat">
        		<input type="checkbox" id="agreeB" name="agreeB" ref="agreeB" @change="selectAllowSMS">
        		<label for="agreeB">
        	<span>이벤트 및 할인 소식 SMS수신 동의(선택)</span>
	        </label>
	        </div>
	    </article>
	    <form>
			<article>
				<div data-adarea="이름" class="form-box-input adClick">
					<input type="text" name="name" id="name" value="${vo.name }" class>
				</div>
				<div data-adarea="연락처" class="form-box-input adClick">
					<input type="text" name="phone" id="phone" placeholder="휴대폰번호 입력" class>
				</div>
				<div data-adarea="생년월일" class="form-box-input adClick">
					<select id="select_year" onchange="javascript:lastday();"></select>
					<select id="select_month" onchange="javascript:lastday();"></select>
					<select id="select_day"></select>
					<br/>
				</div>
				<input type="hidden" name="id" id="id" value="${vo.id }">
				<input type="hidden" name="gender" id="gender" value="${vo.gender }">
				<input type="hidden" name="birth" id="birth">
			</article>
			<article class="last-box mt30">
				<input class="btn_basic full" type="button" value="회원가입" id="sendData">
			</article>
		</form>
	</div>
</body>
</html>
