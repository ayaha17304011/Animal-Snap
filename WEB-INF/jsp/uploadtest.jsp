<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<html>
	<head>
		<title>あにまる すなっぷ</title>

		<header class="site-header">
			<h1 class="site-logo"><a href="timeline"><img src="WebContent/logo/animal-log.png" alt="ロゴ" class="logo"></a></h1>
			<form id="form1" action="" method="get">
			<input id="sbox" id="s" name="s" type="search" placeholder="検索" />
			<input id="sbtn" type="submit" value="検索" /></form>
			<nav class="gnav">
				<ul class="gnav__menu">
						<li class="gnav__menu__item"><a href=""><img src="WebContent/profileIcon/default_icon.png" alt="通知" class="navicon"></a></li>
						<li class="gnav__menu__item"><a href=""><img src="WebContent/profileIcon/default_icon.png" alt="いいね早見表" class="navicon"></a></li>
						<li class="gnav__menu__item"><a href="mypage"><img src="WebContent/profileIcon/default_icon.png" alt="マイページ" class="navicon"></a></li>
						<li class="gnav__menu__item"><a href="upload"><img src="WebContent/profileIcon/default_icon.png" alt="投稿画面" class="navicon"></a></li>
					
					</ul>
			</nav>
		</header>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/style/upload.css"/>

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
            $('.preview').css('background-image', 'url(' + fr.result + ')');
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

			<label for="file_photo" ><img src="WebContent/logo/fileselect.png" alt="ファイルを選択" onmouseover="this.src='WebContent/logo/fileselect_on.png'" onmouseout=" this.src='WebContent/logo/fileselect.png'" /></label><br>
		</div>
	</div>
			<textarea aria-label="コメントを追加" placeholder="コメントを追加(300字以内)" name="replybox" class="captiontext" spellcheck="false" maxlength="300"></textarea><br/>

			<input type="hidden" name="userId" value="${sessionScope.userId}"><br>			
			<input type="submit" name="Upload" id="sbtn">
			
		</form>
	</body>
</html>