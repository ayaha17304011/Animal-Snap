<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<html>
	<head>
		<header class="site-header">
			<h1 class="site-logo"><a href="getpostlist"><img src="WebContent/logo/animal-log.png" alt="繝ｭ繧ｴ"></a></h1>
			<form id="form1" action="search" method="get">
				<input id="sbox" id="s" name="query" type="search" placeholder="讀懃ｴ｢" />
				<input id="sbtn" type="submit" value="讀懃ｴ｢" />
			</form>
			<nav class="gnav">
				<ul class="gnav__menu">
					<li class="gnav__menu__item"><a href="mylike"><img src="WebContent/logo/like.png" onmouseover="this.src='WebContent/logo/like2.png'" onmouseout=" this.src='WebContent/logo/like.png'" alt="縺?縺?縺ｭ譌ｩ隕玖｡ｨ" class="navicon"></a></li>
					<li class="gnav__menu__item"><form name="mypage" action="mypage" method="post"><a href="javascript:mypage.submit()"><img src="WebContent/logo/mypage.png" onmouseover="this.src='WebContent/logo/mypage2.png'" onmouseout=" this.src='WebContent/logo/mypage.png'" alt="繝槭う繝壹?ｼ繧ｸ" class="navicon"></a><input type="hidden" value="${sessionScope.userId}" name="userId"></form></li>
					<li class="gnav__menu__item"><a href="upload"><img src="WebContent/logo/post.png" onmouseover="this.src='WebContent/logo/post2.png'" onmouseout=" this.src='WebContent/logo/post.png'" alt="謚慕ｨｿ逕ｻ髱｢" class="navicon"></a></li>
				</ul>
			</nav>
		</header>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/style/profile.css"/>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/WebContent/js/script.js"></script>

		<title>縺ゅ↓縺ｾ繧? 縺吶↑縺｣縺ｷ</title>
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">

	</head>
<body>
	<form action="editprofile" method="POST" enctype="multipart/form-data" class="">
        <p><input type="text" name="loginid" placeholder="ログインID"></p>
        <p><input type="text" name="username" placeholder="表示名"></p>
        <p><input type="password" name="pass1" placeholder="新しいパスワード"><br>
            <input type="password" name="pass2" placeholder="パスワード確認"></p>
        <p><input type="file" name="icon" accept="image/*"></p>
		<p><textarea placeholder="プロフィール文" name="profile" class="profile" maxlength="300" spellcheck="false"></textarea></p>
		<input type="submit" name="edit" value="変更">
    </form>
    <br>
    <form action="removeuser">
		<input type="submit" name="removeuser" value="アカウントを削除する">
    </form>
    
    </div>
    </div>
</body>