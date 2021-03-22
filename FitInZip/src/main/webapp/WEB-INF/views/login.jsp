<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/login/login.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/fa609ec6e5.js" crossorigin="anonymous"></script>
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
					}
				});
			}
		});
	};
</script>

</head>
<body>
<div id="root">
	<div>
        <div class="sc-dkQUut fKLEUn">
			<section class="sc-jlZIZy sc-dTSxUT iWVnnf dyQypj">
				<div class="sc-htmbXw iarkkR">
					<h1 class="sc-hVHxqd cqbYWu">Login</h1>
                        <div class="sc-hiIRIb bwpZbA">
                            <div class="sc-eirseW iPNSyW">
                                <input name="usernameOrEmail" data-test-id="usernameOrEmail" id="usernameOrEmail" autocapitalize="off" autocorrect="off" class="sc-hTRkEk homFcA" value="">
                                <label for="usernameOrEmail" class="sc-lbVuaH bUszUQ">
                                    <div>Username or Email</div>
                                </label>
                            </div>
                            <div class="sc-eirseW iPNSyW">
                                <input name="password" type="password" data-test-id="password" id="password" autocapitalize="off" autocorrect="off" class="sc-hTRkEk homFcA" value="">
                                <label for="password" class="sc-lbVuaH fgiXCZ">
                                    <div>Password</div>
                                </label>
                                <button data-test-id="showHidePassword" type="button" class="sc-ckTRkR gCHypS">SHOW</button>
                            </div>
                        </div>
                        <div class="sc-jwaSqX dFOHtD">
                            <a data-test-id="forgotPasswordButton" class="sc-bYsYVM ibKgcD" href="/forgot-password">비밀번호 찾기</a>
                        </div>
                        <button type="submit" data-test-id="loginButton" class="sc-kEqYlL sc-dIsAE sc-gSYCTC bcxYtT dWzdfH eQjtrC sc-gUjfYa jITbnv">Login</button>
			
					<a href="javascript:kakaoLogin();" class="btn_basic full big icn-social kk adClick">
						카카오톡으로 로그인하기
					</a>
				
					
					<div class="move-join">아직 계정이 없으신가요? <a href="/joinMain">가입하기</a></div>
				</div>
			</section>
		</div>
	</div>		
</div>
</body>
</html>