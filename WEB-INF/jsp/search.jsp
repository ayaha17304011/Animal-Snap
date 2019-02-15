<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
	<head>
		<header class="site-header">
			<h1 class="site-logo"><a href="getpostlist"><img src="WebContent/logo/animal-log.png" alt="ロゴ" class="logo"></a></h1>
			<form id="form1" action="search" method="get">
				<input id="sbox" id="s" name="query" type="search" placeholder="検索" />
				<input id="sbtn" type="submit" value="検索" />
			</form>
			<nav class="gnav">
				<ul class="gnav__menu">
					<li class="gnav__menu__item"><a href="mylike"><img src="WebContent/logo/like.png" onmouseover="this.src='WebContent/logo/like2.png'" onmouseout=" this.src='WebContent/logo/like.png'" alt="いいね早見表" class="navicon"></a></li>
					<li class="gnav__menu__item"><a href="mypage?userId=${sessionScope.userId}"><img src="WebContent/logo/mypage.png" onmouseover="this.src='WebContent/logo/mypage2.png'" onmouseout=" this.src='WebContent/logo/mypage.png'" alt="マイページ" class="navicon"></a></li>
					<li class="gnav__menu__item"><a href="upload"><img src="WebContent/logo/post.png" onmouseover="this.src='WebContent/logo/post2.png'" onmouseout=" this.src='WebContent/logo/post.png'" alt="投稿画面" class="navicon"></a></li>
				</ul>
			</nav>
		</header>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/style/search.css"/>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/WebContent/js/script.js"></script>

		<title>あにまる すなっぷ</title>
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
	</head>
	
	<body>
		<br><br><br><br>
		<div id="popup_window">
				<div class="popup_box">
				</div>
			</div>
			<div class="userlist">
			<c:forEach var="user" items="${data[0]}">
				<div class="user1">
					<a href="mypage?userId=${user.userId}">
				<p>${user.loginId}</p>
				<img src="<c:url value='/WebContent/${user.iconImage}'/>" class="iconimage"/><br></a>
				</div>
			</c:forEach>
		</div>
			
		<div class="postlist">
			<c:forEach var="post" items="${data[1]}">
				<a href="getpostview?postId=${post.postId}" class="popup">
					<c:set var="url" value="${post.imageURL}"/>
					<c:if test="${fn:endsWith(url, '.jpg')}">
						<img src="<c:url value='/WebContent/${post.imageURL}'/>" alt="Post Image">
					</c:if>
					<c:if test="${fn:endsWith(url,'.mp4')}">
						<video width="100%" height="100%" controls>
							<source src="<c:url value='/WebContent/${post.imageURL}'/>" type="video/mp4">
					</c:if>
				</a>
			</c:forEach>
		</div>
	</body>
</html>