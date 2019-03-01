<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
<body>
    <c:forEach var="data" items="${data}">
            <span href="getpostview?postId=${data.postId}" class="popup">
				<div class="userpost">
					<c:set var="url" value="${data.imageURL}"/>
					<c:set var="file" value="${fn:split(url, '|')}"/>
					<c:choose>
						<c:when test="${fn:length(file) > 1}">
							<div class="mini-icon far fa-images"></div>
							<c:if test="${fn:endsWith(file[0], 'image')}">
								<img src="${file[0]}">
							</c:if>
							<c:if test="${fn:endsWith(file[0],'video')}">
								<video muted>
									<source src="${file[0]}" type="video/mp4">
								</video>
							</c:if>
						</c:when>
						<c:otherwise>
							<c:if test="${fn:endsWith(file[0], 'image')}">
								<img src="${data.imageURL}">
							</c:if>
							<c:if test="${fn:endsWith(file[0],'video')}">
								<div class="mini-icon fas fa-video"></div>
								<video muted>
									<source src="${data.imageURL}" type="video/mp4">
								</video>
							</c:if>
						</c:otherwise>
					</c:choose>
				</div>
            </span>
    </c:forEach>
</body>