<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
	<head>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/style/postview.css"/>
	</head>
	<body>
		<div class="popup_sub">
			<div class="post2">
				<div class="image2">
						<c:set var="url" value="${data[0].imageURL}"/>
						<c:if test="${fn:endsWith(url, '.jpg')}">
							<img src="<c:url value='/WebContent/${data[0].imageURL}'/>" alt="Post Image">
						</c:if>
						<c:if test="${fn:endsWith(url,'.mp4')}">
							<video width="100%" height="100%" controls>
								<source src="<c:url value='/WebContent/${data[0].imageURL}'/>" type="video/mp4">
						</c:if>
					</a>
				</div>
			</div>
			<div class="post3">
				<div class="box1">
					<div class="icon2">
						<img src="<c:url value='/WebContent/${data[0].iconPath}'/>"><a href=""></a>
					</div>
				</div>
				<div class="box2">	
					<div class="username2">
							<a href="mypage?userId=${data[0].userId}">${data[0].userName}</a>
					</div>			
				</div>
				<div class="box3">
					<!-- iine, comment(reply) -->
					<div class="command">
						<div class="lovelike">
							<span style="font-size: 2em;">
								<a href="like?postId=${data[0].postId}"><div class="heart"></div></a>
							</span>
							<a>${data[0].likeCount}</a>
						</div>
						<div class="hukidashi reply">
							<a>${data[0].replyCount}</a>
						</div>
					</div>
				</div>
				<div class="box4">
					<div class="content">
						<div class="caption">
							<a href="">${data[0].userName}</a><span style="margin-right: 1em;"></span> ${data[0].caption}
						</div>
						<div class="reply">
							<c:forEach var="replies" items="${data[1]}">
								<a> ${replies.userName}</a> <span style="margin-right: 1em;"></span> ${replies.reply}
							</c:forEach>
						</div>
						<form class="replybox">
							<textarea placeholder="ƒRƒƒ“ƒg‚ğ’Ç‰Á" name="caption" class="replytext" spellcheck="false"></textarea>
							<input type="submit" name="submit" value="‘—M" class="replybuttom">
							<input type="hidden" value="${data[0].postId}" name="postId">
						</form>
					</div> <!-- end of content -->
				</div> <!-- end of box4 -->
			</div> <!-- end of post3 -->
		</div> <!-- end of popup_sub -->
	</body>
</html>