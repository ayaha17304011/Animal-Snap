<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="java.util.Date, java.util.ArrayList, java.util.Locale, java.text.DateFormat, java.text.SimpleDateFormat, beans.PostBean" %>

<html>
	<head>
		<meta charset="Windows-31J">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/style/nav.css"/>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/slick/slick.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/slick/slick-theme.css" media="screen" />
		<script src="${pageContext.request.contextPath}/WebContent/slick/slick.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/style/timeline.css"/>
		<script src="${pageContext.request.contextPath}/WebContent/js/script.js"></script>
		<script>
			$(function(){
				$(".single-item").slick({
					adaptiveHeight: true,
				});
			})
		</script>
		<title>あにまる すなっぷ</title>
	</head>
	<body>
		<div id="popup_window">
			<div class="popup_box"></div>
		</div>
		<!-- navbar -->
		<nav class="navbar navbar-expand-md navbar-light bg-animal sticky-top p-0 mt-0 mx-0 mb-5">
			<a class="navbar-brand" href="getpostlist">
				<img src="WebContent/logo/animal-log.png" alt="logo" height="75px" title="タイムライン">
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
				<form class="form-inline m-md-auto" action="search" method="post">
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
									title="投稿する"
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
									title="おすすめ"
									height="50px"
								>
								<h3 class="d-inline d-md-none"></h3>
							</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="mylike">
								<img 
									src="WebContent/logo/like.png"
									data-alt-src='WebContent/logo/like2.png'
									alt="コレクション"
									title="いいねした投稿"
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
										title="マイページ"
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
		<%
			if(request.getAttribute("data") == null){
				response.sendRedirect("getpostlist");
			}
		%>
		<% 
			Date date = new Date();
			String nowStr = DateFormat.getInstance().format(date);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
			Date now = sdf.parse(nowStr);
			request.setAttribute("now", now);
		%>
		<c:forEach var="data" items="${data}">
			<div class="post ${data.postId}" id="${data.postId}">
				<div class="top">
					<a href="mypage?userId=${data.userId}">
						<img class="icon rounded-circle mx-2 my-2" src="${data.iconPath}">
						${data.userName}
					</a>
					<a id="day">${data.timestamp}</a>
				</div>				
				<div class="body">
					<c:set var="url" value="${data.imageURL}"/>
					<c:set var="file" value="${fn:split(url, '|')}"/>
					<span href="getpostview?postId=${data.postId}" class="popup">
						<c:choose>
							<c:when test="${fn:length(file) > 1}">
								<div class="mini-icon far fa-images"></div>
								<figure class="single-item">
									<c:forEach var="i" items="${file}">
										<c:if test="${fn:endsWith(i, 'image')}">
											<img src="${i}">
										</c:if>
										<c:if test="${fn:endsWith(i,'video')}">
											<video muted>
												<source src="${i}" type="video/mp4">
											</video>
										</c:if>
									</c:forEach>
								</figure>
							</c:when>
								<c:otherwise>
									<c:if test="${fn:endsWith(file[0], 'image')}">
										<figure class="single-item">
											<img src="${data.imageURL}">
										</figure>
									</c:if>
									<c:if test="${fn:endsWith(file[0],'video')}">
										<div class="mini-icon fas fa-video"></div>
										<figure class="single-item">
											<video muted>
												<source src="${data.imageURL}" type="video/mp4">
											</video>
										</figure>
									</c:if>
								</c:otherwise>
							</c:choose>
						</figure>
					</span>
				</div>

				<!-- like, reply -->
				<div class="bottom">
					<div class="command">
						<span class="like" style="font-size: 2em;">
								<!-- href="like?postId=${data.postId}" -->
							<div class="heart"></div>
							<script>
								likecheck("${data.postId}");
							</script>
							<a id="count" class="likecount">${data.likeCount}</a>
						</span>
						<span style="font-size: 2em;">		
						<div class="hukidashi showreply"><span style="display:none;">${data.postId}</span></div>
						<a id="count">${data.replyCount}</a>
						</span>
					</div>

					<div class="replylist">
						<div class="caption">
							<strong><a href="mypage?userId=${data.userId}">${data.userName}</a></strong><span class="cm">${data.caption}</span>
						</div>
						<div class="replies" style="display:none;">
							<!--  -->
						</div>
					</div>	
					<form class="replybox">
						<textarea placeholder="コメントを追加" name="replytext" spellcheck="false"></textarea>
						<button type="submit" class="replybuttom">コメント</button>
						<input type="hidden" value="${data.postId}" name="postId">
					</form>
				</div>
			</div>
		</c:forEach>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>	
	</body>
</html>