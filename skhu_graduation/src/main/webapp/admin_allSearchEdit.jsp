<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>allSearchEdit</title>
</head>
<body>
	<div id="jb-container">
		<div id="jb-header">
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
		<div class="container">
		<br/>
			<h2>&nbsp;&nbsp;전체학과 졸업요건 수정</h2> 
		<br/><br/>
			<div class="col-sm-4">
				<div class="input-group">
					<select name="major" class="form-control" id="major" style="width: 500px">
						<option value="notSelect">수정하려는 학과/학부를 선택해 주세요</option>
						<option value="소프트웨어 공학과">소프트웨어공학과</option>
						<option value="컴퓨터공학과">컴퓨터공학과</option>
						<option value="IT융합 자율학부">IT융합 자율학부</option>
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
					</select>
				</div>
			</div>
	 <br/>
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th>대상</th>
							<th>부/복수전공</th>
							<th>졸업요건</th>
							<th>기타요건</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td rowspan="4">소프트웨어 공학과 학생</td>
							<td>소프트웨어<br> 주전공</td>
							<td>
								<textarea cols="55" rows="6">[2008~2013학번까지]
전필37학점 포함하여 전공 60학점 이상 이수

[2014학번부터]
전필31학점 포함하여 전공 60학점 이상 이수</textarea>
							</td>
						<tr>
							<td>소프트웨어공학과<br>(타과)복수전공</td>
							<td>
								<textarea cols="55" rows="3">전필 31학점 포함하여 전공 40학점 이상 이수</textarea>
							</td>
						</tr>
						<tr>
							<td>소프트웨어공학과<br>(타과)부전공</td>
							<td>
								<textarea cols="55" rows="3">전필 31학점 포함하여 전공 60학점 이상 이수</textarea>
							</td>
						</tr>
						<tr>
							<td>소프트웨어공학과<br>편입
							</td>
							<td>
								<textarea cols="55" rows="3">1,2학년 지도과목을 제외하고 전필 27학점을 포함하여 전공 60학점 이상 이수</textarea>
							</td>
						</tr>
						<tr>
							<td rowspan="3">타과학생</td>
							<td>소프트웨어공학과<br> 전과</td>
							<td>
								<textarea cols="55" rows="3">학번에 따라 전공필수 이수</textarea>
							</td>
						</tr>
						<tr>
							<td>소프트웨어공학과<br>복수전공</td>
							<td>
								<textarea cols="55" rows="3">지도 과목 제외, 전필 24학점 포함하여 전공 40학점 이상 이수</textarea>
							</td>
						</tr>
						<tr>
							<td>소프트웨어공학과<br>부전공</td>
							<td>
								<textarea cols="55" rows="3">전필 , 전선관계없이 21학점 이상 이수</textarea>
							</td>
						</tr>
					</tbody>
				</table>
				<form class="form-group" style="margin-left: 40%; margin-top: 40px">
					<button type="button" class="btn btn-primary btn-lg btn-block login-button"
						style="width:150px; height: 50px; font-size: 16px">수정하기</button>
				</form>
			</div>
		</div>
	<br/>
	</div>
</body>
</html>