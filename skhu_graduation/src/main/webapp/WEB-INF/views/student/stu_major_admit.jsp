<%@page import="org.apache.jasper.tagplugins.jstl.core.Redirect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://bootswatch.com/4/litera/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{
		font-family: 'NanumSquare', sans-serif;
	}
</style>
</head>
<body>
<%
	String result = request.getParameter("result");

%>
<script>
	var r = "<%= result%>";
	if(r == "0"){
	    alert('선택하신 과목이 교양과목으로 인정되었습니다.');
		location.href = "stu_subject_list";
	 } else if(r == "1"){
	    alert('선택하신 과목이 전공과목으로 인정되었습니다.');
		location.href = "stu_subject_list";
	 }
</script>
	<div class="layer-wrap" style="text-align: center; align: center; margin-top: 70px">
		<form class="pop-layer" method="post">
			<div class="pop-container">
				<div class="pop-conts">
					<!--content //-->
					<h4>전공인정 적용</h4>
					<table style="margin-left: 38%; margin-top: 30px; border-bottom: 1px solid #d2d4d8; 
						border-top: 1px solid #d2d4d8; width: 400px; table-layout: fixed;">
						<tr style="height: 40px">
							<td> ${mySubject.subjectCode} </td>
							<td> ${mySubject.subjectName} </td>
							<td> ${mySubject.completionDivision} </td>
							<td>${mySubject.score}</td>
						</tr>
					</table>
					<%
						String completionDivision = (String)request.getAttribute("completionDivision");
					%>
					<div class="form-group" style="margin-top: 30px; margin-bottom: 40px">
						<div style="margin-top: 30px; margin-right: 15px; display:inline;">
							<input type="radio" name="completionDivision" value=0
							<%=(completionDivision.equals("교선"))? "checked":"" %>/>교양학점 &nbsp;
							<input type="radio" name="completionDivision" value=1
							<%=(completionDivision.equals("전선"))? "checked":"" %>/>
							전공학점
						</div>
					</div>
					<div class="btn-r">
						<input type="submit" class="btn btn-primary" value="적용하기" style="font-size: 15px; width: 100px" />
					</div>
		<!--// content-->
				</div>
			</div>
		</form>
	</div>
</body>
</html>
