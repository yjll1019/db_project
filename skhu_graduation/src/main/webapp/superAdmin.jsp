<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css">
<link rel="stylesheet"
	href="https://bootswatch.com/4/litera/bootstrap.min.css">
<meta charset='utf-8'>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="res/css/header.css">
<link rel="stylesheet" href="res/css/board.css">

<script src="http://code.jquery.com/jquery-latest.min.js"
	type="text/javascript"></script>
<script src="js/header.js"></script>

<script language="javascript">
	function open_page() {
		window.open("superAdmin_create.jsp", "등록",
				"width=1130, height=250, left=350, top=300");
	}
</script>

<title>슈퍼관리자 페이지</title>
</head>
<body>
	<div id="jb-container">
			<div id="jb-header">
		<div id='cssmenu'>
			<ul>
				<li><a href='#' style="padding: 8px; padding-left: 15px; padding-right: 0px;"><img src="res/img/logo.jpg" width="29" height="29"></a></li>
				<li><a href='#'><span>관리자/교수 관리</span></a></li>
				<li style="float: right"><a href='#'><span>LOGOUT</span></a></li>
				<li style="float: right"><a href='#'><span>개인정보변경</span></a></li>
			</ul>
		</div>
	</div>
		<div id="jb-content">
			<h2>관리자, 교수 목록</h2>
			<hr>			
			<div class="form-group"
				style="margin-top: -10px;">
				<button type="button" class="btn btn-outline-primary"
					style="display: inline; width: 100px; margin-left: 40px; float: left; font-size: 14px" onclick="open_page()">등록하기</button>
				<select name="searchInSuperAdmin" class="form-control" style="display: inline; margin-left: 330px; width: 90px; height: 35px; font-size: 15px;">
					<option>교수</option>
					<option>관리자</option>
				</select>
				<input type="text" class="form-control" name="searchText" placeholder="검색" style="display: inline; margin-left: 15px; width: 200px; height: 35px;"/>
					<button type="button" class="btn btn-primary" style="font-size: 14px">조회하기</button>
			</div>
			<br />
			<div class="table-responsive"
				style="margin-top: -35px;padding-left: 40px; padding-right: 40px; font-size: 15pt;">
				<table class="table" style="width: 850px;">
					<thead style="font-size: 18px">
						<tr>
							<th>직책</th>
							<th>이름</th>
							<th>이메일</th>
							<th>전화번호</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>교수</td>
							<td>이승진</td>
							<td>ummm@skhu.ac.kr</td>
							<td>010-1234-5678</td>
						</tr>
						<tr>
							<td>관리자</td>
							<td>최주하</td>
							<td>dev@naver.com</td>
							<td>010-1234-5633</td>
						</tr>
						<tr>
							<td>관리자</td>
							<td>남태리</td>
							<td>1004@naver.com</td>
							<td>010-1234-3333</td>
						</tr>
						<tr>
							<td>교수</td>
							<td>홍은지</td>
							<td>pretty@skhu.ac.kr</td>
							<td>010-1234-1221</td>
						</tr>
						<tr>
							<td>교수</td>
							<td>노은하</td>
							<td>galaxy@skhu.ac.kr</td>
							<td>010-1231-5678</td>
						</tr>
						<tr>
							<td>교수</td>
							<td>유상신</td>
							<td>arduino@skhu.ac.kr</td>
							<td>010-1234-2348</td>
						</tr>
						<tr>
							<td>관리자</td>
							<td>정창수</td>
							<td>as@skhu.ac.kr</td>
							<td>010-1235-4455</td>
						</tr>
						<tr>
							<td>관리자</td>
							<td>박동현</td>
							<td>dd@skhu.ac.kr</td>
							<td>011-538-5678</td>
						</tr>
						<tr>
							<td>교수</td>
							<td>임형</td>
							<td>easy@skhu.ac.kr</td>
							<td>010-4524-1232</td>
						</tr>
						<tr>
							<td>관리자</td>
							<td>최인혁</td>
							<td>kk@naver.com</td>
							<td>010-1334-1211</td>
						</tr>

					</tbody>
				</table>
			</div>

			<div id="page" style="margin-top: 3%">
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								<span class="sr-only">Previous</span>
						</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
								class="sr-only">Next</span>
						</a></li>
					</ul>
				</nav>

			</div>

		</div>
	</div>
</body>
</html>