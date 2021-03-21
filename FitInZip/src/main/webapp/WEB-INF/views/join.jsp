<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
						}
					});
				}
			});
		}
</script>
</head>
<body>
	<a href="javascript:kakaoLogin();">
		<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR53WAliQN62Aoxj2mpzle2ycnX65h5i60HWA&usqp=CAU"/>
	</a>
	
</body>
</html>