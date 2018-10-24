<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://bootswatch.com/4/litera/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="res/css/header.css">
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script src="res/js/header.js"></script>
<link rel="stylesheet" href="res/css/mypage.css">
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
					<a href='#' style="padding: 8px; padding-left: 15px; padding-right: 0px;">
						<img src="res/img/logo.jpg" width="29" height="29">
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
				<li style="float: right"><a href='#'><span>LOGOUT</span></a></li>
				<li style="float: right"><a href='adminInfo.jsp'><span>개인정보변경</span></a></li>
			</ul>
		</div>
	</div>
		<div id="jb-content justify-content-center">
			<div class="container">
				<div class="row main">
					<div class="main-login main-center">
						<form class="form-horizontal" method="post" action="#" style="width: 300px">
							<div class="form-group" style="margin-bottom: 20px">
								<label for="name" class="cols-sm-2 control-label">학번</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon" style="margin-top: 8px"><i class="fa fa-user-graduate fa" aria-hidden="true"></i></span>
										&nbsp;&nbsp; 
										<input type="text" class="form-control" name="studentNumber" id="studentNumber" placeholder="201632000" style="height: 37px; font-size: 13pt;"/>
									</div>
								</div>
							</div>

							<div class="form-group" style="margin-bottom: 20px">
								<label for="name" class="cols-sm-2 control-label">이름</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon" style="margin-top: 8px"><i	class="fa fa-user fa" aria-hidden="true"></i></span> 
										&nbsp;&nbsp; 
										<input type="text" class="form-control" name="name" id="name" placeholder="김지혜" style="height: 37px; font-size: 13pt;"/>
									</div>
								</div>
							</div>

							<div class="form-group">
								<label for="email" class="cols-sm-2 control-label">이메일</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon" style="margin-top: 8px"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
										&nbsp;&nbsp; 
										<input type="text" class="form-control" name="email" id="email" placeholder="jihye@example.com" style="height: 37px; font-size: 13pt;"/>
									</div>
								</div>
							</div>

							<div class="form-group" style="margin-bottom: 20px">
								<label for="phone" class="cols-sm-2 control-label">전화번호</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon" style="margin-top: 8px"><i class="fa fa-phone fa" aria-hidden="true"></i></span> 
										&nbsp;&nbsp; 
										<input type="tel" class="form-control" name="phone" id="phone" placeholder="010-1111-5389" style="height: 37px; font-size: 13pt;"/>
									</div>
								</div>
							</div>

							<label for="major" class="cls-sm-2 control-label">입학구분</label>
							<div class="cols-sm-10" style="margin-bottom: 20px">
								<div class="input-group">
									<span class="input-group-addon" style="margin-top: 8px"><i class="fa fa-graduation-cap fa" aria-hidden="true"></i></span>
									&nbsp;&nbsp; 
									<input type="text" class="form-control" name="divisionOfadmission" id="divisionOfadmission" placeholder="신입학" style="height: 37px; font-size: 13pt;"/>
								</div>
							</div>
							
							<div class="form-group" style="margin-bottom: 20px">
								<label for="major" class="cls-sm-2 control-label">학과(부)</label>
								<div class="cols-sm-10" style="margin-bottom: 5px">
									<div class="input-group">
										<span class="input-group-addon" style="margin-top: 8px"><i class="fa fa-graduation-cap fa" aria-hidden="true"></i></span>
										&nbsp;&nbsp; 
										<select name="major" class="form-control" id="major" style="height: 37px; font-size: 13pt;">
											<option value="notSelect">주전공</option>
											<option value="소프트웨어 공학과">소프트웨어공학과</option>
											<option value="컴퓨터공학과">컴퓨터공학과</option>
											<option value="인문융합자율학부">인문융합 자율학부</option>
											<option value="사회융합자율학부">사회융합 자율학부</option>
											<option value="미디어컨텐츠융합자율학부">미디어컨텐츠융합 자율학부</option>
											<option value="it융합자율학부">IT융합 자율학부</option>
										</select>
									</div>
								</div>

								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon" style="margin-top: 8px"><i class="fa fa-graduation-cap fa" aria-hidden="true"></i></span>
										&nbsp;&nbsp; 
										<select name="subMajor" class="form-control" id="subMajor" style="height: 37px; font-size: 13pt;">
											<option value="notSelect">부/복수전공</option>
											<option value="소프트웨어 공학과">소프트웨어공학과</option>
											<option value="컴퓨터공학과">컴퓨터공학과</option>
											<option value="정보통신공학과">정보통신 공학과</option>
											<option value="글로컬IT학과">글로컬IT학과</option>
											<option value="디지털컨텐츠">디지털컨텐츠</option>
											<option value="신문방송학과">신문방송학과</option>
											<option value="경영학부">경영학부</option>
											<option value="사회과학부">사회과학부</option>
											<option value="사회복지학과">사회복지학과</option>
											<option value="중어중국학과">중어중국학과</option>
											<option value="일어일본학과">일어일본학과</option>
											<option value="영어학과">영어학과</option>
											<option value="신학과">신학과</option>
											<option value="해외창">해외창</option>
											<option value="문화기획전공">문화기획전공</option>
										</select>
									</div>
								</div>
							</div>

							<div class="form-group" style="margin-bottom: 30px">
								<label for="semester" class="cls-sm-2 control-label">학기</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon" style="margin-top: 8px"><i class="fa fa-user-graduate fa" aria-hidden="true"></i></span>
										&nbsp;&nbsp; 
										<select name="semester" class="form-control" id="semester" style="height: 37px; font-size: 13pt;">
											<option value="1학기">1학기</option>
											<option value="2학기">2학기</option>
											<option value="3학기">3학기</option>
											<option value="4학기">4학기</option>
											<option value="5학기">5학기</option>
											<option value="6학기">6학기</option>
											<option value="7학기">7학기</option>
											<option value="8학기">8학기</option>
											<option value="9학기">9학기</option>
											<option value="10학기">10학기</option>
										</select>
									</div>
								</div>
							</div>
							<div id="textright">
								<button type="button" class="btn btn-secondary" style="width: 80%; margin-bottom: 40px; margin-left: 30px"
									onclick="window.open('test.jsp','수강한강의목록','width=530,height=650,location=no,status=no,scrollbars=yes');">
									수강한 강의목록</button>
							</div>
							<div class="form-group" style="margin-top: 10px; margin-left: 31%; width: 120px;">
								<button type="button" class="btn btn-primary btn-lg btn-block login-button">수정하기</button>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>