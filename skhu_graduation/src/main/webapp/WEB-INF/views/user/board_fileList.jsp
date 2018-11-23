<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div id="fileList">
	<table class="table table-boardered table-condensed" style="width: auto">
		<c:forEach var="file" items="${ files }">
			<tr>
				<td style="min-width:200px"><a href="../user/download?id=${file.id}">${ file.fileName }</a></td>
				<td class="text-right">
					<fmt:formatNumber type="number" value="${ file.fileSize }" /> bytes
				</td>
				<c:if test="${ user.role eq '관리자' }">
					<td>
						<a class="btn btn-default btn-xs" href="../user/fileDelete?fileId=${file.id}&boardId=${boardId}">삭제</a>
					</td>
				</c:if>
			</tr>
		</c:forEach>
	</table>
</div>

<script>
	if(parent) {
		var h = $("div#fileList").height() + 20;
		parent.setIframeHeight(h);
	}
</script>

</body>
</html>