<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="R" value="/" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://bootswatch.com/4/litera/bootstrap.min.css">
<link rel="stylesheet" href="${R}res/css/layout.css">
<link rel="stylesheet" href="${R}res/css/calender.css">
<script src="${R}res/js/calender.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<link rel="stylesheet" href="${R}res/css/Nwagon.css" type="text/css">
<link rel="stylesheet" href="${R}res/css/circle.css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${R}res/css/header.css">
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script src="${R}res/js/header.js"></script>
<script src="${R}res/js/Nwagon.js"></script>
<title>main page</title>
</head>
<body>
	<div id="jb-container">
		<div id="jb-header">
		<div id='cssmenu'>
			<ul>
				<li><a href='#'
					style="padding: 8px; padding-left: 15px; padding-right: 0px;"><img src="${R}res/img/logo.jpg" width="29" height="29"></a></li>
				<li><a href='#'><span>나의졸업요건</span></a></li>
				<li><a href='stu_subject_list'><span>수강목록 조회</span></a></li>
				<li><a href='#'><span>졸업요건 조회</span></a></li>
				<li><a href='#'><span>공지사항 및 문의</span></a></li>
				<li style="float: right"><a href='../user/logout'><span>LOGOUT</span></a></li>
				<li style="float: right"><a href='../user/check_password'><span>개인정보변경</span></a></li>
			</ul>
		</div>
	</div>
		<div id="info-container">
			<div id="stdInfo" style="position: absolute; margin-left: 10%">
				<button type="button" class="btn btn-outline-primary">김지혜</button>님은 현재
				<button type="button" class="btn btn-outline-primary">5학기</button>
				<button type="button" class="btn btn-outline-primary">소프트웨어공학과 전공</button>
				<button type="button" class="btn btn-outline-primary">신문방송학과 부전공</button>재학 중입니다. <br />
				<div style="margin-top: 5px; position: absolute; margin-left: 30%">
					지도교수님은 &nbsp;
					<button type="button" class="btn btn-outline-primary">홍은지</button> &nbsp; 교수님 입니다.
				</div>
			</div>
			
			<div class="circleGraph1"
				style="position: absolute; width: 250px; height: 60px; left: 25%; margin-top: 120px;">
				<div class="clearfix">
					<div class="c100 p50">
						<span>50%</span>
						<div class="slice">
							<div class="bar"></div>
							<div class="fill"></div>
						</div>
					</div>
				</div>
				<div
					style="position: absolute; margin-left: 10px; margin-top: 10px; font-size: 15pt; font-weight: bold">
					&nbsp;&nbsp; 65/130<br/> &nbsp; 전공필수</div>
	
			</div>
			
			<div class="circleGraph1"
				style="position: absolute; width: 250px; height: 60px; left: 38%; margin-top: 120px;">
				<!-- default -->
				<div class="clearfix">
					<div class="c100 p50">
						<span>50%</span>
						<div class="slice">
							<div class="bar"></div>
							<div class="fill"></div>
						</div>
					</div>
				</div>
				<div
					style="position: absolute; margin-left: 10px; margin-top: 10px; font-size: 15pt; font-weight: bold">
					&nbsp;&nbsp; 65/130<br/> &nbsp; 교양필수</div>
				<!-- /default -->
			</div>
			
			<div class="circleGraph1"
				style="position: absolute; width: 250px; height: 60px; left: 50%; margin-top: 120px;">
				<!-- default -->
				<div class="clearfix">
					<div class="c100 p50">
						<span>50%</span>
						<div class="slice">
							<div class="bar"></div>
							<div class="fill"></div>
						</div>
					</div>
				</div>
				<div
					style="position: absolute; margin-left: 10px; margin-top: 10px; font-size: 15pt; font-weight: bold">
					&nbsp;&nbsp; 65/130<br/> &nbsp; 부전공</div>
				<!-- /default -->
			</div>
		</div>
	
		<div id="goal-container" style="margin-top: 320px; margin-left: 22%;">
			<label style="font-size: 15pt;"><strong>목표 졸업학점</strong></label> &nbsp;&nbsp;
			직전학기 &nbsp;<input type="text" name="beforeSemester" style="width: 30px;"> 
			남은학점 &nbsp; <input type="text" name="saveCredit" style="width: 30px;"> 
			전체학점 &nbsp; <input type="text" name="allCredit" style="width: 30px;"> 
			목표학점 &nbsp; <input type="text" name="goalCredit" style="width: 30px;"> &nbsp; &nbsp;
			<button type="submit" class="btn btn-primary">조회</button>
		</div>
		<div id="jb-content">
			<a id="top" href="#jb-header"><img src="${R}res/img/rounded-triangle.png" width="40px" height="40px"></a>

			<h3>필수 과목</h3>
			<br />
			<div>
				<table id="table3">
					<tr>
						<td
							style="background-color:#4582EC; color:#fff; border-top: 1px solid gray; border-right: 1px solid silver; border-bottom: 1px solid silver; font-size: 20px; font-weight: bold;">
							채플</td>
						<td
							style="border-top: 1px solid gray; font-size: 20px; font-weight: bold;">
							1 / 2 이수</td>
					</tr>
					<tr>
						<td
							style="background-color:#4582EC; color:#fff; border-bottom: 1px solid gray; border-right: 1px solid silver; border-top: 1px solid silver; font-size: 20px; font-weight: bold;">
							사회봉사</td>
						<td
							style="border-bottom: 1px solid gray; border-top: 1px solid silver; font-size: 20px; font-weight: bold;">
							1 / 1 이수</td>
					</tr>
				</table>
			</div>
			<br/>
			<table id="table1">
				<thead>
					<tr>
						<th scope="col" colspan="2" id="th1"
							style="border-right: 1px solid white">1학년</th>
						<th scope="col" colspan="2" id="th1">2학년</th>
					</tr>
				</thead>
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
					<td id="td2" style="border-right: 1px solid silver"><span>C프로그래밍
							Ⅰ</span><br /> <span>과정지도 1</span><br /> <span>정보사회론</span><br /> <span>이산수학</span><br />
						<span>말과글</span><br /> <span>대학생활세미나 Ⅰ</span></td>
					<td id="td2" style="border-right: 1px solid black"><span>C프로그래밍
							Ⅱ</span><br /> <span>과정지도 2</span><br /> <span>웹페이지 구축 Ⅰ</span><br />
						<span>대학수학</span><br /> <span style="color: #d9534f;">컴퓨터
							활용</span><br /> <span>대학생활세미나 Ⅱ</span></td>
					<td id="td2" style="border-right: 1px solid silver"><span>자바프로그래밍</span><br />
						<span>과정지도 3</span><br /> <span style="color: #d9534f;">컴퓨터구조</span><br />
						<span>데이터베이스개론</span></td>
					<td id="td2"><span>자료구조론</span><br /> <span>과정지도 4</span></td>
				</tr>
				<thead>
					<tr>
						<th scope="col" colspan="2" id="th1">3학년</th>
						<th scope="col" colspan="2" id="th1">4학년</th>
					</tr>
				</thead>
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
					<td id="td2" style="border-right: 1px solid silver"><span>알고리즘</span><br />
						<span>과정지도 5</span></td>
					<td id="td2" style="border-right: 1px solid black"><span
						style="color: #d9534f;">과정지도 6</span></td>
					<td id="td2" style="border-right: 1px solid silver"><span>졸업지도</span></td>
					<td></td>
				</tr>
			</table>
			<br />
			<h3>필수 역량</h3>
			<br />
			<table id="table4">
				<tr>
					<td id="th1" style="font-weight: bold; height: 200px">교양필수</td>
					<td colspan="2" style="border-top: 1px solid gray"><span>대학생활세미나Ⅰ</span><br />
						<span>대학생활세미나Ⅱ</span><br /> <span style="color: #d9534f;">인권과
							평화</span><br /> <span>말과글</span><br /> <span>과학기술과 에콜로지</span><br />
						<span>데이터활용 및 분석</span><br /> <span style="color: #d9534f;">비아메디아채플(1/2)</span><br />
						<span>사회봉사</span></td>
				</tr>
				<tr>
					<td rowspan="3" id="th3" style="font-weight: bold">영역필수</td>
					<td id="th2" style="border-top: 1px solid gray">가치역량</td>
					<td style="border-top: 1px solid gray"><span>민주시민</span><br />
						<span>인간인권</span><br /> <span style="color: #d9534f;">생명평화</span></td>
				</tr>
				<tr>
					<td id="th2"
						style="border-top: 1px solid white; border-bottom: 1px solid white">대안역량</td>
					<td style="border-top: 1px solid silver"><span
						style="color: #d9534f;">융 복합적사고</span><br /> <span
						style="color: #d9534f;">조사 분석 정보활용</span><br /> <span>대안제시
							문제해결</span></td>
				</tr>
				<tr>
					<td id="th2" style="border-bottom: 1px solid gray">실천역량</td>
					<td style="border-top: 1px solid silver"><span
						style="color: #d9534f;">민주적 소통</span><br /> <span>연대와 공동체적
							실천</span></td>
				</tr>
				<tr>
					<td id="th1"
						style="font-weight: bold; height: 120px; border-bottom: 1px solid #4582EC">전공탐색</td>
					<td colspan="2" style="border-bottom: 1px solid gray"><span>소속학부
							1과목 이상</span><br /> <span style="color: #d9534f;">타학부 1과목 이상</span><br />
						<span>전공탐색세미나 1과목</span><br /> <span style="color: #d9534f;">총
							7개 과목(10/19)</span></td>
				</tr>
			</table>
			<br />
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
						<td><button onclick="window.open('http://www.skhu.ac.kr/main.aspx')" style="width: 70px; height: 70px; border: 1px solid #4582EC; border-radius: 50%; color:#4582EC; background-color: #fff">성공회<br/>대학교</button></td>
						<td><button onclick="window.open('https://forest.skhu.ac.kr/')" style="width: 70px; height: 70px; border: 1px solid #4582EC; border-radius: 50%; color:#4582EC; background-color: #fff">종합정보<br/>시스템</button></td>
						<td><button onclick="window.open('http://ecareer.skhu.ac.kr/')" style="width: 70px; height: 70px; border: 1px solid #4582EC; border-radius: 50%; color:#4582EC; background-color: #fff">e커리어<br/>센터</button></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
</html>