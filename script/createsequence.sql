/* シーケンスを作成するスクリプト */

/* シーケンスがひとつでも存在している場合、削除 */
-- select sequence_name, last_number from user_sequences;
DECLARE
  v_cnt NUMBER;
BEGIN
  SELECT count(sequence_name)  INTO v_cnt
  FROM user_sequences
  WHERE sequence_name IN ('AS_SEQ_USERID','AS_SEQ_POSTID','AS_SEQ_REPLYID','AS_SEQ_LIKEID');

  DBMS_OUTPUT.PUT_LINE(v_cnt);
  IF v_cnt > 0 THEN
    EXECUTE IMMEDIATE 'DROP sequence as_seq_userId';
    EXECUTE IMMEDIATE 'DROP sequence as_seq_postId';
    EXECUTE IMMEDIATE 'DROP sequence as_seq_replyId';
    EXECUTE IMMEDIATE 'DROP sequence as_seq_likeId';
  END IF;
END;
/

/* シーケンスを作成 */
create sequence as_seq_userId start with 1 increment by 1;
create sequence as_seq_postId start with 1 increment by 1;

commit;
