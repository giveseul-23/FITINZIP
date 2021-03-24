<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/login/join.css">

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
</head>
<body>
	<section class="join_wrap" v-else>
		<div class="contents">
			<div class="page_title">
                <h2 v-if="isEmail">이메일로 회원가입</h2>
				<p>실시간 소통형<br>라이브 홈트레이닝 클래스 FITIN.ZIP</p>
            </div>
            <div class="step1">
                <article>
                	<div data-adarea="피클_이메일입력" class="form-box-input adClick">
                		<input type="text" name="socialEmail" placeholder="이메일 입력" class>
                		<div class="myform_box">
                			<span class="clear"></span>
                		</div>
                		<div class="info-msg">
                			<label class="error">
                				<span class="msg-box error" style="display: none;"></span>
                			</label>
                		</div>
                	</div>
                	<div data-adarea="피클_비밀번호입력" class="form-box-input adClick">
                		<input type="password" name="userPassword" required="required" placeholder="비밀번호 입력(10자 이상 영문/숫자/특수문자 조합)" maxlength="20" class>
                	</div>
                	<div data-adarea="피클_비밀번호확인" class="form-box-input adClick">
                		<input type="password" name="userPasswordCheck" required="required" placeholder="비밀번호 확인" maxlength="20" class>
                	</div>
                	<div data-adarea="이름" class="form-box-input adClick">
					<input type="text" name="name" id="name" placeholder="이름(실명으로 입력)" class>
					</div>
					<div data-adarea="연락처" class="form-box-input adClick">
						<input type="text" name="phone" id="phone" placeholder="휴대폰번호 입력" class>
					</div>
					<div data-adarea="생년월일" class="form-box-input adClick">
						<div class="btn_search type5">
							<select id="select_year" onchange="javascript:lastday();"></select>
						</div>
						<div class="btn_search type5">
							<select id="select_month" onchange="javascript:lastday();"></select>
						</div>
						<div class="btn_search type5">	
							<select id="select_day"></select>
						</div>
							<br/>
					</div>
					<article v-show="isShow" class="col-box1 left mt20">
	                    <div class="form-box-input adClick" data-adarea="피클_성별">
	                        <div class="chk-box">
	                            <input type="radio" id="fl" name="gender" class="circle-check2" value="female" v-model="gender">
	                            <label for="fl"><i></i><span class="black">여자</span></label>
	                        </div>
	                        <div class="chk-box">
	                            <input type="radio" id="ml" name="gender" class="circle-check2" value="male" v-model="gender">
	                            <label for="ml"><i></i><span class="black">남자</span></label>
	                        </div>
	                    </div>
	                </article>
					
                </article>
                <article class="last-box mt30">
                	<button type="button" class="btn_basic full">가입하기</button>
                </article>
            </div>
            <div class="last-box mt40">
						<div class="gray7 mt30">
							이미 계정이 있으신가요?
							<a href="loginMain" data-adarea="피클_가입하기" class="ml10 black bold adClick">로그인</a>
						</div>
					</div>
		</div>
	</section>
	
	
</body>
</html>