-- ���K�p���[�U���쐬���܂�(���[�U���Fweb�@�p�X���[�h�Fpro)

CREATE USER animal
IDENTIFIED BY animal
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

