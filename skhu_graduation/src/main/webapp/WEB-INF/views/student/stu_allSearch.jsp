<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="R" value="/" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://bootswatch.com/4/litera/bootstrap.min.css">
<link rel="stylesheet" href="${R}res/css/layout.css">
<link rel="stylesheet" href="${R}res/css/calender.css">
<script src="${R}res/js/calender.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<link rel="stylesheet" href="${R}res/css/Nwagon.css" type="text/css">
<link rel="stylesheet" href="${R}res/css/circle.css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${R}res/css/header.css">
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script src="${R}res/js/header.js"></script>
<script src="${R}res/js/Nwagon.js"></script>
<title>졸업요건 조회</title>
<style>
#jb-content {
   width: 80%;
   padding: 40px;
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
				<li><a href='#'
					style="padding: 8px; padding-left: 15px; padding-right: 0px;"><img src="${R}res/img/logo.jpg" width="29" height="29"></a></li>
				<li><a href='../student/stu_main'><span>나의졸업요건</span></a></li>
				<li><a href='../student/stu_subject_list'><span>수강목록 조회</span></a></li>
				<li><a href='../student/stu_allSearch'><span>졸업요건 조회</span></a></li>
				<li><a href='../student/stu_replace_list'><span>대체과목 조회</span></a></li>
				<li><a href='../user/board'><span>공지사항 및 문의</span></a></li>
				<li style="float: right"><a href='../user/logout'><span>LOGOUT</span></a></li>
				<li style="float: right"><a href='../user/check_password'><span>개인정보변경</span></a></li>
			</ul>
		</div>
	</div>
      <div id="jb-content" style="margin-left: 5%">
         <h2>&nbsp;&nbsp;전체학과 졸업요건 안내</h2>
         <br />
         <form class="form-horizontal" method="post" >
 
				<div class="col-sm-4">
					<select name="departmentId" class="form-control"
						value="${departmentList}" style="width: 400px">
							<option selected>학과를 선택하세요</option>
						<c:forEach var="department" items="${departments}">
							<option value="${department.id}">${department.name}</option>
						</c:forEach>
					</select>&nbsp;&nbsp;

					<button type="submit" class="btn btn-primary">조회</button>
		</div>
			<br />
         <div class="table-responsive">
            <table class="table">
               <thead>
                  <tr>
                     <th>대상</th>
                     <th>부/복수전공</th>
                     <th>졸업요건</th>
                     <th>기타요건</th>
                  </tr>
               </thead>
						<tbody>
							<tr>
								<td rowspan="4">${student.department.name} 학생</td>
								<td>${student.department.name}<br> 주전공</td>
								</tr>
								<c:forEach var = "text" items="${ list }">
								<tr>
								<td>${text.graduationContent}</td>
								<td>${text.graduationEtc }
								</tr>
								</c:forEach>

					</table>
         </div>
         </form>
      </div>
      <br />
   </div>

</body>
</html>