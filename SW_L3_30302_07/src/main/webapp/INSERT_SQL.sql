/* ------------------------------------------------------------
   1. 대한어학원 수강신청 관리 시스템
   - TBL_STUDENT_04
   - TBL_SUBJECT_04
   - TBL_SUBLIST_04
   ------------------------------------------------------------ */

drop table TBL_STUDENT_04 cascade constraints;

create table TBL_STUDENT_04 (
    SNO number(6) primary key,
    NAME varchar2(20),
    PHONE varchar2(13),
    EMAIL varchar2(20),
    JOB char(1),
    GRADE char(1),
    RECPDATE date
);

drop table TBL_SUBJECT_04 cascade constraints;

create table TBL_SUBJECT_04 (
    SUBCODE char(4) not null primary key,
    SUBNAME varchar2(20),
    TEACHER varchar2(20),
    ROOM number(3),
    SMONEY number(7)
);

drop table TBL_SUBLIST_04 cascade constraints;

create table TBL_SUBLIST_04 (
    RECPNO number(8) primary key,
    SNO number(6),
    SUBCODE char(4),
    CLASSNO number(2),
    MSTATUS char(1)
);

insert into TBL_STUDENT_04 values (100001, '김학생', '010-1111-2222', 'aaa@ab.com', '1', 'V', to_date('20180901', 'YYYYMMDD'));
insert into TBL_STUDENT_04 values (100002, '이학생', '010-1111-2223', 'bbb@ab.com', '1', 'S', to_date('20180904', 'YYYYMMDD'));
insert into TBL_STUDENT_04 values (100003, '장학생', '010-1111-2224', 'ccc@ab.com', '2', 'S', to_date('20180910', 'YYYYMMDD'));
insert into TBL_STUDENT_04 values (100004, '최학생', '010-1111-2225', 'ddd@ab.com', '3', 'N', to_date('20180911', 'YYYYMMDD'));
insert into TBL_STUDENT_04 values (100005, '진학생', '010-1111-2226', 'eee@ab.com', '2', 'N', to_date('20180911', 'YYYYMMDD'));
insert into TBL_STUDENT_04 values (100006, '차학생', '010-1111-2227', 'fff@ab.com', '2', 'N', to_date('20180913', 'YYYYMMDD'));

insert into TBL_SUBJECT_04 values ('E001', '영어초급', '김강사', 101, 80000);
insert into TBL_SUBJECT_04 values ('E002', '영어중급', '이강사', 102, 80000);
insert into TBL_SUBJECT_04 values ('E003', '영어고급', '박강사', 103, 100000);
insert into TBL_SUBJECT_04 values ('J001', '무역일어초급', '최강사', 201, 100000);
insert into TBL_SUBJECT_04 values ('J002', '무역일어중급', '조강사', 202, 100000);
insert into TBL_SUBJECT_04 values ('J003', '실전무역일어', '왕강사', 203, 120000);

insert into TBL_SUBLIST_04 values (20180001, 100001, 'E001', 1, '1');
insert into TBL_SUBLIST_04 values (20180002, 100002, 'E001', 1, '1');
insert into TBL_SUBLIST_04 values (20180003, 100001, 'E002', 2, '1');
insert into TBL_SUBLIST_04 values (20180004, 100003, 'J001', 1, '1');
insert into TBL_SUBLIST_04 values (20180005, 100001, 'E003', 3, '0');
insert into TBL_SUBLIST_04 values (20180006, 100004, 'J001', 1, '1');
insert into TBL_SUBLIST_04 values (20180007, 100005, 'J001', 1, '1');
insert into TBL_SUBLIST_04 values (20180008, 100006, 'J001', 1, '1');
insert into TBL_SUBLIST_04 values (20180009, 100004, 'J002', 2, '1');
insert into TBL_SUBLIST_04 values (20180010, 100004, 'J003', 3, '0');

/* ------------------------------------------------------------
   2. 방송 시간 정보
   - TBL_SCHEDULE_05
   - TBL_PGMTYPE_05
   ------------------------------------------------------------ */

drop table TBL_SCHEDULE_05 cascade constraints;

create table TBL_SCHEDULE_05(
	PGMID char(4) not null,
	PGMCNT number(3) not null,
	PGMNAME varchar2(50),
	TYPECODE char(2),
	PGMDATE char(8),
	PGMTIME char(4),
	PGMDAY number(1),
	primary key(PGMID, PGMCNT)
);

insert into TBL_SCHEDULE_05 values ('1001',1,'직업방송','AA','20181001','0900',1);
insert into TBL_SCHEDULE_05 values ('1002',1,'개그콘서트','AB','20181001','1100',1);
insert into TBL_SCHEDULE_05 values ('1003',1,'100분토론','AC','20181002','1200',2);
insert into TBL_SCHEDULE_05 values ('1004',1,'중국어강좌','AD','20181002','1400',2);
insert into TBL_SCHEDULE_05 values ('1005',1,'정글의법칙','AE','20181003','1600',3);
insert into TBL_SCHEDULE_05 values ('1006',1,'사랑과전쟁','AF','20181003','2000',3);
insert into TBL_SCHEDULE_05 values ('1001',2,'직업방송','AA','20181004','0900',4);
insert into TBL_SCHEDULE_05 values ('1002',2,'개그콘서트','AB','20181004','1100',4);
insert into TBL_SCHEDULE_05 values ('1003',2,'100분토론','AC','20181004','1200',4);
insert into TBL_SCHEDULE_05 values ('1004',2,'중국어강좌','AD','20181005','1400',5);
insert into TBL_SCHEDULE_05 values ('1005',2,'정글의법칙','AE','20181005','1600',5);
insert into TBL_SCHEDULE_05 values ('1006',2,'사랑과전쟁','AF','20181005','2000',5);
insert into TBL_SCHEDULE_05 values ('1001',3,'직업방송','AA','20181006','0900',6);
insert into TBL_SCHEDULE_05 values ('1002',3,'개그콘서트','AB','20181006','1100',6);
insert into TBL_SCHEDULE_05 values ('1003',3,'100분토론','AC','20181006','1200',6);

drop table TBL_PGMTYPE_05 cascade constraints;

create table TBL_PGMTYPE_05 (
	TYPECODE char(2) not null primary key,
	TYPENAME varchar2(20)
);

insert into TBL_PGMTYPE_05 values ('AA','뉴스');
insert into TBL_PGMTYPE_05 values ('AB','코메디');
insert into TBL_PGMTYPE_05 values ('AC','시사');
insert into TBL_PGMTYPE_05 values ('AD','교육');
insert into TBL_PGMTYPE_05 values ('AE','예능');
insert into TBL_PGMTYPE_05 values ('AF','드라마');

commit;