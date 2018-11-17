<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>졸업요건 조회</title>
<style>
#jb-content {
   width: 80%;
   padding: 40px;
   margin: 20px;
   font-family: 'NanumSquare', sans-serif;
}
</style>
</head>
<body>
   <div id="jb-container">
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
      <div id="jb-content" style="margin-left: 5%">
         <h2>&nbsp;&nbsp;전체학과 졸업요건 안내</h2>
         <br />
         <div class="col-sm-4">
            <div class="input-group">
               <select name="subMajor" class="form-control" id="subMajor">
                  <option value="0">조회하려는 학과를 선택해 주세요</option>
      									<option value="11" >디지털 컨텐츠학과</option>
  									    <option value="12"  >소프트웨어 공학과</option>
      									<option value="13"  >정보통신학과</option>
     									 <option value="14"  >컴퓨터공학과</option>
      									<option value="15"  >글로컬 IT학과</option>
  									    <option value="20"  >경영학부</option>
      									<option value="21"  >디지털컨텐츠학과</option>
      									 <option value="23"  >사회과학부</option>
      									<option value="24"  >사회복지학과</option>
  									    <option value="26"  >신문방송학과</option>
      									<option value="30" >신학과</option>
     									 <option value="31">영어학과</option>
      									<option value="32" >일어일본학과</option>
  									    <option value="34">중어중국학과</option>
               </select>
            </div>
         </div>
         <br />
         <div class="table-responsive">
            <table class="table">
               <thead>
                  <tr>
                     <th>대상</th>
                     <th>부/복수전공</th>
                     <th>졸업요건</th>
                     <th>기타요건</th>
                  </tr>
               </thead>
               <tbody>
                  <tr>
                     <td rowspan="4">소프트웨어 공학과 학생</td>
                     <td>소프트웨어<br> 주전공
                     </td>
                     <td>[2008~2013학번까지]<br> 전필37학점 포함하여 전공 60학점 이상 이수<br>
                        <br> [2014학번부터]<br> 전필31학점 포함하여 전공 60학점 이상 이수<br>
                     </td>
                  </tr>
                  <tr>
                     <td>소프트웨어공학과<br>(타과)복수전공
                     </td>
                     <td>전필 31학점 포함하여 전공 40학점 이상 이수</td>
                  </tr>
                  <tr>
                     <td>소프트웨어공학과<br>(타과)부전공
                     </td>
                     <td>전필 31학점 포함하여 전공 60학점 이상 이수</td>
                  </tr>
                  <tr>
                     <td>소프트웨어공학과<br>편입
                     </td>
                     <td>1,2학년 지도과목을 제외하고 전필 27학점을 포함하여 전공 60학점 이상 이수</td>
                  </tr>

                  <tr>
                     <td rowspan="3">타과학생</td>
                     <td>소프트웨어공학과<br> 전과
                     </td>
                     <td>학번에 따라 전공필수 이수<br> 전과이전 학기의 지도과목은 제외하되, 그만큼의 학점은
                        전선을 이수하여 전공학점을 채워야 함
                  </tr>
                  <tr>
                     <td>소프트웨어공학과<br>복수전공
                     </td>
                     <td>지도 과목 제외하고 전필 24학점 포함하여 전공 40학점 이상 이수(지도 과목은 선택)</td>
                  </tr>
                  <tr>
                     <td>소프트웨어공학과<br>부전공
                     </td>
                     <td>전필, 전선 관계없이 21학점 이상 이수</td>
                  </tr>
               </tbody>
            </table>
         </div>
      </div>
      <br />
   </div>

</body>
</html>