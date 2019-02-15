<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<html>
	<head>
		<link rel="stylesheet" type="text/css" href=" https://use.fontawesome.com/releases/v5.0.13/css/all.css"/>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/slick/slick.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/slick/slick-theme.css" media="screen" />
		<script src="${pageContext.request.contextPath}/WebContent/slick/slick.min.js"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/style/timeline.css"/>
		<script src="${pageContext.request.contextPath}/WebContent/js/script.js"></script>
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
		
	<script>
		$(function(){
			$(".single-item").slick();
		})
	</script>
		
		<title>あにまる すなっぷ</title>
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
	</head>
	<body>
	<br/><br/><br/><br/>
		<% if(session.getAttribute("userId") == null){ 
			response.sendRedirect("log");
		} else { %>

			<a href="logout">ログアウト</a>
			<a href="upload">upload</a><br>

		<% } %>
		<%
			if(request.getAttribute("data") == null){
				response.sendRedirect("getpostlist");
			}
		%>
		<div id="popup_window">
			<div class="popup_box">
			</div>
		</div>
		<c:forEach var="data" items="${data}">
				<div class="post">

					<div class="icon">
						<img src="<c:url value='/WebContent/${data.iconPath}'/>"><a href=""></a>
					</div>

					<div class="username">
						<form name="userpage" action="mypage" method="post">
							<a href="javascript:mypage.submit()">${data.userName}</a>
							<input type="hidden" value="${data.userId}" name="userId"/>
						</form>
					</div>				
					<div class="image">
							<span href="getpostview?postId=${data.postId}" class="popup">
						<div class="single-item">
						<c:set var="url" value="${data.imageURL}"/>
						<c:set var="file" value="${fn:split(url, ',')}"/>
						<c:choose>
							<c:when test="${fn:length(file) > 1}">
								<c:forEach var="i" items="${file}">
									<c:if test="${fn:endsWith(i, 'image')}">
										<img src="${i}">
									</c:if>
									<c:if test="${fn:endsWith(i,'video')}">
										<video width="100%" height="100%" autoplay loop>
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
									<video width="100%" height="100%" autoplay loop>
										<source src="${data.imageURL}" type="video/mp4">
									</video>								
								</c:if>
							</c:otherwise>
						</c:choose>
						</div>
						</span>
					</div>

					<!-- like, reply -->
					<div class="command">
						<div class="lovelike">
							<span style="font-size: 2em;">
								<a href="like?postId=${data.postId}"><div class="heart"></div></a>
							</span>
						</div>	
								
						<div class="hukidashi reply"><span style="display:none;">${data.postId}</span></div>
					</div>

					<div class="content">
						<div class="caption">
							<a href="">${data.userName}</a><span style="margin-right: 1em;"></span>${data.caption}
						</div>
						<div class="reply">
							<c:forEach var="replies" items="${post}">
								<a> reply.username</a> <span style="margin-right: 1em;"></span>  ${post.reply}
							</c:forEach>
						</div>
							
						<form class="replybox">
							<textarea placeholder="コメントを追加" name="replytext" class="replytext" spellcheck="false"></textarea>
							<input type="submit" name="submit" value="送信" class="replybuttom">
							<input type="hidden" value="${data.postId}" name="postId">
						</form>
					</div>
				</div>
			<br><br><br>
		</c:forEach>
	</body>
</html>