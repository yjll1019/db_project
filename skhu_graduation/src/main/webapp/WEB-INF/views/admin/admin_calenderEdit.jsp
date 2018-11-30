<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<!-- header -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://bootswatch.com/4/litera/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${R}res/css/header.css">
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script src="${R}res/js/header.js"></script>
<link href='${R}res/css/fullcalendar.min.css' rel='stylesheet' />
<link href='${R}res/css/fullcalendar.print.min.css' rel='stylesheet' media='print'/>
<script src='${R}res/js/moment.min.js'></script>
<script src='${R}res/js/jquery.min.js'></script>
<script src='${R}res/js/fullcalendar.min.js'></script>
<script src='${R}res/js/ko.js'></script>
<script>
	$(document).ready(function() {

		$('#calendar').fullCalendar({
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'month,basicWeek,basicDay'
			},
			defaultDate : '2018-11-26',
			lang : "ko",
			navLinks : true, // can click day/week names to navigate views
			editable : true,
			eventLimit : true, // allow "more" link when too many events
			events : [ {
				title : 'All Day Event',
				start : '2018-03-01'
			}, {
				title : '중간고사',
				start : '2018-09-07',
				end : '2018-09-10'
			}, {
				id : 999,
				title : '군복학 만기일 ',
				start : '2018-09-26'
			}, {
				id : 999,
				title : 'Repeating Event',
				start : '2018-03-16T16:00:00'
			}, {
				title : 'Conference',
				start : '2018-03-11',
				end : '2018-03-13'
			}, {
				title : 'Meeting',
				start : '2018-03-12T10:30:00',
				end : '2018-03-12T12:30:00'
			}, {
				title : 'Lunch',
				start : '2018-03-12T12:00:00'
			}, {
				title : 'Meeting',
				start : '2018-03-12T14:30:00'
			}, {
				title : 'Happy Hour',
				start : '2018-03-12T17:30:00'
			}, {
				title : 'Dinner',
				start : '2018-03-12T20:00:00'
			}, {
				title : 'Birthday Party',
				start : '2018-03-13T07:00:00'
			}, {
				title : 'Click for Google',
				url : 'http://google.com/',
				start : '2018-03-28'
			} ]
		});

	});
</script>
<style>
body {
	margin: 0px 0px;
	padding: 0;
	font-family: "Lucida Grande", Helvetica, Arial, Verdana, sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 700px;
	margin: 0 auto;
}

form {
	margin: 0 auto;
	width: 250px;
}
</style>
</head>
<body>
	<div id="jb-container">
		<div id="jb-header">
		<div id='cssmenu'>
			<c:if test="${user.role=='관리자' }">
			<ul>
				<li>
					<a style="padding: 8px; padding-left: 15px; padding-right: 0px;">
						<img src="${R}res/img/logo.jpg" width="29" height="29">
					</a>
				</li>
				<li><a href='../admin/admin_stu_search'><span>학생 조회</span></a></li>
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
				<li><a href='../admin/admin_calenderEdit'><span>대학일정 관리</span></a></li>
				<li style="float: right"><a href='../user/logout'><span>LOGOUT</span></a></li>
				<li style="float: right"><a href='../user/check_password'><span>개인정보변경</span></a></li>
			</ul>
			</c:if>
			<c:if test="${user.role=='슈퍼관리자'}">
			<ul>
				<li>
					<a style="padding: 8px; padding-left: 15px; padding-right: 0px;">
						<img src="${R}res/img/logo.jpg" width="29" height="29">
					</a>
				</li>
				<li><a href='../admin/admin_stu_search'><span>학생 조회</span></a></li>
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
				<li><a href='../admin/admin_calenderEdit'><span>대학일정 관리</span></a></li>
				<li><a href='../admin/superAdmin_manage'><span>관리자/교수 관리</span></a></li>
				<li style="float: right"><a href='../user/logout'><span>LOGOUT</span></a></li>
				<li style="float: right"><a href='../user/check_password'><span>개인정보변경</span></a></li>
			</ul>
			</c:if>
		</div>
	</div>
		<div id="jb-container">
			<div id='calendar'></div>
			<br>

			<div id="jb-content justify-content-center">
				<input type="text" name="schedule" size="16"
					placeholder="2018-11-26">&nbsp; &nbsp; <input type="text"
					name="schedule" size="20" placeholder="일정을 입력하세요">

				<div class="form-group">
					<center>
						<button class="btn btn-primary" type="submit">
							일정등록<i class="fa fa-check spaceLeft"></i>
						</button>
						<button class="btn btn-primary" type="submit">
							일정수정<i class="fa fa-check spaceLeft"></i>
						</button>
						<button class="btn btn-danger" type="submit">
							일정삭제<i class="fa fa-times spaceLeft"></i>
						</button>
					</center>

				</div>

			</div>
		</div>
	</div>
</body>
</html>
