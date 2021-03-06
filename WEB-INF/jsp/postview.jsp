<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div class="post ext ${data[0].postId}" id="${data[0].postId}">
		<div class="top">
			<img class="icon rounded-circle mx-2 my-2" src="${data[0].iconPath}">
			<a href="mypage?userId=${data[0].userId}">${data[0].userName}</a>
			<a id="day">${data[0].timestamp}</a>
		</div>
		<div class="body">
			<figure class="single-item">
				<c:set var="url" value="${data[0].imageURL}"/>
				<c:set var="file" value="${fn:split(url, '|')}"/>
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
								<video controls>
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
				<span class="like" style="font-size: 2em;">
					<div class="heart"></div>
					<script>
						likecheck("${data[0].postId}");
					</script>
					<a id="count" class="likecount">${data[0].likeCount}</a>
				</span>
				<c:set var="s" value="${sessionScope.userId}" scope="page"/>
				<c:set var="r" value="${data[0].userId}" scope="page"/>
				<c:choose>
					<c:when test="${s.equals(r)}">
						<div class="removePost">
							<a href="removepost?postId=${data[0].postId}">この投稿を削除する</a>
						</div>
					</c:when>
				</c:choose>
			</div>
			<div class="replylist">
				<div class="caption">
					<strong><a href="mypage?userId=${data[0].userId}">${data[0].userName}</a></strong><span class="cm">${data[0].caption}</span>
				</div>
				<div class="replies">
					<!--  -->
				</div>
			</div>
			<form class="replybox">
				<textarea placeholder="コメントを追加" name="replytext" spellcheck="false"></textarea>
				<input type="submit" class="replybuttom" value="コメント">
				<input type="hidden" value="${data[0].postId}" name="postId">
			</form>
		</div> <!-- end of bottom -->
	</div> <!-- end of post -->
	<script>
		$(function(){
			$("#popup_window .heart").click(function(){
				console.log("like");
				var pid = $(this).closest("#popup_window .post").attr("id");
				var counter = parseInt($("#popup_window .likecount").text());
				console.log(counter);
				like(pid);
				var heart = $("#popup_window ."+ pid +" .heart");
				if(heart.attr('class') == "heart outline"){
					heart.removeClass("outline");
					heart.addClass("red");
					$("#popup_window ."+ pid +" .likecount").text(counter+1);
					$("body > #"+pid+" .likecount").text(counter+1);
					$("body > #"+pid+" .heart").removeClass("outline");
					$("body > #"+pid+" .heart").addClass("red");
				}else if(heart.attr('class') == "heart red"){
					heart.removeClass("red");
					heart.addClass("outline");
					$("#popup_window ."+ pid +" .likecount").text(counter-1);
					$("body > #"+pid+" .likecount").text(counter-1);
					$("body > #"+pid+" .heart").removeClass("red");
					$("body > #"+pid+" .heart").addClass("outline");
				}
			});
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
		function like(pid){
			$.ajax({
				url: "like",
				data:{
					"postId": pid
				}
			});
    	}
		// use Window InnerWidth
		// resize event
	</script>