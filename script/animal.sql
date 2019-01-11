/** テーブルがひとつでも存在している場合、削除する **/

DECLARE
  v_cnt NUMBER;
BEGIN
  SELECT count(table_name)  INTO v_cnt
  FROM user_tables
  WHERE table_name IN ('as_user','as_follower','as_post','as_reply','as_like');

  IF v_cnt > 0 THEN
    EXECUTE IMMEDIATE 'DROP TABLE as_user cascade constraint purge';
    EXECUTE IMMEDIATE 'DROP TABLE as_follower purge';
    EXECUTE IMMEDIATE 'DROP TABLE as_post purge';
    EXECUTE IMMEDIATE 'DROP TABLE as_reply purge';
    EXECUTE IMMEDIATE 'DROP TABLE as_like purge';
  END IF;
END;
/


-- as_user表を作成します。

CREATE TABLE as_user(

userID		number(10) constraint pk_userID primary key,
loginID		varchar2(30) constraint uq_loginID unique,
username	varchar2(30) not null,
password	varchar2(12) not null,
iconpath	varchar2(256) not null

 );


-- as_follower表を作成します。

CREATE TABLE as_follower (
userID		number(10),
observerID	number(10),
CONSTRAINT FK_follow_userID FOREIGN KEY (userID) REFERENCES as_user(userID),
CONSTRAINT FK_follow_observerID FOREIGN KEY (ObserverID) REFERENCES as_user(userID)
 );


-- as_post表を作成します。

CREATE TABLE as_post (
postID		number(10) constraint pk_postID primary key,
userID		number(10) constraint fk_Post_userID references as_user(userID),
caption 	varchar2(600),
imageURL 	varchar2(256) not null,
timestamp 	date default sysdate,
state number(1) default 1 check (state = 0 or state = 1)ser(userID)
 );


-- JOB_HISTORY表を作成します。

CREATE TABLE as_reply (
replyID		number(10) constraint pk_replyId primary key,
userID 		number(10) constraint fk_reply_userId references as_user(userID),
postID 		number(10) constraint fk_reply_postId references as_post(postID),
reply 		varchar2(600) not null,
timestamp date default sysdate
 );
 
create table as_like(

likeID number(10) constraint pk_likeId primary key,
userID number (10) constraint fk_like_userId references as_user(userID),
postID number (10) constraint fk_like_postId references as_post(postId)

);


-- as_user表にデータを挿入します。

