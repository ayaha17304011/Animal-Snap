<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<title>Show Test</title>
	</head>
	<body>
		<%
			if(request.getAttribute("data") == null){
				response.sendRedirect("postlist");
			}
		%>
		<a href="upload">upload</a><br>
		<c:forEach var="data" items="${data}">
			<img src="${data.imageURL}">
			<br>
			${data.caption}
			<br>
			<span>show reply...<span>
			<form action="addReply" method="post">
				<input type="hidden" name="postId" value="${data.postId}">
				<input type="textarea" name="reply" required>
				<input type="submit" value="reply">
			</form>
			<hr>
		</c:forEach>
	</body>
</html>