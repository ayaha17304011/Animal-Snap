<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<head>
		<title>‚ ‚É‚Ü‚é ‚·‚È‚Á‚Õ</title>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/style/user.css"/>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">	
	</head>
	<body>
		<c:forEach var="data" items="${data}">
			<div class="user">
				<a href="mypage?userId=${data.userId}"></a>
				<p>${data.userName}</p>
				<img src="${data.iconImage}" class="icon rounded-circle mx-2 my-2">
			</div>
		</c:forEach>
	</body>
</html>