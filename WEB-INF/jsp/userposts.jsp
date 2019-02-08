<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<body>
<div>
    <c:forEach var="data" items="${data}">
            <a href="getpostview?postId=${data.postId}" class="popup">
                <c:set var="url" value="${data.imageURL}"/>
                <c:if test="${fn:endsWith(url, '.jpg')}">
                    <img src="<c:url value='/WebContent/${data.imageURL}'/>" alt="Post Image">
                </c:if>
                <c:if test="${fn:endsWith(url,'.mp4')}">
                    <video width="100%" height="100%">
                        <source src="<c:url value='/WebContent/${data.imageURL}'/>" type="video/mp4">
                </c:if>
            </a>
    </c:forEach>
</div>
</body>