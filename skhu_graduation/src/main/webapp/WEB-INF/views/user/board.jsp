<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://bootswatch.com/4/litera/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${R}res/css/header.css">
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script src="${R}res/js/header.js"></script>
<script>
$(function() { 
	$("[data-url]").click(function() { 
		var url = $(this).attr("data-url");   
		location.href = url;
	})  
})
</script>
<link rel="stylesheet" href="${R}res/css/board.css">
<title>게시글 목록</title>
</head>
<body>
	<div id="jb-container">
		<div id="jb-header"> <!-- role에 따라 다른 헤더가 보이도록 할 예정 -->
		<div id='cssmenu'>
			<c:if test="${ user.role == '관리자' }">
				<ul>
					<li>
						<a style="padding: 8px; padding-left: 15px; padding-right: 0px;">
							<img src="${R}res/img/logo.jpg" width="29" height="29">
						</a>
					</li>
					<li><a href='../admin/admin_stu_search'><span>학생 조회</span></a></li>
					<li class='active has-sub'><a><span>졸업요건 수정</span></a>
						<ul>
							<li class='last'><a href='../admin/admin_allSearchEdit'><span>졸업요건표 수정</span></a></li>
							<li class='last'><a href='../admin/admin_change_credit'><span>필수학점 수정</span></a></li>
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
					<li style="float: right"><a href='../user/logout'><span>LOGOUT</span></a></li>
					<li style="float: right"><a href='../user/check_password'><span>개인정보변경</span></a></li>
				</ul>
			</c:if>
			<c:if test="${ user.role == '학생' }">
				<ul>
				<li><a style="padding: 8px; padding-left: 15px; padding-right: 0px;">
					<img src="${R}res/img/logo.jpg" width="29" height="29"></a>
				</li>
				<li><a href='../student/stu_main'><span>나의졸업요건</span></a></li>
				<li><a href='../student/stu_subject_list'><span>수강목록 조회</span></a></li>
				<li><a href='../student/stu_allSearch'><span>졸업요건 조회</span></a></li>
				<li><a href='../student/stu_replace_list'><span>대체과목 조회</span></a></li>
				<li><a href='../user/board'><span>공지사항 및 문의</span></a></li>
				<li style="float: right"><a href='../user/logout'><span>LOGOUT</span></a></li>
				<li style="float: right"><a href='../user/check_password'><span>개인정보변경</span></a></li>
			</ul>
			</c:if>
			<c:if test="${ user.role == '교수' }">
				<ul>
				<li><a style="padding: 8px; padding-left: 15px; padding-right: 0px;">
					<img src="${R}res/img/logo.jpg" width="29" height="29"></a>
				</li>
				<li><a href='../professor/professor_stu_search'><span>학생 조회</span></a></li>
				<li><a href='../professor/professor_allSearch'><span>졸업요건 조회</span></a></li>
				<li><a href='../user/board'><span>공지사항 및 문의</span></a></li>
				<li style="float: right"><a href='../user/logout'><span>LOGOUT</span></a></li>
				<li style="float: right"><a href='../user/check_password'><span>개인정보변경</span></a></li>
			</ul>
			</c:if>
		</div>
	</div>
	<div id="jb-content">
			<h2>공지사항 및 문의</h2>
			<hr>
			<div class="container">
				<form:form method="get" modelAttribute="pagination">
				<form:hidden path="pg" value="1" />
	 				<div class="input-group" style="width: 500px; float: right; margin-bottom: 15px">
						<select name="sb" class="form-control" id="sb">
							<option value="0">전체</option>
							<option value="1">이름</option>
							<option value="2">제목</option>
						</select> 
						&nbsp;&nbsp;
						<input type="text" class="form-control" name="st" style="width:200px;" placeholder="입력하세요">&nbsp;&nbsp; 
						<span class="input-group-btn">
							<input class="btn btn-default" type="submit">
								<span class="input-group-addon">
									<i class="fa fa-search fa" aria-hidden="true"></i>
								</span>
							</>
						</span>
					</div>
				</form:form>
			</div>
			<br />
			<table class="table table-hover">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="board" items="${ boards }">
						<c:choose>
							<c:when test="${ board.postType == 1 }">
								<tr class="notice" data-url="board_notice?id=${ board.boardId }">
									<td id="word-color"><i class="fa fa-bullhorn fa"></i></td>
									<td id="word-color">${ board.title }</td>
									<td id="word-color">${ board.userName }</td>
									<td id="word-color">
										<fmt:formatDate pattern="yyy-MM-dd" value="${ board.date }" />
									</td>
								</tr>
							</c:when>
							<c:when test="${ board.postType == 2 }">
								<tr data-url="${board.groupOrder == 1 ? 'board_answer' : 'board_question_unlocked'}?boardId=${board.boardId}">
									<td>${ board.boardId }</td>
									<td>${ board.groupOrder == 1 ? '<i class="fa fa-arrow-right fa"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;' : ''}
										${ !empty board.password ? '<i class="fas fa-lock fa"></i>&nbsp;' : ''}${ board.title }</td>
									<td>${ board.userName }</td>
									<td>
										<fmt:formatDate pattern="yyy-MM-dd" value="${ board.date }" />
									</td>
								</tr>
							</c:when>
						</c:choose>
					</c:forEach>
				</tbody>
			</table>

			<a class="btn btn-primary pull-right" href="${ user.role == '관리자' ? 'board_notice_create' : 'board_question_create' }">		 
				<i class="glyphicon glyphicon-plus"></i> 글쓰기
			</a>
			
				<my:pagination pageSize="${pagination.sz }"
			recordCount="${pagination.recordCount }" />

		</div>	
	</div>
</body>
</html>