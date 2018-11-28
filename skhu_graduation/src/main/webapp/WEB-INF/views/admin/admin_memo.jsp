<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://bootswatch.com/4/litera/bootstrap.min.css">

<title>조치사항</title>
</head>
<%
	String stuId = String.valueOf(request.getAttribute("stuId"));
%>
<!-- 
<script type="text/javascript">
	function back() {
		$.ajax({
			type:"POST",
			url:"/professor_memo",
			data:form,
			success:function(data){
				self.close();
			}
		})
	}
</script>
 -->
<body>

	<div
		style="position: absolute; width: 500px; height: 600px; top: 0; left: 0; bottom: 0; right: 0; margin: auto;">
		<form action="admin_memo" method="post" modelAttribute="counsel">
			<textarea name="content" cols="60" rows="20" style="margin-top: 10px">
	  			${record}
	  		</textarea>
			<input type="hidden" name="stuId" value=<%=stuId%>>
			<button type="submit" class="btn btn-primary"
				style="margin-left: 40%; margin-top: 5%;">저장</button>
		</form>
	</div>
</body>
</html>