<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="viewport" content="width=device-width">
		<meta name="robots" content="noindex,nofollow">
		<link rel="canonical" href="https://lopan.jp/css-animation">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/style/login.css"/>

		<title>���ɂ܂� ���Ȃ��� �悤����</title>
		<style>
			.bg-animal{
				background-color: #abe8d5;
			}
		</style>
	</head>
	<body>
		<!-- navbar -->
		<nav class="navbar navbar-expand-md navbar-light bg-animal sticky-top p-0 mt-0 mx-0 mb-5">
			<a class="navbar-brand text-white" href="getpostlist">
				<img src="WebContent/logo/animal-log.png" alt="logo" height="75px">
			</a>
			<form class="form-inline m-md-auto w-50" action="search" method="get">
				<input
					class="form-control mr-2 w-75"
					name="query"
					type="search"
					placeholder="����"
					aria-label="Search"
				>
				<button class="btn btn-outline-primary px-4 my-2 mx-sm-0" type="submit">����</button>
			</form>
		</nav>
		<h1>���ɂ܂� ���Ȃ��� �ւ悤����</h1>
		<div class="box">
			<div class="box1">
				<div class="slider">
				     <img src="<c:url value='WebContent/sample_image/dogcat2.jpg'/>" alt="�Ȃ񂩂������L���[�g�ȓ����̉摜" width="80%" height="auto">
				     <img src="<c:url value='WebContent/sample_image/bird8.jpg'/>" alt="�Ȃ񂩂������L���[�g�ȓ����̉摜" width="80%" height="auto">
				</div>
			</div>	
			<div class="box2">
				<img src="WebContent/logo/animal-log.png" class="titlelogo">
				<button class="btn1 submitbutton" type="button">���O�C��</button><br>
				<button class="btn2 submitbutton" type="button">�V�K�o�^</button>
			</div>
		</div>
		
		
	<% if(request.getAttribute("data")!=null){ %>
	<script>alert("${data}")</script>
	<% } %>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script> --><script src="${pageContext.request.contextPath}/WebContent/js/loginbox.js"></script>
	</body>
</html>