<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=UTF-8" %>
<%Boolean isFollow = (Boolean)request.getAttribute("data");%>
<% if(isFollow){ %>
    <button id="sbtn3" type="button">�t�H���[��</button>
<% } else if(!isFollow){ %>
    <button id="sbtn3" type="button">�t�H���[����</button>
<% } %>