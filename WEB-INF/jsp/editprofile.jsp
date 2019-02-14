<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<html>
    <head>
    <title>あにまる すなっぷ</title>
</head>
<body>
	<form action="editprofile" method="POST" enctype="multipart/form-data" class="">
        <p><input type="text" name="loginid" placeholder="ログインID"></p>
        <p><input type="text" name="username" placeholder="表示名"></p>
        <p><input type="password" name="pass1" placeholder="新しいパスワード"><br>
            <input type="password" name="pass2" placeholder="パスワード確認"></p>
        <p><input type="file" name="icon" accept="image/*"></p>
		<p><textarea placeholder="プロフィール文" name="profile" class="profile" maxlength="300" spellcheck="false"></textarea></p>
		<input type="submit" name="edit" value="変更">
    </form>
    <form action="removeuser">
		<input type="submit" name="removeuser" value="アカウントを削除する">
    </form>
</body>