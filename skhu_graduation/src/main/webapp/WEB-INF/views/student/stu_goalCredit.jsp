<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://bootswatch.com/4/litera/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<meta charset="UTF-8">
<title>목표학점</title>
<style>
	body{
		font-family: 'NanumSquare', sans-serif;
	}
</style>
</head>
<body>
<%
	String score = request.getParameter("score");
	String goalCredit = request.getParameter("goalCredit");
%>
	<div style="margin-top: 10px;">
				<table id="scoreCalcul">
					<tr style="color: #4582EC">
						<th>학기</th>
						<th>이수학점</th>
						<th>취득학점</th>
						<th>졸업학점</th>
					</tr>
					<c:forEach items="${map}" var="credit">
						<tr>
							<td>${map.key }</td>
							<td>${map.value}</td>
							<td>${score }</td>
							<td>${goalCredit}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
	<a href="stu_main">돌아가기</a>
</body>
</html>