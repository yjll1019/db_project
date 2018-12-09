

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.List"%>
<%@ page import="net.skhu.dto.*"%>

<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://bootswatch.com/4/litera/bootstrap.min.css">
<link rel="stylesheet" href="${R}res/css/layout.css">
<link rel="stylesheet" href="${R}res/css/calender.css">
<script src="${R}res/js/calender.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<link rel="stylesheet" href="${R}res/css/Nwagon.css" type="text/css">
<link rel="stylesheet" href="${R}res/css/circle.css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${R}res/css/header.css">
<script src="http://code.jquery.com/jquery-latest.min.js"
	type="text/javascript"></script>
<script src="${R}res/js/header.js"></script>
<script src="${R}res/js/Nwagon.js"></script>

<title>main page</title>
</head>
<body>
	<div id="jb-container">
		<div id="jb-header">
			<div id='cssmenu'>
				<ul>
					<li><a
						style="padding: 8px; padding-left: 15px; padding-right: 0px;"><img
							src="${R}res/img/logo.jpg" width="29" height="29"></a></li>
					<li><a href='../student/stu_main'><span>나의졸업요건</span></a></li>
					<li><a href='../student/stu_subject_list'><span>수강목록
								조회</span></a></li>
					<li><a href='../student/stu_allSearch'><span>졸업요건
								조회</span></a></li>
					<li><a href='../student/stu_replace_list'><span>대체과목
								조회</span></a></li>
					<li><a href='../user/board'><span>공지사항 및 문의</span></a></li>
					<li style="float: right"><a href='../user/logout'><span>LOGOUT</span></a></li>
					<li style="float: right"><a href='../user/check_password'><span>개인정보변경</span></a></li>
				</ul>
			</div>
		</div>
		<div id="info-container">
			<div id="stdInfo" style="position: absolute; margin-left: 10%">
				<button type="button" class="btn btn-outline-primary">${student.user.userName }</button>
				님은 현재
				<button type="button" class="btn btn-outline-primary">${student.stuSemester }</button>
				학기
				<button type="button" class="btn btn-outline-primary">${student.department.name }</button>
				<button type="button" class="btn btn-outline-primary">${student.secondMajorName}</button>
				재학 중입니다. <br />
				<div style="margin-top: 5px; position: absolute; margin-left: 30%">
					지도교수님은 &nbsp;
					<button type="button" class="btn btn-outline-primary">${student.pName }</button>
					&nbsp; 교수님 입니다.
				</div>
			</div>
			<%
				GraduationInput g = (GraduationInput) request.getAttribute("graduation");
				String s = (String) request.getAttribute("secredit");
				Student student = (Student) request.getAttribute("student");
				String fresh = student.getUserId().substring(0, 4);
				
				int a = (int) (student.getMajor() / (Double.parseDouble(g.getCredit())) * 100);
				int b = (int) (((double) (student.getCultural() / 15.0)) * 100);
				if (a > 100)
					a = 100;
				if (b > 100)
					b = 100;
				int c;
				if (student.getValue() != 0 && s != null) {
					c = (int) (((double) (student.getValue() / 40.0)) * 100);
				} else
					c = 0;
			%>
			<c:set var="year" value="<%=fresh%>" />

			<c:if test="${year ne '2018'}">
				<div class="circleGraph1"
					style="position: absolute; width: 250px; height: 60px; left: 25%; margin-top: 120px;">

					<div class="clearfix">
						<div class="c100 p<%=a%>">
							<span>${student.major}</span>
							<div class="slice">
								<div class="bar"></div>
								<div class="fill"></div>
							</div>
						</div>
					</div>
					<div
						style="position: absolute; margin-left: 10px; margin-top: 10px; font-size: 15pt; font-weight: bold">
						&nbsp;&nbsp; ${student.major}/ ${graduation.credit }<br /> &nbsp;
						전공
					</div>

				</div>
			</c:if>
			<c:if test="${year eq '2018'}">
			<div class="circleGraph1"
					style="position: absolute; width: 250px; height: 60px; left: 38%; margin-top: 120px;">
					<!-- default -->
					<div class="clearfix">
						<div class="c100 p<%=b%>">
							<span>${student.cultural}</span>
							<div class="slice">
								<div class="bar"></div>
								<div class="fill"></div>
							</div>
						</div>
					</div>
					<div
						style="position: absolute; margin-left: 10px; margin-top: 10px; font-size: 15pt; font-weight: bold">
						&nbsp;&nbsp; ${student.cultural}/16<br /> &nbsp; 교양필수
					</div>
					<!-- /default -->
				</div>v
			</c:if>
			<c:if test="${year ne '2018'}">
				<div class="circleGraph1"
					style="position: absolute; width: 250px; height: 60px; left: 38%; margin-top: 120px;">
					<!-- default -->
					<div class="clearfix">
						<div class="c100 p<%=b%>">
							<span>${student.cultural}</span>
							<div class="slice">
								<div class="bar"></div>
								<div class="fill"></div>
							</div>
						</div>
					</div>
					<div
						style="position: absolute; margin-left: 10px; margin-top: 10px; font-size: 15pt; font-weight: bold">
						&nbsp;&nbsp; ${student.cultural}/15<br /> &nbsp; 교양필수
					</div>
					<!-- /default -->
				</div>
			
				<%
					if (s != null) {
				%>

				<c:if
					test="${graduation.division=='부전공'||graduation.division=='복수전공'}">
					<div class="circleGraph1"
						style="position: absolute; width: 250px; height: 60px; left: 50%; margin-top: 120px;">
						<!-- default -->
						<div class="clearfix">
							<div class="c100 p<%=c%>">
								<span>${student.value}</span>
								<div class="slice">
									<div class="bar"></div>
									<div class="fill"></div>
								</div>
							</div>
						</div>
						<div
							style="position: absolute; margin-left: 10px; margin-top: 10px; font-size: 15pt; font-weight: bold">
							&nbsp;&nbsp; ${student.value}/${secredit }<br /> &nbsp;
							${graduation.division }
						</div>
						<!-- /default -->
					</div>
				</c:if>
				<%
					}
				%>
			</c:if>
		</div>
		<form:form method="post">
			<div id="goal-container" style="margin-top: 320px; margin-left: 22%;">
				<label style="font-size: 15pt;"><strong>목표 졸업학점</strong></label>
				&nbsp;&nbsp; 이수학기 &nbsp;<input type="text" id="beforeSemester"
					name="beforeSemester" style="width: 40px;" /> 남은학점 &nbsp; <input
					type="text" name="saveCredit" style="width: 40px;" /> 전체평점 &nbsp;
				<input type="text" name="allCredit" style="width: 40px;" /> 목표학점
				&nbsp; <input type="text" name="goalCredit" style="width: 30px;" />
				<button type="submit" class="btn btn-primary">조회</button>
			</div>
		</form:form>

		<div id="jb-content">
			<a id="top" href="#jb-header"><img
				src="${R}res/img/rounded-triangle.png" width="40px" height="40px"></a>

			<h3>필수 과목</h3>
			<div>
				<table id="table3">
					<tr>
						<td
							style="background-color: #4582EC; color: #fff; border-top: 1px solid gray; border-right: 1px solid silver; border-bottom: 1px solid silver; font-size: 20px; font-weight: bold;">
							채플</td>
						<td
							style="border-top: 1px solid gray; font-size: 20px; font-weight: bold;">
							${student.pray} / 2 이수</td>
					</tr>
					<c:if test="${ student.getVolunteerExemption() eq '0'}">
						<td
							style="border-bottom: 1px solid gray; border-top: 1px solid silver; font-size: 20px; font-weight: bold;">
							${student.service } / 1 이수</td>

						<tr>
							<td
								style="background-color: #4582EC; color: #fff; border-bottom: 1px solid gray; border-right: 1px solid silver; border-top: 1px solid silver; font-size: 20px; font-weight: bold;">
								사회봉사</td>
							<td
								style="border-bottom: 1px solid gray; border-top: 1px solid silver; font-size: 20px; font-weight: bold;">
								${student.service } / 1 이수</td>
						</tr>
					</c:if>
				</table>
			</div>
			<br />
			<!-- 시작 -->
			<%
				List<String> requiredMySubject = (List) request.getAttribute("requiredMySubject");
			%>
			<c:if test="${admissionYear ne '2018' }">
				<%
					List<String> list1 = (List) request.getAttribute("list1");
						List<String> list2 = (List) request.getAttribute("list2");
						List<String> list3 = (List) request.getAttribute("list3");
						List<String> list4 = (List) request.getAttribute("list4");
						List<String> list5 = (List) request.getAttribute("list5");
						List<String> list6 = (List) request.getAttribute("list6");
						List<String> list7 = (List) request.getAttribute("list7");
						List<String> list8 = (List) request.getAttribute("list8");
				%>
				<table id="table1">
					<thead>
						<tr>
							<th scope="col" colspan="2" id="th1"
								style="border-right: 1px solid white">1학년</th>
							<th scope="col" colspan="2" id="th1">2학년</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td id="td1" style="border-right: 1px solid silver"><strong>
									1학기 </strong></td>
							<td id="td1" style="border-right: 1px solid black"><strong>
									2학기 </strong></td>
							<td id="td1" style="border-right: 1px solid silver"><strong>
									1학기 </strong></td>
							<td id="td1"><strong> 2학기 </strong></td>
						</tr>
						<tr>
							<!-- 1-1 -->
							<td id="td2" style="border-right: 1px solid silver">
								<%
									for (int i = 0; i < list1.size(); ++i) {
											if (!requiredMySubject.contains(list1.get(i))) {
								%> <span style="color: #d9534f;"><%=list1.get(i)%></span><br />
								<%
									} else {
								%> <span><%=list1.get(i)%></span><br /> <%
 	}
 		}
 %>
							</td>
							<!-- 1-2 -->
							<td id="td2" style="border-right: 1px solid silver">
								<%
									for (int i = 0; i < list2.size(); ++i) {
											if (!requiredMySubject.contains(list2.get(i))) {
								%> <span style="color: #d9534f;"><%=list2.get(i)%></span><br />
								<%
									} else {
								%> <span><%=list2.get(i)%></span><br /> <%
 	}
 		}
 %>
							</td>
							<!-- 2-1 -->
							<td id="td2" style="border-right: 1px solid silver">
								<%
									for (int i = 0; i < list3.size(); ++i) {
											if (!requiredMySubject.contains(list3.get(i))) {
								%> <span style="color: #d9534f;"><%=list3.get(i)%></span><br />
								<%
									} else {
								%> <span><%=list3.get(i)%></span><br /> <%
 	}
 		}
 %>
							</td>
							<!-- 2-2 -->
							<td id="td2" style="border-right: 1px solid silver">
								<%
									for (int i = 0; i < list4.size(); ++i) {
											if (!requiredMySubject.contains(list4.get(i))) {
								%> <span style="color: #d9534f;"><%=list4.get(i)%></span><br />
								<%
									} else {
								%> <span><%=list4.get(i)%></span><br /> <%
 	}
 		}
 %>
							</td>
						</tr>
					</tbody>
					<thead>
						<tr>
							<th scope="col" colspan="2" id="th1">3학년</th>
							<th scope="col" colspan="2" id="th1">4학년</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td id="td1" style="border-right: 1px solid silver"><strong>
									1학기 </strong></td>
							<td id="td1" style="border-right: 1px solid black"><strong>
									2학기 </strong></td>
							<td id="td1" style="border-right: 1px solid silver"><strong>
									1학기 </strong></td>
							<td id="td1"><strong> 2학기 </strong></td>
						</tr>
						<tr>
							<!-- 3-1 -->
							<td id="td2" style="border-right: 1px solid silver">
								<%
									for (int i = 0; i < list5.size(); ++i) {
											if (!requiredMySubject.contains(list5.get(i))) {
								%> <span style="color: #d9534f;"><%=list5.get(i)%></span><br />
								<%
									} else {
								%> <span><%=list5.get(i)%></span><br /> <%
 	}
 		}
 %>
							</td>
							<!-- 3-2 -->
							<td id="td2" style="border-right: 1px solid silver">
								<%
									for (int i = 0; i < list6.size(); ++i) {
											if (!requiredMySubject.contains(list6.get(i))) {
								%> <span style="color: #d9534f;"><%=list6.get(i)%></span><br />
								<%
									} else {
								%> <span><%=list6.get(i)%></span><br /> <%
 	}
 		}
 %>
							</td>
							<!-- 4-1 -->
							<td id="td2" style="border-right: 1px solid silver">
								<%
									for (int i = 0; i < list7.size(); ++i) {
											if (!requiredMySubject.contains(list7.get(i))) {
								%> <span style="color: #d9534f;"><%=list7.get(i)%></span><br />
								<%
									} else {
								%> <span><%=list7.get(i)%></span><br /> <%
 	}
 		}
 %>
							</td>
							<!-- 4-2 -->
							<td id="td2" style="border-right: 1px solid silver">
								<%
									for (int i = 0; i < list8.size(); ++i) {
											if (!requiredMySubject.contains(list8.get(i))) {
								%> <span style="color: #d9534f;"><%=list8.get(i)%></span><br />
								<%
									} else {
								%> <span><%=list8.get(i)%></span><br /> <%
 	}
 		}
 %>
							</td>
						</tr>
					</tbody>
				</table>
			</c:if>
			<!-- 끝  -->
			<br /> <label style="font-size: 12pt;"> <strong> 교양
					필수(2과목 이상 필수) : <br /> <%
 	List<String> list9 = (List) request.getAttribute("list9");
 	for (int i = 0; i < list9.size(); ++i)
 		if (!requiredMySubject.contains(list9.get(i))) {
 %> <span style="color: #d9534f;"><%=list9.get(i)%></span> &nbsp; <%
 	} else {
 %> <%=list9.get(i)%> &nbsp; <%
 	}
 %>
			</strong>
			</label> <br />
		</div>
		<div id="jb-sidebar">
			<div id="kCalendar"></div>
			<script>
				window.onload = function() {
					kCalendar('kCalendar');
				};
			</script>
			<div id="sidemenu">
				<table id="table2">
					<tr style="font-size: 10pt">
						<td><button
								onclick="window.open('http://www.skhu.ac.kr/main.aspx')"
								style="width: 70px; height: 70px; border: 1px solid #4582EC; border-radius: 50%; color: #4582EC; background-color: #fff">
								성공회<br />대학교
							</button></td>
						<td><button
								onclick="window.open('https://forest.skhu.ac.kr/')"
								style="width: 70px; height: 70px; border: 1px solid #4582EC; border-radius: 50%; color: #4582EC; background-color: #fff">
								종합정보<br />시스템
							</button></td>
						<td><button
								onclick="window.open('http://ecareer.skhu.ac.kr/')"
								style="width: 70px; height: 70px; border: 1px solid #4582EC; border-radius: 50%; color: #4582EC; background-color: #fff">
								e커리어<br />센터
							</button></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>