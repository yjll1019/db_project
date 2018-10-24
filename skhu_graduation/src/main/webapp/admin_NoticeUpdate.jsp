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
<title>공지사항 수정하기</title>
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
		<div id="jb-content">
			<div id="boardWrite" style="margin-top:-30px;max-width: 800px;">
				<h2>글 수정</h2>
				<hr>
				<div class="container">
						<form action=".jsp" method="post">
							<div class="table table-responsive">
								<table class="table table-bordered" style="font-size:17px; text-align: center">
									<tr>
										<td style="background-color: #4582EC; color: white"><strong>작성일</strong></td>
										<td style="text-align: left">2018.09.26</td>
									</tr>
									<tr>
										<td style="background-color: #4582EC;color: white"><strong>제목</strong></td>
										<td colspan="3"><input type="text" class="form-control"
											name="subject" value="공지사항"></td>
									</tr>
									<tr>
										<td style="background-color: #4582EC;color: white"><strong>첨부 파일</strong></td>
										<td><input type="file" class="form-control" name="file" id="file"/></td>
										
									</tr>
									
									<tr>
										<td style="background-color: #4582EC; color: white"><strong>글내용</strong></td>
										<td colspan="3"><textarea name="content"
												class="form-control" style="width: 100%; height: 200px;">졸업요건이 변경되었습니다. 확인부탁드립니다.</textarea></td>
									</tr>
								</table>
								<div class="form-group" style="margin-top:30px; margin-left:25%;">
									<input type="submit" value="수정하기" class="btn btn-outline-primary" style="margin-right:20px;">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<button type="button" class="btn btn-outline-danger" style="margin-right:20px;">삭제하기</button>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<button type="button" class="btn btn-primary">목록으로</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
</body>
</html>