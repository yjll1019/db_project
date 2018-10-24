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
<link rel="stylesheet" href="res/css/board.css">
<title>관리자 게시판</title>
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
						<li class='last'><a href='allSearchEdit.jsp'><span>졸업요건표 수정</span></a></li>
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
		<div id="jb-content">
			<h2>
				<i>&nbsp;&nbsp;</i>공지사항 및 문의
			</h2>

			<hr>
			<div class="form-group" style="margin-top: -10px; margin-left: 600px; width:350px;">
				<select name="searchInBoard" class="form-control"
					style="display: inline; width:90px; height:35px; font-size:15px;">
					<option>이름</option>
					<option>제목</option>
				</select> 
				<input type="text" class="form-control" name="searchText"
					placeholder="검색" style="display: inline; margin-left: 5px; width:150px; height:35px;">

				<button type="button" class="btn btn-primary">조회</button>
			</div>
			<br />
			<table class="table table-hover" style="margin-top: -35px;">
				<thead>
					<tr >
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr class="notice">
						<td id="word-color"><i class="fa fa-bullhorn fa"></i></td>
						<td id="word-color">공지사항입니다.</td>
						<td id="word-color">관리자</td>
						<td id="word-color">2018.09.15</td>
					</tr>
					<tr>
						<td>2</td>
						<td>졸업요건 문의</td>
						<td>이예지</td>
						<td>2018.09.10</td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;<i class="fa fa-arrow-right fa"></i>
							[답변]
						</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 졸업요건 문의</td>
						<td>관리자</td>
						<td>2018.09.11</td>
					</tr>
					<tr>
						<td>3</td>
						<td>학점 문의</td>
						<td>이혜지</td>
						<td>2018.09.09</td>
					</tr>

					<tr>
						<td>&nbsp;&nbsp;&nbsp;<i class="fa fa-arrow-right fa"></i>
							[답변]
						</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 학점문의</td>
						<td>관리자</td>
						<td>2018.08.01</td>
					</tr>
					<tr>
						<td>4</td>
						<td>교수 졸업지도</td>
						<td>이승진</td>
						<td>2018.07.31</td>
					</tr>

					<tr>
						<td>&nbsp;&nbsp;&nbsp;<i class="fa fa-arrow-right fa"></i>
							[답변]
						</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 교수 졸업지도</td>
						<td>관리자</td>
						<td>2018.08.01</td>
					</tr>

					<tr>
						<td>5</td>
						<td>18학번 졸업요건 문의</td>
						<td>새내기</td>
						<td>2018.07.20</td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;<i class="fa fa-arrow-right fa"></i>
							[답변]
						</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 18학번 졸업요건 문의</td>
						<td>관리자</td>
						<td>2018.07.21</td>
					</tr>
				</tbody>
			</table>
			
			<a id="createButton" class="btn btn-primary pull-right" href="admin_NoticeWrite.jsp">글쓰기</a>
			<div style="margin-top: 2%">
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<li class="page-item">
							<a class="page-link" href="#" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
								<span class="sr-only">Previous</span>
							</a>
						</li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item">
							<a class="page-link" href="#" aria-label="Next">
								<span aria-hidden="true">&raquo;</span> 
								<span class="sr-only">Next</span>
							</a>
						</li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>