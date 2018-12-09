<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet" href="https://bootswatch.com/4/litera/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${R}res/css/header.css">
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script src="${R}res/js/header.js"></script>
<script>
$(function() { 
   $("[data-url]").click(function() { 
      var url = $(this).attr("data-url");   
      location.href = url;   })  
})

</script>
<title>관리자학생리스트</title>
<style>
   #jb-content {
      width: 80%;
      margin: 20px;
      font-family: 'NanumSquare', sans-serif;
   }
</style>
</head>
<body>
   <div id="jb-container">
      <div id="jb-header">
      <div id='cssmenu'>
         <c:if test="${user.role=='관리자' }">
         <ul>
            <li>
               <a style="padding: 8px; padding-left: 15px; padding-right: 0px;">
                  <img src="${R}res/img/logo.jpg" width="29" height="29">
               </a>
            </li>
            <li><a href='../admin/admin_stu_search'><span>학생 조회</span></a></li>
            <li class='active has-sub' ><a><span>졸업요건 수정</span></a>
               <ul>
                  <li class='last'><a href='../admin/admin_allSearchEdit'><span>졸업요건표 수정</span></a></li>
                    <li class='last'><a href='../admin/admin_change_credit'><span>필수학점 수정</span></a></li>
                  <li class='last'><a href='../admin/admin_changeGraduation'><span>필수과목 수정</span></a></li>
               </ul>
            </li>
            <li class='active has-sub' ><a><span>과목 목록 수정</span></a>
               <ul>
                  <li class='last'><a href='../admin/admin_all_subject'><span>전체과목 목록</span></a></li>
                  <li class='last'><a href='../admin/admin_replace_list'><span>대체과목 목록</span></a></li>
               </ul>
            </li>
            <li><a href='../user/board'><span>공지사항 및 문의</span></a></li>
            <li><a href='../admin/admin_calenderEdit'><span>대학일정 관리</span></a></li>
            <li style="float: right"><a href='../user/logout'><span>LOGOUT</span></a></li>
            <li style="float: right"><a href='../user/check_password'><span>개인정보변경</span></a></li>
         </ul>
         </c:if>
         <c:if test="${user.role=='슈퍼관리자'}">
         <ul>
            <li>
               <a style="padding: 8px; padding-left: 15px; padding-right: 0px;">
                  <img src="${R}res/img/logo.jpg" width="29" height="29">
               </a>
            </li>
            <li><a href='../admin/admin_stu_search'><span>학생 조회</span></a></li>
            <li class='active has-sub' ><a><span>졸업요건 수정</span></a>
               <ul>
                  <li class='last'><a href='../admin/admin_allSearchEdit'><span>졸업요건표 수정</span></a></li>
                  <li class='last'><a href='../admin/admin_change_credit'><span>필수학점 수정</span></a></li>
                  <li class='last'><a href='../admin/admin_changeGraduation'><span>필수과목 수정</span></a></li>
               </ul>
            </li>
            <li class='active has-sub' ><a><span>과목 목록 수정</span></a>
               <ul>
                  <li class='last'><a href='../admin/admin_all_subject'><span>전체과목 목록</span></a></li>
                  <li class='last'><a href='../admin/admin_replace_list'><span>대체과목 목록</span></a></li>
               </ul>
            </li>
            <li><a href='../user/board'><span>공지사항 및 문의</span></a></li>
            <li><a href='../admin/admin_calenderEdit'><span>대학일정 관리</span></a></li>
            <li><a href='../admin/superAdmin_manage'><span>관리자/교수 관리</span></a></li>
            <li style="float: right"><a href='../user/logout'><span>LOGOUT</span></a></li>
            <li style="float: right"><a href='../user/check_password'><span>개인정보변경</span></a></li>
         </ul>
         </c:if>
      </div>
   </div>
         <div id="jb-content" style="margin-left: 3%; margin-top: 5%; padding-left: 8%">
            <div style="margin-left: 20%; margin-top: 3%;">
               <h3>학생 목록</h3>
            </div>
            <form method="POST">
            <div id="search" style="margin-top: 2%; font-size: 13pt;">
                <div class="form-group" style="display: inline;">
                   <select name="sbd" class="custom-select" style="margin-left: 20%; width: 190px; height:35px;">
                        <option value="0">전체</option>
                        <option value="12" ${sbd == '12' ? 'selected' : ''}>소프트웨어 공학과</option>
                            <option value="14" ${sbd == '14' ? 'selected' : ''}>컴퓨터공학과</option>
                            <option value="10" ${sbd == '10' ? 'selected' : ''}>IT융합 자율 학부</option>
                  </select> &nbsp; 
                  <select name="sbg" class="custom-select" style="width: 100px; display: inline; margin-left: 5px; height:35px;">
                     <option value="0">전체</option>
                     <option value="1" ${sbg == '1' ? 'selected' : ''}>1학년</option>
                     <option value="2" ${sbg == '2' ? 'selected' : ''}>2학년</option>
                     <option value="3" ${sbg == '3' ? 'selected' : ''}>3학년</option>
                     <option value="4" ${sbg == '4' ? 'selected' : ''}>4학년</option>
                  </select>
                     &nbsp;<a href="admin_frustrated_list" class="btn btn-outline-primary" style="font-size: 14px">미충족학생조회</a>
                 </div>
                 <div class="form-group" id="class2" style="display:inline;">
                  <select name="sbi" class="custom-select" style="width: 110px; ]display: inline; margin-left: 5%; height:35px;">
                     <option value="0">검색조건</option>
                     <option value="1" ${sbi == '1' ? 'selected' : ''}>학번</option>
                     <option value="2" ${sbi == '2' ? 'selected' : ''}>이름</option>
                     <option value="3" ${sbi == '3' ? 'selected' : ''}>과목코드</option>
                     <option value="4" ${sbi == '4' ? 'selected' : ''}>과목명</option>
                  </select> 
                  
                  <input type="text" name="st" placeholder="검색" style="margin-left: 5px; width: 90px;">

                  <input type="submit" class="btn btn-primary" style="font-size: 10pt;" value="조회하기"/>
               </div>
           </div>
           </form>
            <div class="table-responsive"
               style="margin-left: 20%; margin-top: 2%; font-size: 12pt;">
               <table class="table" style="width: 900px;">
                  <thead>
                     <tr>
                        <th><strong>학번</strong></th>
                        <th><strong>이름</strong></th>
                        <th><strong>학과</strong></th>
                        <th><strong>휴대전화번호</strong></th>
                     </tr>
                  </thead>
                  <tbody>
                     <c:forEach var="user" items="${ users }">
                        <tr data-url="../user/detail_stu_info?id=${user.id }" style="cursor:pointer">
                           <td>${ user.id }</td>
                           <td>${ user.userName }</td>
                           <td>${ user.departmentName }</td>
                           <td>${ user.phone }</td>
                        </tr>
                     </c:forEach>
                  </tbody>
               </table>
            </div>
         </div>
      
       <div id="page"  style="margin-top: 1%;">
         <nav aria-label="Page navigation example"> 
              <ul class="pagination justify-content-center">
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
              </ul>
         </nav>      
      </div>
   </div>
</body>
</html>