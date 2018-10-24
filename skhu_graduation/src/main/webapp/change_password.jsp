<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>비밀번호 변경</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="res/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="res/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="res/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="res/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="res/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="res/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="res/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="res/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="res/css/util.css">
<link rel="stylesheet" type="text/css" href="res/css/main.css">
<!--===============================================================================================-->
<script>
	function password(){
		alert('비밀번호가 변경되었습니다!');
		window.location = "http://localhost:8080/DBfront/login.html"; // 왜 이동을 안해,,ㅜ
	}
</script>
</head>
<body>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form">
					<div class="text-center" style="font-size: 30px; padding-bottom: 30px;
						font-weight: 800; font-family: 'NanumSquare', sans-serif;">
						<span> 비밀번호 변경 </span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Valid email is: a@b.c">
						<input class="input100" type="password" name="pass"> <span
							class="focus-input100" data-placeholder="비밀번호"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<input class="input100" type="password" name="pass"> <span
							class="focus-input100" data-placeholder="비밀번호 확인"></span>
					</div>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn" style="background-color: #4582EC"
								onclick="javascript:password()">change</button>
						</div>
					</div>
					<br/>
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>