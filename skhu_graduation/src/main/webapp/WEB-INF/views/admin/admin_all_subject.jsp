<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://bootswatch.com/4/litera/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css"><!-- 폰트 -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${R}res/css/header.css">
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script src="${R}res/js/header.js"></script>
<title>관리자 과목리스트</title>
<style>
	#jb-content {
		width: 80%;
		margin: 20px;
		font-family: 'NanumSquare', sans-serif;
	}
</style>
<% String s = request.getParameter("r"); %>
<script>
	var r = <%= s %>;
	if(r == "1"){
    	alert('업로드 성공!');
 	} else if(r == "-1"){
 		alert('업로드 실패 혹은 선택된 파일이 없습니다.');
 	}
</script>
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
				<li><a href='../admin/admin_stu_search?sbd=0&sbg=0&sbi=0&st='><span>학생 조회</span></a></li>
				<li class='active has-sub' ><a><span>졸업요건 수정</span></a>
					<ul>
						<li class='last'><a href='../admin/admin_allSearchEdit'><span>졸업요건표 수정</span></a></li>
						<li class='last'><a href='#'><span>필수학점 수정</span></a></li>
						<li class='last'><a href='../admin/admin_changeGraduation'><span>필수과목 수정</span></a></li>
					</ul>
				</li>
				<li class='active has-sub'><a><span>과목 목록 수정</span></a>
					<ul>
						<li class='last'><a href='../admin/admin_all_subject'><span>전체과목 목록</span></a></li>
						<li class='last'><a href='../admin/admin_replace_list'><span>대체과목 목록</span></a></li>
					</ul>
				</li>
				<li><a href='../user/board'><span>공지사항 및 문의</span></a></li>
				<li><a href='../admin/calenderEdit'><span>대학일정 관리</span></a></li>
				<li style="float: right"><a href='../user/logout'><span>LOGOUT</span></a></li>
				<li style="float: right"><a href='../admin/adminInfo'><span>개인정보변경</span></a></li>
			</ul>
		</div>
	</div>
			<div id="jb-content" style="margin-left: 3%; margin-top: 3%; padding-left: 8%">
				<div style="margin-left: 20%; margin-top: 3%; margin-bottom: 2%;">
					<h3>과목 목록</h3>
				</div>
				<form method="post">
					<div class="form-group" id="class2" style="display:inline; margin-left: 10%;">
						<select class="custom-select" style="width: 90px; display: inline; margin-left: 10%; height:35px;">
							<option>과목명</option>
							<option>과목코드</option>
						</select> 
						<input type="text" name="searchText" placeholder="검색" style="margin-left: 5px; width: 120px;">&nbsp;
						<button type="button" class="btn btn-primary" style="font-size: 13px;">조회</button>
					</div>
				</form>
				<form action="subject_upload" method="post" enctype="multipart/form-data">							
					<div class="form-group" style="margin-left: 20%; margin-top: 10px">
						<input type="file" name="file" style="width: 250px;">
						<button type="submit" class="btn btn-primary" style="font-size: 13px;">업로드</button>   	
		 			</div>				
				</form>
				<div class="table-responsive" style="margin-left: 20%; margin-top: 20px; font-size: 12pt;">
					<table class="table" style="width: 900px;">
						<thead style="font-size: 18px; font-weight: 500px;">
							<tr>
								<th>년도</th>
								<th>학기</th>
								<th>과목코드</th>
								<th>분반</th>
								<th>개설소속</th>
								<th>과목명</th>
								<th>이수구분</th>
								<th>학점</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>2010</td>
								<td>1학기</td>
								<td>AC00001</td>
								<td>01</td>
								<td>교양계 교목실</td>
								<td>기도모임</td>
								<td>교양필수</td>
								<td>0.0</td>
							</tr>
							<tr>
								<td>2010</td>
								<td>1학기</td>
								<td>AC00004</td>
								<td>01</td>
								<td>인문계 영어학과</td>
								<td>영어1</td>
									<td>교양필수</td>
								<td>3.0</td>
							</tr>
							<tr>
								<td>2010</td>
								<td>1학기</td>
								<td>AC00001</td>
								<td>01</td>
								<td>교양계 교목실</td>
								<td>기도모임</td>
								<td>교양필수</td>
								<td>0.0</td>
							</tr>
							<tr>
								<td>2010</td>
								<td>1학기</td>
								<td>AC00004</td>
								<td>01</td>
								<td>인문계 영어학과</td>
								<td>영어1</td>
									<td>교양필수</td>
								<td>3.0</td>
							</tr>
							<tr>
								<td>2010</td>
								<td>1학기</td>
								<td>AC00001</td>
								<td>01</td>
								<td>교양계 교목실</td>
								<td>기도모임</td>
								<td>교양필수</td>
								<td>0.0</td>
							</tr>
							<tr>
								<td>2010</td>
								<td>1학기</td>
								<td>AC00004</td>
								<td>01</td>
								<td>인문계 영어학과</td>
								<td>영어1</td>
									<td>교양필수</td>
								<td>3.0</td>
							</tr>
							<tr>
								<td>2010</td>
								<td>1학기</td>
								<td>AC00001</td>
								<td>01</td>
								<td>교양계 교목실</td>
								<td>기도모임</td>
								<td>교양필수</td>
								<td>0.0</td>
							</tr>
							<tr>
								<td>2010</td>
								<td>1학기</td>
								<td>AC00004</td>
								<td>01</td>
								<td>인문계 영어학과</td>
								<td>영어1</td>
									<td>교양필수</td>
								<td>3.0</td>
							</tr>
							<tr>
								<td>2010</td>
								<td>1학기</td>
								<td>AC00001</td>
								<td>01</td>
								<td>교양계 교목실</td>
								<td>기도모임</td>
								<td>교양필수</td>
								<td>0.0</td>
							</tr>
							<tr>
								<td>2010</td>
								<td>1학기</td>
								<td>AC00004</td>
								<td>01</td>
								<td>인문계 영어학과</td>
								<td>영어1</td>
									<td>교양필수</td>
								<td>3.0</td>
							</tr>
							<tr>
								<td>2010</td>
								<td>1학기</td>
								<td>AC00001</td>
								<td>01</td>
								<td>교양계 교목실</td>
								<td>기도모임</td>
								<td>교양필수</td>
								<td>0.0</td>
							</tr>
							<tr>
								<td>2010</td>
								<td>1학기</td>
								<td>AC00004</td>
								<td>01</td>
								<td>인문계 영어학과</td>
								<td>영어1</td>
									<td>교양필수</td>
								<td>3.0</td>
							</tr>														
						</tbody>
					</table>
				</div>
			</div>
		
		 <div id="page">
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
		
	</div>
</body>
</html>