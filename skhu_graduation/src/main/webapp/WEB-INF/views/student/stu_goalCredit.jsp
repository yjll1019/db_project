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
		<div id="goal-container" style="margin-top: 5%; margin-left: 35%; font-size: 25pt; text-align:center;">
			<div style="margin-top: 10px;">
				<table id="scoreCalcul">
					<tr style="color: #4582EC;">
						<th>학기</th>
						<th>&nbsp; &nbsp; 이수학점</th>
						<th>&nbsp; &nbsp; 취득학점</th>
						
					</tr>
					<c:forEach items="${map}" var="credit">
						<tr>
							<td>${credit.key }</td>
							<td>${credit.value}</td>
							<td>${score }</td>
							
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<br/> <div style="font-size: 20pt; color:red; margin-left:44%;">
					졸업학점 : ${goalCredit}
			</div>	
		<br/>
				<a href="stu_main" style="margin-top: 2%; font-size: 25pt; margin-left:45%;">돌아가기</a>
</body>
</html>