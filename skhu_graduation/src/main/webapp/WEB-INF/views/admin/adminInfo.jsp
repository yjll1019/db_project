<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://bootswatch.com/4/litera/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${R}res/css/header.css">
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script src="${R}res/js/header.js"></script>
<!-- Website CSS style -->
<link rel="stylesheet" type="text/css" href="assets/css/main.css">
<!-- Website Font style -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${R}res/css/adminInfo.css">
<title>관리자 개인정보변경</title>
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
				<li>
					<a href='#' style="padding: 8px; padding-left: 15px; padding-right: 0px;">
						<img src="${R}res/img/logo.jpg" width="29" height="29">
					</a>
				</li>
				<li><a href='admin_stu_search.jsp'><span>학생 조회</span></a></li>
				<li class='active has-sub' ><a><span>졸업요건 수정</span></a>
					<ul>
						<li class='last'><a href='admin_allSearchEdit.jsp'><span>졸업요건표 수정</span></a></li>
						<li class='last'><a href='#'><span>필수학점 수정</span></a></li>
						<li class='last'><a href='admin_changeGraduation.jsp'><span>필수과목 수정</span></a></li>
					</ul>
				</li>
				<li class='active has-sub' ><a><span>과목 목록 수정</span></a>
					<ul>
						<li class='last'><a href='admin_all_subject.jsp'><span>전체과목 목록</span></a></li>
						<li class='last'><a href='admin_replace_list.jsp'><span>대체과목 목록</span></a></li>
					</ul>
				</li>
				<li><a href='admin_board.jsp'><span>공지사항 및 문의</span></a></li>
				<li><a href='calenderEdit.jsp'><span>대학일정 관리</span></a></li>
				<li style="float: right"><a href='../user/logout'><span>LOGOUT</span></a></li>
				<li style="float: right"><a href='admin/adminInfo.jsp'><span>개인정보변경</span></a></li>
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
										<span class="input-group-addon" style="margin-top: 10px"><i class="fa fa-user fa" aria-hidden="true"></i></span> 
										&nbsp;&nbsp; 
										<input type="text" class="form-control" name="userName"value="${user.userName}" style="height: 37px; font-size: 13pt;"/>
									</div>
								</div>
							</div>

							<div class="form-group">
								<label for="email" class="cols-sm-2 control-label">이메일</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon" style="margin-top: 10px"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
										&nbsp;&nbsp; 
										<input type="email" class="form-control" name="email" value="${user.email}" style="height: 37px; font-size: 13pt;"/>
									</div>
								</div>
							</div>

							<div class="form-group">
								<label for="phone" class="cols-sm-2 control-label">전화번호</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon" style="margin-top: 10px"><i class="fa fa-phone fa" aria-hidden="true"></i></span> 
										&nbsp;&nbsp; 
										<input type="tel" class="form-control" name="phone" value="${user.phone }"style="height: 37px; font-size: 13pt;"/>
									</div>
								</div>
							</div>

							<div class="form-group">
								<label for="password" class="cols-sm-2 control-label">비밀번호</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon" style="margin-top: 10px"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span> 
										&nbsp;&nbsp; 
										<input type="password" class="form-control" name="password" placeholder="비밀번호를 입력하세요" style="height: 37px; font-size: 13pt; font-family: sans-serif"/>
									</div>
								</div>
							</div>

							<div class="form-group">
								<label for="confirmPassword" class="cols-sm-2 control-label">비밀번호 확인</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon" style="margin-top: 10px"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span> 
										&nbsp;&nbsp;
										<input type="password" class="form-control" name="confirmPassword"  placeholder="비밀번호 확인" style="height: 37px; font-size: 13pt; font-family: sans-serif"/>
									</div>
								</div>
							</div>
							<br />
							<div class="form-group" style="margin-top: 10px; margin-left: 31%; width: 120px;">
								<button class="btn btn-primary btn-lg btn-block login-button">수정하기</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>