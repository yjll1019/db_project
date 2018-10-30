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
<title>관리자학생리스트</title>
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
				<li style="float: right"><a href='../user/logout'><span>LOGOUT</span></a></li>
				<li style="float: right"><a href='../user/check_password'><span>개인정보변경</span></a></li>
			</ul>
		</div>
	</div>
			<div id="jb-content" style="margin-left: 3%; margin-top: 5%; padding-left: 8%">
				<div style="margin-left: 20%; margin-top: 3%;">
					<h3>학생 목록</h3>
				</div>
				<form>
				<div id="search" style="margin-top: 2%; font-size: 13pt;">
					 <div class="form-group" id="search" style="display: inline;">
					    <select class="custom-select" style="margin-left: 20%; width: 190px; height:35px;">
					      <option>소프트웨어공학과</option>
								<option>컴퓨터공학과</option>
								<option>정보통신공학과</option>
								<option>글로컬IT학과</option>
								<option>디지털컨텐츠</option>
								<option>신문방송학과</option>
								<option>경영학부</option>
								<option>사회과학부</option>
								<option>사회복지학과</option>
								<option>중어중국학과</option>
								<option>일어일본학과</option>
								<option>영어학과</option>
								<option>신학과</option>
							</select> &nbsp; 
							<select class="custom-select" style="width: 100px; display: inline; margin-left: 5px; height:35px;">
								<option>1학년</option>
								<option>2학년</option>
								<option>3학년</option>
								<option>4학년</option>
							</select>
							&nbsp; <input type="submit" class="btn btn-outline-primary" style="font-size: 14px" value="미충족학생조회"/>
			  		</div>
			  		<div class="form-group" id="class2" style="display:inline;">
						<select class="custom-select" style="width: 80px; ]display: inline; margin-left: 10%; height:35px;">
							<option>학번</option>
							<option>이름</option>
							<option>과목</option>
						</select> 
						<input type="text" name="searchText" placeholder="검색" style="margin-left: 5px; width: 120px;">

						<input type="submit" class="btn btn-primary" value="조회하기"/>
					</div>
			  </div>
			  </form>
				<div class="table-responsive"
					style="margin-left: 20%; margin-top: 2%; font-size: 12pt;">
					<table class="table" style="width: 900px;">
						<thead>
							<tr>
								<th><strong>학번</strong></th>
								<th><strong>이름</strong></th>
								<th><strong>학과</strong></th>
								<th><strong>휴대전화번호</strong></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>201632001</td>
								<td>김지혜</td>
								<td>소프트웨어공학과</td>
								<td>010-1234-5678</td>
							</tr>
							<tr>
								<td>201632002</td>
								<td>명혜연</td>
								<td>소프트웨어공학과</td>
								<td>010-1234-5678</td>
							</tr>
							<tr>
								<td>201632003</td>
								<td>이예지</td>
								<td>소프트웨어공학과</td>
								<td>010-1234-5678</td>
							</tr>
							<tr>
								<td>201632004</td>
								<td>이혜지</td>
								<td>소프트웨어공학과</td>
								<td>010-1234-5678</td>
							</tr>
							<tr>
								<td>201632005</td>
								<td>명연혜</td>
								<td>소프트웨어공학과</td>
								<td>010-1234-5678</td>
							</tr>
							<tr>
								<td>201632006</td>
								<td>김혜지</td>
								<td>소프트웨어공학과</td>
								<td>010-1234-5678</td>
							</tr>
							<tr>
								<td>201632007</td>
								<td>이지예</td>
								<td>소프트웨어공학과</td>
								<td>010-1234-5678</td>
							</tr>
							<tr>
								<td>201632008</td>
								<td>이지혜</td>
								<td>소프트웨어공학과</td>
								<td>010-1234-5678</td>
							</tr>
							<tr>
								<td>201632009</td>
								<td>김지혜</td>
								<td>소프트웨어공학과</td>
								<td>010-1234-5678</td>
							</tr>
							<tr>
								<td>201632010</td>
								<td>이티버</td>
								<td>소프트웨어공학과</td>
								<td>010-1234-5678</td>
							</tr>
							<tr>
								<td>201632011</td>
								<td>김루비</td>
								<td>소프트웨어공학과</td>
								<td>010-1234-5678</td>
							</tr>
							<tr>
								<td>201632012</td>
								<td>이낑깡</td>
								<td>소프트웨어공학과</td>
								<td>010-1234-5678</td>
							</tr>
							<tr>
								<td>201632013</td>
								<td>명라이코스</td>
								<td>소프트웨어공학과</td>
								<td>010-1234-5678</td>
							</tr>
							<tr>
								<td>201632014</td>
								<td>명설</td>
								<td>소프트웨어공학과</td>
								<td>010-1234-5678</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		
		 <div id="page"  style="margin-top: 1%;">
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
</body>
</html>