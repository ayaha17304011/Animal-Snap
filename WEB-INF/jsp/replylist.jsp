<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/WebContent/style/timeline.css"/>
    <div class="popup_sub">
        <div><a class="close">close</a></div>
        <c:forEach items="${data}" var="data">
                <div class="icon">
                    <img src="<c:url value='/WebContent/${data.iconPath}'/>"><a href=""></a>
                </div>
                <div class="username">
                    <a href="mypage?userId=${data.userId}">${data.userName}</a>
                </div>
                <div class="replytext">
                    <p>${data.reply}</p>
                </div>
        </c:forEach>
    </div>
</body>