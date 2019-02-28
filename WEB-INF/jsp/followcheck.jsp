<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=UTF-8" %>
<%
    Boolean isFollow = (Boolean)request.getAttribute("data");
    out.print(isFollow); 
%>