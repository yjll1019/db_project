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

<script language="javascript">
	function open_page() {
		window.open("../admin/superAdmin_create", "등록",
				"width=1170, height=300, left=50, top=50");
	}
</script>
<title>슈퍼관리자 관리 페이지</title>
<style>
	#jb-content {
		width: 80%;
		margin: 20px;
		font-family: 'NanumSquare', sans-serif;
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
		<div id="jb-content" style="margin-left: 3%; margin-top: 5%; padding-left: 8%">
				<div style="margin-left: 20%; margin-top: 3%;">
					<h3>관리자,교수 목록</h3>
				</div>
				<div class="form-group"
				style="margin-top: 5px;style="display: inline;">
				
				<button type="button" class="btn btn-outline-primary"
					style="display: inline; width: 100px; margin-left: 30px;  float: left"
					onclick="open_page()">등록하기
				</button>
				
				<form method="get" action="search">
				<select name="search" class="form-control"
					style="display: inline; margin-left:400px;width: 90px; height: 35px; font-size: 15px;">
					<option value="">전체</option>
					<option value="교수">교수</option>
					<option value="관리자">관리자</option>
				</select> 
				
				<input type="text" class="form-control" name="searchText"
					placeholder="검색"
					style="display: inline; margin-left: 5px; width: 150px; height: 35px;">

				<button type="submit" class="btn btn-primary">조회</button>
				</form>

			</div>
			<br />
			<div class="table-responsive"
				style="margin-top: -35px;padding-left: 40px; padding-right: 40px; font-size: 15pt;">
				<table class="table" style="width: 800px;">
					<thead>
						<tr>
							<th>직책</th>
							<th>이름</th>
							<th>이메일</th>
							<th>전화번호</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="user" items="${ list }">
								<tr style="cursor:pointer">
									<td>${ user.role }</td>
									<td>${ user.userName }</td>
									<td>${ user.email }</td>
									<td>${ user.phone }</td>
								</tr>
							</c:forEach>

					</tbody>
				</table>
			</div>
				
			</div>
			<div id="page"  style="margin-top: 1%;">
			<nav aria-label="Page navigation example"> 
 				 <ul class="pagination justify-content-center">
    				<li class="page-item"><a class="page-link" href="#">1</a></li>
    				<li class="page-item"><a class="page-link" href="#">2</a></li>
    				<li class="page-item"><a class="page-link" href="#">3</a></li>
 				 </ul>
			</nav>		
		</div>
	</div>
</body>
</html>