INSERT INTO as_user VALUES(100,'Steven','King','SKING','515.123.4567','03-06-17','AD_PRES',24000,NULL,NULL,90);
INSERT INTO as_user VALUES(101,'Neena','Kochhar','NKOCHHAR','515.123.4568','05-09-21','AD_VP',17000,NULL,100,90);
INSERT INTO as_user VALUES(102,'Lex','De Haan','LDEHAAN','515.123.4569','01-01-13','AD_VP',17000,NULL,100,90);
INSERT INTO as_user VALUES(103,'Alexander','Hunold','AHUNOLD','590.423.4567','06-01-03','IT_PROG',9000,NULL,102,60);
INSERT INTO as_user VALUES(104,'Bruce','Ernst','BERNST','590.423.4568','07-05-21','IT_PROG',6000,NULL,103,60);
INSERT INTO as_user VALUES(105,'David','Austin','DAUSTIN','590.423.4569','05-06-25','IT_PROG',4800,NULL,103,60);
INSERT INTO as_user VALUES(106,'Valli','Pataballa','VPATABAL','590.423.4560','06-02-05','IT_PROG',4800,NULL,103,60);
INSERT INTO as_user VALUES(107,'Diana','Lorentz','DLORENTZ','590.423.5567','07-02-07','IT_PROG',4200,NULL,103,60);
INSERT INTO as_user VALUES(108,'Nancy','Greenberg','NGREENBE','515.124.4569','02-08-17','FI_MGR',12008,NULL,101,100);
INSERT INTO as_user VALUES(109,'Daniel','Faviet','DFAVIET','515.124.4169','02-08-16','FI_ACCOUNT',9000,NULL,108,100);
INSERT INTO as_user VALUES(110,'John','Chen','JCHEN','515.124.4269','05-09-28','FI_ACCOUNT',8200,NULL,108,100);
INSERT INTO as_user VALUES(111,'Ismael','Sciarra','ISCIARRA','515.124.4369','05-09-30','FI_ACCOUNT',7700,NULL,108,100);
INSERT INTO as_user VALUES(112,'Jose Manuel','Urman','JMURMAN','515.124.4469','06-03-07','FI_ACCOUNT',7800,NULL,108,100);
INSERT INTO as_user VALUES(113,'Luis','Popp','LPOPP','515.124.4567','07-12-07','FI_ACCOUNT',6900,NULL,108,100);
INSERT INTO as_user VALUES(114,'Den','Raphaely','DRAPHEAL','515.127.4561','02-12-07','PU_MAN',11000,NULL,100,30);
INSERT INTO as_user VALUES(115,'Alexander','Khoo','AKHOO','515.127.4562','03-05-18','PU_CLERK',3100,NULL,114,30);
INSERT INTO as_user VALUES(116,'Shelli','Baida','SBAIDA','515.127.4563','05-12-24','PU_CLERK',2900,NULL,114,30);
INSERT INTO as_user VALUES(117,'Sigal','Tobias','STOBIAS','515.127.4564','05-07-24','PU_CLERK',2800,NULL,114,30);
INSERT INTO as_user VALUES(118,'Guy','Himuro','GHIMURO','515.127.4565','06-11-15','PU_CLERK',2600,NULL,114,30);
INSERT INTO as_user VALUES(119,'Karen','Colmenares','KCOLMENA','515.127.4566','07-08-10','PU_CLERK',2500,NULL,114,30);
INSERT INTO as_user VALUES(120,'Matthew','Weiss','MWEISS','650.123.1234','04-07-18','ST_MAN',8000,NULL,100,50);
INSERT INTO as_user VALUES(121,'Adam','Fripp','AFRIPP','650.123.2234','05-04-10','ST_MAN',8200,NULL,100,50);
INSERT INTO as_user VALUES(122,'Payam','Kaufling','PKAUFLIN','650.123.3234','03-05-01','ST_MAN',7900,NULL,100,50);
INSERT INTO as_user VALUES(123,'Shanta','Vollman','SVOLLMAN','650.123.4234','05-10-10','ST_MAN',6500,NULL,100,50);
INSERT INTO as_user VALUES(124,'Kevin','Mourgos','KMOURGOS','650.123.5234','07-11-16','ST_MAN',5800,NULL,100,50);
INSERT INTO as_user VALUES(125,'Julia','Nayer','JNAYER','650.124.1214','05-07-16','ST_CLERK',3200,NULL,120,50);
INSERT INTO as_user VALUES(126,'Irene','Mikkilineni','IMIKKILI','650.124.1224','06-09-28','ST_CLERK',2700,NULL,120,50);
INSERT INTO as_user VALUES(127,'James','Landry','JLANDRY','650.124.1334','07-01-14','ST_CLERK',2400,NULL,120,50);
INSERT INTO as_user VALUES(128,'Steven','Markle','SMARKLE','650.124.1434','08-03-08','ST_CLERK',2200,NULL,120,50);
INSERT INTO as_user VALUES(129,'Laura','Bissot','LBISSOT','650.124.5234','05-08-20','ST_CLERK',3300,NULL,121,50);
INSERT INTO as_user VALUES(130,'Mozhe','Atkinson','MATKINSO','650.124.6234','05-10-30','ST_CLERK',2800,NULL,121,50);
INSERT INTO as_user VALUES(131,'James','Marlow','JAMRLOW','650.124.7234','05-02-16','ST_CLERK',2500,NULL,121,50);
INSERT INTO as_user VALUES(132,'TJ','Olson','TJOLSON','650.124.8234','07-04-10','ST_CLERK',2100,NULL,121,50);
INSERT INTO as_user VALUES(133,'Jason','Mallin','JMALLIN','650.127.1934','04-06-14','ST_CLERK',3300,NULL,122,50);
INSERT INTO as_user VALUES(134,'Michael','Rogers','MROGERS','650.127.1834','06-08-26','ST_CLERK',2900,NULL,122,50);
INSERT INTO as_user VALUES(135,'Ki','Gee','KGEE','650.127.1734','07-12-12','ST_CLERK',2400,NULL,122,50);
INSERT INTO as_user VALUES(136,'Hazel','Philtanker','HPHILTAN','650.127.1634','08-02-06','ST_CLERK',2200,NULL,122,50);
INSERT INTO as_user VALUES(137,'Renske','Ladwig','RLADWIG','650.121.1234','03-07-14','ST_CLERK',3600,NULL,123,50);
INSERT INTO as_user VALUES(138,'Stephen','Stiles','SSTILES','650.121.2034','05-10-26','ST_CLERK',3200,NULL,123,50);
INSERT INTO as_user VALUES(139,'John','Seo','JSEO','650.121.2019','06-02-12','ST_CLERK',2700,NULL,123,50);
INSERT INTO as_user VALUES(140,'Joshua','Patel','JPATEL','650.121.1834','06-04-06','ST_CLERK',2500,NULL,123,50);
INSERT INTO as_user VALUES(141,'Trenna','Rajs','TRAJS','650.121.8009','03-10-17','ST_CLERK',3500,NULL,124,50);
INSERT INTO as_user VALUES(142,'Curtis','Davies','CDAVIES','650.121.2994','05-01-29','ST_CLERK',3100,NULL,124,50);
INSERT INTO as_user VALUES(143,'Randall','Matos','RMATOS','650.121.2874','06-03-15','ST_CLERK',2600,NULL,124,50);
INSERT INTO as_user VALUES(144,'Peter','Vargas','PVARGAS','650.121.2004','06-07-09','ST_CLERK',2500,NULL,124,50);
INSERT INTO as_user VALUES(145,'John','Russell','JRUSSEL','011.44.1344.429268','04-10-01','SA_MAN',14000,0.4,100,80);
INSERT INTO as_user VALUES(146,'Karen','Partners','KPARTNER','011.44.1344.467268','05-01-05','SA_MAN',13500,0.3,100,80);
INSERT INTO as_user VALUES(147,'Alberto','Errazuriz','AERRAZUR','011.44.1344.429278','05-03-10','SA_MAN',12000,0.3,100,80);
INSERT INTO as_user VALUES(148,'Gerald','Cambrault','GCAMBRAU','011.44.1344.619268','07-10-15','SA_MAN',11000,0.3,100,80);
INSERT INTO as_user VALUES(149,'Eleni','Zlotkey','EZLOTKEY','011.44.1344.429018','08-01-29','SA_MAN',10500,0.2,100,80);
INSERT INTO as_user VALUES(150,'Peter','Tucker','PTUCKER','011.44.1344.129268','05-01-30','SA_REP',10000,0.3,145,80);
INSERT INTO as_user VALUES(151,'David','Bernstein','DBERNSTE','011.44.1344.345268','05-03-24','SA_REP',9500,0.25,145,80);
INSERT INTO as_user VALUES(152,'Peter','Hall','PHALL','011.44.1344.478968','05-08-20','SA_REP',9000,0.25,145,80);
INSERT INTO as_user VALUES(153,'Christopher','Olsen','COLSEN','011.44.1344.498718','06-03-30','SA_REP',8000,0.2,145,80);
INSERT INTO as_user VALUES(154,'Nanette','Cambrault','NCAMBRAU','011.44.1344.987668','06-12-09','SA_REP',7500,0.2,145,80);
INSERT INTO as_user VALUES(155,'Oliver','Tuvault','OTUVAULT','011.44.1344.486508','07-11-23','SA_REP',7000,0.15,145,80);
INSERT INTO as_user VALUES(156,'Janette','King','JKING','011.44.1345.429268','04-01-30','SA_REP',10000,0.35,146,80);
INSERT INTO as_user VALUES(157,'Patrick','Sully','PSULLY','011.44.1345.929268','04-03-04','SA_REP',9500,0.35,146,80);
INSERT INTO as_user VALUES(158,'Allan','McEwen','AMCEWEN','011.44.1345.829268','04-08-01','SA_REP',9000,0.35,146,80);
INSERT INTO as_user VALUES(159,'Lindsey','Smith','LSMITH','011.44.1345.729268','05-03-10','SA_REP',8000,0.3,146,80);
INSERT INTO as_user VALUES(160,'Louise','Doran','LDORAN','011.44.1345.629268','05-12-15','SA_REP',7500,0.3,146,80);
INSERT INTO as_user VALUES(161,'Sarath','Sewall','SSEWALL','011.44.1345.529268','06-11-03','SA_REP',7000,0.25,146,80);
INSERT INTO as_user VALUES(162,'Clara','Vishney','CVISHNEY','011.44.1346.129268','05-11-11','SA_REP',10500,0.25,147,80);
INSERT INTO as_user VALUES(163,'Danielle','Greene','DGREENE','011.44.1346.229268','07-03-19','SA_REP',9500,0.15,147,80);
INSERT INTO as_user VALUES(164,'Mattea','Marvins','MMARVINS','011.44.1346.329268','08-01-24','SA_REP',7200,0.1,147,80);
INSERT INTO as_user VALUES(165,'David','Lee','DLEE','011.44.1346.529268','08-02-23','SA_REP',6800,0.1,147,80);
INSERT INTO as_user VALUES(166,'Sundar','Ande','SANDE','011.44.1346.629268','08-03-24','SA_REP',6400,0.1,147,80);
INSERT INTO as_user VALUES(167,'Amit','Banda','ABANDA','011.44.1346.729268','08-04-21','SA_REP',6200,0.1,147,80);
INSERT INTO as_user VALUES(168,'Lisa','Ozer','LOZER','011.44.1343.929268','05-03-11','SA_REP',11500,0.25,148,80);
INSERT INTO as_user VALUES(169,'Harrison','Bloom','HBLOOM','011.44.1343.829268','06-03-23','SA_REP',10000,0.2,148,80);
INSERT INTO as_user VALUES(170,'Tayler','Fox','TFOX','011.44.1343.729268','06-01-24','SA_REP',9600,0.2,148,80);
INSERT INTO as_user VALUES(171,'William','Smith','WSMITH','011.44.1343.629268','07-02-23','SA_REP',7400,0.15,148,80);
INSERT INTO as_user VALUES(172,'Elizabeth','Bates','EBATES','011.44.1343.529268','07-03-24','SA_REP',7300,0.15,148,80);
INSERT INTO as_user VALUES(173,'Sundita','Kumar','SKUMAR','011.44.1343.329268','08-04-21','SA_REP',6100,0.1,148,80);
INSERT INTO as_user VALUES(174,'Ellen','Abel','EABEL','011.44.1644.429267','04-05-11','SA_REP',11000,0.3,149,80);
INSERT INTO as_user VALUES(175,'Alyssa','Hutton','AHUTTON','011.44.1644.429266','05-03-19','SA_REP',8800,0.25,149,80);
INSERT INTO as_user VALUES(176,'Jonathon','Taylor','JTAYLOR','011.44.1644.429265','06-03-24','SA_REP',8600,0.2,149,80);
INSERT INTO as_user VALUES(177,'Jack','Livingston','JLIVINGS','011.44.1644.429264','06-04-23','SA_REP',8400,0.2,149,80);
INSERT INTO as_user VALUES(178,'Kimberely','Grant','KGRANT','011.44.1644.429263','07-05-24','SA_REP',7000,0.15,149,NULL);
INSERT INTO as_user VALUES(179,'Charles','Johnson','CJOHNSON','011.44.1644.429262','08-01-04','SA_REP',6200,0.1,149,80);
INSERT INTO as_user VALUES(180,'Winston','Taylor','WTAYLOR','650.507.9876','06-01-24','SH_CLERK',3200,NULL,120,50);
INSERT INTO as_user VALUES(181,'Jean','Fleaur','JFLEAUR','650.507.9877','06-02-23','SH_CLERK',3100,NULL,120,50);
INSERT INTO as_user VALUES(182,'Martha','Sullivan','MSULLIVA','650.507.9878','07-06-21','SH_CLERK',2500,NULL,120,50);
INSERT INTO as_user VALUES(183,'Girard','Geoni','GGEONI','650.507.9879','08-02-03','SH_CLERK',2800,NULL,120,50);
INSERT INTO as_user VALUES(184,'Nandita','Sarchand','NSARCHAN','650.509.1876','04-01-27','SH_CLERK',4200,NULL,121,50);
INSERT INTO as_user VALUES(185,'Alexis','Bull','ABULL','650.509.2876','05-02-20','SH_CLERK',4100,NULL,121,50);
INSERT INTO as_user VALUES(186,'Julia','Dellinger','JDELLING','650.509.3876','06-06-24','SH_CLERK',3400,NULL,121,50);
INSERT INTO as_user VALUES(187,'Anthony','Cabrio','ACABRIO','650.509.4876','07-02-07','SH_CLERK',3000,NULL,121,50);
INSERT INTO as_user VALUES(188,'Kelly','Chung','KCHUNG','650.505.1876','05-06-14','SH_CLERK',3800,NULL,122,50);
INSERT INTO as_user VALUES(189,'Jennifer','Dilly','JDILLY','650.505.2876','05-08-13','SH_CLERK',3600,NULL,122,50);
INSERT INTO as_user VALUES(190,'Timothy','Gates','TGATES','650.505.3876','06-07-11','SH_CLERK',2900,NULL,122,50);
INSERT INTO as_user VALUES(191,'Randall','Perkins','RPERKINS','650.505.4876','07-12-19','SH_CLERK',2500,NULL,122,50);
INSERT INTO as_user VALUES(192,'Sarah','Bell','SBELL','650.501.1876','04-02-04','SH_CLERK',4000,NULL,123,50);
INSERT INTO as_user VALUES(193,'Britney','Everett','BEVERETT','650.501.2876','05-03-03','SH_CLERK',3900,NULL,123,50);
INSERT INTO as_user VALUES(194,'Samuel','McCain','SMCCAIN','650.501.3876','06-07-01','SH_CLERK',3200,NULL,123,50);
INSERT INTO as_user VALUES(195,'Vance','Jones','VJONES','650.501.4876','07-03-17','SH_CLERK',2800,NULL,123,50);
INSERT INTO as_user VALUES(196,'Alana','Walsh','AWALSH','650.507.9811','06-04-24','SH_CLERK',3100,NULL,124,50);
INSERT INTO as_user VALUES(197,'Kevin','Feeney','KFEENEY','650.507.9822','06-05-23','SH_CLERK',3000,NULL,124,50);
INSERT INTO as_user VALUES(198,'Donald','OConnell','DOCONNEL','650.507.9833','07-06-21','SH_CLERK',2600,NULL,124,50);
INSERT INTO as_user VALUES(199,'Douglas','Grant','DGRANT','650.507.9844','08-01-13','SH_CLERK',2600,NULL,124,50);
INSERT INTO as_user VALUES(200,'Jennifer','Whalen','JWHALEN','515.123.4444','03-09-17','AD_ASST',4400,NULL,101,10);
INSERT INTO as_user VALUES(201,'Michael','Hartstein','MHARTSTE','515.123.5555','04-02-17','MK_MAN',13000,NULL,100,20);
INSERT INTO as_user VALUES(202,'Pat','Fay','PFAY','603.123.6666','05-08-17','MK_REP',6000,NULL,201,20);
INSERT INTO as_user VALUES(203,'Susan','Mavris','SMAVRIS','515.123.7777','02-06-07','HR_REP',6500,NULL,101,40);
INSERT INTO as_user VALUES(204,'Hermann','Baer','HBAER','515.123.8888','02-06-07','PR_REP',10000,NULL,101,70);
INSERT INTO as_user VALUES(205,'Shelley','Higgins','SHIGGINS','515.123.8080','02-06-07','AC_MGR',12008,NULL,101,110);
INSERT INTO as_user VALUES(206,'William','Gietz','WGIETZ','515.123.8181','02-06-07','AC_ACCOUNT',8300,NULL,205,110);


