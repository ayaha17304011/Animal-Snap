<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<head>
		<meta charset="Windows-31J">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/slick/slick.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/slick/slick-theme.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/style/timeline.css"/>	
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/style/nav.css"/>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/WebContent/slick/slick.min.js"></script>
		<script src="${pageContext.request.contextPath}/WebContent/js/script.js" charset="Windows-31J"></script>
		<title>あにまる すなっぷ</title>
	</head>
	<body>
		<!-- navbar -->
		<nav class="navbar navbar-expand-md navbar-light bg-animal sticky-top p-0 mt-0 mx-0 mb-5">
				<a class="navbar-brand" href="getpostlist">
					<img src="WebContent/logo/animal-log.png" alt="logo" height="75px">
				</a>
				<button class="navbar-toggler bg-info"
					type="button"
					data-toggle="collapse"
					data-target="#CollapseContent"
					aria-controls="CollapseContent"
					aria-expanded="false"
					aria-label="Toggle navigation"
				>
					<span class="navbar-toggler-icon"></span>
					Menu
				</button>
				<div class="collapse navbar-collapse" id="CollapseContent">
					<form class="form-inline m-md-auto" action="search" method="get">
						<input
							class="form-control mr-2"
							name="query"
							type="search"
							placeholder="検索"
							aria-label="Search"
						>
						<button class="btn btn-outline-primary px-4 my-2 mx-sm-0" type="submit">検索</button>
					</form>
					<ul class="navbar-nav">
						<li class="nav-item">
							<a class="nav-link" href="upload">
								<img
									src="WebContent/logo/post.png"
									data-alt-src='WebContent/logo/post2.png'
									alt="投稿画面"
									height="50px"
								>
								<h3 class="d-inline d-md-none">投稿画面</h3>
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="mylike">
								<img 
									src="WebContent/logo/like.png"
									data-alt-src='WebContent/logo/like2.png'
									alt="いいね早見表"
									height="50px"
								>
								<h3 class="d-inline d-md-none">いいね早見表</h3>
							</a>
						</li>
						<li class="nav-item">
								<a class="nav-link" href="mypage?userId=${sessionScope.userId}">
									<img 
										src="WebContent/logo/mypage.png" 
										data-alt-src='WebContent/logo/mypage2.png'
										alt="マイページ"
										height="50px"
									>
									<h3 class="d-inline d-md-none">マイページ</h3>
								</a>
							</form>
						</li>
					</ul>
				</div>
			</nav>
		<div id="popup_window">
			<div class="popup_box"></div>
		</div>

		<div class="icon">
			<img src="${data.iconImage}" class="iconimage">
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
					<form id="logout" action="logout" method="POST">
						<input id="sbtn3" type="submit" value="ログアウト" />
					</form>
				</c:when>
				<c:otherwise>
					<div id="follow">
						<button id="sbtn3" type="button"></button>
						<input type="hidden" value="${data.userId}" name="userId">
					</div>
					<script>
						followcheck("${data.userId}");
					</script>
				</c:otherwise>
			</c:choose>

			<div class="userid">
				<p1>${data.loginId}</p1>
			</div>	

			<div class="follower">
				<a href="#">フォロワー <span class="followercount">${data.observer}</span>人</a>
			</div>	

			<div class="following">
				<a href="#">${data.following}人をフォロー中</a>
			</div>

			<div class="profile">
				<p1>${data.profile}</p1>
			</div>
		</div> <!-- end of prof -->

		<div class="mypost">
			<div class="postlist"></div>
			<h1 class="load">Loading</h1>
		</div>

		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
	</body>
</html> 