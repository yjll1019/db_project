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
	<div class="layer-wrap" style="text-align: center; align: center; margin-top: 70px">
		<form class="pop-layer">
			<div class="pop-container">
				<div class="pop-conts">
					<!--content //-->
					<h4>전공인정 적용</h4>
					<table style="margin-left: 100px; margin-top: 30px; border-bottom: 1px solid #d2d4d8; 
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
						<div class="custom-control custom-radio" style="margin-top: 30px; margin-right: 15px; display:inline;">
							<input type="radio" id="customRadio1" name="customRadio" class="custom-control-input" value="교선"
							<%=(completionDivision.equals("교선"))? "checked":"" %>	>
							 <label class="custom-control-label" for="customRadio1">교양학점</label>
						</div>
						<div class="custom-control custom-radio" style="margin-top: 10px; margin-bottom: 20px; display:inline;">
							<input type="radio" id="customRadio2" name="customRadio" class="custom-control-input" value="전선"
							<%=(completionDivision.equals("전선"))? "checked":"" %>
							> 
							<label class="custom-control-label" for="customRadio2">전공학점</label>
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