-- as_follower表にデータを挿入します。

INSERT INTO as_follower VALUES(10,'Administration',200,1700);
INSERT INTO as_follower VALUES(20,'Marketing',201,1800);
INSERT INTO as_follower VALUES(30,'Purchasing',114,1700);
INSERT INTO as_follower VALUES(40,'Human Resources',203,2400);
INSERT INTO as_follower VALUES(50,'Shipping',121,1500);
INSERT INTO as_follower VALUES(60,'IT',103,1400);
INSERT INTO as_follower VALUES(70,'Public Relations',204,2700);
INSERT INTO as_follower VALUES(80,'Sales',145,2500);
INSERT INTO as_follower VALUES(90,'Executive',100,1700);
INSERT INTO as_follower VALUES(100,'Finance',108,1700);
INSERT INTO as_follower VALUES(110,'Accounting',205,1700);
INSERT INTO as_follower VALUES(120,'Treasury',NULL,1700);
INSERT INTO as_follower VALUES(130,'Corporate Tax',NULL,1700);
INSERT INTO as_follower VALUES(140,'Control And Credit',NULL,1700);
INSERT INTO as_follower VALUES(150,'Shareholder Services',NULL,1700);
INSERT INTO as_follower VALUES(160,'Benefits',NULL,1700);
INSERT INTO as_follower VALUES(170,'Manufacturing',NULL,1700);
INSERT INTO as_follower VALUES(180,'Construction',NULL,1700);
INSERT INTO as_follower VALUES(190,'Contracting',NULL,1700);
INSERT INTO as_follower VALUES(200,'Operations',NULL,1700);
INSERT INTO as_follower VALUES(210,'IT Support',NULL,1700);
INSERT INTO as_follower VALUES(220,'NOC',NULL,1700);
INSERT INTO as_follower VALUES(230,'IT Helpdesk',NULL,1700);
INSERT INTO as_follower VALUES(240,'Government Sales',NULL,1700);
INSERT INTO as_follower VALUES(250,'Retail Sales',NULL,1700);
INSERT INTO as_follower VALUES(260,'Recruiting',NULL,1700);
INSERT INTO as_follower VALUES(270,'Payroll',NULL,1700);


