-- 実習用ユーザを作成します(ユーザ名：web　パスワード：pro)

CREATE USER animal
IDENTIFIED BY animal
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
QUOTA UNLIMITED ON users;


-- テーブル作成等の権限を与えます

GRANT connect, resource,
      create view,
      create synonym,
      create public synonym,
      drop public synonym
TO animal;

