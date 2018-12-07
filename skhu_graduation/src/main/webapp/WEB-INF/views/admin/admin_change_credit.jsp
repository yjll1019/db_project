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
<title>필수학점 수정</title>
</head>
<script>

</script>
<body>
	<div id="jb-container">
		<div id="jb-header">
		<div id='cssmenu'>
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
				<li><a href='../admin/calenderEdit'><span>대학일정 관리</span></a></li>
				<li style="float: right"><a href='../user/logout'><span>LOGOUT</span></a></li>
				<li style="float: right"><a href='../user/check_password'><span>개인정보변경</span></a></li>
			</ul>
		</div>
	</div>
	
            <div style="margin-left: 13%; margin-top: 3%;">
               <h3>필수 학점 수정</h3></br>
            </div>
         <form class="form-horizontal" action = "creditSelect">

			  	  <div class="form-group" id="class2" style="display:inline;">
                  <select name="departmentId" class="custom-select" style="width: 300px; ]display: inline;margin-left: 13%; height:35px;">
     							<option >학과를 선택하세요</option>
							<c:forEach var="department" items="${departments}">
								<option value="${department.id}" ${departmentId == department.id ? "selected" : ""}>${department.name}</option>
							</c:forEach>
                  </select> 
                  
                  	<select name="year" class="custom-select"  style="width: 200px; ]display: inline;margin-left: 1%; height:35px;">
                  	<option >연도를 선택하세요</option>
					<option value="2018">2018</option>
					<option value="2017" >2017</option>
					<option value="2016" >2016</option>
					<option value="2015" >2015</option>
					<option value="2014">2014</option>
					<option value="2013">2013</option>
				</select>
                  

                  <input type="submit" class="btn btn-primary" style="font-size: 10pt;" value="조회하기"/>
               </div>							
		</form>
		
		





			</div>
			
			</body>
</html>