<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html>
	<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">		
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/style/mylike.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/slick/slick.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/slick/slick-theme.css" media="screen" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/WebContent/js/script.js"></script>
	<script src="${pageContext.request.contextPath}/WebContent/slick/slick.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/style/timeline.css"/>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/style/nav.css"/>

	<title>���ɂ܂� ���Ȃ���</title>
	</head>
	<body>
		<!-- navbar -->
		<nav class="navbar navbar-expand-md navbar-light bg-animal sticky-top p-0 mt-0 mx-0 mb-5">
			<a class="navbar-brand" href="getpostlist">
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
						class="form-control mr-2"
						name="query"
						type="search"
						placeholder="����"
						aria-label="Search"
					>
					<button class="btn btn-outline-primary px-4 my-2 mx-sm-0" type="submit">����</button>
				</form>
				<ul class="navbar-nav">
					<li class="nav-item">
						<a class="nav-link" href="upload">
							<img
								src="WebContent/logo/post.png"
								data-alt-src='WebContent/logo/post2.png'
								alt="���e���"
								margin: 1px;
								height="50px"
							>
							<h3 class="d-inline d-md-none">���e���</h3>
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active">
							<img 
								src="WebContent/logo/like2.png"
								alt="�����ˑ����\"
								height="50px"
							>
							<h3 class="d-inline d-md-none">�����ˑ����\</h3>
						</a>
					</li>
					<li class="nav-item">
						<form name="mypage" action="mypage" method="post">
							<a class="nav-link" href="javascript:mypage.submit()">
								<img 
									src="WebContent/logo/mypage.png" 
									data-alt-src='WebContent/logo/mypage2.png'
									alt="�}�C�y�[�W"
									height="50px"
								>
								<h3 class="d-inline d-md-none">�}�C�y�[�W</h3>
								<input type="hidden" value="${sessionScope.userId}" name="userId">
							</a>
						</form>
					</li>
				</ul>
			</div>
		</nav>
		<div id="popup_window">
			<div class="popup_box"></div>
		</div>
		<div class="mylike">
			<c:forEach var="data" items="${data}">
				<span href="getpostview?postId=${data.postId}" class="popup">
					<c:set var="url" value="${data.imageURL}"/>
					<c:if test="${fn:endsWith(url, 'image')}">
						<img src="${data.imageURL}" alt="Post Image" class="image"/>
					</c:if>
					<c:if test="${fn:endsWith(url,'video')}">
						<video width="100%" height="100%" controls>
						<source src="${data.imageURL}" type="video/mp4" class="image"/>
					</c:if>
				</span>
			</c:forEach>
		</div>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
	</body>
</html>