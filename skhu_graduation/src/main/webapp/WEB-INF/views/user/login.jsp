<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>Login</title>
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
</head>
<% 
	String result = String.valueOf(request.getAttribute("result"));
	String alert = String.valueOf(request.getAttribute("alert"));
%>
<script>
	var r = "<%= result%>";
    if(r == 0){
        alert('회원가입이 완료되었습니다.');
     } else if(r == -1){
        alert('이미 존재하는 아이디입니다. 아이디는 학번입니다.');
     }
    
    var al = "<%= alert%>"
    	if(al == -1){
    		alert('존재하지 않는 아이디입니다.');
    	} else if(al == 0){
    		alert('로그인에 실패했습니다.');
    	}
</script>
<body>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form" method="post">
					<span class="login100-form-title p-b-26"> LOGIN </span>

					<div class="wrap-input100 validate-input" data-validate="아이디를 입력하세요">
						<input class="input100" type="text" name="id" value="${ user.id }" /> 
						<span class="focus-input100" data-placeholder="ID"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="비밀번호를 입력하세요">
						<input class="input100" type="password" name="password" value="${ user.password }" /> 
						<span class="focus-input100" data-placeholder="Password"></span>
					</div>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn">Login</button>
						</div>
					</div>
					
					<div class="text-center p-t-50">
						<span class="txt1"></span> 
						<a class="txt2" href="stu_forgot_password.jsp" style="font-size: 15px"> 비밀번호찾기 </a>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div id="dropDownSelect1"></div>
	<!--===============================================================================================-->
	<script src="${R}res/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="${R}res/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="${R}res/vendor/bootstrap/js/popper.js"></script>
	<script src="${R}res/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="${R}res/vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="${R}res/vendor/daterangepicker/moment.min.js"></script>
	<script src="${R}res/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="${R}res/vendor/countdowntime/countdowntime.js"></script>
	<!--===============================================================================================-->
	<script src="${R}res/js/main.js"></script>

</body>
</html>