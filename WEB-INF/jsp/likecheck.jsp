<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=UTF-8" %>
<%
    Boolean isliked = (Boolean)request.getAttribute("data");
    out.print(isliked); 
%>