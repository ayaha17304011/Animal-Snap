<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
	<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">		
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/style/mylike.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/slick/slick.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/slick/slick-theme.css" media="screen" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/WebContent/js/script.js"></script>
	<script src="${pageContext.request.contextPath}/WebContent/slick/slick.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/style/timeline.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/style/nav.css"/>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
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
								margin: 1px;
								height="50px"
							>
							<h3 class="d-inline d-md-none">投稿画面</h3>
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="recommend">
							<img 
								src="WebContent/logo/recommend1.png"
								data-alt-src='WebContent/logo/recommend2.png'
								alt="レコメンド"
								height="50px"
							>
							<h3 class="d-inline d-md-none"></h3>
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active">
							<img 
								src="WebContent/logo/like2.png"
								alt="コレクション"
								height="50px"
							>
							<h3 class="d-inline d-md-none">コレクション</h3>
						</a>
					</li>
					<li class="nav-item">
						<form name="mypage" action="mypage" method="post">
							<a class="nav-link" href="javascript:mypage.submit()">
								<img 
									src="WebContent/logo/mypage.png" 
									data-alt-src='WebContent/logo/mypage2.png'
									alt="マイページ"
									height="50px"
								>
								<h3 class="d-inline d-md-none">マイページ</h3>
								<input type="hidden" value="${sessionScope.userId}" name="userId">
							</a>
						</form>
					</li>
				</ul>
			</div>
		</nav>
		<div id="popup_window">
			<div class="popup_box"></div>
		</div>
		<div class="mylike">
			<c:forEach var="data" items="${data}">
				<div class="smallpost">
					<span href="getpostview?postId=${data.postId}" class="popup">
						<c:set var="url" value="${data.imageURL}"/>
						<c:set var="file" value="${fn:split(url, '|')}"/>
						<c:choose>
							<c:when test="${fn:length(file) > 1}">
								<div class="mini-icon far fa-images"></div>
								<c:if test="${fn:endsWith(file[0], 'image')}">
									<img src="${file[0]}" class="image">
								</c:if>
								<c:if test="${fn:endsWith(file[0],'video')}">
									<video muted>
										<source src="${file[0]}" type="video/mp4" class="image">
									</video>								
								</c:if>
							</c:when>
							<c:otherwise>
								<c:if test="${fn:endsWith(file[0], 'image')}">
									<img src="${data.imageURL}" class="image">
								</c:if>
								<c:if test="${fn:endsWith(file[0],'video')}">
									<div class="mini-icon fas fa-video"></div>
									<video muted>
										<source src="${data.imageURL}" type="video/mp4" class="image">
									</video>								
								</c:if>
							</c:otherwise>
						</c:choose>
					</span>
				</div>
			</c:forEach>
		</div>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
	</body>
</html>