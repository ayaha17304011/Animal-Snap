<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/style/timeline.css"/>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
</head>
<body>
	<div class="post">

		<div class="icon">
			<img src="<c:url value='/WebContent/${data.iconPath}'/>"><a href=""></a>
		</div>
		
		<div class="username">
			<a href="">${data.userName}</a>
		</div>						

		<div class="image">
			<c:set var="url" value="${data.imageURL}"/>
			<c:if test="${fn:endsWith(url, '.jpg')}">
				<img src="<c:url value='/WebContent/${data.imageURL}'/>" alt="Post Image">
			</c:if>
			<c:if test="${fn:endsWith(url,'.mp4')}">
				<video width="100%" height="100%" controls>
					<source src="<c:url value='/WebContent/${data.imageURL}'/>" type="video/mp4">
			</c:if>
			
		</div>

		<!-- iine, comment(reply) -->
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
				<a href="">${data.userName}</a><span style="margin-right: 1em;"></span>${data.caption}
			</div>
			<div class="reply">
				<c:forEach var="replies" items="${post}">
					<a> reply.username</a> <span style="margin-right: 1em;"></span>  ${post.reply}
				</c:forEach>
			</div>
			
			<form class="replybox">
				<textarea aria-label="コメントを追加" placeholder="コメントを追加" name="replybox" class="replytext" spellcheck="false"></textarea>
				<input type="submit" name="submit" value="送信" class="replybuttom">
				<input type="hidden" value="${sessionScope.loginUser.loginId}">
			</form>
		</div>
			
	</div>
</body>
</html>