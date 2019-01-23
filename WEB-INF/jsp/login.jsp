<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
		
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/style/log.css"/>
	<title>あにまる すなっぷ</title>
</head>
<body>
		<header class="site-header">
				<h1 class="site-logo"><a href=""><img src="<c:url value='WebContent/logo/animal-log.png'/>" alt="ロゴ"></h1>
				<nav class="gnav">
					<ul class="gnav__menu">
						<li class="gnav__menu__item"><a href=""> alt="通知"></a></li>
	
					</ul>
				</nav>
			</header>
<br><br><br><br>
	<div class="box1">
	<img src="<c:url value='WebContent/sample_image/dogcat2.jpg'/>" alt="なんかすごくキュートな動物の画像" width="80%" height="auto">
	</div>
	
	<div class="box2">
		<h1>ログイン</h1>
		<form action="login" method="post">
			<input type="text" name="loginid" placeholder="ユーザーID" class="nyuuryoku"><br>
			<input type="password" name="pass" placeholder="パスワード" class="nyuuryoku"><br>
			<input type="submit" value="ログイン" class="submitbutton">
		</form>
		<p><a href="signup">新規登録</p>
	</div>
	
	<br><br><br><br>
</body>
</html>