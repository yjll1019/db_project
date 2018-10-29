<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="res/css/board.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="res/css/header.css">
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script src="res/js/header.js"></script>
<link rel="stylesheet" href="https://bootswatch.com/4/litera/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/innks/NanumSquare/master/nanumsquare.min.css">
<meta charset="UTF-8">
<title>교수 마이페이지</title>
</head>
<body>
	<div id="jb-header">
		<div id='cssmenu'>
			<ul>
				<li><a href='#'
					style="padding: 8px; padding-left: 15px; padding-right: 0px;"><img src="res/img/logo.jpg" width="29" height="29"></a></li>
				<li><a href='#'><span>학생 조회</span></a></li>
				<li><a href='#'><span>졸업요건 조회</span></a></li>
				<li><a href='#'><span>공지사항 및 문의</span></a></li>
				<li style="float: right"><a href='#'><span>LOGOUT</span></a></li>
				<li style="float: right"><a href='#'><span>개인정보변경</span></a></li>
			</ul>
		</div>
	</div>
	<div id="jb-content justify-content-center">
			<div class="container">
				<div class="row main">
					<div class="main-login main-center">
						<form class="form-horizontal" method="post" action="#" style="width: 300px">

							<div class="form-group">
								<label for="name" class="cols-sm-2 control-label">이름</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon" style="margin-top: 8px"><i class="fa fa-user fa" aria-hidden="true"></i></span> 
										&nbsp;&nbsp; 
										<input type="text" class="form-control" name="name" id="name" placeholder="교수님" style="height: 37px; font-size: 13pt;"/>
									</div>
								</div>
							</div>

							<div class="form-group">
								<label for="email" class="cols-sm-2 control-label">이메일</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon" style="margin-top: 8px"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
										&nbsp;&nbsp; 
										<input type="text" class="form-control" name="email" id="email" placeholder="professor@skhu.ac.kr" style="height: 37px; font-size: 13pt;"/>
									</div>
								</div>
							</div>

							<div class="form-group">
								<label for="phone" class="cols-sm-2 control-label">전화번호</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon" style="margin-top: 8px"><i class="fa fa-phone fa" aria-hidden="true"></i></span> 
											&nbsp;&nbsp; 
											<input type="tel" class="form-control" name="phone" id="phone" placeholder="010-1234-5678" style="height: 37px; font-size: 13pt;"/>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="major" class="cls-sm-2 control-label">학과(부)</label>
								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon" style="margin-top: 8px"><i class="fa fa-graduation-cap fa" aria-hidden="true"></i></span> 
										&nbsp;&nbsp; 
										<select name="major" class="form-control" id="major" style="height: 37px; font-size: 13pt;">
											<option value="notSelect">소속 학과(부)를 선택해주세요</option>
											<option value="소프트웨어 공학과">소프트웨어공학과</option>
											<option value="컴퓨터공학과">컴퓨터공학과</option>
											<option value="인문융합자율학부">인문융합 자율학부</option>
											<option value="사회융합자율학부">사회융합 자율학부</option>
											<option value="미디어컨텐츠융합자율학부">미디어컨텐츠융합 자율학부</option>
											<option value="it융합자율학부">IT융합 자율학부</option>
										</select>
									</div>
								</div>
							</div>

							<div class="form-group" style="margin-bottom: 20px">
								<label for="major" class="cls-sm-2 control-label">담당 학년</label>
								<div class="cols-sm-10" style="margin-bottom: 5px">
									<div class="input-group">
										<span class="input-group-addon" style="margin-top: 8px"><i class="fa fa-graduation-cap fa" aria-hidden="true"></i></span>
										&nbsp;&nbsp; 
										<select name="major" class="form-control" id="major" style="height: 37px; font-size: 13pt;">
											<option value="notSelect">학년 해당사항 없음</option>
											<option value="1학년">1학년</option>
											<option value="2학년">2학년</option>
											<option value="3학년">3학년</option>
											<option value="4학년">4학년</option>
										</select>
									</div>
								</div>

								<div class="cols-sm-10">
									<div class="input-group">
										<span class="input-group-addon" style="margin-top: 8px"><i class="fa fa-graduation-cap fa" aria-hidden="true"></i></span>
										&nbsp;&nbsp; 
										<select name="subMajor" class="form-control" id="subMajor" style="height: 37px; font-size: 13pt;">
											<option value="notSelect">반 해당사항 없음</option>
											<option value="1반">1반</option>
											<option value="2반">2반</option>
											<option value="3반">3반</option>
											<option value="4반">4반</option>
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
										<input type="password" class="form-control" name="password" id="password" data-toggle="popover" placeholder="비밀번호를 입력하세요" style="height: 37px; font-size: 13pt;"/>
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
										<input type="password" class="form-control" name="confirm" id="confirm" placeholder="비밀번호 확인" style="height: 37px; font-size: 13pt;"/>
									</div>
									<span id="confirmPass"></span>
								</div>
							</div>
							<br />
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