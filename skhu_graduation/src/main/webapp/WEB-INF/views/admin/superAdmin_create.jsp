<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="https://cdn.rawgit.com/innks/NanumSquare/master/nanumsquare.min.css">
<link rel="stylesheet"
	href="https://bootswatch.com/4/litera/bootstrap.min.css">
<meta charset='utf-8'>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-latest.min.js"
	type="text/javascript"></script>
<script language="javascript">
	function back(){
		opener.document.superAdmin_manage; //opener.document.폼이름.변수이름.value="값"을 쓴다. 팝업창 띄우고나서 다시 부모 창으로 결과값을 돌려줄 때 사용한다.
		self.close();
	}
</script>

<title>등록하기</title>
</head>
<body>
	<div class="container" style="margin-top: 50px; font-size: 15pt; margin-left: 40px">
		<form action="superAdmin_create" method="post"
					modelAttribute="user">
		<table>
			<tr>
				<td>
				<select name="role" class="form-control" style="width: 100px; border: 1px solid gray">
						<option value="교수">교수</option>
						<option value="관리자">관리자</option>
				</select>
				</td>

				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>
				<input type="text" class="form-control" name="userName"
					placeholder="이름"
					style="margin-left: 10px; width: 150px; border: 1px solid gray">
				</td>

				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>
				<input type="email" class="form-control" name="email"
					placeholder="이메일"
					style="margin-left: 10px; width: 150px; border: 1px solid gray">
				</td>

				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>
				<input type="text" class="form-control" name="phone"
					placeholder="전화번호"
					style="margin-left: 10px; width: 150px; border: 1px solid gray">
				</td>

				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>
				<input type="text" class="form-control" name="id"
					placeholder="아이디"
					style="margin-left: 10px; width: 150px; border: 1px solid gray">
				</td>

				<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>
				<input type="text" class="form-control" name="password"
					placeholder="비밀번호"
					style="margin-left: 10px; width: 150px; border: 1px solid gray">
				</td>
			</tr>

		</table>
	</div>
	<div class="form-group" style="margin-top: 60px; margin-left: 500px;">
		<button type="submit" value="등록하기" class="btn btn-outline-primary"></button>
	</div>
	</form>
</body>
</html>