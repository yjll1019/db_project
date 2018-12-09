<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>게시글 비밀번호 확인</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${R}res/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${R}res/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${R}res/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${R}res/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${R}res/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${R}res/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${R}res/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${R}res/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="${R}res/css/util.css">
<link rel="stylesheet" type="text/css" href="${R}res/css/main.css">
<!--===============================================================================================-->
<link rel="stylesheet" href="https://bootswatch.com/4/litera/bootstrap.min.css">
<script>
	var r = ${ result };
	if(r == -1){
        alert('비밀번호가 일치하지 않습니다.');
     }

</script>
</head>
<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form method="post" class="login100-form validate-form">
					<div class="text-center" style="font-size: 30px; padding-bottom: 30px; font-weight: 800; font-family: 'NanumSquare', sans-serif;">
						<span>게시글 <br/>비밀번호 확인 </span>
					</div>
					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<input class="input100" type="password" name="password"> <span
							class="focus-input100" data-placeholder="password"></span>
					</div>
					<div class="form-group" align="center" style="margin-top: 60px;">
						<a href="board" class="btn btn-outline-primary">목록으로</a>
						<button type="submit" class="btn btn-primary" style="margin-left: 20px">확인하기</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>