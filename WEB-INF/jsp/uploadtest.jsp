<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<html>
	<head>
		<title>Upload Test</title>
	</head>
	<body>
		<form method="post" action="post" enctype="multipart/form-data">
			<input type="text" name="caption"><br>
			<input type="file" name="post" accept="video/*,image/*" required><br>
			<input type="hidden" name="userId" value="${sessionScope.userId}"><br>			
			<input type="submit" name="Upload">
			${sessionScope.userId}
		</form>
	</body>
</html>