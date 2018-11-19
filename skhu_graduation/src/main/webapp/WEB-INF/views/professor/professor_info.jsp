<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${R}res/css/header.css">
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script src="${R}res/js/header.js"></script>
<link rel="stylesheet" href="https://bootswatch.com/4/litera/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/innks/NanumSquare/master/nanumsquare.min.css">
<link rel="stylesheet" href="${R}res/css/professorInfo.css">
<meta charset="UTF-8">
<title>교수 개인정보변경</title>
</head>
<%
	String alert =String.valueOf(request.getAttribute("alert"));
%>
<script>
	var al = "<%=alert%>"
		if(al==-1){
			alert('비밀번호 조건이 맞지 않습니다. 영문+숫자 8자리 이상!');
		}else if(al==-2){
			alert('비밀번호와 확인비밀번호가 맞지 않습니다.');
		}

</script>
<body>
<div id="jb-container">
	<div id="jb-header">
		<div id='cssmenu'>
			<ul>
				<li><a href='#'
					style="padding: 8px; padding-left: 15px; padding-right: 0px;"><img src="${R}res/img/logo.jpg" width="29" height="29"></a></li>
				<li><a href='../professor/professor_stu_search'><span>학생 조회</span></a></li>
				<li><a href='../professor/professor_allSearch'><span>졸업요건 조회</span></a></li>
				<li><a href='../user/board'><span>공지사항 및 문의</span></a></li>
				<li style="float: right"><a href='../user/logout'><span>LOGOUT</span></a></li>
				<li style="float: right"><a href='../user/check_password'><span>개인정보변경</span></a></li>
			</ul>
		</div>
	</div>
	<div id="jb-content justify-content-center">
			<div class="container">
				<div class="row main">
					<div class="main-login main-center">
						<form class="form-horizontal" method="post" style="width: 300px">

							<div class="form-group">
								<label for="name" class="cols-sm-2 control-label">이름</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon" style="margin-top: 8px"><i class="fa fa-user fa" aria-hidden="true"></i></span> 
										&nbsp;&nbsp; 
										<input type="text" class="form-control" name="userName" value="${user.userName }" style="height: 37px; font-size: 13pt;"/>
									</div>
								</div>
							</div>

							<div class="form-group">
								<label for="email" class="cols-sm-2 control-label">이메일</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon" style="margin-top: 8px"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
										&nbsp;&nbsp; 
										<input type="email" class="form-control" name="email" value="${user.email }" style="height: 37px; font-size: 13pt;"/>
									</div>
								</div>
							</div>

							<div class="form-group">
								<label for="phone" class="cols-sm-2 control-label">전화번호</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon" style="margin-top: 8px"><i class="fa fa-phone fa" aria-hidden="true"></i></span> 
											&nbsp;&nbsp; 
											<input type="tel" class="form-control" name="phone" value="${user.phone }" style="height: 37px; font-size: 13pt;"/>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="departmentId" class="cls-sm-2 control-label">학과(부)</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon" style="margin-top: 8px"><i class="fa fa-graduation-cap fa" aria-hidden="true"></i></span> 
										&nbsp;&nbsp; 
										<select name="departmentId"  class="form-control"  style="height: 37px; font-size: 13pt;">
											<option value="">소속 학과(부)를 선택해주세요</option>
											<option value="12">소프트웨어공학과</option>
											<option value="14">컴퓨터공학과</option>
											<option value="32">인문융합 자율학부</option>
											<option value="25">사회융합 자율학부</option>
											<option value="22">미디어컨텐츠융합 자율학부</option>
											<option value="10">IT융합 자율학부</option>
										</select>
									</div>
								</div>
							</div>

							<div class="form-group" style="margin-bottom: 20px">
								<label for="grade" class="cls-sm-2 control-label">담당 학년</label>
								<div class="cols-sm-10" style="margin-bottom: 5px">
									<div class="input-group">
										<span class="input-group-addon" style="margin-top: 8px"><i class="fa fa-graduation-cap fa" aria-hidden="true"></i></span>
										&nbsp;&nbsp; 
										<select name="grade" class="form-control" style="height: 37px; font-size: 13pt;">
											<option value="">학년 해당사항 없음</option>
											<option value="1">1학년</option>
											<option value="2">2학년</option>
											<option value="3">3학년</option>
											<option value="4">4학년</option>
										</select>
									</div>
								</div>

								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon" style="margin-top: 8px"><i class="fa fa-graduation-cap fa" aria-hidden="true"></i></span>
										&nbsp;&nbsp; 
										<select name="group" class="form-control" style="height: 37px; font-size: 13pt;">
											<option value="">반 해당사항 없음</option>
											<option value="1">1반</option>
											<option value="2">2반</option>
											<option value="3">3반</option>
											<option value="4">4반</option>
										</select>
									</div>
								</div>
							</div>

							<div class="form-group">
								<label for="password" class="cols-sm-2 control-label">비밀번호</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon" style="margin-top: 8px"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span> 
										&nbsp;&nbsp; 
										<input type="text" class="form-control" name="password"  placeholder="비밀번호를 입력하세요" style="height: 37px; font-size: 13pt;"/>
									</div>
								</div>
							</div>

							<div class="form-group">
								<label for="confirmPassword" class="cols-sm-2 control-label">비밀번호 확인</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon" style="margin-top: 10px"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span> 
										&nbsp;&nbsp;
										<input type="text" class="form-control" name="confirmPassword"  placeholder="비밀번호 확인" style="height: 37px; font-size: 13pt;"/>
									</div>
								</div>
							</div>
							<br />
							<div class="form-group" style="margin-top: 10px; margin-left: 31%; width: 120px;">
								<button  class="btn btn-primary btn-lg btn-block login-button">수정하기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>