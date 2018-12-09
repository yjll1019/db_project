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

<script language="javascript">
	function open_page() {
		window.open("../admin/superAdmin_create", "등록",
				"width=1170, height=300, left=50, top=50");
	}
</script>
<title>슈퍼관리자 관리 페이지</title>
<style>
	#jb-content {
		width: 80%;
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
				<li>
					<a style="padding: 8px; padding-left: 15px; padding-right: 0px;">
						<img src="${R}res/img/logo.jpg" width="29" height="29">
					</a>
				</li>
				<li><a href='../admin/superAdmin_manage'><span>관리자/교수 관리</span></a></li>
				<li style="float: right"><a href='../user/logout'><span>LOGOUT</span></a></li>
			</ul>
		</div>
	</div>
		<div id="jb-content" style="margin-left: 18%; margin-top: 5%; padding-left: 8%">
				<div style="margin-left: 3%; margin-top: 3%; margin-bottom: 2%"> 
					<h3>관리자/교수 목록</h3>
				</div>
				<div class="form-group"
				style="margin-top: 5px; display: inline"> 
				
				<button type="button" class="btn btn-outline-primary" 
					style="display: inline; width: 100px; margin-left: 3%; float: left; margin-bottom: 1%"  
					onclick="open_page()">등록하기
				</button>
				
				<form method="post">
				
				<select name="sb" class="form-control" 
					style="display: inline; margin-left: 27%; width: 90px; height: 35px; font-size: 15px;">  
					<option value="0">전체</option>
					<option value="1">교수명</option>
					<option value="2">관리자명</option>
				</select> 
				
				<input type="text" class="form-control" name="st" placeholder="검색"
					style="display: inline; margin-left: 5px; width: 150px; height: 35px;">
				<button type="submit" class="btn btn-primary">조회</button>
				
				</form>

			</div>
			<br />
			<div class="table-responsive"
				style="margin-top: -35px;padding-left: 40px; padding-right: 40px; font-size: 15pt;">
				<table class="table" style="width: 800px;">
					<thead>
						<tr>
							<th>직책</th>
							<th>이름</th>
							<th>이메일</th>
							<th>전화번호</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="user" items="${ users }">
								<tr style="cursor:pointer">
									<td>${ user.role }</td>
									<td>${ user.userName }</td>
									<td>${ user.email }</td>
									<td>${ user.phone }</td>
								</tr>
							</c:forEach>

					</tbody>
				</table>
			</div>
			</div>
	</div>
</body>
</html>