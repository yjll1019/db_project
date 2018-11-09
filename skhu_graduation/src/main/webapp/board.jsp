<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
<link rel="stylesheet" href="${R}res/css/board.css">

<title>게시글 목록</title>
</head>
<body>
	<div id="jb-container">
		<div id="jb-header">
		<div id='cssmenu'>
			<ul>
				<li><a href='#' style="padding: 8px; padding-left: 15px; padding-right: 0px;">
						<img src="res/img/logo.jpg" width="29" height="29">
					</a>
				</li>
				<li><a href='#'><span>나의졸업요건</span></a></li>
				<li><a href='#'><span>수강목록 조회</span></a></li>
				<li><a href='#'><span>졸업요건 조회</span></a></li>
				<li><a href='#'><span>공지사항 및 문의</span></a></li>
				<li style="float: right"><a href='#'><span>LOGOUT</span></a></li>
				<li style="float: right"><a href='#'><span>개인정보변경</span></a></li>
			</ul>
		</div>
	</div>
	<div id="jb-content">
			<h2>공지사항 및 문의</h2>
			<hr>
			<div class="container">
				<div class="input-group"
					style="width: 500px; float: right; margin-bottom: 15px">
					<select name="searchSelect" class="form-control" id="searchSelect">
						<option value="이름">이름</option>
						<option value="제목">제목</option>
					</select> 
					&nbsp;&nbsp;
					<input type="text" class="form-control" name="searchText" style="width:200px;"
						placeholder="입력하세요">&nbsp;&nbsp; <span
						class="input-group-btn">
						<button class="btn btn-default" type="button">
							<span class="input-group-addon"><i class="fa fa-search fa"
								aria-hidden="true"></i></span>
						</button>
					</span>
				</div>

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

			<a id="createButton" class="btn btn-primary pull-right"
				href="BoardWrite.jsp?pg=">
				 <!-- ^%=currentPage%>&srchText= ^%=srchTextEncoded%>  ^자리에 < >들어가야함, pg=다음 붙어야함, 
				 이거때매 오류나서 주석 처리  
				 
				 ${ 관리자 ? 공지사항 작성페이지 url : 문의글 작성페이지 url}
				 -->
				 			 
				<i class="glyphicon glyphicon-plus"></i> 글쓰기
			</a>
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							<span class="sr-only">Previous</span>
					</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
							class="sr-only">Next</span>
					</a></li>
				</ul>
			</nav>

		</div>
		
	</div>
</body>
</html>