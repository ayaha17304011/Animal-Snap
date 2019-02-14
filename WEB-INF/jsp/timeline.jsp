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
			$(window)
				.on('scroll resize', function () {
				// ウインドウのスクロール量取得
				var windowScrollTop = $(window).scrollTop();
				// ウインドウの高さ取得
				var windowInnerHeight = window.innerHeight;

				var $video = $('video');
				// videoがページの最上部からどの位置にあるか取得
				var videoTop = $('video').offset().top;
				// videoの高さ取得
				var videoHeight = $('video').innerHeight();

				// videoが停止している、かつvideoが画面内に入ってきた場合、再生処理
				if ($video[0].paused && (windowScrollTop + windowInnerHeight > videoTop)) {
					$video[0].play();
				}

				// videoが再生中、かつ画面外に出た場合、停止処理
				if (!$video[0].paused && ((windowScrollTop + windowInnerHeight < videoTop) || (windowScrollTop > videoTop + videoHeight))) {
					$video[0].pause();
				}
			})
			.trigger('scroll');
			$(".slider").slick();
		})
	</script>
		
		<title>あにまる すなっぷ</title>
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
	</head>
	<body>

	<div class="slider">
		<img src="<c:url value='WebContent/sample_image/dogcat2.jpg'/>" alt="なんかすごくキュートな動物の画像" width="80%" height="auto">
		<img src="<c:url value='WebContent/sample_image/bird8.jpg'/>" alt="なんかすごくキュートな動物の画像" width="80%" height="auto">
	</div>
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
		<div class="post">
			<div class="image">
				<span href="getpostview?postId=1" class="popup">
					<div class=slider>
						<img src="<c:url value='/WebContent/sample_image/鳥/bird.jpg'/>">
						<img src="<c:url value='/WebContent/sample_image/鳥/bird2.jpg'/>">
						<video width="100%" height="100%" controls>
							<source src="<c:url value='/WebContent/videos/user_2019_02_05_14_03_21.mp4'/>" type="video/mp4">
						</video>
						<video width="100%" height="100%" controls>
							<source src="<c:url value='/WebContent/videos/user_2019_02_05_14_03_21.mp4'/>" type="video/mp4">
						</video>
						<video width="100%" height="100%" controls>
							<source src="<c:url value='/WebContent/videos/user_2019_02_05_14_03_21.mp4'/>" type="video/mp4">
						</video>							
					</div>
				</span>
			</div>
			<!-- like, reply -->
			<div class="command">
				<div class="lovelike">
					<span style="font-size: 2em;">
						<a href="like"><div class="heart"></div></a>
					</span>
				</div>		
				<div class="hukidashi reply"><span style="display:none;">1</span></div>	
			</div>
		</div>
		<br><br><br>
		<script src="${pageContext.request.contextPath}/WebContent/js/script.js"></script>	
	</body>
</html>