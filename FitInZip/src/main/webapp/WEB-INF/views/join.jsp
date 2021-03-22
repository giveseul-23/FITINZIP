<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/login/join.css">
<script src="http://developer.kakao.com/sdk/js/kakao.js"></script>

<script>
	//e1abbefa9eea8cd3c5624e569d66bfa7
	window.Kakao.init("e1abbefa9eea8cd3c5624e569d66bfa7");
	
	function kakaoLogin() {
		window.Kakao.Auth.login({
			scope:'profile, account_email, gender',
			success: function(authObj) {
				console.log(authObj);
				window.Kakao.API.request({
					url:'/v2/user/me',
					success: res => {
						const kakao_account = res.kakao_account;
						console.log(kakao_account);
						var id = kakao_account.email;
						var name = kakao_account.name;
						var gender = kakao_account.gender;
						var joinInfo = {id : "id", name : "name", gender : "gender"};
						document.write('<form action="/join" id="smb_form" method="post"><input type="hidden" id="joinInfo" name="joinInfo" value=""></form>');
						document.getElementById("smb_form").submit();
					}
				});
			}
		});
	};
</script>
</head>
<body>
	<div class="contents">
		<div class="page_title">
			<h2>로그인</h2>
			<p>실시간 소통형<br>라이브 홈 트레이닝 클래스 피클</p>
		</div>
		<a href="javascript:kakaoLogin();" class="btn_basic full big icn-social kk adClick">
			카카오톡으로 가입하기
		</a>
		
		<a href="#" class="btn_basic full big icn-social bg_gray1 black adClick">
			이메일로 가입하기
		</a>
		
		<div class="move-join">아직 계정이 이미 있으신가요? <a href="/loginMain">로그인하기</a></div>
	</div>
</body>
</html>