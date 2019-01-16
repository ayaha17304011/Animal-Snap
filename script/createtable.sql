/* テーブルを作成するスクリプト */

/* テーブルがひとつでも存在している場合、削除 */
-- select table_name from user_tables;
DECLARE
  v_cnt NUMBER;
BEGIN
  SELECT count(table_name)  INTO v_cnt
  FROM user_tables
  WHERE table_name IN ('AS_USER','AS_FOLLOWER','AS_POST','AS_REPLY','AS_LIKE');

  IF v_cnt > 0 THEN
    EXECUTE IMMEDIATE 'DROP TABLE as_user cascade constraint purge'; -- as_userは他の表から参照されているのでcascade constraint
    EXECUTE IMMEDIATE 'DROP TABLE as_follower purge';
    EXECUTE IMMEDIATE 'DROP TABLE as_post purge';
    EXECUTE IMMEDIATE 'DROP TABLE as_reply purge';
    EXECUTE IMMEDIATE 'DROP TABLE as_like purge';
  END IF;
END;
/


/* 表の作成 */
CREATE TABLE as_user (
  userID		number(10) constraint pk_userID primary key,
  loginID		varchar2(30) constraint uq_loginID unique,
  username	varchar2(30) not null,
  password	varchar2(12) not null,
  iconpath	varchar2(256) not null
);

CREATE TABLE as_follower (
  userID		  number(10),
  observerID	number(10),
  CONSTRAINT FK_follow_userID FOREIGN KEY (userID) REFERENCES as_user(userID),
  CONSTRAINT FK_follow_observerID FOREIGN KEY (ObserverID) REFERENCES as_user(userID)
);

create table as_post (
	postID    number(10) constraint pk_postID primary key,
	userID    number(10) constraint fk_Post_userID references as_user(userID),
	caption   varchar2(600),
	imageURL  varchar2(256) not null,
	timestamp date default sysdate,
	state number(1) default 1 check (state = 0 or state = 1)
);

CREATE TABLE as_reply (
  replyID	number(10) constraint pk_replyId primary key,
  userID 	number(10) constraint fk_reply_userId references as_user(userID),
  postID 	number(10) constraint fk_reply_postId references as_post(postID),
  reply 	varchar2(600) not null,
  timestamp date default sysdate
);

create table as_like (
  likeID number(10) constraint pk_likeId primary key,
  userID number(10) constraint fk_like_userId references as_user(userID),
  postID number(10) constraint fk_like_postId references as_post(postId)
);


-- as_user表にデータを挿入します。
INSERT INTO as_user VALUES(as_seq_userId.nextval,'test01','testmen','test','sample_image\default_icon.png');
INSERT INTO as_user VALUES(as_seq_userId.nextval,'test02','testmen','test','sample_image\default_icon.png');

-- as_follower表にデータを挿入します。
INSERT INTO as_follower VALUES(1,2);

-- as_post表にデータを挿入します。
INSERT INTO as_post VALUES(as_seq_postId.nextval,1,'test','sample_image\dogcat.jpg',sysdate,1);

-- as_reply表にデータを挿入します。
INSERT INTO as_reply VALUES(as_seq_replyId.nextval,1,10,'testtest',sysdate);

--as_like表にデータを挿入します。
INSERT INTO as_reply VALUES(as_seq_likeId.nextval,1,10);

commit;
