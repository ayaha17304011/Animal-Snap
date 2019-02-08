<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
	<head>
		<title>あにまる すなっぷ</title>

		<header class="site-header">
			<h1 class="site-logo"><a href="getpostlist"><img src="WebContent/logo/animal-log.png" alt="ロゴ" class="logo"></a></h1>
			<form id="form1" action="" method="get">
			<input id="sbox" id="s" name="s" type="search" placeholder="検索" />
			<input id="sbtn" type="submit" value="検索" /></form>
			<nav class="gnav">
				<ul class="gnav__menu">
					<li class="gnav__menu__item"><a href="mylike"><img src="WebContent/logo/like.png" onmouseover="this.src='WebContent/logo/like2.png'" onmouseout=" this.src='WebContent/logo/like.png'" alt="いいね早見表" class="navicon"></a></li>
					<li class="gnav__menu__item"><form name="mypage" action="mypage" method="post"><a href="javascript:mypage.submit()"><img src="WebContent/logo/mypage.png" onmouseover="this.src='WebContent/logo/mypage2.png'" onmouseout=" this.src='WebContent/logo/mypage.png'" alt="マイページ" class="navicon"></a><input type="hidden" value="${sessionScope.userId}" name="userId"></form></li>
					<li class="gnav__menu__item"><a href="upload"><img src="WebContent/logo/post.png" onmouseover="this.src='WebContent/logo/post2.png'" onmouseout=" this.src='WebContent/logo/post.png'" alt="投稿画面" class="navicon"></a></li>
				</ul>
			</nav>
		</header>

		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/style/upload.css"/>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
		<script>
			$('#file_photo').change(
			    function () {
			        if (!this.files.length) {
			            return;
			        }
				
			        var file = $(this).prop('files')[0];
			        var fr = new FileReader();
			        $('.preview').css('background-image', 'none');
			        fr.onload = function() {
			            $('.preview').css({'background-image': 'url(' + fr.result + ')','background': 'no-repeat'});
			        }
			        fr.readAsDataURL(file);
			        $(".preview img").css('opacity', 0);
			    }
			);
		</script>
	</head>

	<body>
		<br><br><Br><br>
		<form method="post" action="post" enctype="multipart/form-data" class="file_post">
			<div class="input_file">
				<div class="preview">
					<input type="file" name="post" accept="video/*,image/*" required id="file_photo">
					<br>
				</div>
				<label for="file_photo" ><img src="WebContent/logo/fileselect.png" alt="ファイルを選択" onmouseover="this.src='WebContent/logo/fileselect_on.png'" onmouseout=" this.src='WebContent/logo/fileselect.png'" /></label><br>
			</div>
	
			<textarea placeholder="コメントを追加(300字以内)" name="caption" class="captiontext" spellcheck="false" maxlength="300"></textarea>

			<br/>

			<input type="hidden" name="userId" value="${sessionScope.userId}"><br>			
			<input type="submit" name="Upload" id="sbtn2">
		</form>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script> --><script src="${pageContext.request.contextPath}/WebContent/js/upload.js"></script>
	</body>
</html>