-- as_post表にデータを挿入します。

INSERT INTO as_post VALUES('AD_PRES','President',20080,40000);
INSERT INTO as_post VALUES('AD_VP','Administration Vice President',15000,30000);
INSERT INTO as_post VALUES('AD_ASST','Administration Assistant',3000,6000);
INSERT INTO as_post VALUES('FI_MGR','Finance Manager',8200,16000);
INSERT INTO as_post VALUES('FI_ACCOUNT','Accountant',4200,9000);
INSERT INTO as_post VALUES('AC_MGR','Accounting Manager',8200,16000);
INSERT INTO as_post VALUES('AC_ACCOUNT','Public Accountant',4200,9000);
INSERT INTO as_post VALUES('SA_MAN','Sales Manager',10000,20080);
INSERT INTO as_post VALUES('SA_REP','Sales Representative',6000,12008);
INSERT INTO as_post VALUES('PU_MAN','Purchasing Manager',8000,15000);
INSERT INTO as_post VALUES('PU_CLERK','Purchasing Clerk',2500,5500);
INSERT INTO as_post VALUES('ST_MAN','Stock Manager',5500,8500);
INSERT INTO as_post VALUES('ST_CLERK','Stock Clerk',2008,5000);
INSERT INTO as_post VALUES('SH_CLERK','Shipping Clerk',2500,5500);
INSERT INTO as_post VALUES('IT_PROG','Programmer',4000,10000);
INSERT INTO as_post VALUES('MK_MAN','Marketing Manager',9000,15000);
INSERT INTO as_post VALUES('MK_REP','Marketing Representative',4000,9000);
INSERT INTO as_post VALUES('HR_REP','Human Resources Representative',4000,9000);
INSERT INTO as_post VALUES('PR_REP','Public Relations Representative',4500,10500);


