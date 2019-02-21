<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<body>
<div class="userposts">
    <c:forEach var="data" items="${data}">
            <span href="getpostview?postId=${data.postId}" class="popup">
				<c:set var="url" value="${data.imageURL}"/>
				<c:set var="file" value="${fn:split(url, '|')}"/>
				<c:choose>
					<c:when test="${fn:length(file) > 1}">
						<c:if test="${fn:endsWith(file[0], 'image')}">
							<div class="userpost">
								<img src="${file[0]}">
							</div>
						</c:if>
						<c:if test="${fn:endsWith(file[0],'video')}">
							<div class="userpost">
								<video muted>
									<source src="${file[0]}" type="video/mp4">
								</video>
							</div>
						</c:if>
					</c:when>
					<c:otherwise>
						<c:if test="${fn:endsWith(file[0], 'image')}">
							<div class="userpost">
								<img src="${data.imageURL}">
							</div>
						</c:if>
						<c:if test="${fn:endsWith(file[0],'video')}">
							<div class="userpost">
								<video muted>
									<source src="${data.imageURL}" type="video/mp4">
								</video>
							</div>
						</c:if>
					</c:otherwise>
				</c:choose>
            </span>
    </c:forEach>
</div>
</body>