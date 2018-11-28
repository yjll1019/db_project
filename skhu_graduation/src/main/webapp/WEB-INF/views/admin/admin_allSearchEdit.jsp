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
<title>allSearchEdit</title>
</head>
<body>
		<div id="jb-header">
		<div id='cssmenu'>
			<c:if test="${user.role=='관리자' }">
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
				<li><a href='../admin/admin_calenderEdit'><span>대학일정 관리</span></a></li>
				<li style="float: right"><a href='../user/logout'><span>LOGOUT</span></a></li>
				<li style="float: right"><a href='../user/check_password'><span>개인정보변경</span></a></li>
			</ul>
			</c:if>
			<c:if test="${user.role=='슈퍼관리자'}">
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
				<li><a href='../admin/admin_calenderEdit'><span>대학일정 관리</span></a></li>
				<li><a href='../admin/superAdmin_manage'><span>관리자/교수 관리</span></a></li>
				<li style="float: right"><a href='../user/logout'><span>LOGOUT</span></a></li>
				<li style="float: right"><a href='../user/check_password'><span>개인정보변경</span></a></li>
			</ul>
			</c:if>
		</div>
	</div>
		<div class="container">
		<br/>
			<h2>&nbsp;&nbsp;전체학과 졸업요건 수정</h2> 
		<br/><br/>
         <form class="form-horizontal" action = "select">

			  		<div class="form-group" id="class2" style=" display:inline;">
				<select name="departmentId" class="form-control"
						value="${departmentList}" style="width: 400px">
							<option >학과를 선택하세요</option>
						<c:forEach var="department" items="${departments}">
							<option value="${department.id}" ${departmentId == department.id ? "selected" : ""}>${department.name}</option>
						</c:forEach>
					</select>&nbsp;&nbsp;
						<input type="submit" class="btn btn-primary" style="font-size: 10pt;" value="조회"/>
					</div>
		</form>

	 <br/>
      <div class="table-responsive">
 			<div class="table-responsive">
				<table class="table" width="1100">
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
							<td rowspan="4" >${department.name} 학생</td>
							<td>${department.name}<br> 주전공</td>
							<td>
								<textarea cols="55" rows="6" name="content0" id="content0"><c:out value="${list0.graduationContent}"/></textarea>
							</td>
							<td><textarea cols="55" rows="6" name="etc0" id="etc0"><c:out value="${list0.graduationEtc}"/></textarea></td>
							</tr>
						<tr>
							<td width="130">${department.name}<br>(타과)복수전공</td>
							<td>
								<textarea cols="55" rows="3" name="content1" id="content1"><c:out value="${list1.graduationContent}"/></textarea>
							</td>
							<td width=230><textarea cols="40" rows="3" name="etc1" id="etc1"><c:out value="${list1.graduationEtc}"/></textarea></td>
						</tr>
						<tr>
							<td>${department.name}<br>(타과)부전공</td>
							<td>
								<textarea cols="55" rows="3" name="content2" id="content2"><c:out value="${list2.graduationContent}"/></textarea>
							</td>
							<td><textarea cols="40" rows="3" name="etc2" id="etc2"><c:out value="${list2.graduationEtc}"/></textarea></td>
						</tr>
						<tr>
							<td>${department.name}<br>편입
							</td>
							<td>
								<textarea cols="55" rows="3" name="content3" id="content3"><c:out value="${list3.graduationContent}"/></textarea>
							</td>
							<td><textarea cols="40" rows="3" name="etc3" id="etc3"><c:out value="${list3.graduationEtc}"/></textarea></td>
						</tr>
						<tr>
							<td rowspan="3">타과학생</td>
							<td>${department.name}<br> 전과</td>
							<td>
								<textarea cols="55" rows="3">학번에 따라 전공필수 이수</textarea>
							</td>
						</tr>
						<tr>
							<td>${department.name}<br>복수전공</td>
							<td>
								<textarea cols="55" rows="3" name="content4" id="content4"><c:out value="${list4.graduationContent}"/></textarea>
							</td>
						<td><textarea cols="40" rows="3" name="etc4" id="etc4"><c:out value="${list4.graduationEtc}"/></textarea></td>
						</tr>
						<tr>
							<td>${department.name}<br>부전공</td>
							<td>
								<textarea cols="55" rows="3" name="content5" id="content5"><c:out value="${list5.graduationContent}"/></textarea>
							</td>
							<td><textarea cols="40" rows="3" name="etc5" id="etc5"><c:out value="${list5.graduationEtc}"/></textarea></td>
						</tr>
					</tbody>
				</table>
         </div>
				<form class="form-group" action = "edit"  style="margin-left: 40%; margin-top: 40px">
					<button type="submit" class="btn btn-primary btn-lg btn-block login-button"
						style="width:150px; height: 50px; font-size: 16px">수정하기</button>
				</form>
			</div>
		</div>
	<br/>

</body>
</html>