<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="post ext">
		<div class="top">
			<form name="userpage" action="mypage" method="post">
				<a href="javascript:mypage.submit()">
					<img class="icon rounded-circle mx-2 my-2" src="<c:url value='/WebContent/${data[0].iconPath}'/>">
					${data[0].userName}
				</a>
				<input type="hidden" value="${data[0].userId}" name="userId"/>
			</form>
		</div>
		<div class="body">
			<figure class="single-item">
				<c:set var="url" value="${data[0].imageURL}"/>
				<c:set var="file" value="${fn:split(url, ',')}"/>
				<c:choose>
					<c:when test="${fn:length(file) > 1}">
						<c:forEach var="i" items="${file}">
							<c:if test="${fn:endsWith(i, 'image')}">
								<div class="imgwrap">
									<img src="${i}">
								</div>
							</c:if>
							<c:if test="${fn:endsWith(i,'video')}">
								<div class="imgwrap">
									<video muted>
										<source src="${i}" type="video/mp4">
										<source src="${i}" type="video/webm">
										<source src="${i}" type="video/ogg">
									</video>
								</div>					
							</c:if>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<c:if test="${fn:endsWith(file[0], 'image')}">
							<div class="imgwrap">
								<img src="${data[0].imageURL}">
							</div>
						</c:if>
						<c:if test="${fn:endsWith(file[0],'video')}">
							<div class="imgwrap">
								<video muted>
									<source src="${data[0].imageURL}" type="video/mp4">
									<source src="${data[0].imageURL}" type="video/webm">
									<source src="${data[0].imageURL}" type="video/ogg">
								</video>
							</div>
						</c:if>
					</c:otherwise>
				</c:choose>
			</figure>
		</div>
		<div class="bottom">
			<div class="command">
				<a href="#" style="font-size: 2em;">
					<div class="heart"></div>
				</a>
				<a href="#">100</a>
				<div class="removePost">
					<a href="#">この投稿を削除する</a>
				</div>
			</div>
			<div class="replylist">
				<c:if test="${data[0].caption} != ''">
					<div class="caption">
						<strong><a href="">${data.userName}</a></strong><span class="cm">${data.caption}</span>
					</div>
				</c:if>
				<c:forEach var="replies" items="${data[1]}">
					<div>
						<strong><a href="#">${replies.userName}</a></strong><span class="cm">${replies.reply}</span>
					</div>
				</c:forEach>
				<div>
					<strong><a href="#">B1</a></strong><span class="cm">reply 1</span>
				</div>
				<div>
					<strong><a href="#">B2</a></strong><span class="cm">reply 2</span>
				</div>
				<div>
					<strong><a href="#">User1</a></strong><span class="cm">aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</span>
				</div>
			</div>
			<form class="replybox">
				<textarea placeholder="コメントを追加" name="caption" spellcheck="false"></textarea>
				<button type="submit" class="replybuttom">コメント</button>
				<input type="hidden" value="${data[0].postId}" name="postId">
			</form>
		</div> <!-- end of bottom -->
	</div> <!-- end of post -->
	<script>
		$(function(){
			$(document).ready(function(){
				if(window.innerWidth < 768){
					$("#popup_window .post").removeClass("ext");
				}
			})
			$(window).resize(function(){
				if(window.innerWidth >= 768){
					$("#popup_window .post").addClass("ext");
				}
				if(window.innerWidth < 768){
					$("#popup_window .post").removeClass("ext");
				}
			})
			$(".single-item").slick()
		})
		// use Window InnerWidth
		// resize event
	</script>