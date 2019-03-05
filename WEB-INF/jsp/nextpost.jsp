<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:forEach var="data" items="${data}">
    <div class="post ${data.postId}" id="${data.postId}">
        <div class="top">
            <a href="mypage?userId=${data.userId}">
                <img class="icon rounded-circle mx-2 my-2" src="${data.iconPath}">
                ${data.userName}
            </a>
            <a id="day">${data.timestamp}</a>
        </div>				
        <div class="body">
            <span href="getpostview?postId=${data.postId}" class="popup">
                
                    <c:set var="url" value="${data.imageURL}"/>
                    <c:set var="file" value="${fn:split(url, '|')}"/>
                    <c:choose>
                        <c:when test="${fn:length(file) > 1}">
                            <div class="mini-icon far fa-images"></div>
                            <figure class="single-item">
                                <c:forEach var="i" items="${file}">
                                    <c:if test="${fn:endsWith(i, 'image')}">
                                        <img src="${i}">
                                    </c:if>
                                    <c:if test="${fn:endsWith(i,'video')}">
                                        <video muted>
                                            <source src="${i}" type="video/mp4">
                                        </video>
                                    </c:if>
                                </c:forEach>
                            </figure>
                        </c:when>
                        <c:otherwise>
                            <c:if test="${fn:endsWith(file[0], 'image')}">
                                <figure class="single-item">
                                    <img src="${data.imageURL}">
                                </figure>
                            </c:if>
                            <c:if test="${fn:endsWith(file[0],'video')}">
                                <div class="mini-icon fas fa-video"></div>
                                <figure class="single-item">
                                    <video muted>
                                        <source src="${data.imageURL}" type="video/mp4">
                                    </video>
                                </figure>
                            </c:if>
                        </c:otherwise>
                    </c:choose>
            </span>
        </div>

        <!-- like, reply -->
        <div class="bottom">
            <div class="command">
                <span class="like" style="font-size: 2em;">
                        <!-- href="like?postId=${data.postId}" -->
                    <div class="heart"></div>
                    <script>
                        likecheck("${data.postId}");
                    </script>
                    <a id="count" class="likecount">${data.likeCount}</a>
                </span>
                <span style="font-size: 2em;">		
                <div class="hukidashi showreply"><span style="display:none;">${data.postId}</span></div>
                <a id="count">${data.replyCount}</a>
                </span>
            </div>

            <div class="replylist">
                <div class="caption">
                    <strong><a href="mypage?userId=${data.userId}">${data.userName}</a></strong><span class="cm">${data.caption}</span>
                </div>
                <div class="replies" style="display:none;">
                    <!--  -->
                </div>
            </div>	
            <form class="replybox">
                <textarea placeholder="コメントを追加" name="replytext" spellcheck="false"></textarea>
                <button type="submit" class="replybuttom">コメント</button>
                <input type="hidden" value="${data.postId}" name="postId">
            </form>
        </div>
    </div>
</c:forEach>