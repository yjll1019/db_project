<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://bootswatch.com/4/litera/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<!-- 폰트 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${R}res/css/header.css">
<script src="http://code.jquery.com/jquery-latest.min.js"
	type="text/javascript"></script>
<script src="${R}res/js/header.js"></script>
<title>관리자 과목리스트</title>
<style>
#jb-content {
	width: 80%;
	margin: 20px;
	font-family: 'NanumSquare', sans-serif;
}
</style>
<%
	String s = request.getParameter("r");
%>
<script>
	var r =
<%=s%>
	;
	if (r == "1") {
		alert('업로드 성공!');
	} else if (r == "-1") {
		alert('업로드 실패 혹은 선택된 파일이 없습니다.');
	}
</script>
</head>
<body>
	<div id="jb-container">
		<div id="jb-header">
			<div id='cssmenu'>
				<c:if test="${user.role=='관리자' }">
					<ul>
						<li><a
							style="padding: 8px; padding-left: 15px; padding-right: 0px;">
								<img src="${R}res/img/logo.jpg" width="29" height="29">
						</a></li>
						<li><a href='../admin/admin_stu_search'><span>학생
									조회</span></a></li>
						<li class='active has-sub'><a><span>졸업요건 수정</span></a>
							<ul>
								<li class='last'><a href='../admin/admin_allSearchEdit'><span>졸업요건표
											수정</span></a></li>
								<li class='last'><a href='#'><span>필수학점 수정</span></a></li>
								<li class='last'><a href='../admin/admin_changeGraduation'><span>필수과목
											수정</span></a></li>
							</ul></li>
						<li class='active has-sub'><a><span>과목 목록 수정</span></a>
							<ul>
								<li class='last'><a href='../admin/admin_all_subject'><span>전체과목
											목록</span></a></li>
								<li class='last'><a href='../admin/admin_replace_list'><span>대체과목
											목록</span></a></li>
							</ul></li>
						<li><a href='../user/board'><span>공지사항 및 문의</span></a></li>
						<li><a href='../admin/admin_calenderEdit'><span>대학일정
									관리</span></a></li>
						<li style="float: right"><a href='../user/logout'><span>LOGOUT</span></a></li>
						<li style="float: right"><a href='../user/check_password'><span>개인정보변경</span></a></li>
					</ul>
				</c:if>
				<c:if test="${user.role=='슈퍼관리자'}">
					<ul>
						<li><a
							style="padding: 8px; padding-left: 15px; padding-right: 0px;">
								<img src="${R}res/img/logo.jpg" width="29" height="29">
						</a></li>
						<li><a href='../admin/admin_stu_search'><span>학생
									조회</span></a></li>
						<li class='active has-sub'><a><span>졸업요건 수정</span></a>
							<ul>
								<li class='last'><a href='../admin/admin_allSearchEdit'><span>졸업요건표
											수정</span></a></li>
								<li class='last'><a href='#'><span>필수학점 수정</span></a></li>
								<li class='last'><a href='../admin/admin_changeGraduation'><span>필수과목
											수정</span></a></li>
							</ul></li>
						<li class='active has-sub'><a><span>과목 목록 수정</span></a>
							<ul>
								<li class='last'><a href='../admin/admin_all_subject'><span>전체과목
											목록</span></a></li>
								<li class='last'><a href='../admin/admin_replace_list'><span>대체과목
											목록</span></a></li>
							</ul></li>
						<li><a href='../user/board'><span>공지사항 및 문의</span></a></li>
						<li><a href='../admin/admin_calenderEdit'><span>대학일정
									관리</span></a></li>
						<li><a href='../admin/superAdmin_manage'><span>관리자/교수
									관리</span></a></li>
						<li style="float: right"><a href='../user/logout'><span>LOGOUT</span></a></li>
						<li style="float: right"><a href='../user/check_password'><span>개인정보변경</span></a></li>
					</ul>
				</c:if>
			</div>
		</div>
		<div id="jb-content"
			style="margin-left: 3%; margin-top: 3%; padding-left: 8%">
			<div style="margin-left: 20%; margin-top: 3%; margin-bottom: 2%;">
				<h3>과목 목록</h3>
			</div>
		<div style="display: inline">
			<form action="subject_upload" method="post" enctype="multipart/form-data"style="display: inline">
				<div class="form-group" style="margin-left: 20%; margin-top: 10px; display: inline">
					<input type="file" name="file" style="width: 250px;">
					<button type="submit" class="btn btn-primary"
						style="font-size: 13px;">업로드</button> 
				</div> 
			</form>
			
			<form:form method="get" modelAttribute="pagination" style="display: inline">
				<form:hidden path="pg" value="1" />
				<form:select path="sb" class="form-control"
					style="display: inline; max-width:150px; margin-left: 8%;" 
					itemValue="value" itemLabel="label" items="${searchBy }" />
				<form:input path="st" class="form-control"
					style="display: inline; max-width:200px;" placeholder="검색하세요" />
				<input type="submit" class="btn btn-outline-primary" value="조회하기" />
			</form:form>
			</div>
			<form method="get">
				<div class="table-responsive"
					style="margin-left: 20%; margin-top: 20px; font-size: 12pt;">
					<table class="table" style="width: 900px;">
						<thead style="font-size: 18px; font-weight: 500px;">
							<tr>
								<th>년도</th>
								<th>학기</th>
								<th>과목코드</th>
								<th>분반</th>
								<th>개설소속</th>
								<th>과목명</th>
								<th>이수구분</th>
								<th>학점</th>
							</tr>
						</thead>
						<tbody style="font-size: 12pt;">
							<c:forEach var="subjectlist" items="${subjectlist}">
								<tr>
									<td>${subjectlist.year}</td>
									<td>${subjectlist.semester }</td>
									<td>${subjectlist.code }</td>
									<td>${subjectlist.divisionClass }</td>
									<td>${subjectlist.name}</td>
									<td>${subjectlist.subjectName }</td>
									<td>${subjectlist.completionDivision }</td>
									<td>${subjectlist.credit }</td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
				</div>
				</form>
		</div>
		<div style="margin-left: 24%">  
			<my:pagination pageSize="${pagination.sz }"
			recordCount="${pagination.recordCount }" />
		</div>
	</div>
</body>
</html>