<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
	<head>
		<header class="site-header">
			<h1 class="site-logo"><a href=""><img src="WebContent/logo/animal-log.png" alt="ロゴ"></h1>
			<nav class="gnav">
				<ul class="gnav__menu">
					<li class="gnav__menu__item"><a href=""><img src="WebContent/profileIcon/default_icon.png" alt="通知"></a></li>
					<li class="gnav__menu__item"><a href=""><img src="WebContent/profileIcon/default_icon.png" alt="いいね早見表"></a></li>
					<li class="gnav__menu__item"><a href="upload"><img src="WebContent/profileIcon/default_icon.png" alt="アイコン"></a></li>
	
				</ul>
			</nav>
		</header>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/style/timeline.css"/>
		<title>タイムライン</title>
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
	</head>
	<body>
	<br/><br/><br/><br/>
		<% if(session.getAttribute("loginUser") == null){ %>

			<a href="log">ログイン</a>
			<a href="signup">新規登録</a>

		<% } else { %>

			${sessionScope.loginUser.loginId}
			<a href="logout">ログアウト</a>

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
							<img src="<c:url value='/WebContent/${data.iconPath}'/>"><a href="">${data.userName}</a>
						</div>
				
						<div class="image">
							<img src="<c:url value='/WebContent/${data.imageURL}'/>" alt="Post Image">
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
									 reply.username ${post.reply}
								</c:forEach>
							</div>
							
							<form class="replybox">
								<input type="textarea" name="replybox">
								<input type="submit" name="submit" value="reply">
								<input type="hidden" value="${sessionScope.loginUser.loginId}">
							</form>
						</div>
					</div>
					<hr>
		</c:forEach>
	</body>
</html>