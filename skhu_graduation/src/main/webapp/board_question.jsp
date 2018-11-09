<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://bootswatch.com/4/litera/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${R}res/css/header.css">
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script src="${R}res/js/header.js"></script>
<link rel="stylesheet" href="${R}res/css/board.css">

<title>문의 내용</title>
</head>
<body>
	<div id="jb-container">
		<div id="jb-header">
			<div id='cssmenu'>
				<ul>
					<li>
						<a href='#' style="padding: 8px; padding-left: 15px; padding-right: 0px;">
							<img src="res/img/logo.jpg" width="29" height="29">
						</a>
					</li>
					<li><a href='#'><span>나의졸업요건</span></a></li>
					<li><a href='#'><span>수강목록 조회</span></a></li>
					<li><a href='#'><span>졸업요건 조회</span></a></li>
					<li><a href='#'><span>공지사항 및 문의</span></a></li>
					<li style="float: right"><a href='#'><span>LOGOUT</span></a></li>
					<li style="float: right"><a href='#'><span>개인정보변경</span></a></li>
				</ul>
			</div>
		</div>
		<div id="jb-content">
			<div id="boardWrite"style="max-width: 800px;">
				<h3>&nbsp;&nbsp;문의 내용</h3>
				<hr>
				<form method="post">
					<table class="table table-bordered" align="center" style="margin-top: 40px; font-size: 17px; text-align: center; width: 80%">
						<tr>
							<td style="background-color: #4582EC; color: white; width: 100px; padding-top: 18px"><strong>이름</strong></td>
							<td colspan="3" style="text-align: left; padding-left: 25px; padding-top: 18px">
								<span>학생</span>
							</td>									
						</tr>
						<tr>
							<td style="background-color: #4582EC; color: white; padding-top: 18px"><strong>제목</strong></td>
							<td colspan="3" style="text-align: left; padding-left: 25px; padding-top: 18px">
								<span>졸업요건 문의드립니다.</span>
							</td>
						</tr>
						<tr>
							<td style="background-color: #4582EC; color: white; height: 400px; padding-top: 190px"><strong>내용</strong></td>
							<td colspan="3" style="text-align: left; padding: 40px;">
								<span>졸업요건이 뭐에요ㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠ</span>
							</td>
						</tr>
					</table>
					
					<div class="form-group" align="center" style="margin-top: 40px">
						<button type="button" class="btn btn-outline-primary">목록으로</button>
						<!-- 관리자에게 보이도록 c:if 처리하기 
						&nbsp;&nbsp;<a href="delete?id=${ board.boardId }" class="btn btn-danger" data-confirm-delete>삭제하기</a>
						-->				
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>