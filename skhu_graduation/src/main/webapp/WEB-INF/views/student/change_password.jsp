<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

 <c:url var="R" value="/" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>비밀번호 변경</title>
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
<%
	String result = String.valueOf(request.getAttribute("result"));
%>
<script>
	var r = "<%= result%>"
	 if(r == 1){
	 	 alert('비밀번호가 성공적으로 변경되었습니다.');
	 	location.href="/skhu_graduation/user/login";
	 } else if(r == -1){
	     alert('비밀번호와 확인 비밀번호가 일치하지 않습니다. 다시 입력해주세요.');
	 } else if(r == -2){
			alert('비밀번호는 영문+숫자 8자리 이상입니다. 다시 입력해주세요.');
	 }
</script>
</head>
<body>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
			  <form:form method="post" modelAttribute="user" class="login100-form validate-form"> 
					<div class="text-center" style="font-size: 30px; padding-bottom: 30px;
						font-weight: 800; font-family: 'NanumSquare', sans-serif;">
						<span> 비밀번호 변경 </span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Valid email is: a@b.c">
						<input class="input100" type="password" name="password" value="${user.password }"> <span
							class="focus-input100" data-placeholder="비밀번호(영문+숫자 8자이상)"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<input class="input100" type="password" name="confirmPassword" value="${user.confirmPassword }"> <span
							class="focus-input100" data-placeholder="비밀번호 확인"></span>
					</div>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button type="submit" class="login100-form-btn" style="background-color: #4582EC">change</button>
						</div>
					</div>
					<br/>
				</form:form>
			</div>
		</div>
	</div>
	
</body>
</html>