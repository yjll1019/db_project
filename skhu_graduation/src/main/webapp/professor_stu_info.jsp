<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://bootswatch.com/4/litera/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css"><!-- 폰트 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="res/css/header.css">
<script src="http://code.jquery.com/jquery-latest.min.js"
	type="text/javascript"></script>
<script src="js/header.js"></script>



<title>Insert title here</title>
</head>
<body>
	<div id="jb-container">
	<div id="jb-header">
		<div id='cssmenu'>
			<ul>
				<li><a href='#'
					style="padding: 8px; padding-left: 15px; padding-right: 0px;"><img src="res/img/logo.jpg" width="29" height="29"></a></li>
				<li><a href='#'><span>학생 조회</span></a></li>
				<li><a href='#'><span>졸업요건 조회</span></a></li>
				<li><a href='#'><span>공지사항 및 문의</span></a></li>
				<li style="float: right"><a href='#'><span>LOGOUT</span></a></li>
				<li style="float: right"><a href='#'><span>개인정보변경</span></a></li>
			</ul>
		</div>
	</div>
	<div id="content" style="margin-bottom: 5%;">	
		<button type="button" class="btn btn-outline-primary" style="font-size:10pt; margin-left: 83%; margin-top: 5%;"
		 onclick="window.open('professor_memo.html','학생메모','width=530,height=650,location=no,status=no,scrollbars=yes');">상담내역</button>
		
		   <div class="table-responsive" style="margin-left: 10%; font-size:14pt; margin-top:1%; ">
		     <table class="table" style="width: 80%;">
		       <tbody>
		      <tr>
		      	<th>이름</th>
		      	<td>김지혜</td>
		      	<th>학기</th>
		      	<td>5</td>
		      </tr>
		      <tr>
		      	<th>학번</th>
		      	<td>201632004</td>
		      	<th>전화번호</th>
		      	<td>010-1234-5678</td>
		      </tr>
		      <tr>
		      	<th>학과</th>
		      	<td>소프트웨어공학과 <br/> 디지털컨텐츠학과(부전공)</td>
		      	<th>이메일</th>
		      	<td>rubizzang@naver.com</td>
		       </tr>
		       </tbody>
		     </table>
		   </div>
	
			<div style="margin-left:10%; ">
				<h5>수강내역</h5>
		
				<div style="font-size:14pt;">
					<div style=" margin-top:5px; font-size: 12pt; margin-left: 35%;">
						이수학점 <span style="color:red">80/130 </span>&nbsp;&nbsp;&nbsp;
						총평점<span style="color:red"> 3.75</span>
					</div>
					
					 <div class="form-group" id="search" style="display: inline;">
					    <select class="custom-select" style="margin-top:1%; 20%; width: 190px; height:45px;">
							<option>2016-1학기</option>
							<option>2016-2학기</option>
						</select>
					</div>
	
					     <table class="table" style="width:90%;  margin-top:2%;">
					     	<thead>
			    		<tr>
			    			<th>년도</th>
			    			<th>학기</th>
			    			<th>과목코드</th>
			    			<th>과목명</th>
			    			<th>이수구분</th>
			    			<th>학점</th>
			    			<th>성적</th>
			    		</tr>
		    		</thead>
		    		<tbody>
		    			<tr>
		    				<td>2016</td>
		    				<td>1학기</td>
		    				<td>AC00004</td>
		    				<td>영어I</td>
		    				<td>교선</td>
		    				<td>3</td>
		    				<td>BO</td>
		    			</tr>
		      			<tr>
		    				<td>2016</td>
		    				<td>1학기</td>
		    				<td>AF00011</td>
		    				<td>이산수학</td>
		    				<td>교선</td>
		    				<td>3</td>
		    				<td>BO</td>
		    			</tr>
		       			<tr>
		    				<td>2016</td>
		    				<td>1학기</td>
		    				<td>IB00001</td>
		    				<td>C프로그래밍</td>
		    				<td>전필</td>
		    				<td>3</td>
		    				<td>C+</td>
		    			</tr>
		        			<tr>
		    				<td>2016</td>
		    				<td>1학기</td>
		    				<td>IB00002</td>
		    				<td>과정지도1</td>
		    				<td>전필</td>
		    				<td>1</td>
		    				<td>P</td>
		    			</tr>
		      			<tr>
		    				<td>2016</td>
		    				<td>1학기</td>
		    				<td>AF00016</td>
		    				<td>대학물리와 실험II</td>
		    				<td>교선</td>
		    				<td>3</td>
		    				<td>A0</td>
		    			</tr>  	
		    			<tr>
		    				<td>2016</td>
		    				<td>1학기</td>
		    				<td>AF00004</td>
		    				<td>지구환경과학</td>
		    				<td>교선</td>
		    				<td>3</td>
		    				<td>C+</td>
		    			</tr>  	
		    			<tr>
		    				<td>2016</td>
		    				<td>1학기</td>
		    				<td>AF00016</td>
		    				<td>홈페이지제작</td>
		    				<td>교선</td>
		    				<td>3</td>
		    				<td>A0</td>
		    			</tr>  						 			
		    		</tbody>
					</table>					
			
				
				</div>
			</div>
		</div>
	</div>
</body>
</html>