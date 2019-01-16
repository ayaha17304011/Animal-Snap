-- 実習用ユーザを作成します(ユーザ名：animal　パスワード：pass)

CREATE USER animal
IDENTIFIED BY pass
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

