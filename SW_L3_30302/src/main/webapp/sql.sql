drop table tbl_member_01;
drop table tbl_trainer_01;
drop table tbl_apply_01;
drop table tbl_schedule_01;
drop table tbl_class_type_01;

create table tbl_member_01 (
    mno number(6) not null primary key,
    name varchar2(20),
    phone varchar2(13),
    email varchar2(30),
    job char(1),
    grade char(1),
    joindate date
);

insert into tbl_member_01 values (200001, '김철수', '010-1111-2222', 'cs_kim@naver.com', '2', 'V', to_date('20230105', 'yyyymmdd'));
insert into tbl_member_01 values (200002, '이영희', '010-1111-3333', 'yh_lee@naver.com', '1', 'S', to_date('20230210', 'yyyymmdd'));
insert into tbl_member_01 values (200003, '박민수', '010-1111-4444', 'ms_park@naver.com', '3', 'N', to_date('20230315', 'yyyymmdd'));
insert into tbl_member_01 values (200004, '최지현', '010-1111-5555', 'jh_choi@naver.com', '2', 'N', to_date('20230320', 'yyyymmdd'));
insert into tbl_member_01 values (200005, '정우성', '010-1111-6666', 'ws_jung@naver.com', '1', 'S', to_date('20230402', 'yyyymmdd'));
insert into tbl_member_01 values (200006, '한가인', '010-1111-7777', 'gi_han@naver.com', '3', 'N', to_date('20230405', 'yyyymmdd'));

create table tbl_trainer_01 (
    tcode char(4) not null primary key,
    tname varchar2(20),
    field varchar2(30),
    room number(3),
    fee number(7)
);

insert into tbl_trainer_01 values ('H001', '김트레이너', '헬스 초급', 101, 80000);
insert into tbl_trainer_01 values ('H002', '이트레이너', '헬스 중급', 102, 90000);
insert into tbl_trainer_01 values ('H003', '박트레이너', '헬스 고급', 103, 100000);
insert into tbl_trainer_01 values ('Y001', '최트레이너', '요가 초급', 201, 75000);
insert into tbl_trainer_01 values ('Y002', '조트레이너', '요가 중급', 202, 85000);
insert into tbl_trainer_01 values ('P001', '장트레이너', '필라테스 중급', 301, 95000);

create table tbl_apply_01 (
    appno number(8) not null primary key,
    mno number(6),
    tcode char(4),
    classno number(2),
    mstatus char(1)
);

insert into tbl_apply_01 values (20230001, 200001, 'H001', 1, '1');
insert into tbl_apply_01 values (20230002, 200002, 'H001', 1, '1');
insert into tbl_apply_01 values (20230003, 200001, 'H002', 2, '1');
insert into tbl_apply_01 values (20230004, 200003, 'Y001', 1, '1');
insert into tbl_apply_01 values (20230005, 200001, 'H003', 3, '0');
insert into tbl_apply_01 values (20230006, 200004, 'Y001', 1, '1');
insert into tbl_apply_01 values (20230007, 200005, 'Y001', 1, '1');
insert into tbl_apply_01 values (20230008, 200006, 'Y001', 1, '1');
insert into tbl_apply_01 values (20230009, 200004, 'Y002', 2, '1');
insert into tbl_apply_01 values (20230010, 200004, 'P001', 3, '0');

commit;

select appno as 신청번호,
       mno as 회원번호,
       tcode as 트레이너코드,
       classno as 교시,
       decode(mstatus, '1', '완납', '0', '미납') as 결제상태
from tbl_apply_01
where mstatus = '1'
order by appno;

select a.appno as 신청번호,
       a.mno as 회원번호,
       a.tcode as 트레이너코드,
       a.classno as 교시,
       '완납' as 결제상태
from tbl_apply_01 a, tbl_trainer_01 t
where a.tcode = t.tcode
  and t.field = '헬스 초급'
  and a.mstatus = '1'
order by a.appno;

select tcode as 트레이너코드,
       count(*) as 수강인원수
from tbl_apply_01
group by tcode
order by tcode;

create table tbl_schedule_01 (
    classid char(4) not null,
    classcnt number(3) not null,
    classname varchar2(50),
    typecode char(4),
    classdate char(8),
    classtime char(4),
    classday number(1),
    primary key (classid, classcnt)
);

insert into tbl_schedule_01 values ('H001', 1, '헬스 초급반', 'HC01', '20250106', '0900', 1);
insert into tbl_schedule_01 values ('H002', 1, '헬스 중급반', 'HC02', '20250106', '1100', 1);
insert into tbl_schedule_01 values ('H003', 1, '헬스 고급반', 'HC03', '20250107', '1400', 2);
insert into tbl_schedule_01 values ('Y001', 1, '요가 초급반', 'YC01', '20250107', '1600', 2);
insert into tbl_schedule_01 values ('P001', 1, '필라테스 중급반', 'PC01', '20250108', '1000', 3);
insert into tbl_schedule_01 values ('H001', 2, '헬스 초급반', 'HC01', '20250113', '0900', 1);
insert into tbl_schedule_01 values ('Y001', 2, '요가 초급반', 'YC01', '20250114', '1600', 2);


create table tbl_class_type_01 (
    typecode char(4) not null primary key,
    typename varchar2(20)
);

insert into tbl_class_type_01 values ('HC01', '헬스 초급');
insert into tbl_class_type_01 values ('HC02', '헬스 중급');
insert into tbl_class_type_01 values ('HC03', '헬스 고급');
insert into tbl_class_type_01 values ('YC01', '요가 초급');
insert into tbl_class_type_01 values ('YC02', '요가 중급');
insert into tbl_class_type_01 values ('PC01', '필라테스 중급');

commit;
   


select 
    s.classid as 강의id,
    s.classcnt as 회차,
    s.classname as 강의명,
    t.typename as 강좌명,
    to_char(to_date(s.classdate, 'yyyymmdd'), 'yyyy-mm-dd') as 강의일자,
    to_char(to_date(lpad(s.classtime, 4, '0'), 'hh24mi'), 'hh24:mi') as 강의시간,
    decode(s.classday, 1, '월요일', 2, '화요일', 3, '수요일', 4, '목요일', 5, '금요일', 6, '토요일', 7, '일요일') as 강의요일
from tbl_schedule_01 s, tbl_class_type_01 t
where s.typecode = t.typecode
  and s.classcnt = (select max(classcnt) from tbl_schedule_01)
order by s.classid asc, s.classcnt asc;