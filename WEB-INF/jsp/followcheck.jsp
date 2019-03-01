<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=UTF-8" %>
<%Boolean isFollow = (Boolean)request.getAttribute("data");%>
<% if(isFollow){ %>
    <button id="sbtn3" type="button">フォロー中</button>
<% } else if(!isFollow){ %>
    <button id="sbtn3" type="button">フォローする</button>
<% } %>