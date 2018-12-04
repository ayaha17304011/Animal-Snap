<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>Post</title>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
</head>
<body>
	<div class="post">
		<div class="header">
			<img src="<c:url value='/WebContent/images/${post.iconPath}'/>" alt="icon">
			<a href="">${user.userName}</a>

		</div>

		<div class="image">
			<img src="<c:url value='/WebContent/images/${post.imageURL}'/>" alt="post">
		</div>
		<div class="command">
			<span style="font-size: 2em;">
				<i class="far fa-heart"></i>
			</span>
			<span style="font-size: 2em;">
				<i class="far fa-comment"></i>
			</span>
		</div>
		<div class="content">
			<div class="caption">
				<a href="">${user.userName}</a>${post.caption}
			</div>
			<div class="reply">
				<c:forEach var="replies" items="${post}">
					<!-- reply.username --> ${post.reply}
				</c:forEach>
			</div>
			<form class="replybox">
				<input type="textarea" name="replybox">
				<input type="submit" name="submit" value="reply">
				<input type="hidden" value="${sessionScope.loginUser.loginId}"
			</form>
		</div>
	</div>
</body>
</html>