<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
	<head>
		<header class="site-header">
			<h1 class="site-logo"><a href=""><img src="WebContent/logo/animal-log.png" alt="���S"></a></h1>
			<form id="form1" action="" method="get">
			<input id="sbox" id="s" name="s" type="search" placeholder="����" />
			<input id="sbtn" type="submit" value="����" /></form>
			<nav class="gnav">
				<ul class="gnav__menu">
					<li class="gnav__menu__item"><a href=""><img src="WebContent/profileIcon/default_icon.png" alt="�ʒm"></a></li>
					<li class="gnav__menu__item"><a href=""><img src="WebContent/profileIcon/default_icon.png" alt="�����ˑ����\"></a></li>
					<li class="gnav__menu__item"><a href="upload"><img src="WebContent/profileIcon/default_icon.png" alt="�A�C�R��"></a></li>
	
				</ul>
			</nav>
		</header>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/style/timeline.css"/>
		<title>���ɂ܂� ���Ȃ���</title>
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
	</head>
	<body>
	
	
	<br/><br/><br/><br/>
		<% if(session.getAttribute("userId") == null){ %>

			<a href="log">���O�C��</a>
			<a href="signup">�V�K�o�^</a>

		<% } else { %>

			<a href="logout">���O�A�E�g</a>

		<% } %>
		<%
			if(request.getAttribute("data") == null){
				response.sendRedirect("getpostlist");
			}
		%>
		<a href="upload">upload</a><br>
		<c:forEach var="data" items="${data}">
				<div class="post">

						<div class="icon">
							<img src="<c:url value='/WebContent/${data.iconPath}'/>"><a href=""></a>
						</div>
						
						<div class="username">
								<a href="">${data.userName}</a>
						</div>						
				
						<div class="image">
							<c:set var="url" value="${data.imageURL}"/>
							<c:if test="${fn:endsWith(url, '.jpg')}">
								<img src="<c:url value='/WebContent/${data.imageURL}'/>" alt="Post Image">
							</c:if>
							<c:if test="${fn:endsWith(url,'.mp4')}">
								<video width="100%" height="100%" controls>
									<source src="<c:url value='/WebContent/${data.imageURL}'/>" type="video/mp4">
							</c:if>
							
						</div>

						<!-- iine, comment(reply) -->
						<div class="command">
							<span style="font-size: 2em;">
								<i class="far fa-heart"></i>
							</span>
							<span style="font-size: 2em;">
								<i class="far fa-comment"></i>
							</span>
						</div>

						<div class="content">
							<div class="caption">
								<a href="">${data.userName}</a><span style="margin-right: 1em;"></span>${data.caption}
							</div>
							<div class="reply">
								<c:forEach var="replies" items="${post}">
									<a> reply.username</a> <span style="margin-right: 1em;"></span>  ${post.reply}
								</c:forEach>
							</div>
							
							<form class="replybox">
								<textarea aria-label="�R�����g��ǉ�" placeholder="�R�����g��ǉ�" name="replybox" class="replytext" spellcheck="false"></textarea>
								<input type="submit" name="submit" value="���M" class="replybuttom">
								<input type="hidden" value="${sessionScope.loginUser.loginId}">
							</form>
						</div>
						
					</div>
					<br><br><br>
		</c:forEach>
	</body>
</html>