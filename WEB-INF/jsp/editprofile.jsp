<%@ page pageEncoding="Windows-31J" contentType="text/html;charset=Windows-31J" %>
<html>
    <head>
    <title>���ɂ܂� ���Ȃ���</title>
</head>
<body>
	<form action="editprofile" method="POST" enctype="multipart/form-data" class="">
        <p><input type="text" name="loginid" placeholder="���O�C��ID"></p>
        <p><input type="text" name="username" placeholder="�\����"></p>
        <p><input type="password" name="pass1" placeholder="�V�����p�X���[�h"><br>
            <input type="password" name="pass2" placeholder="�p�X���[�h�m�F"></p>
        <p><input type="file" name="icon" accept="image/*"></p>
		<p><textarea placeholder="�v���t�B�[����" name="profile" class="profile" maxlength="300" spellcheck="false"></textarea></p>
		<input type="submit" name="edit" value="�ύX">
    </form>
    <form action="removeuser">
		<input type="submit" name="removeuser" value="�A�J�E���g���폜����">
    </form>
</body>