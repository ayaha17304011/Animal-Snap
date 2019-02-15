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
		
		
		<title>あにまる すなっぷ</title>
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
	</head>
    <body>
    <br><br><br><br>
        <div class="container mt-4 pre-upload">
            <div class="mb-4 mt-2">
            <input type="hidden" role="uploadcare-uploader" id="uploadedImage"
                data-preview-step="true"
                data-multiple="true"
                data-multiple-min="1"
                data-multiple-max="10"
                 />
            </div>

            <div id="postpreview" style="display: none; width: 600px;">
                <div class="image">
					<div class="single-item">
												
					</div>
			</div>
                
                <div class="foot">
                <%-- caption submit button --%>
                    <form method="post" action="post">
                        <input type="hidden" name="url" />
                        <textarea placeholder="コメントを追加(300字以内)"
                            name="caption"
                            class="captiontext"
                            maxlength="300"></textarea>
                            <button type="submit" class="btn btn-info">Submit</button>
                    </form>
                </div>
            </div>
        </div>


        <script src="${pageContext.request.contextPath}/WebContent/js/script.js"></script>	
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"/>
        <script src="https://ucarecdn.com/libs/widget/3.x/uploadcare.min.js"></script>
        <script src="https://ucarecdn.com/libs/widget-tab-effects/1.x/uploadcare.tab-effects.min.js"></script>
        <script src="${pageContext.request.contextPath}/WebContent/js/uploadwidget.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
    </body>
</html>