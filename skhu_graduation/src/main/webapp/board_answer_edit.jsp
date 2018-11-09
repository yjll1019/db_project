<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://bootswatch.com/4/litera/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="${R}res/css/header.css">
<script src="${R}res/js/header.js"></script>
<link rel="stylesheet" href="${R}res/css/board.css">
<title>답변 작성 및 수정</title>
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
			<div id="boardWrite" style="margin-top:-30px; max-width: 800px;">
				<h2>&nbsp;&nbsp;답변 작성<!-- ${ board.boardId == null ? "수정" : "등록" } --></h2>
				<hr>
				<div class="container">
					<form method="post">
						<table class="table table-bordered" align="center" style="margin-top: 40px; font-size: 17px; text-align: center; max-width: 640px; width: 80%;">
							<tr>
								<td style="background-color: #4582EC; color: white; width: 100px; padding-top: 18px"><strong>제목</strong></td>
								<td colspan="3" style="text-align: left; padding-left: 25px; padding-top: 18px">[답변완료] 졸업 요건 문의드립니다.</td>
							</tr>
							<tr>
								<td style="background-color: #4582EC; color: white; height: 260px; padding-top: 18px"><strong>문의내용</strong></td>
								<td colspan="3" style="text-align: left; padding: 40px;">
									소프트웨어공학과 졸업요건 어디에서 확인가능한가요??							
								</td>
							</tr>
							<tr>
								<td style="background-color: #4582EC; color: white; height: 260px; padding-top: 18px"><strong>답변내용</strong></td>
								<td colspan="3">
									<textarea name="answer" class="form-control" style="width: 100%; height: 260px;">졸업요건조회 메뉴에서 확인가능합니다.</textarea>
								</td>
							</tr>
						</table>
						<div class="form-group" align="center" style="margin-top: 40px">
							<button type="submit" class="btn btn-outline-primary">등록하기</button>&nbsp;&nbsp;
        					<a href="delete?id=${ board.boardId }" class="btn btn-outline-danger" data-confirm-delete>삭제하기</a>&nbsp;&nbsp;
							<button type="button" class="btn btn-outline-primary">목록으로</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>