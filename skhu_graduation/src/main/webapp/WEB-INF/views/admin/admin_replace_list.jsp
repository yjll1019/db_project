<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>

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
<title>관리자-대체과목 목록</title>
</head>
<body>
	<div id="jb-container">
		<div id="jb-header">
		<div id='cssmenu'>
			<ul>
				<li>
					<a href='#' style="padding: 8px; padding-left: 15px; padding-right: 0px;">
						<img src="${R}res/img/logo.jpg" width="29" height="29">
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
						<li class='last'><a href='../admin/admin_replace_list'><span>대체과목 목록</span></a></li>
					</ul>
				</li>
				<li><a href='admin_board.jsp'><span>공지사항 및 문의</span></a></li>
				<li><a href='calenderEdit.jsp'><span>대학일정 관리</span></a></li>
				<li style="float: right"><a href='../user/logout'><span>LOGOUT</span></a></li>
				<li style="float: right"><a href='../user/check_password'><span>개인정보변경</span></a></li>
			</ul>
		</div>
	</div>
		<div style="margin-top: 30px; margin: 0 auto; max-width: 1000px; padding: 40px 40px; font-family: 'NanumSquare', sans-serif;">
			<h2>대체과목 목록</h2>
			<hr>
			<form:form method="get" modelAttribute="pagination">
				<form:hidden path="pg" value="1"/>
				<form:select path="sb" class="form-group"
							itemValue="value" itemLabel="label" items="${searchBy }"/>
				<form:input path="st" class="form-control" placeholder="검색하세요"/>
				<button type="submit" class="btn btn-outline-primary" style="font-size: 14px" value="조회하기"></button>
			</form:form>
			<!--	
				<div class="form-group" style="margin-top: -10px; margin-left: 415px; width: 540px;">
					<select name="major" class="form-control" style="display: inline; width: 120px; height: 35px; font-size: 15px;">
						<option value="학부/학과">학부/학과</option>
						<option value="소프트웨어공학과">소프트웨어공학과</option>
						<option value="정보통신공학과">정보통신공학과</option>
						<option value="컴퓨터공학과">컴퓨터공학과</option>
						<option value="글로컬IT공학과">글로컬IT공학과</option>
					</select>
					<select name="searchSubject" class="form-control" style="display: inline; width: 120px; height: 35px; font-size: 15px;">
						<option>과목코드</option>
						<option>과목이름</option>
					</select>
					<input type="text" class="form-control" name="searchText" placeholder="검색" style="display: inline; margin-left: 5px; width: 150px; height: 35px;">
					<input type="submit" class="btn btn-outline-primary" style="font-size: 14px" value="조회하기"/>
				</div>
			</form>
			 -->
			<br />
			<table class="table table-bordered" style="margin-top: -35px; width: 700; height: 300px; text-align: center; table-layout: fixed;">
				<thead>
					<tr style="background-color: #4582EC; color: white;">
						<th scope="col" colspan="2" style="border-right: 1px solid white; font-size: 15pt">폐지된 과목</th>
						<th scope="col" colspan="2" style="font-size: 15pt">대체 과목</th>
					</tr>
				</thead>
				<tr style="font-size: 18px">
					<td style="height: 50px; border-right: 1px solid silver"><strong> 과목코드 </strong></td>
					<td style="height: 50px; border-right: 1px solid black"><strong> 과목명 </strong></td>
					<td style="height: 50px; border-right: 1px solid silver"><strong> 과목코드 </strong></td>
					<td><strong> 과목명 </strong></td>
				</tr>
				<tbody style="font-size: 12pt;">
					<c:forEach var="replace" items="${replace }">
						<tr>
							<td style="border-right: 1px solid silver">${replace.subjectCode }</td>
							<td style="border-right: 1px solid black">${replace.subject.subjectName }</td>
							<td style="border-right: 1px solid silver">${replace.replaceSubject }</td>
							<td style="border-right: 1px solid silver">${replace.replaceSubjectName }</td>
						</tr>
					</c:forEach>
					
				</tbody>
			</table>
			<div style="margin-top: 4%">
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center" style="margin-top:20px;">
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
			<div class="container" style="margin-top: 30px; font-size: 15pt">
			<form>
				<table style="width: 900px;">
					<tr>
						<td><strong>폐지과목</strong></td>
						<td><select name="major" class="form-control"
							style="margin-left: 0px; border: 1px solid gray">
								<option value="학부/학과">학부/학과</option>
								<option value="소프트웨어공학과">소프트웨어공학과</option>
								<option value="정보통신공학과">정보통신공학과</option>
								<option value="컴퓨터공학과">컴퓨터공학과</option>
								<option value="글로컬IT공학과">글로컬IT공학과</option>
							</select>
						</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>
							<select name="grade" class="form-control" style="margin-left: 10px; border: 1px solid gray;">
								<option value="1">1학년</option>
								<option value="2">2학년</option>
								<option value="3">3학년</option>
								<option value="4">4학년</option>
							</select>
						</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>
							<select name="term" class="form-control" style="margin-left: 10px; border: 1px solid gray;">
								<option value="1">1학기</option>
								<option value="2">2학기</option>
							</select>
						</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>
							<input type="text" class="form-control" name="subjectCode" placeholder="과목코드"
								style="margin-left: 10px; width: 130px; border: 1px solid gray"/>
						</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>
							<input type="text" class="form-control" name="subjectName" placeholder="과목명"
								style="width: 200px; border: 1px solid gray;"/>
						</td>
					</tr>
					<tr><td>&nbsp;</td></tr>
					<tr>
						<td style="width: 100px"><strong>대체과목</strong></td>
						<td><select name="major" class="form-control"
							style="margin-left: 0px; border: 1px solid gray">
								<option value="학부/학과">학부/학과</option>
								<option value="소프트웨어공학과">소프트웨어공학과</option>
								<option value="정보통신공학과">정보통신공학과</option>
								<option value="컴퓨터공학과">컴퓨터공학과</option>
								<option value="글로컬IT공학과">글로컬IT공학과</option>
							</select>
						</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>
							<select name="grade" class="form-control" style="margin-left: 10px; border: 1px solid gray;">
								<option value="1">1학년</option>
								<option value="2">2학년</option>
								<option value="3">3학년</option>
								<option value="4">4학년</option>
							</select>
						</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>
							<select name="term" class="form-control" style="margin-left: 10px; border: 1px solid gray;">
								<option value="1">1학기</option>
								<option value="2">2학기</option>
							</select>
						</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>
							<input type="text" class="form-control" name="subjectCode" placeholder="과목코드"
								style="margin-left: 10px; width: 130px; border: 1px solid gray"/>
						</td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>
							<input type="text" class="form-control" name="subjectName" placeholder="과목명"
								style="width: 200px; border: 1px solid gray;"/>
						</td>
					</tr>
				</table>
				<input type="submit" class="btn btn-outline-primary" value="저장하기"
					style="margin-left: 45%; margin-top: 3%; font-size: 15px;"/>
			</form>
			<form action="replace_upload" method="post" enctype="multipart/form-data">							
					<div class="form-group" style="display: inline;">
						<input type="file" name="file" style="width: 250px;">
						<button type="submit" class="btn btn-primary">업로드</button>			   	
		 			</div>				
				</form>
			</div>
		</div>
		<my:pagination pageSize="${pagination.sz }" recordCount="${pagination.recordCount }"/>
	</div>
</body>
</html>