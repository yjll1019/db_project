<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="net.skhu.dto.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:url var="R" value="/" />
 <% 
 String s= request.getParameter("departmentId");
 int majorId = (s==null) ? 0 : Integer.parseInt(s);
 int subMajorId=0;
 
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://bootswatch.com/4/litera/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/innks/NanumSquare/master/nanumsquare.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.css">
<link rel="stylesheet" href="${R}res/css/mypage.css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${R}res/css/header.css">
<script src="http://code.jquery.com/jquery-latest.min.js"
	type="text/javascript"></script>
<!-- Website CSS style -->
<link rel="stylesheet" type="text/css" href="assets/css/main.css">

<!-- Website Font style -->

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" 
integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Passion+One'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Oxygen'
	rel='stylesheet' type='text/css'>

<!-- header -->
<link rel="stylesheet" href="${R}res/css/header.css">
<script src="http://code.jquery.com/jquery-latest.min.js"
	type="text/javascript"></script>
<script src="${R}res/js/header.js"></script>	
<% String r = request.getParameter("r"); %>
<script>
	var r = <%= r %>;
	if(r == "-1"){
 		alert('업로드 실패 혹은 선택된 파일이 없습니다.');
 	}
</script>
<title>학생 마이페이지 </title>
</head>
<%
	String alert =String.valueOf(request.getAttribute("alert"));
%>
<script>
	var al = "<%=alert%>"
		if(al==-1){
			alert('비밀번호 조건이 맞지 않습니다. 영문+숫자 8자리 이상!');
		}else if(al==-2){
			alert('비밀번호와 확인비밀번호가 맞지 않습니다.');
		}

</script>
<body>
	<div id="jb-container">
		<div id="jb-header">
		<div id='cssmenu'>
			<ul>
				<li><a href='#'
					style="padding: 8px; padding-left: 15px; padding-right: 0px;"><img src="${R}res/img/logo.jpg" width="29" height="29"></a></li>
				<li><a href='#'><span>나의졸업요건</span></a></li>
				<li><a href='stu_subject_list'><span>수강목록 조회</span></a></li>
				<li><a href='stu_allSearch'><span>졸업요건 조회</span></a></li>
				<li><a href='#'><span>공지사항 및 문의</span></a></li>
				<li style="float: right"><a href='../user/logout'><span>LOGOUT</span></a></li>
				<li style="float: right"><a href='../user/check_password'><span>개인정보변경</span></a></li>
			</ul>
		</div>
	</div>
