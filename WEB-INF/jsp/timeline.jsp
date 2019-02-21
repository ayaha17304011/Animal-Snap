<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
	<head>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/style/timeline.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/style/nav.css"/>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/slick/slick.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/slick/slick-theme.css" media="screen" />
		<script src="${pageContext.request.contextPath}/WebContent/slick/slick.min.js"></script>

		<script src="${pageContext.request.contextPath}/WebContent/js/script.js"></script>
		<script>
			$(function(){
				$(".single-item").slick({
					adaptiveHeight: true
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
			<a class="navbar-brand text-white" href="getpostlist">
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
		<%
			if(request.getAttribute("data") == null){
				response.sendRedirect("getpostlist");
			}
		%>
		<c:forEach var="data" items="${data}">
			<div class="post">
				<div class="top">
					<form  class="userplace" name="userpage" action="mypage" method="post">
						<a href="javascript:mypage.submit()">
							<img class="icon rounded-circle mx-2 my-2" src="${data.iconPath}">
							${data.userName}
						</a>
						<input type="hidden" value="${data.userId}" name="userId"/>
					</form>
				<a id="day">${data.timestamp}</a>
			</div>				 
				<div class="body">
					<span href="getpostview?postId=${data.postId}" class="popup">
						<figure class="single-item">
							<c:set var="url" value="${data.imageURL}"/>
							<c:set var="file" value="${fn:split(url, ',')}"/>
							<c:choose>
								<c:when test="${fn:length(file) > 1}">
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
								</c:when>
								<c:otherwise>
									<c:if test="${fn:endsWith(file[0], 'image')}">
										<img src="${data.imageURL}">
									</c:if>
									<c:if test="${fn:endsWith(file[0],'video')}">
										<video muted>
											<source src="${data.imageURL}" type="video/mp4">
										</video>								
									</c:if>
								</c:otherwise>
							</c:choose>
						</figure>
					</span>
				</div>

				<!-- like, reply -->
				<div class="bottom">
					<div class="command">
						<span style="font-size: 2em;">
							<a href="like?postId=${data.postId}"><div class="heart"></div></a>
							<a id="count">${data.likeCount}</a>
						</span>
						<span style="font-size: 2em;">		
						<div class="hukidashi reply"><span style="display:none;">${data.postId}</span></div>
						<a id="count">${data.replyCount}</a>
						</span>
					</div>

					<div class="replylist">
						<div class="caption">
							<strong><a href="mypage?userId=${data.userId}">${data.userName}</a></strong><span class="cm">${data.caption}</span>
						</div>
						<c:forEach var="replies" items="${post}">
							<div class="reply">
								<strong><a>${replies.username}</a></strong><span class="cm">${replies.reply}</span>
							</div>
						</c:forEach>
					</div>	
					<form class="replybox">
						<textarea placeholder="コメントを追加" name="caption" spellcheck="false"></textarea>
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