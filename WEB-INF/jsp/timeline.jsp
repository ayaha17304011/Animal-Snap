<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/style/timeline.css"/>
		<header class="site-header">
			<h1 class="site-logo"><a href=""><img src="WebContent/logo/animal-log.png" alt="ロゴ"></a></h1>
			<form id="form1" action="search" method="get">
			<input id="sbox" id="s" name="query" type="search" placeholder="検索" />
			<input id="sbtn" type="submit" value="検索" /></form>
			<nav class="gnav">
				<ul class="gnav__menu">
					<li class="gnav__menu__item"><a href=""><a href=""><img src="WebContent/logo/like.png" alt="�?�?ね早見表" class="navicon"></a></li>
					<li class="gnav__menu__item"><a href="mypage?userId=${sessionScope.userId}"><img src="WebContent/logo/mypage.png" alt="マイペ�?�ジ" class="navicon"></a></li>
					<li class="gnav__menu__item"><a href="upload"><img src="WebContent/logo/post.png" alt="投稿画面" class="navicon"></a></li>
				</ul>
			</nav>
		</header>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/WebContent/js/script.js"></script>
		<link rel="stylesheet" type="text/css" href="slick.css" media="screen" />
		<link rel="stylesheet" type="text/css" href="slick-theme.css" media="screen" />
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<script src="http://code.jquery.com/jquery-1.12.3.min.js"></script>
		<script src="slick.min.js"></script>
		
	<script>
		$(window)
    	.on('scroll resize', function () {
        // ウインドウのスクロール量取�?
        var windowScrollTop = $(window).scrollTop();
        // ウインドウの高さ取�?
        var windowInnerHeight = window.innerHeight;

        var $video = $('video');
        // videoが�?��?�ジの最上部からどの位置にあるか取�?
        var videoTop = $('video').offset().top;
        // videoの高さ取�?
        var videoHeight = $('video').innerHeight();

        // videoが停止して�?る、かつvideoが画面�?に入ってきた場合、�?�生処�?
        if ($video[0].paused && (windowScrollTop + windowInnerHeight > videoTop)) {
            $video[0].play();
        }

        // videoが�?�生中、かつ画面外に出た�?�合、停止処�?
        if (!$video[0].paused && ((windowScrollTop + windowInnerHeight < videoTop) || (windowScrollTop > videoTop + videoHeight))) {
            $video[0].pause();
        }
    })
    .trigger('scroll');

	</script>
		
		<title>あにま�? すなっぷ</title>
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
	</head>
	<body>
	
	
	<br/><br/><br/><br/>
		<% if(session.getAttribute("userId") == null){ %>

			<a href="log">ログイン</a>
			<a href="log">新規登録</a>

		<% } else { %>

			<a href="logout">ログアウ�?</a>
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
							<a href="mypage?userId=${data.userId}">${data.userName}</a>
						</div>						
				
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

						<!-- like, reply -->
						<div class="command">
							<span style="font-size: 2em;">
								<i class="far fa-heart"></i>
							</span>
							<span style="font-size: 2em;">
								<i class="far fa-comment reply"><span style="display:none;">${data.postId}</span></i>
							</span>
							<form action="like" method="post" class="likebutton">
								<input type="hidden" value="${data.postId}" name="postId">
								<input type="submit" name="submit" value="like" class="likebutton">
							</form>
					</div>

						<div class="content">
							<c:if test = "${data.caption != null}">
								<div class="caption">
									<a href="">${data.userName}</a><span style="margin-right: 1em;"></span>${data.caption}
								</div>
							</c:if>
							<div class="reply">
								<c:forEach var="replies" items="${post}">
									<a> reply.username</a> <span style="margin-right: 1em;"></span>  ${post.reply}
								</c:forEach>
							</div>
							
							<form class="replybox">
								<textarea placeholder="�R�����g��ǉ�" name="replytext" class="replytext" spellcheck="false" maxlength="300"></textarea>
								<input type="submit" name="submit" value="���M" class="replybuttom">
								<input type="hidden" value="${data.postId}" name="postId">
							</form>
						</div>
						
					</div>
					<br><br><br>
		</c:forEach>
	</body>
</html>
