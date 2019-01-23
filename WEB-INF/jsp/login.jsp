<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/style/log.css"/>
	<title>���ɂ܂� ���Ȃ���</title>
</head>
<body>
		<header class="site-header">
				<h1 class="site-logo"><a href=""><img src="<c:url value='WebContent/logo/animal-log.png'/>" alt="���S"></h1>
				<nav class="gnav">
					<ul class="gnav__menu">
						<li class="gnav__menu__item"><a href=""> alt="�ʒm"></a></li>
	
					</ul>
				</nav>
			</header>
			<br><br><br><br>
	<div class="box">
		<div class="box1">
		<img src="<c:url value='WebContent/sample_image/dogcat2.jpg'/>" alt="�Ȃ񂩂������L���[�g�ȓ����̉摜" width="80%" height="auto">
		</div>
		
		<div class="box2">
			<h1>���ɂ܂� ���Ȃ���</h1>
			<button class="btn1 submitbutton" type="button">���O�C��</button>
			<br>
			<button class="btn2 submitbutton" type="button">�V�K�o�^</button>
		</div>
	</div>
	
	<script>
		$(function() {
			$(".btn1").on("click",function(){
				$(".box2").empty();
				$(".box2").append(
					$("<h1/>").text("���O�C��"),
					$("<form/>",{
						action: 'login',
						method: 'post'
					}).append(
						$("<input/>",{
							type: 'text',
							name: 'loginid',
							placeholder: '���[�U�[ID',
							class: 'nyuuryoku'
						}),
						$("<input/>",{
							type: 'password',
							name: 'pass',
							placeholder: '�p�X���[�h',
							class: 'nyuuryoku'
						}),
						$("<input/>",{
							type: 'submit',
							value: '���O�C��',
							class: 'submitbutton'
						})
					),
				)
			});
			$(".btn2").on("click",function(){
				$(".box2").empty();
				$(".box2").append(
					$("<h1/>").text("�V�K�o�^"),
					$("<form/>",{
						action: 'login',
						method: 'post'
					}).append(
						$("<input/>",{
							type: 'text',
							name: 'loginid',
							placeholder: '���[�U�[ID',
							class: 'nyuuryoku'
						}),
						$("<input/>",{
							type: 'password',
							name: 'password',
							placeholder: '�p�X���[�h',
							class: 'nyuuryoku'
						}),
						$("<input/>",{
							type: 'submit',
							value: '�V�K�o�^',
							class: 'submitbutton'
						})
					)
				)
			})
		})
	</script>
</body>
</html>