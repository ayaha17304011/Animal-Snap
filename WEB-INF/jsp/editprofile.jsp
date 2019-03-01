<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=UTF-8" %>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/style/profile.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/style/timeline.css"/>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/style/nav.css"/>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/WebContent/js/script.js"></script>
		<title>あにまる すなっぷ</title>
	</head>
<body>
	<div class="pro">
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
						class="form-control mr-2 w-50"
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
						<a class="nav-link" href="recommend">
							<img 
								src="WebContent/logo/recommend1.png"
								data-alt-src='WebContent/logo/recommend2.png'
								alt="レコメンド"
								height="50px"
							>
							<h3 class="d-inline d-md-none">おすすめ</h3>
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="mylike">
							<img 
								src="WebContent/logo/like.png"
								data-alt-src='WebContent/logo/like2.png'
								alt="コレクション"
								height="50px"
							>
							<h3 class="d-inline d-md-none">いいねした投稿</h3>
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
		<div class="profilesetting">
			<a>アイコン画像</a>
			<form action="editprofile" method="POST" enctype="multipart/form-data">

				<div class="container mt-4 pre-upload">
					<div class="mb-4 mt-2">
					<input type="hidden" name="uploadcare" role="uploadcare-uploader" id="uploadedImage"
							data-preview-step="false"
					/>
					</div>
					<div class="iconpreviwe">

					</div>
				</div>
				<input type="hidden" name="icon" id="icon">
				<p><input type="text" name="loginid" placeholder="ログインID" id="textbox"></p>
				<p><input type="text" name="username" placeholder="ユーザー名" id="textbox"></p>
				<p><input type="password" name="pass1" placeholder="新しいパスワード"id="textbox"><br>
					<input type="password" name="pass2" placeholder="確認のため新しいパスワードを入力してください" id="textbox"></p>
				<p><textarea placeholder="プロフィール文(300文字以内)" name="profile" class="profile" maxlength="300" spellcheck="false"  id="proftextbox"></textarea></p>
				<input type="submit" name="edit" value="変更" id="sbtn4">
			</form>
			<form action="mypage?userId=${sessionScope.userId}" method="POST">
				<input type="submit" name="edit" value="戻る" id="sbtn5">
			</form>
			<br><br>
			<form action="removeuser">
			<input type="submit" name="removeuser" value="アカウントを削除する" id="sbtn6">
			</form>

		<script src="${pageContext.request.contextPath}/WebContent/js/script.js"></script>	
		<script src="https://ucarecdn.com/libs/widget/3.x/uploadcare.min.js"></script>
		<script src="https://ucarecdn.com/libs/widget-tab-effects/1.x/uploadcare.tab-effects.min.js"></script>
		<script src="${pageContext.request.contextPath}/WebContent/js/editicon.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
	</div>
</body>
</html>