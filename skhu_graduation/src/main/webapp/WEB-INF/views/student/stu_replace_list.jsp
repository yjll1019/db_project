<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://bootswatch.com/4/litera/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/innks/NanumSquare/master/nanumsquare.min.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="res/css/header.css">
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script src="res/js/header.js"></script>
<title>학생- 대체과목 리스트 </title>
</head>
<body>
	<div id="jb-header">
		<div id='cssmenu'>
			<ul>
				<li><a href='#'
					style="padding: 8px; padding-left: 15px; padding-right: 0px;"><img src="res/img/logo.jpg" width="29" height="29"></a></li>
				<li><a href='#'><span>나의졸업요건</span></a></li>
				<li><a href='#'><span>수강목록 조회</span></a></li>
				<li><a href='#'><span>졸업요건 조회</span></a></li>
				<li><a href='#'><span>공지사항 및 문의</span></a></li>
				<li style="float: right"><a href='#'><span>LOGOUT</span></a></li>
				<li style="float: right"><a href='#'><span>개인정보변경</span></a></li>
			</ul>
		</div>
	</div>

	
		<div id="search" style="margin-top: 3%; font-size: 10pt;">
         <div style="font-size:20pt; margin-left: 20%;">
         	<strong>대체과목목록</strong>
         </div>
         
         <div id="class2" style="display: inline; margin-left: 65%; font-size: 12pt;">
             <input type="text" name="searchText" placeholder="과목명을 입력하세요."  style="margin-left:5px;">
	         	&nbsp; <button type="button" class="btn btn-primary">조회</button>
         </div>
      </div>

      
   <div class="table-responsive" style="margin-left: 20%; font-size:8pt; margin-top: 3%; text-align:center;">
     <table class="table" style="width:60%;">
       <thead>
         <tr>
    	  <th style=" font-size: 15pt">폐지된 과목</th>
  	      <th style="font-size: 15pt">대체 과목</th>
         </tr>
       </thead>
       
       <tbody style="font-size: 12pt;">
       <tr>
         <td>이산수학</td>
         <td>대학수학</td>
       </tr>
       <tr>
         <td>웹페이지구축I</td>
         <td>전공선택</td>
       </tr>
       <tr>
         <td>C프로그래밍I</td>
         <td>Python 프로그래밍</td>
       </tr>
       <tr>
         <td>자바프로그래밍</td>
         <td>전공선택</td>
       </tr>
       <tr>
         <td>컴퓨터구조</td>
         <td>컴퓨터네트워크</td>
       </tr>
       <tr>
         <td>운영체제론</td>
         <td>전공선택</td>
       </tr>
       <tr>
         <td>알고리즘</td>
         <td>전공선택</td>
       </tr>
       <tr>
         <td>공업수학I</td>
         <td>대학수학</td>
       </tr>
       <tr>
         <td>C++프로그래밍</td>
         <td>자바프로그래밍</td>
       </tr>
       <tr>
         <td>데이터통신</td>
         <td>데이터베이스</td>
       </tr>
       <tr>
         <td>컴퓨터그래픽스</td>
         <td>디지털영상처리</td>
       </tr>                   	
       </tbody>
     </table>
   </div>
      
      <div id="page" style="margin-top: 3%">
			<nav aria-label="Page navigation example"> 
 				 <ul class="pagination justify-content-center">
    				 <li class="page-item">
      					<a class="page-link" href="#" aria-label="Previous">
      					  <span aria-hidden="true">&laquo;</span>
        				  <span class="sr-only">Previous</span>
     				    </a>
   	 				</li>
    				<li class="page-item"><a class="page-link" href="#">1</a></li>
    				<li class="page-item"><a class="page-link" href="#">2</a></li>
    				<li class="page-item"><a class="page-link" href="#">3</a></li>
    				<li class="page-item">
      					<a class="page-link" href="#" aria-label="Next">
        					<span aria-hidden="true">&raquo;</span>
        					<span class="sr-only">Next</span>
     					</a>
    				</li>
 				 </ul>
			</nav>		
			
		</div>
</body>
</html>