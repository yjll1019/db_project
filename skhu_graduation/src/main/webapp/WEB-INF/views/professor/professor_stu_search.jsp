<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://bootswatch.com/4/litera/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css"><!-- 폰트 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${R}res/css/header.css">
<script src="http://code.jquery.com/jquery-latest.min.js"
	type="text/javascript"></script>
<script src="${R}res/js/header.js"></script>
<style>
	#jb-content {
	width: 80%;
	margin: 20px;
	font-family: 'NanumSquareRound', sans-serif;
}
</style>
<title>교수 학생리스트 </title>
</head>
<body>
	<div id="jb-container">
	<div id="jb-header">
		<div id='cssmenu'>
			<ul>
				<li><a href='#'
					style="padding: 8px; padding-left: 15px; padding-right: 0px;"><img src="${R}res/img/logo.jpg" width="29" height="29"></a></li>
				<li><a href='#'><span>학생 조회</span></a></li>
				<li><a href='#'><span>졸업요건 조회</span></a></li>
				<li><a href='#'><span>공지사항 및 문의</span></a></li>
				<li style="float: right"><a href='../user/logout'><span>LOGOUT</span></a></li>
				<li style="float: right"><a href='#'><span>개인정보변경</span></a></li>
			</ul>
		</div>
	</div>
		<div id="jb-content" style="margin-left: 3%; margin-top:5%;">
				<div style="margin-left: 20%;">
					<h3>학생 목록</h3>
				</div>
				
		<div id="search" style="margin-top: 2%; font-size: 13pt;">
         <div id="class1" style="display: inline; margin-left: 20%; ">
			<select name="grade" style="width: 100px; display: inline; margin-left: 3px; height:40px;">
				<option value="1">1학년</option>
				<option value="2">2학년</option>
				<option value="3">3학년</option>
				<option value="4">4학년</option>
			</select>
            &nbsp;
			<button type="button" class="btn btn-outline-primary" style="font-size: 10pt">미충족학생조회</button>
         </div>
         
         <div id="class2" style="display: inline; margin-left:27%;">
            <select name="searchIndex" style="width: 100px; display: inline; margin-left: 5px; height:40px;">
               <option value="0">학번</option>
               <option value="1">이름</option>
                 <option value="2">과목</option>
            </select>
            
            <input type="text" name="searchText" placeholder="검색"  style="margin-left:7px; width: 150px;">
         
         <button type="button" class="btn btn-primary">조회</button>
         </div>
      </div>

      
   				<div class="table-responsive"
					style="margin-left: 20%; margin-top: 2%; font-size: 14pt;">
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
						<c:forEach var="student" items="${ students }">
							<tr>
								<td>${student.userId}</td>
								<td>${student.user.userName}</td>
								<td>${student.department.name}</td>
								<td>${student.user.phone}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
      
      <div id="page" style="margin-top: 3%">
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