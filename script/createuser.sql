-- ���K�p���[�U���쐬���܂�(���[�U���Fanimal�@�p�X���[�h�Fpass)

CREATE USER animal
IDENTIFIED BY pass
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
QUOTA UNLIMITED ON users;


-- �e�[�u���쐬���̌�����^���܂�

GRANT connect, resource,
      create view,
      create synonym,
      create public synonym,
      drop public synonym
TO animal;

