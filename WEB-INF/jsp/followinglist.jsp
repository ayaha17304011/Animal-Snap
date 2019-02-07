<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<title>‚ ‚É‚Ü‚é ‚·‚È‚Á‚Õ</title>
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
	</head>
	<body>
		<c:forEach var="data" items="${data}">
			<p>${data.loginId}</p>
			<p>${data.userName}</p>
			<img src="<c:url value='/WebContent/${data.iconImage}'/>" class="iconimage">
		</c:forEach>
	</body>
</html>