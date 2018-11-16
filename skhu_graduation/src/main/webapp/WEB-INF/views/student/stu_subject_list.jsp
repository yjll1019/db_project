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
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/innks/NanumSquare/master/nanumsquare.min.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${R}res/css/header.css">
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script src="${R}res/js/header.js"></script>
<!-- button drop down 링크 -->
<link rel="stylesheet" href="${R}res/css/stu_subject_list.css">
<title></title>
</head>
<body>

	<div id="jb-header">
		<div id='cssmenu'>
			<ul>
				<li><a href='#'
					style="padding: 8px; padding-left: 15px; padding-right: 0px;"><img src="${R}res/img/logo.jpg" width="29" height="29"></a></li>
				<li><a href='#'><span>나의졸업요건</span></a></li>
				<li><a href='stu_subject_list'><span>수강목록 조회</span></a></li>
				<li><a href='#'><span>졸업요건 조회</span></a></li>
				<li><a href='#'><span>공지사항 및 문의</span></a></li>
				<li style="float: right"><a href='#'><span>LOGOUT</span></a></li>
				<li style="float: right"><a href='#'><span>개인정보변경</span></a></li>
			</ul>
		</div>
	</div>
	<div id="jb-content">
				<div style="margin-left: 15%; margin-top: 5%;">
					<h3>수강 목록</h3>
				</div>

			<div id="search" style="margin-top: 1%; font-size: 10pt;">
				<div id="class1" style="display: inline; font-size: 12pt;">
				
				<form:form method="post">	
				<select class="custom-select" name="subjectListYear" id="subjectListYear" style="width: 100px; height:40px; margin-left: 15%; margin-top:1%">
				
				<%
					int enterYear = (Integer)request.getAttribute("enterYear");
					int currentYear = (Integer)request.getAttribute("currentYear");
					int i = enterYear;
					int year = 0;
					if(request.getAttribute("year")!=null)
						year = (Integer)request.getAttribute("year");
					int semester = 1;
					if(request.getAttribute("semester")!=null)
						semester = (Integer)request.getAttribute("semester");
				%>
					<option value=0>전체</option>
				<%
					for(i=enterYear; i<=currentYear; ++i){
				%>
					<option <%=(i==year)? "selected":""%>><%=i %></option>
				<%
					}
				%>
				</select> &nbsp;	
						
				<select class="custom-select" name="subjectListSemester" id="subjectListSemester" style="width: 100px; height:40px; margin-left:1%; margin-top:1%">
						 <option value=1 <%= (1==semester)? "selected" : "" %>>1학기</option>
						<option value=2 <%= (2==semester)? "selected" : "" %>>2학기</option>
					</select> &nbsp;
					
					<button type="submit" class="btn btn-primary" style="font-size: 12pt; margin-top:1%">조회</button>
				</form:form>	
				</div>
			</div>
	
	
			<div class="table-responsive"
				style="margin-left: 15%; font-size: 12pt; margin-top: 2%">
				<table class="table" style="width: 70%; margin-bottom: 100px;">
					<thead>
						<tr>
							<th>년도</th>
							<th>학기</th>
							<th>과목코드</th>
							<th>과목명</th>
							<th>이수구분</th>
							<th>학점</th>
							<th>성적등급</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="subject" items="${mySubjectlist }">
							<tr>
								<td>${subject.takeYear }</td>
								<td>${subject.takeSemester}</td>
								<td>${subject.subjectCode }</td>
								<td>${subject.subjectName }</td>
								<td>${subject.completionDivision }</td>
								<td>${subject.credit }</td>
								<td>${subject.score }</td>
								<td>
								<div class="dropdown">
									<button class="dropbtn">&nbsp;변경&nbsp;</button>
									<div class="dropdown-content">
										 <a href="<c:url value="../student/stu_replace_first" > 
  											<c:param name="subjectCode" value="${subject.subjectCode }"></c:param>
 											 </c:url>">대체과목변경(초수강)</a>
										 <a href="<c:url value="stu_replace_repeat" > 
  											<c:param name="subjectCode" value="${subject.subjectCode }"></c:param>
 											 </c:url>">대체과목변경(재수강)</a>
										 <a href="<c:url value="stu_major_admit" > 
  											<c:param name="subjectCode" value="${subject.subjectCode }"></c:param>
 											 </c:url>">전공인정신청</a>
									</div>
								</div>
							</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
	</div>
			<div id="page">
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> 
						<span aria-hidden="true">&laquo;</span> <!-- <<표시 -->
								<span class="sr-only">Previous</span> <!--  -->
						</a></li>
						<li class="page-item" name="pageCount" value=cnt><a class="page-link" href="#" value="1">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> 
						<span aria-hidden="true">&raquo;</span> <span
								class="sr-only">Next</span>
						</a></li>
					</ul>
				</nav>
	
			</div>
	</div>
</body>
</html>