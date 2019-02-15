<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<head>
		<header class="site-header">
			<h1 class="site-logo"><a href="getpostlist"><img src="WebContent/logo/animal-log.png" alt="ロゴ"></a></h1>
			<form id="form1" action="search" method="get">
				<input id="sbox" id="s" name="query" type="search" placeholder="検索" />
				<input id="sbtn" type="submit" value="検索" />
			</form>
			<nav class="gnav">
				<ul class="gnav__menu">
					<li class="gnav__menu__item"><a href="mylike"><img src="WebContent/logo/like.png" onmouseover="this.src='WebContent/logo/like2.png'" onmouseout=" this.src='WebContent/logo/like.png'" alt="いいね早見表" class="navicon"></a></li>
					<li class="gnav__menu__item"><form name="mypage" action="mypage" method="post"><a href="javascript:mypage.submit()"><img src="WebContent/logo/mypage.png" onmouseover="this.src='WebContent/logo/mypage2.png'" onmouseout=" this.src='WebContent/logo/mypage.png'" alt="マイページ" class="navicon"></a><input type="hidden" value="${sessionScope.userId}" name="userId"></form></li>
					<li class="gnav__menu__item"><a href="upload"><img src="WebContent/logo/post.png" onmouseover="this.src='WebContent/logo/post2.png'" onmouseout=" this.src='WebContent/logo/post.png'" alt="投稿画面" class="navicon"></a></li>
				</ul>
			</nav>
		</header>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/style/mypage.css"/>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/WebContent/js/script.js"></script>

		<title>あにまる すなっぷ</title>
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">

	</head>

	<body>
		<br><br><br><br>
		<div id="popup_window">
			<div class="popup_box"></div>
		</div>

		<div class="icon">
			<img src="<c:url value='/WebContent/${data.iconImage}'/>" class="iconimage">
		</div>

		<div class="prof">
	
			<div class="username">
				<span id="uid" style="display:none">${data.userId}</span>
				<h2>${data.userName}</h2>
			</div>
			<c:set var="s" value="${sessionScope.userId}" scope="page"/>
			<c:set var="r" value="${data.userId}" scope="page"/>
			<c:choose>
				<c:when test="${s.equals(r)}">
					<form id="editprofile" action="toeditprofile" method="POST">
						<input id="sbtn3" type="submit" value="プロフィールの編集" />
					</form>
				</c:when>
				<c:otherwise>
					<form id="follow" action="follow" method="POST">
						<input id="sbtn3" type="submit" value="フォローする" />
						<input type="hidden" value="${data.userId}" name="userId">
					</form>
				</c:otherwise>
		</c:choose>

			<div class="userid">
				<p1>${data.loginId}</p1>
			</div>	

			<div class="follower">
				<form name="follower" action="followerlist" method="post">
					<a href="javascript:follower.submit()">フォロワー ${data.observer}人</a>
					<input type="hidden" value="${data.userId}" name="userId">
				</form>
			</div>	

			<div class="following">
				<form name="following" action="followinglist" method="post">
					<a href="javascript:following.submit()">${data.following}人をフォロー中</a>
					<input type="hidden" value="${data.userId}" name="userId">
				</form>
			</div>

			<div class="profile">
				<p1>${data.profile}</p1>
			</div>
		</div> <!-- end of prof -->

		<div class="mypost">
			<div class="postlist"></div>
			<h1 class="load">Loading</h1>
		</div>

		<br><br><br>
		<br><br><br><br>
	</body>
</html> 