<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<html>
	<head>
		<header class="site-header">
			<h1 class="site-logo"><a href="getpostlist"><img src="WebContent/logo/animal-log.png" alt="ロゴ"></a></h1>
			<form id="form1" action="search" method="get">
				<input id="sbox" id="s" name="query" type="search" placeholder="����" />
				<input id="sbtn" type="submit" value="����" />
			</form>
			<nav class="gnav">
				<ul class="gnav__menu">
					<li class="gnav__menu__item"><a href="mylike"><img src="WebContent/logo/like.png" onmouseover="this.src='WebContent/logo/like2.png'" onmouseout=" this.src='WebContent/logo/like.png'" alt="�?�?ね早見表" class="navicon"></a></li>
					<li class="gnav__menu__item"><form name="mypage" action="mypage" method="post"><a href="javascript:mypage.submit()"><img src="WebContent/logo/mypage.png" onmouseover="this.src='WebContent/logo/mypage2.png'" onmouseout=" this.src='WebContent/logo/mypage.png'" alt="マイペ�?�ジ" class="navicon"></a><input type="hidden" value="${sessionScope.userId}" name="userId"></form></li>
					<li class="gnav__menu__item"><a href="upload"><img src="WebContent/logo/post.png" onmouseover="this.src='WebContent/logo/post2.png'" onmouseout=" this.src='WebContent/logo/post.png'" alt="投稿画面" class="navicon"></a></li>
				</ul>
			</nav>
		</header>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/style/profile.css"/>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/WebContent/js/script.js"></script>

		<title>���ɂ܂� ���Ȃ���</title>
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">

	</head>
<body>
	<div class="pro">
		<br><br><br><br>
		<div class="profilesetting">
			<a>�A�C�R���摜</a>
			<form action="editprofile" method="POST" enctype="multipart/form-data">

				<div class="container mt-4 pre-upload">
					<div class="mb-4 mt-2">
					<input type="hidden" name="icon" role="uploadcare-uploader" id="uploadedImage"
							data-preview-step="true"
							data-multiple="false"
							data-multiple-min="1"
							data-multiple-max="1"
					/>
					</div>
				</div>
	
					<p><input type="text" name="loginid" placeholder="���O�C��ID" id="textbox"></p>
					<p><input type="text" name="username" placeholder="���[�U�[��" id="textbox"></p>
					<p><input type="password" name="pass1" placeholder="�V�����p�X���[�h" id="textbox"><br>
						<input type="password" name="pass2" placeholder="�m�F�̂��ߐV�����p�X���[�h����͂��Ă�������" id="textbox"></p>
					<p><textarea placeholder="�v���t�B�[����(300�����ȓ�)" name="profile" class="profile" maxlength="300" spellcheck="false"  id="proftextbox"></textarea></p>
				<input type="submit" name="edit" value="�ύX" id="sbtn2">
			</form>
			<br><br>
			<form action="removeuser">
			<input type="submit" name="removeuser" value="�A�J�E���g���폜����">
			</form>

		<script src="${pageContext.request.contextPath}/WebContent/js/script.js"></script>	
		<script src="https://ucarecdn.com/libs/widget/3.x/uploadcare.min.js"></script>
		<script src="https://ucarecdn.com/libs/widget-tab-effects/1.x/uploadcare.tab-effects.min.js"></script>
		<script src="${pageContext.request.contextPath}/WebContent/js/uploadwidget.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
	</div>
</body>