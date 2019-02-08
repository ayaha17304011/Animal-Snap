<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/style/postview.css"/>
</head>
<body>
	<div class="popup_sub">

		<div class="post2">
			
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
		</div>
		<div class="post3">
			<div class="box1">
				<div class="icon">
					<img src="<c:url value='/WebContent/${data.iconPath}'/>"><a href=""></a>
				</div>
			</div>
			<div class="box2">	
				<div class="username">
						<a href="">${data.userName}</a>
				</div>			
			</div>			

			

			<div class="box3">
				<!-- iine, comment(reply) -->
										<div class="command">
							<div class="lovelike">
								<span style="font-size: 2em;">
									<a href="like"><div class="heart"></div></a>
								</span>
							</div>	
								
							<div class="hukidashi reply"><span style="display:none;">${data.postId}</span></div>
							

							
						</div>
			</div>
		
			<div class="box4">
				<div class="content">
					<div class="caption">
						<a href="">${data.userName}</a><span style="margin-right: 1em;"></span>${data.caption}
					</div>
					<div class="reply">
						<c:forEach var="replies" items="${post}">
							<a> replies.username</a> <span style="margin-right: 1em;"></span>  ${post.reply}
						</c:forEach>
					</div>

					<form  class="replybox">
						<textarea placeholder="ƒRƒƒ“ƒg‚ð’Ç‰Á" name="caption" class="replytext" spellcheck="false"></textarea>
						<input type="submit" name="submit" value="‘—M" class="replybuttom">
						<input type="hidden" value="${sessionScope.loginUser.loginId}">
					</form></div>
				</div>
			</div>
		</div>
	</div>
</body>