<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<html>
	<head>
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
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/style/profile.css"/>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/WebContent/js/script.js"></script>

		<title>あにまる すなっぷ</title>
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">

	</head>
<body>
<div class="pro">
<br><br><br><br>
	<div class="profilesetting">
	<form action="editprofile" method="POST" enctype="multipart/form-data">

	    <p><input type="file" name="icon" accept="image/*" id="file_icon" ><label for="file_icon" ><img src="WebContent/logo/fileselect.png" alt="�t�@�C����I��" onmouseover="this.src='WebContent/logo/fileselect_on.png'" onmouseout=" this.src='WebContent/logo/fileselect.png'" style="display:none;" /></label></p>
        <p><input type="text" name="loginid" placeholder="���O�C��ID" id="textbox"></p>
        <p><input type="text" name="username" placeholder="���[�U�[��" id="textbox"></p>
        <p><input type="password" name="pass1" placeholder="�V�����p�X���[�h" id="textbox"><br>
            <input type="password" name="pass2" placeholder="�m�F�̂��ߐV�����p�X���[�h����͂��Ă�������" id="textbox"></p>

		<p><textarea placeholder="プロフィール文(300字以内)" name="profile" class="profile" maxlength="300" spellcheck="false"  id="proftextbox"></textarea></p>
		<input type="submit" name="edit" value="変更" id="sbtn2">
    </form>
    <br>
    <form action="removeuser">
		<input type="submit" name="removeuser" value="アカウントを削除する" id="sbtn2">
    </form>
    
    </div>
    </div>
</body>