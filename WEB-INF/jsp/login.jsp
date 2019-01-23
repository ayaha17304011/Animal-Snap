<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
	<div class="box">
		<div class="box1">
		<img src="<c:url value='WebContent/sample_image/dogcat2.jpg'/>" alt="なんかすごくキュートな動物の画像" width="80%" height="auto">
		</div>
		
		<div class="box2">
			<h1>あにまる すなっぷ</h1>
			<button class="btn1 submitbutton" type="button">ログイン</button>
			<br>
			<button class="btn2 submitbutton" type="button">新規登録</button>
		</div>
	</div>
	
	<script>
		$(function() {
			$(".btn1").on("click",function(){
				$(".box2").empty();
				$(".box2").append(
					$("<h1/>").text("ログイン"),
					$("<form/>",{
						action: 'login',
						method: 'post'
					}).append(
						$("<input/>",{
							type: 'text',
							name: 'loginid',
							placeholder: 'ユーザーID',
							class: 'nyuuryoku'
						}),
						$("<input/>",{
							type: 'password',
							name: 'pass',
							placeholder: 'パスワード',
							class: 'nyuuryoku'
						}),
						$("<input/>",{
							type: 'submit',
							value: 'ログイン',
							class: 'submitbutton'
						})
					),
				)
			});
			$(".btn2").on("click",function(){
				$(".box2").empty();
				$(".box2").append(
					$("<h1/>").text("新規登録"),
					$("<form/>",{
						action: 'login',
						method: 'post'
					}).append(
						$("<input/>",{
							type: 'text',
							name: 'loginid',
							placeholder: 'ユーザーID',
							class: 'nyuuryoku'
						}),
						$("<input/>",{
							type: 'password',
							name: 'password',
							placeholder: 'パスワード',
							class: 'nyuuryoku'
						}),
						$("<input/>",{
							type: 'submit',
							value: '新規登録',
							class: 'submitbutton'
						})
					)
				)
			})
		})
	</script>
</body>
</html>