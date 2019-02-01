<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<title>���ɂ܂� ���Ȃ���</title>
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
	</head>
	<body>
		<c:forEach var="user" items="${data[0]}">
			<p>${user.loginId}</p>
			<img src="<c:url value='/WebContent/${user.iconImage}'/>" class="iconimage"/><br>
		</c:forEach>
		<c:forEach var="post" items="${data[1]}">
			<img src="<c:url value='/WebContent/${post.imageURL}'/>" class="image"/><br>
		</c:forEach>
	</body>
</html>