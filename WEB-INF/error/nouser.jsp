<%@ page isErrorPage="true" pageEncoding="Windows-31J" contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <meta http-equiv="Refresh" content="3;url=getpostlist">
        <title>${pageContext.exception.message}</title>
    </head>
    <body>
        ${pageContext.exception.message}
    </body>
</html>