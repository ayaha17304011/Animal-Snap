<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>

		<meta name="viewport" content="width=device-width">
		<meta name="robots" content="noindex,nofollow">
		<link rel="canonical" href="https://lopan.jp/css-animation">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/style/login.css"/>

		<title>あにまる すなっぷ</title>

		<header class="site-header">
			<h1 class="site-logo"><a href=""><img src="WebContent/logo/animal-log.png" alt="ロゴ" class="logo"></a></h1>
			<form id="form1" action="search" method="get">
				<input id="sbox" id="s" name="query" type="search" placeholder="検索" />
				<input id="sbtn" type="submit" value="検索" />
			</form>
			<nav class="gnav">
				<ul class="gnav__menu">
					<li class="gnav__menu__item"></li>
					<li class="gnav__menu__item"></li>
					<li class="gnav__menu__item"></li>
				</ul>
			</nav>
		</header>
		
	</head>
	<body>
		<br><br><br><br>
		<h1>あにまる すなっぷ へようこそ</h1>
		<div class="box">
			<div class="box1">
				<div class="slider">
				     <img src="<c:url value='WebContent/sample_image/dogcat2.jpg'/>" alt="なんかすごくキュートな動物の画像" width="80%" height="auto">
				     <img src="<c:url value='WebContent/sample_image/bird8.jpg'/>" alt="なんかすごくキュートな動物の画像" width="80%" height="auto">
				</div>
			</div>	
			
			<div class="box2">
				
				<img src="WebContent/logo/animal-log.png"  / class="titlelogo">
				<button class="btn1 submitbutton" type="button">ログイン</button><br>
				<button class="btn2 submitbutton" type="button">新規登録</button>
			</div>
		</div>
		
		


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script> --><script src="${pageContext.request.contextPath}/WebContent/js/loginbox.js"></script>
	</body>
</html>