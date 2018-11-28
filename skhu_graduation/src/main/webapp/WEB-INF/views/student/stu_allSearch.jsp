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
		</div>
	</div>
      <div id="jb-content" style="margin-left: 10%">
         <h2>&nbsp;&nbsp;전체학과 졸업요건 안내</h2>
         <br />
         <form class="form-horizontal" method="post" >
 
				<div class="col-sm-4">
					<select name="departmentId" class="form-control"
						value="${departmentList}" style="width: 400px">
							<option selected>학과를 선택하세요</option>
						<c:forEach var="department" items="${departments}">
							<option value="${department.id}" ${departmentId == department.id ? "selected" : ""}>${department.name}</option>
						</c:forEach>
					</select>&nbsp;&nbsp;

					<button type="submit" class="btn btn-primary">조회</button>
		</div>
			<br />
         <div class="table-responsive">
            <table class="table table-bordered"
				style="margin-top: -15px; width: 1000; max-height: 500px; text-align: center; table-layout: fixed;">
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
								<td rowspan="4">${department.name} 학생</td>
								<td>${department.name}<br> 주전공</td>
								<td>${list0.graduationContent}</td>
								<td  width=230 style=""font-size: 10pt;">${list0.graduationEtc}</td>
								</tr>
								<tr>
								<td>${department.name}<br>(타과)복수전공</td>
								<td>${list1.graduationContent}</td>
								<td width=230>${list1.graduationEtc}</td>
								</tr>
								<tr>
								<td>${department.name}<br>(타과)부전공</td>
								<td>${list2.graduationContent}</td>
								<td>${list2.graduationEtc}</td>
								</tr>
								<tr>
								<td>${department.name}<br>편입</td>
								<td>${list3.graduationContent }</td>
								<td>${list3.graduationEtc}</td>
								</tr>
								<tr>
								<td rowspan="3">타과학생</td>
								<td>${department.name}<br> 전과
								</td>
								<td>학번에 따라 전공필수 이수<br> 전과이전 학기의 지도과목은 제외하되, 그만큼의 학점은
                        전선을 이수하여 전공학점을 채워야 함
								</tr>
								<tr>
								<td>${department.name }<br>복수전공
								</td>
								<td>${list4.graduationContent }</td>
								<td>${list4.graduationEtc}</td>
								</tr>
								<tr>
								<td>${department.name}<br>부전공
								</td>
								<td>${list5.graduationContent }</td>
								<td>${list5.graduationEtc}</td>
								</tr>
								</tbody>

					</table>
         </div>
         </form>
      </div>
      <br />
   </div>

</body>
</html>