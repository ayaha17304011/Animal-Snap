set echo off
set feed off

@ script\alter_profile             -- パスワードの期限を無期限に変更

@ script\createuser                -- ユーザを作成します。


set serveroutput on

DECLARE
  v_cnt  NUMBER;
BEGIN
  SELECT COUNT(username) INTO v_cnt
  FROM dba_users
  WHERE username = 'ANIMAL';

  IF v_cnt = 1 THEN
     DBMS_OUTPUT.PUT_LINE('------------------------');
     DBMS_OUTPUT.PUT_LINE('ANIMALユーザを作成しました');
     DBMS_OUTPUT.PUT_LINE('------------------------');
  END IF;
END;
/

set feed 6
set echo on

