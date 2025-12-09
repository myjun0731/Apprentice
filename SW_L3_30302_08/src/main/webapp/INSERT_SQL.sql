/* ------------------------------------------------------------
   1. 학생 성적 관리 시스템 (테이블 생성)
   ------------------------------------------------------------ */

drop table MEMBER_TBL cascade constraints;

create table MEMBER_TBL (
    ID varchar2(5) not null,
    NAME varchar2(20),
    GENDER varchar2(3),
    constraint PK_MEMBER primary key (ID)
);

drop table SCORE_TBL cascade constraints;

create table SCORE_TBL (
    ID varchar2(5) not null,
    KOREAN number(3),
    ENGLISH number(3),
    MATH number(3),
    HISTORY number(3),
    constraint PK_SCORE primary key (ID)
);

/* ------------------------------------------------------------
   2. 데이터 삽입 (문제 3)
   ------------------------------------------------------------ */

-- 1. 학생 정보 데이터 삽입
insert into MEMBER_TBL values ('10301', '권기현', '남');
insert into MEMBER_TBL values ('10302', '구지우', '여');
insert into MEMBER_TBL values ('10303', '권태준', '남');
insert into MEMBER_TBL values ('10304', '금기연', '여');
insert into MEMBER_TBL values ('10305', '김영진', '남');
insert into MEMBER_TBL values ('10401', '김주현', '남');
insert into MEMBER_TBL values ('10402', '김태민', '여');
insert into MEMBER_TBL values ('10403', '임수민', '여');
insert into MEMBER_TBL values ('10404', '남상도', '남');
insert into MEMBER_TBL values ('10405', '조은호', '여'); 

-- 2. 학생 점수 데이터 삽입
insert into SCORE_TBL values ('10301', 70, 80, 75, 95);
insert into SCORE_TBL values ('10302', 80, 73, 80, 85);
insert into SCORE_TBL values ('10303', 45, 75, 45, 75);
insert into SCORE_TBL values ('10304', 65, 73, 65, 65);
insert into SCORE_TBL values ('10305', 90, 100, 68, 95);
insert into SCORE_TBL values ('10401', 95, 75, 84, 60);
insert into SCORE_TBL values ('10402', 65, 70, 50, 94);
insert into SCORE_TBL values ('10403', 80, 60, 100, 80);
insert into SCORE_TBL values ('10404', 64, 50, 40, 65);
insert into SCORE_TBL values ('10405', 55, 70, 80, 75);

commit;
