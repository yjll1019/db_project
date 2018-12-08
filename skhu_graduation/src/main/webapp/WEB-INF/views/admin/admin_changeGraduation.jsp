<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.List"%>
<%@ page import="net.skhu.dto.*" %>
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
<title>필수과목 수정</title>
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
		<div id="jb-content" style="padding-left: 6%">
		
					<form method="post" class ="form-inline mb5" action= "subjectSelect">
				<div style="font-size: 14pt;">
				<select name="departmentId" class="form-control">
    							<option >학과를 선택하세요</option>
							<c:forEach var="department" items="${departments}">
								<option value="${department.id}" ${departmentId == department.id ? "selected" : ""}>${department.name}</option>
							</c:forEach>
                  </select> 
				&nbsp;
				<select name="year" class="form-control">
				<option value="0">년도선택</option>
					<option value="2018" <c:if test="${year == 2018}">selected</c:if>>2018</option>
					<option value="2017" <c:if test="${year == 2017}">selected</c:if>>2017</option>
					<option value="2016" <c:if test="${year == 2016}">selected</c:if>>2016</option>
					<option value="2015" <c:if test="${year == 2015}">selected</c:if>>2015</option>
					<option value="2014"<c:if test="${year == 2014}">selected</c:if>>2014</option>
					<option value="2013"<c:if test="${year == 2013}">selected</c:if>>2013</option>
				</select>	
				&nbsp;
				<button type="submit" class="btn btn-outline-primary" style="font-size: 13px;">조회하기</button>	
			</div>
			</form>
			<br/>	
			<div style="font-size: 20pt;">		
			</div>
			
			<table id="table1" style="margin-top: 2%; width: 100%;">
				<thead>
					<tr>
						<th scope="col" colspan="1" id="th1"
							style="border-right: 1px solid white; font-size:15pt;">1학년</th>
						<th scope="col" colspan="1" id="th1" style="font-size:15pt;">2학년</th>
						<th scope="col" colspan="1" id="th1" style="font-size:15pt;">3학년</th>
						<th scope="col" colspan="1" id="th1" style="font-size:15pt;">4학년</th>
					</tr>
				</thead>
				<tr>
					<td id="td1" style="border-right: 1px solid silver"><strong>
							1학기 </strong></td>
					<td id="td1" style="border-right: 1px solid black"><strong>
							1학기 </strong></td>
					<td id="td1" style="border-right: 1px solid silver"><strong>
							1학기 </strong></td>
					<td id="td1"><strong> 1학기 </strong></td>
				</tr>
				
				<tr>
				<td id="td2" style="border-right: 1px solid silver">
				<c:forEach var="requiredSubject" items="${list1}">
				   <c:if test="${ requiredSubject.semester == 1}">
					
						
						<span>${requiredSubject.subjectCode}&nbsp;&nbsp;${requiredSubject.name}</span><br>
						
				
					</c:if>
					</c:forEach>
						</td>
					<td id="td2" style="border-right: 1px solid black">
					<c:forEach var="requiredSubject" items="${list2}">
				   <c:if test="${ requiredSubject.semester == 1}">
					
						
						<span>${requiredSubject.subjectCode}&nbsp;&nbsp;${requiredSubject.name}</span><br>
						
				
					</c:if>
					</c:forEach>
					</td>
					<td id="td2" style="border-right: 1px solid silver">
					<c:forEach var="requiredSubject" items="${list3}">
				   <c:if test="${ requiredSubject.semester == 1}">
					
						
						<span>${requiredSubject.subjectCode}&nbsp;&nbsp;${requiredSubject.name}</span><br>
						
				
					</c:if>
					</c:forEach>
					
					<td id="td2" style="border-right: 1px solid silver">
					
					<c:forEach var="requiredSubject" items="${list4}">
				   <c:if test="${ requiredSubject.semester == 1}">
					
						
						<span>${requiredSubject.subjectCode}&nbsp;&nbsp;${requiredSubject.name}</span><br>
						
				
					</c:if>
					</c:forEach>
					</td>
				</tr>
			
				<tr>
					<td id="td1" style="border-right: 1px solid silver;"><strong>
							2학기 </strong></td>
					<td id="td1" style="border-right: 1px solid black"><strong>
							2학기 </strong></td>
					<td id="td1" style="border-right: 1px solid silver"><strong>
							2학기 </strong></td>
					<td id="td1"><strong> 2학기 </strong></td>
				</tr>
				<tr>
					<td id="td2" style="border-right: 1px solid silver">
					<c:forEach var="requiredSubject" items="${list1}">
				   <c:if test="${ requiredSubject.semester == 2}">
					
						
						<span>${requiredSubject.subjectCode}&nbsp;&nbsp;${requiredSubject.name}</span><br>
						
				
					</c:if>
					</c:forEach>
					</td>
					<td id="td2" style="border-right: 1px solid black">
						<c:forEach var="requiredSubject" items="${list2}">
				        <c:if test="${ requiredSubject.semester == 2}">
					
						
						<span>${requiredSubject.subjectCode}&nbsp;&nbsp;${requiredSubject.name}</span><br>
						
				
					</c:if>
					</c:forEach>
					</td>
					<td id="td2" style="border-right: 1px solid silver">
							<c:forEach var="requiredSubject" items="${list3}">
				        <c:if test="${ requiredSubject.semester == 2}">
					
						
						<span>${requiredSubject.subjectCode}&nbsp;&nbsp;${requiredSubject.name}</span><br>
						
				
					</c:if>
					</c:forEach>
					</td>
					<td id="td2">
							<c:forEach var="requiredSubject" items="${list4}">
				        <c:if test="${ requiredSubject.semester == 2}">
					
						
						<span>${requiredSubject.subjectCode}&nbsp;&nbsp;${requiredSubject.name}</span><br>
						
				
					</c:if>
					</c:forEach>
					</td>
				</tr>
			</table>
			<form method = "post" action = "updateSubject">		
			 				<input type="hidden" name="departmentId" value ="${departmentId}">
 				<input type="hidden" name="year" value = "${year}">
			<div class="container" style="margin-top: 5%; font-size: 15pt; margin-left: 20%">
				<table style="width: 900px;">
					<tr>	
						<td><select name="grade" class="form-control"
							style="margin-left: 30px; border: 1px solid gray">
								<option value="1">1학년</option>
								<option value="2">2학년</option>
								<option value="3">3학년</option>
								<option value="4">4학년</option>
						</select></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td><select name="semester" class="form-control"
							style="margin-left: 30px; border: 1px solid gray">
								<option value="1">1학기</option>
								<option value="2">2학기</option>
						</select></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td><input type="text" class="form-control"
							name="subjectCode" placeholder="과목코드"
							style="margin-left: 30px; margin-right:20px;width: 150px; border: 1px solid gray"></td>
						<td><input type="text" class="form-control"
							name="subjectName" placeholder="과목명"
							style="margin-right:250px;width: 150px; border: 1px solid gray"></td>
					</tr>
				</table>
			</div>
				<input type="submit" class="btn btn-outline-primary" value="추가하기"
					style="margin-left: 42%; margin-top: 5%; font-size: 15px;"/>
			</form>
		</div>

	</div>
</body>
</html>