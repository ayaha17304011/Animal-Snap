set echo off
set feed off

@ script\alter_profile             -- �p�X���[�h�̊����𖳊����ɕύX

@ script\createuser                -- ���[�U���쐬���܂��B


set serveroutput on

DECLARE
  v_cnt  NUMBER;
BEGIN
  SELECT COUNT(username) INTO v_cnt
  FROM dba_users
  WHERE username = 'ANIMAL';

  IF v_cnt = 1 THEN
     DBMS_OUTPUT.PUT_LINE('------------------------');
     DBMS_OUTPUT.PUT_LINE('ANIMAL���[�U���쐬���܂���');
     DBMS_OUTPUT.PUT_LINE('------------------------');
  END IF;
END;
/

set feed 6
set echo on

