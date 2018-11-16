<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://bootswatch.com/4/litera/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${R}res/css/header.css">
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script src="${R}res/js/header.js"></script>
<link rel="stylesheet" href="${R}res/css/board.css">
<script>
	var r = ${ result };
	if(r == -1){
        alert('비밀번호는 4자리 이상이어야합니다.');
     }
</script>
<title>문의 작성 및 수정</title>
</head>
<body>
	<div id="jb-container">
		<div id="jb-header">
			<div id='cssmenu'>
				<c:if test="${ user.role == '관리자' }">
				<ul>
					<li>
						<a href='#' style="padding: 8px; padding-left: 15px; padding-right: 0px;">
							<img src="res/img/logo.jpg" width="29" height="29">
						</a>
					</li>
					<li><a href='admin_stu_search.jsp'><span>학생 조회</span></a></li>
					<li class='active has-sub'><a><span>졸업요건 수정</span></a>
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
					<li><a href='admin_calenderEdit.jsp'><span>대학일정 관리</span></a></li>
					<li style="float: right"><a href='#'><span>LOGOUT</span></a></li>
					<li style="float: right"><a href='adminInfo.jsp'><span>개인정보변경</span></a></li>
				</ul>
			</c:if>
			<c:if test="${ user.role == '학생' }">
				<ul>
					<li><a href='#' style="padding: 8px; padding-left: 15px; padding-right: 0px;"><img src="${R}res/img/logo.jpg" width="29" height="29"></a></li>
					<li><a href='#'><span>나의졸업요건</span></a></li>
					<li><a href='#'><span>수강목록 조회</span></a></li>
					<li><a href='#'><span>졸업요건 조회</span></a></li>
					<li><a href='#'><span>공지사항 및 문의</span></a></li>
					<li style="float: right"><a href='../user/logout'><span>LOGOUT</span></a></li>
					<li style="float: right"><a href='student/stu_info'><span>개인정보변경</span></a></li>
				</ul>
			</c:if>
			<c:if test="${ user.role == '교수' }">
				<ul>
					<li><a href='#' style="padding: 8px; padding-left: 15px; padding-right: 0px;"><img src="${R}res/img/logo.jpg" width="29" height="29"></a></li>
					<li><a href='#'><span>학생 조회</span></a></li>
					<li><a href='#'><span>졸업요건 조회</span></a></li>
					<li><a href='#'><span>공지사항 및 문의</span></a></li>
					<li style="float: right"><a href='../user/logout'><span>LOGOUT</span></a></li>
					<li style="float: right"><a href='../user/check_password'><span>개인정보변경</span></a></li>
				</ul>
			</c:if>
			</div>
		</div>
		<div id="jb-content">
			<div id="boardWrite"style="max-width: 800px;">
				<h3>&nbsp;&nbsp;글 ${ board.boardId > 0 ? "수정" : "등록" }</h3>
				<hr>
				<form method="post">
					<table class="table table-bordered" style="margin-left: 10%; margin-top: 40px; font-size: 17px; text-align: center; width: 80%">
						<tr>
							<td style="background-color: #4582EC; color: white; padding-top: 18px"><strong>제목</strong></td>
							<td colspan="3">
								<input type="text" class="form-control" name="title" value="${ board.title }" style="height: 35px">
							</td>
						</tr>
						<tr>
							<td style="background-color: #4582EC; color: white; height: 400px; padding-top: 190px"><strong>내용</strong></td>
							<td colspan="3">
								<textarea name="content" class="form-control" style="width: 100%; height: 400px;">${ board.content }</textarea>
							</td>
						</tr>
						<tr>
							<td style="background-color: #4582EC; color: white; padding-top: 26px"><strong>비밀번호</strong></td>
							<td colspan="3" style="text-align: left">
								<input type="password" class="form-control" name="password" value="${ board.password }"
									style="width: 150px; height: 35px; font-family: sans-serif">
								<span style="color: gray; font-size: 12pt">※ 비밀번호를 입력하시면 비밀글로 저장됩니다. (비밀번호는 4자리 이상)</span>
							</td>
						</tr>
					</table>
					
					<div class="form-group" align="center" style="margin-top: 40px">
      					<button type="submit" class="btn btn-primary">등록하기</button>&nbsp;&nbsp;
      					<c:if test="${ board.boardId > 0 }">
        					<a href="questionDelete?id=${ board.boardId }" class="btn btn-danger" data-confirm-delete>삭제하기</a>&nbsp;&nbsp;
        				</c:if>
      					<a href="board" class="btn btn-outline-primary">목록으로</a>
    				</div>					
				</form>
			</div>
		</div>
	</div>
</body>
</html>