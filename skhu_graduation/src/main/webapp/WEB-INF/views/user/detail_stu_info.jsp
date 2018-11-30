<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
<head>
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
<script src="${R}js/header.js"></script>



<title>학생 상세페이지</title>
</head>
<body>
	<div id="jb-container">
	<div id="jb-header">
		<div id='cssmenu'>
			<c:if test="${ role == '관리자' }">
				<ul>
					<li>
						<a style="padding: 8px; padding-left: 15px; padding-right: 0px;">
							<img src="${R}res/img/logo.jpg" width="29" height="29">
						</a>
					</li>
					<li><a href='../admin/admin_stu_search'><span>학생 조회</span></a></li>
					<li class='active has-sub'><a><span>졸업요건 수정</span></a>
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
					<li style="float: right"><a href='../admin/adminInfo'><span>개인정보변경</span></a></li>
				</ul>
			</c:if>
			<c:if test="${ role == '교수' }">
				<ul>
					<li><a href='#'
						style="padding: 8px; padding-left: 15px; padding-right: 0px;"><img src="${R}res/img/logo.jpg" width="29" height="29"></a></li>
					<li><a href='../professor/professor_stu_search'><span>학생 조회</span></a></li>
					<li><a href='../professor/professor_allSearch'><span>졸업요건 조회</span></a></li>
					<li><a href='../user/board'><span>공지사항 및 문의</span></a></li>
					<li style="float: right"><a href='../user/logout'><span>LOGOUT</span></a></li>
					<li style="float: right"><a href='../user/check_password'><span>개인정보변경</span></a></li>
				</ul>
			</c:if>
		</div>
	</div>
	<div id="content" style="margin-bottom: 5%;">	
		<div style="margin-top: 5%;">
			<a href="${ role == '관리자' ? '../admin/admin_stu_search' : '../professor/professor_stu_search' }" class="btn btn-primary" 
				style="font-size: 10pt; float: right; margin-right: 18%; margin-bottom: 2%">목록으로</a>
			<c:if test="${ role == '관리자' }">
				<button type="button" class="btn btn-outline-primary" style="font-size: 10pt; float: right; margin-right: 1%; margin-bottom: 1%"
		 			onclick="window.open('../admin/admin_memo?id=${student.userId}','조치사항','width=530,height=650,location=no,status=no,scrollbars=yes');">조치사항</button>
			</c:if>	
			<c:if test="${ role == '교수' }">
				<button type="button" class="btn btn-outline-primary" style="font-size: 10pt; float: right; margin-right: 1%; margin-bottom: 1%"
		 			onclick="window.open('../professor/professor_memo?id=${student.userId}','학생메모','width=530,height=650,location=no,status=no,scrollbars=yes');">상담내역</button>
			</c:if>
		</div>
		<div class="table-responsive" style="margin-left: 18%; font-size:14pt; margin-top: 10%; width: 75%;">
			<table class="table" style="width: 80%;">
		      	<tbody>
		      		<tr>
		      			<th><strong>이름</strong></th>
		      			<td>${student.user.userName }</td>
		   			   	<th><strong>학번</strong></th>
		   			   	<td>${student.userId }</td>
		   		   </tr>
		      <tr>
		      	<th><strong>학기</strong></th>
		      	<td>${student.stuSemester }</td>
		      	<th><strong>학과</strong></th>
		      	<td>${student.department.name } <br/> ${student.secondMajor.department.name }(${student.secondMajor.division })</td>
		      	<th><strong>반</strong></th>
		      	<td>${student.stuClass }</td>
		      </tr>
		      <tr>
		      	<th><strong>전화번호</strong></th>
		      	<td>${student.user.phone }</td>
		      	<th><strong>이메일</strong></th>
		      	<td>${student.user.email }</td>
		       </tr>
		       </tbody>
		     </table>
		   </div>
			
			<div style="margin-left: 25%; margin-top: 5% ">
				<iframe id="iframe1" src="stu_info_subject?id=${ student.userId }" style="width: 90%; border: none">
				</iframe>
			</div>
		</div>
	</div>
<script> 
	function setIframeHeight(h) {
		$("#iframe1").height(h); 
	} 
</script>
</body>
</html>