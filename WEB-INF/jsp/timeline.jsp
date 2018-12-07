<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<title>Show Test</title>
	</head>
	<body>
		<% if(session.getAttribute("loginUser") == null){ %>

			<a href="log">Login</a>
			<a href="signup">Signup</a>

		<% } else { %>

			${sessionScope.loginUser.loginId}
			<a href="logout">Logout</a>

		<% } %>
		<%
			if(request.getAttribute("data") == null){
				response.sendRedirect("getpostlist");
			}
		%>
		<a href="upload">upload</a><br>
		<c:forEach var="data" items="${data}">
				<div class="post">

						<div class="header">
							<a href="">${data.userName}</a>
						</div>
				
						<div class="image">
							<img src="<c:url value='/WebContent/images/${data.imageURL}'/>" alt="Post Image">
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
								<a href="">${data.userName}</a>${data.caption}
							</div>
							<div class="reply">
								<c:forEach var="replies" items="${post}">
									<!-- reply.username ${post.reply} -->
								</c:forEach>
							</div>
							
							<form class="replybox">
								<input type="textarea" name="replybox">
								<input type="submit" name="submit" value="reply">
								<!-- <input type="hidden" value="${sessionScope.loginUser.loginId}" -->
							</form>
						</div>
					</div>
					<hr>
		</c:forEach>
	</body>
</html>