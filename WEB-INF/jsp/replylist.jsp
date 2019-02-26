<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body>
    <c:forEach items="${data}" var="data">
        <div>
            <strong><a>${data.userName}</a></strong><span class="cm">${data.reply}</span>
        </div>
    </c:forEach>
</body>