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
	href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${R}res/css/header.css">
<script src="http://code.jquery.com/jquery-latest.min.js"
	type="text/javascript"></script>
<script src="${R}res/js/header.js"></script>
<title>학생- 대체과목 리스트 </title>
</head>
<body>
	<div id="jb-container">
		<div id="jb-header">
		<div id='cssmenu'>
			<ul>
				<li><a style="padding: 8px; padding-left: 15px; padding-right: 0px;"><img src="${R}res/img/logo.jpg" width="29" height="29"></a></li>
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
		<div
			style="margin-top: 30px; margin: 0 auto; max-width: 1000px; padding: 40px 40px; font-family: 'NanumSquare', sans-serif;">
			<h2>대체과목 목록</h2>
			<hr>
			<form:form method="get" modelAttribute="pagination">
				<form:hidden path="pg" value="1" />
				<form:select path="sb" class="form-control"
					style="display: inline; max-width:150px; margin-left:450px;"
					itemValue="value" itemLabel="label" items="${searchBy }" />
				<form:input path="st" class="form-control"
					style="display: inline; max-width:200px;" placeholder="검색하세요" />
				<input type="submit" class="btn btn-outline-primary" value="조회하기" />
			</form:form>

			<br />
			<table class="table table-bordered"
				style="margin-top: -15px; width: 700; max-height: 300px; text-align: center; table-layout: fixed;">
				<thead>
					<tr style="background-color: #4582EC; color: white;">
						<th scope="col" colspan="2"
							style="border-right: 1px solid white; font-size: 15pt">폐지된
							과목</th>
						<th scope="col" colspan="2" style="font-size: 15pt">대체 과목</th>
						<th style="border-right: 1px solid white; font-size: 15pt">삭제</th>
					</tr>
				</thead>
				<tr style="font-size: 18px">
					<td style="height: 20px; border-right: 1px solid silver"><strong>
							과목코드 </strong></td>
					<td style="height: 20px; border-right: 1px solid black"><strong>
							과목명 </strong></td>
					<td style="height: 20px; border-right: 1px solid silver"><strong>
							과목코드 </strong></td>
					<td><strong> 과목명 </strong></td>
					<td><strong> 삭제 </strong></td>
				</tr>
				<tbody style="font-size: 12pt;">
					<c:forEach var="replace" items="${replace }">
						<c:if test="${replace.subjectName ne null }">
						<tr>
							<td style="border-right: 1px solid silver">${replace.subjectCode }</td>
							<td style="border-right: 1px solid black">${replace.subjectName }</td>
							<td style="border-right: 1px solid silver">${replace.replaceSubject }</td>
							<td style="border-right: 1px solid silver"><c:choose>
									<c:when test="${replace.completionDivision eq '1'}"> 
                                    전공 선택 과목으로 대체
                               </c:when>
                        <c:when test="${replace.completionDivision eq '2'}"> 
                                    경제학전공 과목에서 선택
                               </c:when>
                               <c:when test="${replace.completionDivision eq '3'}"> 
                                    교양사회영역 선택과목으로 대체
                               </c:when>
                               <c:when test="${replace.completionDivision eq '4'}"> 
                                    교양선택과목으로 대체
                               </c:when>
                               <c:when test="${replace.completionDivision eq '5'}"> 
                                    교양인문영역 선택과목으로 대체
                               </c:when>
                               <c:when test="${replace.completionDivision eq '6'}"> 
                                    교양자연영역 선택과목으로 대체
                               </c:when>
                               <c:when test="${replace.completionDivision eq '7'}"> 
                                    사회진출실 개설 교과목으로 대체
                               </c:when>
                               <c:when test="${replace.completionDivision eq '8'}"> 
                                    사회학전공 과목에서 선택
                               </c:when>
                               <c:when test="${replace.completionDivision eq '9'}"> 
                                    정치학전공 과목에서 선택
                               </c:when>
								</c:choose> ${replace.replaceSubjectName}</td>
							<td><a href="replaceDelete?subjectCode=${ replace.subjectCode }&replaceSubject=${replace.replaceSubject}"class="btn btn-danger">삭제</a></td>
						</tr>
						</c:if>
					</c:forEach>

				</tbody>
			</table>

			<my:pagination pageSize="${pagination.sz }"
				recordCount="${pagination.recordCount }" />

		</div>
	</div>
</body>
</html>