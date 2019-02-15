-- select table_name from user_tables;
DECLARE
  v_cnt NUMBER;
BEGIN
  SELECT count(table_name)  INTO v_cnt
  FROM user_tables
  WHERE table_name IN ('AS_USER','AS_FOLLOWER','AS_POST','AS_REPLY','AS_LIKE');

  IF v_cnt > 0 THEN
    EXECUTE IMMEDIATE 'DROP TABLE as_user cascade constraint purge'; 
    EXECUTE IMMEDIATE 'DROP TABLE as_follower cascade constraint purge';
    EXECUTE IMMEDIATE 'DROP TABLE as_post cascade constraint purge';
    EXECUTE IMMEDIATE 'DROP TABLE as_reply cascade constraint purge';
    EXECUTE IMMEDIATE 'DROP TABLE as_like cascade constraint purge';
  END IF;
END;
/


CREATE TABLE as_user (
  userID		number(10) constraint pk_userID primary key,
  loginID		varchar2(30) constraint uq_loginID unique,
  username	varchar2(30) not null,
  password	varchar2(12) not null,
  iconpath	varchar2(256) not null, 
	profile   varchar2(300),
  state number(1) default 1 check (state = 0 or state = 1)
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
  replyID	number(10),
  userID 	number(10) constraint fk_reply_userId references as_user(userID),
  postID 	number(10) constraint fk_reply_postId references as_post(postID),
  reply 	varchar2(600) not null,
  timestamp date default sysdate
);

create table as_like (
  userID number(10) constraint fk_like_userId references as_user(userID),
  postID number(10) constraint fk_like_postId references as_post(postId)
);

-- as_user
INSERT INTO as_user VALUES(as_seq_userId.nextval,'test01','testmen1','test','sample_image\default_icon.png','プロフィール',default);
INSERT INTO as_user VALUES(as_seq_userId.nextval,'test02','testmen2','test','sample_image\default_icon.png','',default);

-- as_follower
INSERT INTO as_follower VALUES(1,2);

-- as_post
-- INSERT INTO as_post VALUES(as_seq_postId.nextval,1,'captiontest','sample_image\dogcat.jpg',default,default);

-- as_reply
-- INSERT INTO as_reply VALUES(1,1,'replytest',default);

--as_like
-- INSERT INTO as_like VALUES(1,1);

commit;