-- as_reply表にデータを挿入します。

INSERT INTO as_reply VALUES(102,'01-01-13','06-07-24','IT_PROG',60);
INSERT INTO as_reply VALUES(101,'97-09-21','01-10-27','AC_ACCOUNT',110);
INSERT INTO as_reply VALUES(101,'01-10-28','05-03-15','AC_MGR',110);
INSERT INTO as_reply VALUES(201,'04-02-17','07-12-19','MK_REP',20);
INSERT INTO as_reply VALUES(114,'06-03-24','07-12-31','ST_CLERK',50);
INSERT INTO as_reply VALUES(122,'07-01-01','07-12-31','ST_CLERK',50);
INSERT INTO as_reply VALUES(200,'95-09-17','01-06-17','AD_ASST',90);
INSERT INTO as_reply VALUES(176,'06-03-24','06-12-31','SA_REP',80);
INSERT INTO as_reply VALUES(176,'07-01-01','07-12-31','SA_MAN',80);
INSERT INTO as_reply VALUES(200,'02-07-01','06-12-31','AC_ACCOUNT',90);


commit;


CREATE OR REPLACE VIEW as_userVW AS
SELECT as_userID pID, FIRST_NAME || ' ' || LAST_NAME as_userName,EMAIL,SALARY,MANAGER_ID MID,as_follower_ID DID FROM as_user;
