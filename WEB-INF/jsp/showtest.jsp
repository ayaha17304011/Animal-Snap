<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<title>Show Test</title>
	</head>
	<body>
		<c:forEach var="data" items="${data}">
			<img src="${data.imageURL}">
			<h2>${data.caption}</h2>
		</c:forEach>
	</body>
</html>