<div id="jb-content justify-content-center">
			<div class="container">
			<div class="row main">
				<div class="main-login main-center">
					<form class="form-horizontal" method="post" action="updateStudent" style="width: 300px; margin-left: 23px">
						<div class="form-group">
							<label for="name" class="cols-sm-2 control-label">이름</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true" style="margin-top: 10px;"></i></span>
									&nbsp;&nbsp;
									<input type="text" class="form-control" name="name"  value="${users.userName}" style="height: 37px;"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="email" class="cols-sm-2 control-label">이메일</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"  style="margin-top: 10px;"></i></span>
									&nbsp;&nbsp;
									<input type="text" class="form-control" name="email"   value="${users.email}"style="height: 37px;"/>
								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="phone" class="cols-sm-2 control-label">전화번호</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-phone fa" aria-hidden="true"  style="margin-top: 10px;"></i></span>
									&nbsp;&nbsp;
									<input type="tel" class="form-control" name="phone"  value="${users.phone}" style="height: 37px;"/>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<label for="password" class="cols-sm-2 control-label">비밀번호</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock  " aria-hidden="true"  style="margin-top: 8px;"></i></span>
									&nbsp;&nbsp;
									<input type="password" class="form-control" name="password" id="password" data-toggle="popover" placeholder="비밀번호 입력" style="height: 37px;"/>
								</div>
				
							</div>
						</div>

						<div class="form-group">
							<label for="confirm" class="cols-sm-2 control-label">비밀번호 확인</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock" aria-hidden="true"  style="margin-top: 8px;"></i></span>
									&nbsp;&nbsp;
									<input type="password" class="form-control" name="confirm" id="confirm"  placeholder="비밀번호 확인 입력" style="height: 37px;"/>
								</div>
								
							</div>
						</div>

						<div class="form-group" style="margin-top: 20pt;">	
							<div class="cols-sm-10">
								<div class="input-group" style="font-size: 13pt;">
								<span class="input-group-addon">
									<i class="fas fa-pen-square" ></i>&nbsp; 편입생
								</span>
									<input type="checkbox" name="kind"  id="kind" style="margin-left:20px; width:25px; height:25px;"/>
								</div>
								
								<div class="input-group" style="font-size: 13pt; margin-top: 8px;">
									<span class="input-group-addon">
									<i class="fas fa-pen-square" ></i>&nbsp; 사회봉사면제여부
									</span>
									<input type="checkbox" name="kind" id="kind" style="margin-left:20px; width:25px; height:25px;"/>
								</div>
							</div>
						</div>
						
						<div class="form-group" style="margin-top: 25px;">
							<label for ="major" class="cls-sm-2 control-label">학부/학과</label>
							<div class="radio" style="font-size: 10pt; margin-bottom: 7%">
 								&nbsp;	&nbsp;	&nbsp; &nbsp;
 								<input type="radio" name="howToGraduate" value="전공기초" checked> 전공기초 
 								&nbsp; &nbsp;
								<input type="radio" name="howToGraduate" value="전공심화"> 전공심화
 							</div>
 							
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-graduation-cap fa" aria-hidden="true"  style="margin-top: 10px;"></i></span>
									&nbsp;&nbsp;
									<select name="majorId" class="form-control" value="${student.departmentId }" style="height: 37px; font-size: 10pt;">
     									 <option value="0"  <c:if test="${student.departmentId == 0}">selected</c:if> >주전공을 선택해 주세요</option>
      									<option value="12" <c:if test="${student.departmentId == 12}">selected</c:if>>소프트웨어 공학과</option>
  									    <option value="14" <c:if test="${student.departmentId == 14}">selected</c:if>>컴퓨터공학과</option>
      									<option value="10" <c:if test="${student.departmentId == 10}">selected</c:if>>IT융합 자율 학부</option>
									</select>
								</div>
							</div>
							</div>
						
							<div class="checkbox" style="font-size: 10pt; margin-bottom: 7%">
 								&nbsp;	&nbsp;	&nbsp; &nbsp; 
 								<input type="checkbox" name="doubleMajor" value="복수전공" > 복수전공 
 								&nbsp; &nbsp;
								<input type="checkbox" name="subMajor" value="부전공"> 부전공
 							</div>
							<div class="cols-sm-10" style="margin-top:5px;">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-graduation-cap fa" aria-hidden="true"  style="margin-top: 10px;"></i></span>
									&nbsp;&nbsp;
							<select name="subMajorId" class="form-control" value="${secondMajor.departmentId }" style="height: 37px; font-size: 10pt;" >
     									 <option value="0" <c:if test="${secondMajor.departmentId == 0}">selected</c:if> >부/복수 전공을 선택해 주세요</option>
      									<option value="11"<c:if test="${secondMajor.departmentId == 11}">selected</c:if> >디지털 컨텐츠학과</option>
  									    <option value="12" <c:if test="${secondMajor.departmentId == 12 }">selected</c:if> >소프트웨어 공학과</option>
      									<option value="13" <c:if test="${secondMajor.departmentId ==13 }">selected</c:if> >정보통신학과</option>
     									 <option value="14" <c:if test="${secondMajor.departmentId == 14}">selected</c:if> >컴퓨터공학과</option>
      									<option value="15" <c:if test="${secondMajor.departmentId ==15}">selected</c:if> >글로컬 IT학과</option>
  									    <option value="20" <c:if test="${secondMajor.departmentId ==20}">selected</c:if> >경영학부</option>
      									<option value="21" <c:if test="${secondMajor.departmentId ==21}">selected</c:if> >디지털컨텐츠학과</option>
      									 <option value="23" <c:if test="${secondMajor.departmentId ==23}">selected</c:if> >사회과학부</option>
      									<option value="24" <c:if test="${secondMajor.departmentId ==24}">selected</c:if> >사회복지학과</option>
  									    <option value="26" <c:if test="${secondMajor.departmentId ==26}">selected</c:if> >신문방송학과</option>
      									<option value="30" <c:if test="${secondMajor.departmentId ==30}">selected</c:if>>신학과</option>
     									 <option value="31"<c:if test="${secondMajor.departmentId ==31}">selected</c:if> >영어학과</option>
      									<option value="32"<c:if test="${secondMajor.departmentId ==32}">selected</c:if> >일어일본학과</option>
  									    <option value="34" <c:if test="${secondMajor.departmentId ==34}">selected</c:if> >중어중국학과</option>
      									
								</select>
								</div>
							</div>
							
							
						<div class="form-group" style="margin-top:5px;">
							<label for ="semester" class="cls-sm-2 control-label">학기</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user-graduate fa" aria-hidden="true"  style="margin-top: 10px;"></i></span>
									&nbsp;&nbsp;
									<select name="semester" class="form-control" value="${student.stuSemester}"  style="height: 37px; font-size: 10pt;" >
      									<option value="0" <c:if test="${student.stuSemester == 0}">selected</c:if> >학기를 선택해 주세요</option>
  									    <option value="1" <c:if test="${student.stuSemester == 1}">selected</c:if>>1학기</option>
      									<option value="2" <c:if test="${student.stuSemester == 2}">selected</c:if>>2학기</option>
     									<option value="3" <c:if test="${student.stuSemester == 3}">selected</c:if>>3학기</option>
      									<option value="4" <c:if test="${student.stuSemester == 4}">selected</c:if>>4학기</option>
  									    <option value="5" <c:if test="${student.stuSemester == 5}">selected</c:if>>5학기</option>
       									<option value="0" <c:if test="${student.stuSemester == 6}">selected</c:if>>6학기</option>
  									    <option value="1" <c:if test="${student.stuSemester == 7}">selected</c:if>>7학기</option>
      									<option value="2" <c:if test="${student.stuSemester == 8}">selected</c:if>>8학기</option>
     									<option value="3" <c:if test="${student.stuSemester == 9}">selected</c:if>>9학기</option>
								</select>
								</div>
							</div>
						</div>

							<div class="form-group" style="margin-top: 36px; margin-left: 31%; width: 120px;">
							<button type="submit" class="btn btn-primary btn-lg btn-block login-button" >수정하기</button>
						</div>		
					</form>
					<form action="mySubject_upload" method="post" enctype="multipart/form-data" style="margin-left: 10px">
							<div class="form-group">
							<label for="file" class="cols-sm-2 control-label">수강목록 업로드</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-file-upload fa" aria-hidden="true" style="margin-top: 10px;"></i></span>
									&nbsp;&nbsp;
									<input type="file" name="file" style="width: 250px;" />
									<button type="submit" class="btn btn-outline-primary" style="font-size: 13px;">업로드</button>
								</div>
							</div>
						</div>					
					</form>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>