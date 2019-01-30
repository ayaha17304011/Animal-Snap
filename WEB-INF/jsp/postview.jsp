<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<body>
	<div class="popup_sub">
		<div><a class="close">close</a></div>
		<div class="post">
			<div class="icon">
				<img src="<c:url value='/WebContent/${data.iconPath}'/>"><a href=""></a>
			</div>
			
			<div class="username">
					<a href="">${data.userName}</a>
			</div>						
			${data.postId}
			<div class="image">
			<a href="getpostview?postId=${data.postId}" class="popup">
				<c:set var="url" value="${data.imageURL}"/>
				<c:if test="${fn:endsWith(url, '.jpg')}">
					<img src="<c:url value='/WebContent/${data.imageURL}'/>" alt="Post Image">
				</c:if>
				<c:if test="${fn:endsWith(url,'.mp4')}">
					<video width="100%" height="100%" controls>
						<source src="<c:url value='/WebContent/${data.imageURL}'/>" type="video/mp4">
				</c:if>
			</a>
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
					<textarea placeholder="ƒRƒƒ“ƒg‚ð’Ç‰Á" name="caption" class="replytext" spellcheck="false"></textarea>
					<input type="submit" name="submit" value="‘—M" class="replybuttom">
					<input type="hidden" value="${sessionScope.loginUser.loginId}">
				</form>
			</div>
			
		</div>
	</div>
</body>