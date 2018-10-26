<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://bootswatch.com/4/litera/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/innks/NanumSquareRound/master/nanumsquareround.min.css"><!-- ��Ʈ -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${R}res/css/header.css">
<script src="http://code.jquery.com/jquery-latest.min.js"
	type="text/javascript"></script>
<script src="${R}res/js/header.js"></script>
<title>���� �л�����Ʈ </title>
</head>
<body>
	<div id="jb-container">
	<div id="jb-header">
		<div id='cssmenu'>
			<ul>
				<li><a href='#'
					style="padding: 8px; padding-left: 15px; padding-right: 0px;"><img src="${R}res/img/logo.jpg" width="29" height="29"></a></li>
				<li><a href='#'><span>�л� ��ȸ</span></a></li>
				<li><a href='#'><span>������� ��ȸ</span></a></li>
				<li><a href='#'><span>�������� �� ����</span></a></li>
				<li style="float: right"><a href='logout'><span>LOGOUT</span></a></li>
				<li style="float: right"><a href='#'><span>������������</span></a></li>
			</ul>
		</div>
	</div>
		<div id="jb-content" style="margin-left: 3%; margin-top:5%;">
				<div style="margin-left: 20%;">
					<h3>�л� ���</h3>
				</div>
				
		<div id="search" style="margin-top: 2%; font-size: 13pt;">
         <div id="class1" style="display: inline; margin-left: 20%; ">
			<select class="custom-select" style="width: 100px; display: inline; margin-left: 3px; height:40px;">
				<option>1�г�</option>
				<option>2�г�</option>
				<option>3�г�</option>
				<option>4�г�</option>
			</select>
            &nbsp;
			<button type="button" class="btn btn-outline-primary" style="font-size: 10pt">�������л���ȸ</button>
         </div>
         
         <div id="class2" style="display: inline; margin-left:27%;">
            <select class="custom-select" style="width: 100px; display: inline; margin-left: 5px; height:40px;">
               <option>�й�</option>
               <option>�̸�</option>
                 <option>����</option>
            </select>
            
            <input type="text" name="searchText" placeholder="�˻�"  style="margin-left:7px; width: 150px;">
         
         <button type="button" class="btn btn-primary">��ȸ</button>
         </div>
      </div>

      
   				<div class="table-responsive"
					style="margin-left: 20%; margin-top: 2%; font-size: 14pt;">
					<table class="table" style="width: 900px;">
						<thead>
							<tr>
								<th><strong>�й�</strong></th>
								<th><strong>�̸�</strong></th>
								<th><strong>�а�</strong></th>
								<th><strong>�޴���ȭ��ȣ</strong></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>201632001</td>
								<td>������</td>
								<td>����Ʈ������а�</td>
								<td>010-1234-5678</td>
							</tr>
							<tr>
								<td>201632002</td>
								<td>������</td>
								<td>����Ʈ������а�</td>
								<td>010-1234-5678</td>
							</tr>
							<tr>
								<td>201632003</td>
								<td>�̿���</td>
								<td>����Ʈ������а�</td>
								<td>010-1234-5678</td>
							</tr>
							<tr>
								<td>201632004</td>
								<td>������</td>
								<td>����Ʈ������а�</td>
								<td>010-1234-5678</td>
							</tr>
							<tr>
								<td>201632005</td>
								<td>������</td>
								<td>����Ʈ������а�</td>
								<td>010-1234-5678</td>
							</tr>
							<tr>
								<td>201632006</td>
								<td>������</td>
								<td>����Ʈ������а�</td>
								<td>010-1234-5678</td>
							</tr>
							<tr>
								<td>201632007</td>
								<td>������</td>
								<td>����Ʈ������а�</td>
								<td>010-1234-5678</td>
							</tr>
							<tr>
								<td>201632008</td>
								<td>������</td>
								<td>����Ʈ������а�</td>
								<td>010-1234-5678</td>
							</tr>
							<tr>
								<td>201632009</td>
								<td>������</td>
								<td>����Ʈ������а�</td>
								<td>010-1234-5678</td>
							</tr>
							<tr>
								<td>201632010</td>
								<td>��Ƽ��</td>
								<td>����Ʈ������а�</td>
								<td>010-1234-5678</td>
							</tr>
							<tr>
								<td>201632011</td>
								<td>����</td>
								<td>����Ʈ������а�</td>
								<td>010-1234-5678</td>
							</tr>
							<tr>
								<td>201632012</td>
								<td>�̳���</td>
								<td>����Ʈ������а�</td>
								<td>010-1234-5678</td>
							</tr>
							<tr>
								<td>201632013</td>
								<td>�������ڽ�</td>
								<td>����Ʈ������а�</td>
								<td>010-1234-5678</td>
							</tr>
							<tr>
								<td>201632014</td>
								<td>����</td>
								<td>����Ʈ������а�</td>
								<td>010-1234-5678</td>
							</tr>
						</tbody>
					</table>
				</div>
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
		</div>
</body>
</html>