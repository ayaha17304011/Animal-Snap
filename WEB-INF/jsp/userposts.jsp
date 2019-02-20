<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<body>
<div>
    <c:forEach var="data" items="${data}">
            <a href="getpostview?postId=${data.postId}" class="popup">
                    <c:set var="url" value="${data.imageURL}"/>
                    <c:set var="file" value="${fn:split(url, ',')}"/>
                <c:choose>
							<c:when test="${fn:length(file) > 1}">
								<c:forEach var="i" items="${file}">
									<c:if test="${fn:endsWith(i, 'image')}">
										<img src="${i}">
									</c:if>
									<c:if test="${fn:endsWith(i,'video')}">
										<video width="100%" height="100%"  muted autoplay loop>
											<source src="${i}" type="video/mp4">
										</video>								
									</c:if>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<c:if test="${fn:endsWith(file[0], 'image')}">
									<img src="${data.imageURL}">
								</c:if>
								<c:if test="${fn:endsWith(file[0],'video')}">
									<video width="100%" height="100%" autoplay loop>
										<source src="${data.imageURL}" type="video/mp4">
									</video>								
								</c:if>
							</c:otherwise>
						</c:choose>
            </a>
    </c:forEach>
</div>
</body>