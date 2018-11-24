<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my"%>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://bootswatch.com/4/litera/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/innks/NanumSquare/master/nanumsquare.min.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${R}res/css/header.css">
<script src="http://code.jquery.com/jquery-latest.min.js"
	type="text/javascript"></script>
<script src="${R}res/js/header.js"></script>
<!-- button drop down 링크 -->
<link rel="stylesheet" href="${R}res/css/stu_subject_list.css">
<title></title>
</head>
<body>
	<div id="fileList">
		<div>
			<h3>수강 목록</h3>
		</div>

		<div id="search" style="margin-top: 1%; font-size: 10pt;">
			<div id="class1" style="display: inline; font-size: 12pt;">

				<form:form method="post">
					<select class="custom-select" name="subjectListYear"
						id="subjectListYear"
						style="width: 100px; height: 40px; margin-top: 1%">

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
						<option value="0">전체</option>
						<%
					for(i=enterYear; i<=currentYear; ++i){
				%>
						<option <%=(i==year)? "selected":""%>><%=i %></option>
						<%
					}
				%>
					</select> &nbsp;	
						
				<select class="custom-select" name="subjectListSemester"
						id="subjectListSemester"
						style="width: 100px; height: 40px; margin-left: 1%; margin-top: 1%">
						<option value=1 <%= (1 == semester)? "selected" : "" %>>1학기</option>
						<option value=2 <%= (2 == semester)? "selected" : "" %>>2학기</option>
					</select> &nbsp;
					
					<button type="submit" class="btn btn-primary"
						style="font-size: 12pt; margin-top: 1%">조회</button>
				</form:form>
			</div>
		</div>


		<div class="table-responsive"
			style="font-size: 12pt; margin-top: 2%">
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
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div id="page" style="margin-left: 23%;">
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-left">
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
	<!-- <<표시 --> <span class="sr-only">Previous</span> <!--  -->
				</a></li>
				<li class="page-item" name="pageCount" value=cnt><a
					class="page-link" href="#" value="1">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
						class="sr-only">Next</span>
				</a></li>
			</ul>
		</nav>
	</div>
	
<script>
	if (parent) {
		var h = $("div#fileList").height() + 100;
		parent.setIframeHeight(h); 
	} 
</script>
</body>
</html>