<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>


<!DOCTYPE html>
<html>
	<head>
		<header class="site-header">
			<h1 class="site-logo"><a href="timeline"><img src="WebContent/logo/animal-log.png" alt="���S" class="logo"></a></h1>
			<form id="form1" action="" method="get">
			<input id="sbox" id="s" name="s" type="search" placeholder="����" />
			<input id="sbtn" type="submit" value="����" /></form>
			<nav class="gnav">
				<ul class="gnav__menu">
						<li class="gnav__menu__item"><a href=""><img src="WebContent/profileIcon/default_icon.png" alt="�ʒm" class="navicon"></a></li>
						<li class="gnav__menu__item"><a href=""><img src="WebContent/profileIcon/default_icon.png" alt="�����ˑ����\" class="navicon"></a></li>
						<li class="gnav__menu__item"><a href="mypage"><img src="WebContent/profileIcon/default_icon.png" alt="�}�C�y�[�W" class="navicon"></a></li>
						<li class="gnav__menu__item"><a href="upload"><img src="WebContent/profileIcon/default_icon.png" alt="���e���" class="navicon"></a></li>
					
					</ul>
			</nav>
		</header>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/style/mypage.css"/>
		<!-- <link rel="stylesheet" type="text/css" href="C:/Animal-Snap-master/WebContent/style/mypage.css"/> -->
		<title>���ɂ܂� ���Ȃ���</title>
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
	</head>



<body>
		<br><br><br><br>
		<c:forEach var="data" items="${data}">
						<div class="icon">
							<img src="WebContent/profileIcon/default_icon.png" class="iconimage">
							<!--<img src="<c:url value='/WebContent/${data.iconPath}'/>">-->
						</div>
						
						<div class="username">
								<h1>���[�U�[���������</h1>
								<!--${data.userName}-->
						</div>
						<img src="WebContent/sample_image/default_icon.png"  class="profile">
						<br>
										
						<div class="userid">
							<p1>���[�U�[ID����</p1>
							<!--${data.userId}-->
					</div>	
					<div class="follower">
						<p2>�t�H�����[</p2>0<p2>�l</p2>
						<!--${data.follower}-->
				</div>	

				<div class="follower">
						0<p2>�l���t�H���[��</p2>
						<!--${data.following}<p2>�l���t�H���[��<p2>-->
				</div>
					<div class="post">
						<!-- <div class="image"> -->
							<ul class="photo_ul">
								<li class="photo"><img src="WebContent/sample_image/dogcat.jpg"><a href=""></a></li>
								<li class="photo"><img src="WebContent/sample_image/dogcat2.jpg"><a href=""></a></li>
								<li class="photo"><img src="WebContent/sample_image/fefe.jpg"><a href=""></a></li>
								<li class="photo"><img src="WebContent/sample_image/dogcat.jpg"><a href=""></a></li>
								<li class="photo"><img src="WebContent/sample_image/dogcat2.jpg"><a href=""></a></li>
								<li class="photo"><img src="WebContent/sample_image/fefe.jpg"><a href=""></a></li>
							</ul>
							
							<!--<img src="<c:url value='/WebContent/${data.imageURL}'/>" alt="Post Image">-->
						<!-- </div> -->
					</div>


						

					<br><br><br>
		</c:forEach>
		


	
	<br><br><br><br>
	</body>
</html>