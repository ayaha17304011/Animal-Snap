<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
		
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
	<div class="box1">
	<img src="<c:url value='WebContent/sample_image/dogcat2.jpg'/>" alt="�Ȃ񂩂������L���[�g�ȓ����̉摜" width="80%" height="auto">
	</div>
	
	<div class="box2">
		<h1>���O�C��</h1>
		<form action="login" method="post">
			<input type="text" name="loginid" placeholder="���[�U�[ID" class="nyuuryoku"><br>
			<input type="password" name="pass" placeholder="�p�X���[�h" class="nyuuryoku"><br>
			<input type="submit" value="���O�C��" class="submitbutton">
		</form>
		<p><a href="signup">�V�K�o�^</p>
	</div>
	
	<br><br><br><br>
</body>
</html>