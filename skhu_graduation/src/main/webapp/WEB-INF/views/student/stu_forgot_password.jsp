<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<c:url var="R" value="/" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>학생 비밀번호찾기</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="${R}${R}res/vendor/bootstrap/css/bootstrap.min.css">
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
<% String result = String.valueOf(request.getAttribute("result")); 
	String pw = String.valueOf(request.getAttribute("password"));
%>

<script>
	var r = "<%=result%>";
	var pw = "<%= pw%>";

	if(r == -1){
		alert('OTP 인증에 실패했습니다. 다시 인증해주세요.')
	}else if(r == -2){
		alert('해당 아이디가 존재하지 않습니다.')
	}else if(r == 1){
   		 alert('OTP인증이 완료되었습니다. 비밀번호를 변경해주세요.');
   		location.href="change_password";
    }
	
</script>
</head>
<body>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form:form method="post" class="login100-form validate-form">
					<div class="text-center" style="font-size: 30px; padding-bottom: 30px;
						font-weight: 800; font-family: 'NanumSquare', sans-serif;">
						<span> 비밀번호 변경</span>
					</div>

					<div class="wrap-input100 validate-input"
						data-validate="Valid email is: a@b.c">
						<input class="input100" type="text" name="id"> <span
							class="focus-input100" data-placeholder="ID"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<input class="input100" type="text" name="otp"> <span
							class="focus-input100" data-placeholder="OTP"></span>
					</div>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button type="submit" class="login100-form-btn" style="background-color: #4582EC">confirm</button>
						</div>
					</div>
					<br/><br/>
					<div class="text-center p-t-20">
						 <a class="txt2" href="admin_professor_forgot_password.jsp"> 관리자/교수 비밀번호찾기 </a>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	
</body>
</html>