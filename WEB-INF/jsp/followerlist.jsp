<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body>
	<c:forEach var="data" items="${data}">
		<div class="user">
			<a href="mypage?userId=${data.userId}">
				<img src="${data.iconImage}" class="icon rounded-circle mx-2 my-2">
				<p>${data.userName}</p>
			</a>
		</div>
	</c:forEach>
</body>