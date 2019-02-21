<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<title>‚ ‚É‚Ü‚é ‚·‚È‚Á‚Õ</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/style/user.css"/>
	</head>
	<body>
		<c:forEach var="data" items="${data}">
			<div class="user">
				<a href="mypage?userId=${data.userId}"></a>
				<p>${data.loginId}</p>
				<p>${data.userName}</p>
				<img src="<c:url value='/WebContent/${data.iconImage}'/>" class="iconimage">
			</div>
		</c:forEach>
	</body>
</html>