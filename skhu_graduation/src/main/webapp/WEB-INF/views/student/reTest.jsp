<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			
수강한 과목 <br/>
<c:forEach items="${requiredSubjectMap}" var="subject">
${subject.value }
<br/>
</c:forEach>
<br/>

수강하지 못한 과목
<br/>
<c:forEach items="${noSubjectMap}" var="map">
${map.value }
</c:forEach>

<a href="stu_main">돌아가기</a> 
</body>
</html>