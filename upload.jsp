<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<html>
	<head>
		<title>Upload Test</title>
	</head>
	<body>
		<form method="post" action="servlet" enctype="multipart/form-data">
			<input type="text" name="caption"><br>
			<input type="file" name="image" accept="video/*,image/*" required><br>
			<input type="submit" name="Upload">
		</form>
	</body>
</html>