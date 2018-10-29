<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- header -->
<link rel="stylesheet" href="${R}res/css/header.css">
<script src="http://code.jquery.com/jquery-latest.min.js"
	type="text/javascript"></script>
<script src="${R}res/js/header.js"></script>
<link rel="stylesheet" href="https://bootswatch.com/4/litera/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css"/>
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css">
<link rel="stylesheet" href="${R}res/css/join.css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Website CSS style -->
<link rel="stylesheet" type="text/css" href="assets/css/main.css">
<!-- Website Font style -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" 
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<title>Join Page</title>
</head>
<% String result = String.valueOf(request.getAttribute("result")); %>
<script>
	var r = "<%=result%>";
	if(r == 1){
		alert('비밀번호와 확인비밀번호가 일치하지 않습니다. 다시 입력해주세요.');
	}else if(r == 2){
		alert('비밀번호는 영문+숫자 8자리 이상입니다. 다시 입력해주세요.');
	}
</script>
<body>
<div id="jb-container">
		<div id="jb-header">
			<div id='cssmenu'>
				<ul>
					<li>
						<a href='#' style="padding: 8px; padding-left: 15px; padding-right: 0px;">
							<img src="${R}res/img/logo.jpg" width="29" height="29">
						</a>
					</li>
				</ul>
			</div>
		</div>
		<div id="jb-content justify-content-center">
			<div class="scontainer">
			<div class="row main">
				<div class="main-login main-center">
					<form:form method="post" class="form-horizontal" modelAttribute="user" style="width: 300px">			
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">아이디</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon" style="margin-top: 8px"><i class="fa fa-user fa" aria-hidden="true"></i></span>
									&nbsp;&nbsp;
									<form:input path="id" class="form-control" placeholder="학번을 입력해주세요" style="height: 37px; font-size: 13pt;"/>
								</div>
							</div>
						</div> 
			
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">이름</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon" style="margin-top: 8px"><i class="fa fa-user fa" aria-hidden="true"></i></span>
									&nbsp;&nbsp;
									<form:input path="userName" class="form-control" placeholder="이름을 입력해 주세요" style="height: 37px; font-size: 13pt;"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">이메일</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon" style="margin-top: 8px"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
									&nbsp;&nbsp;
									<form:input path="email" class="form-control" placeholder="이메일을 입력해주세요" style="height: 37px; font-size: 13pt;"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="phone" class="cols-sm-2 control-label">전화번호</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon" style="margin-top: 8px"><i class="fa fa-phone fa" aria-hidden="true"></i></span>
									&nbsp;&nbsp;
									<form:input path="phone" class="form-control" placeholder="010-1111-5389" style="height: 37px; font-size: 13pt;"/>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">비밀번호</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon" style="margin-top: 8px"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									&nbsp;&nbsp;
									<form:input type="password" path="password" class="form-control" placeholder="비밀번호를 입력해 주세요" style="height: 37px; font-size: 13pt; font-family: sans-serif"/>
								</div>
								
								<span id="result"></span>
							</div>
						</div>

						<div class="form-group">
							<label for="confirm" class="cols-sm-2 control-label">비밀번호 확인</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon" style="margin-top: 8px"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									&nbsp;&nbsp;
									<form:input type="password" path="confirmPassword" class="form-control" placeholder="비밀번호를 한번 더 입력해 주세요" style="height: 37px; font-size: 13pt; font-family: sans-serif"/>
								</div>
								<span id="confirmPass"></span>
							</div>
						</div>
		
						<div class="form-group">
							<label for ="major" class="cls-sm-2 control-label">학부/학과</label>
							
							<div class="radio" style="font-size: 10pt; margin-bottom: 7%">
 								&nbsp;	&nbsp;	&nbsp; &nbsp; &nbsp; &nbsp;
 								<input type="radio" name="howToGraduate" value="전공기초" checked> 전공기초 
 								&nbsp; &nbsp;
								<input type="radio" name="howToGraduate" value="전공심화"> 전공심화
 							</div>
							
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon" style="margin-top: 8px"><i class="fa fa-graduation-cap fa" aria-hidden="true"></i></span>
									&nbsp;&nbsp;
								    <select name="departmentId" class="form-control" id="departmentId" style="height: 37px; font-size: 10pt;">
										<c:forEach var="department" items="${departments }">
											<option value="${department.id }"> ${department.name }</option>
										</c:forEach>
									 </select>                       
								</div>
							</div>
							<br/>	
							
							<div class="checkbox" style="font-size: 10pt; margin-bottom: 7%">
 								&nbsp;	&nbsp;	&nbsp; &nbsp; &nbsp; &nbsp;
 								<input type="checkbox" name="doubleMajor" value="복수전공" > 복수전공 
 								&nbsp; &nbsp;
								<input type="checkbox" name="subMajor" value="부전공"> 부전공
 							</div>
											
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon" style="margin-top: 8px"><i class="fa fa-graduation-cap fa" aria-hidden="true"></i></span>
									&nbsp;&nbsp;
								    <select name="secondMajorDepartmentId" class="form-control" id="departmentId" style="height: 37px; font-size: 10pt;">
										<c:forEach var="department" items="${departments }">
											<option value="${department.id }">${department.name }</option>
										</c:forEach>
								 </select>
							   </div>
							</div>
						</div>
						
						<div class="form-group">
							<label for ="semester" class="cls-sm-2 control-label">현재 학기</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon" style="margin-top: 8px"><i class="fa fa-user-graduate fa" aria-hidden="true"></i></span>
									&nbsp;&nbsp;
									<select name="stuSemester" class="form-control" id="stuSemester" style="height: 37px; font-size: 10pt;">
										<option value="1">1학기</option>
										<option value="2">2학기</option>
										<option value="3">3학기</option>
										<option value="4">4학기</option>
										<option value="5">5학기</option>
										<option value="6">6학기</option>
										<option value="7">7학기</option>
										<option value="8">8학기</option>
										<option value="9">9학기</option>
										<option value="10">10학기</option>
								</select>
								</div>
							</div>
						</div>
						
						<div class="form-group">
						<label for ="semester" class="cls-sm-2 control-label">현재 반</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon" style="margin-top: 8px"><i class="fa fa-user-graduate fa" aria-hidden="true"></i></span>
									&nbsp;&nbsp;
									<select name="stuClass" class="form-control" id="stuClass" style="height: 37px; font-size: 10pt;">
										<option value="없음">없음</option>
										<option value="a">a반</option>
										<option value="b">b반</option>
										<option value="c">c반</option>
										<option value="d">d반</option>
								</select>
								</div>
							</div>
						</div>
	
						<div class="form-group">
							<label for="otp" class="cols-sm-2 control-label">OTP</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon" style="margin-top: 8px"><i class="fa fa-user fa" aria-hidden="true"></i></span>
									&nbsp;&nbsp;
									<input type="text" class="form-control" name="otp" id="otp"  placeholder="종합정보 시스템-웹서비스-OTP" style="height: 37px; font-size: 10pt;"/>
								</div>
							</div>
						</div>
						<br />
						<div class="form-group" style="margin-top: 10px; margin-left: 31%; width: 120px;">
							<button type="submit" class="btn btn-primary btn-ji btn-block join-button">회원가입</button>
						</div>
				</form:form>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>