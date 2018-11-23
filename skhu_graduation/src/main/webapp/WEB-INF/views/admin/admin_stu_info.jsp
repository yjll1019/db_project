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
<link rel="stylesheet" href="${R}res/css/mypage.css">
<!-- Website CSS style -->
<link rel="stylesheet" type="text/css" href="assets/css/main.css">
<!-- Website Font style -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<title>관리자 학생 정보</title>
</head>
<body>
	<div id="jb-container">
		<div id="jb-header">
		<div id='cssmenu'>
			<ul>
				<li>
					<a style="padding: 8px; padding-left: 15px; padding-right: 0px;">
						<img src="${R}res/img/logo.jpg" width="29" height="29">
					</a>
				</li>
				<li><a href='../admin/admin_stu_search?sbd=0&sbg=0&sbi=0&st='><span>학생 조회</span></a></li>
				<li class='active has-sub' ><a><span>졸업요건 수정</span></a>
					<ul>
						<li class='last'><a href='../admin/admin_allSearchEdit'><span>졸업요건표 수정</span></a></li>
						<li class='last'><a href='#'><span>필수학점 수정</span></a></li>
						<li class='last'><a href='../admin/admin_changeGraduation'><span>필수과목 수정</span></a></li>
					</ul>
				</li>
				<li class='active has-sub' ><a><span>과목 목록 수정</span></a>
					<ul>
						<li class='last'><a href='../admin/admin_all_subject'><span>전체과목 목록</span></a></li>
						<li class='last'><a href='../admin/admin_replace_list'><span>대체과목 목록</span></a></li>
					</ul>
				</li>
				<li><a href='../user/board'><span>공지사항 및 문의</span></a></li>
				<li><a href='../admin/calenderEdit'><span>대학일정 관리</span></a></li>
				<li style="float: right"><a href='../user/logout'><span>LOGOUT</span></a></li>
				<li style="float: right"><a href='../user/check_password'><span>개인정보변경</span></a></li>
			</ul>
		</div>
	</div>
		<div id="jb-content justify-content-center">
			<div class="container">
				<div class="row main">
					<div class="main-login main-center">
							<div class="form-group" style="margin-bottom: 20px">
								<label for="name" class="cols-sm-2 control-label">학번</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-user-graduate fa" aria-hidden="true"></i></span>
										&nbsp;&nbsp; 
										${ user.id }
									</div>
								</div>
							</div>

							<div class="form-group" style="margin-bottom: 20px">
								<label for="name" class="cols-sm-2 control-label">이름</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i	class="fa fa-user fa" aria-hidden="true"></i></span> 
										&nbsp;&nbsp; 
										${ user.userName }
									</div>
								</div>
							</div>

							<div class="form-group">
								<label for="email" class="cols-sm-2 control-label">이메일</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon" ><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
										&nbsp;&nbsp; 
										${ user.email }
									</div>
								</div>
							</div>

							<div class="form-group" style="margin-bottom: 20px">
								<label for="phone" class="cols-sm-2 control-label">전화번호</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-phone fa" aria-hidden="true"></i></span> 
										&nbsp;&nbsp; 
										${ user.phone }
									</div>
								</div>
							</div>

							<label for="major" class="cls-sm-2 control-label">입학구분</label>
								<div class="cols-sm-10" style="margin-bottom: 20px">
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-graduation-cap fa" aria-hidden="true"></i></span>
										&nbsp;&nbsp; 
										${ transferStudent == '0' ? '입학' : '편입' }
									</div>
								</div>
							
							<div class="form-group" style="margin-bottom: 20px">
								<label for="major" class="cls-sm-2 control-label">학부/학과</label>
								<div class="cols-sm-10" style="margin-bottom: 5px">
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-graduation-cap fa" aria-hidden="true"></i></span>
										&nbsp;&nbsp; 
										${ student.department.name }
									</div>
								</div>

								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-graduation-cap fa" aria-hidden="true"></i></span>
										&nbsp;&nbsp; 
										${ secondMajor.department.name }
									</div>
								</div>
							</div>

							<div class="form-group" style="margin-bottom: 30px">
								<label for="semester" class="cls-sm-2 control-label">학기</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon"><i class="fa fa-user-graduate fa" aria-hidden="true"></i></span>
										&nbsp;&nbsp; 
										${ student.stuSemester } 학기
									</div>
								</div>
							</div>
							<div class="form-group" style="margin-top: 10px; margin-left: 18%; width: 120px;">
								<a href="admin_stu_subject?id=${ user.id }" class="btn btn-outline-primary">수강한 강의 목록</a>
							</div>
							<div class="form-group" style="margin-top: 10px; margin-left: 31%; width: 120px;">
								<a href="admin_stu_search?sbd=${sbd}&sbg=${sbg}&sbi=${sbi}&st=${st}" class="btn btn-primary">목록으로</a>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>