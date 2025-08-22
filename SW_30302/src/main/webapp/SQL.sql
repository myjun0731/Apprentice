drop table TBL_DEPT;
drop table TBL_CAR;
drop table TBL_DRIVE;

create table TBL_DEPT (
DEPT_CODE char(2) not null Primary Key,
DEPT_NAME varchar2(14),
DEPT_OFFR varchar2(14)
);

insert into TBL_DEPT values ('10', '영업부', '김영업');
insert into TBL_DEPT values ('20', '총무부', '이총무');
insert into TBL_DEPT values ('30', '구매부', '박구매');
insert into TBL_DEPT values ('40', '개발부', '조개발');

create table TBL_CAR (
CAR_NO char(10) not null Primary Key,
CAR_MODEL varchar2(14),
CAR_COMPANY varchar2(10),
CAR_DATE char(8)
);

insert into TBL_CAR values ('10가0001', '소나타', '현대', '20230101');
insert into TBL_CAR values ('10가0002', 'K5', '기아', '20230102');
insert into TBL_CAR values ('10가0003', 'SM5', '삼성', '20230103');
insert into TBL_CAR values ('10가0004', '그랜저', '현대', '20230104');
insert into TBL_CAR values ('10가0005', 'K5', '기아', '20230105');

create table TBL_DRIVE (
DRV_DATE char(8) not null,
CAR_NO char(10) not null,
DRV_START number,
DRV_END number,
DEPT_CODE char(2),
DRV_MONEY number,
Primary Key(DRV_DATE, CAR_NO)
);

insert into TBL_DRIVE values ('20230301', '10가0001', 10000, 10100, '10', 20000);
insert into TBL_DRIVE values ('20230301', '10가0002', 10000, 10150, '10', 30000);
insert into TBL_DRIVE values ('20230301', '10가0003', 10000, 10200, '20', 30000);
insert into TBL_DRIVE values ('20230301', '10가0004', 10000, 10250, '30', 40000);
insert into TBL_DRIVE values ('20230301', '10가0005', 10000, 10300, '40', 40000);

insert into TBL_DRIVE values ('20230302', '10가0001', 10100, 10300, '10', 25000);
insert into TBL_DRIVE values ('20230302', '10가0002', 10150, 10300, '10', 20000);
insert into TBL_DRIVE values ('20230302', '10가0003', 10200, 10400, '20', 35000);
insert into TBL_DRIVE values ('20230302', '10가0004', 10250, 10500, '20', 40000);
insert into TBL_DRIVE values ('20230302', '10가0005', 10300, 10600, '30', 50000);

-- 주행내역조회
select 
subStr(DRV_DATE, 0,4) || '년' ||subStr(DRV_DATE, 5,2) || '월' ||subStr(DRV_DATE, 7,2) || '일',
dr.CAR_NO,
ca.CAR_MODEL,
to_char(DRV_START, '999,999,999'),
to_char(DRV_END, '999,999,999'),
de.DEPT_NAME,
to_char(DRV_MONEY, 'L999,999,999')
from TBL_DRIVE dr, TBL_CAR ca, TBL_DEPT de
where ca.CAR_NO = dr.CAR_NO and dr.DEPT_CODE = de.DEPT_CODE
order by CAR_NO, DRV_START desc

-- (부서별)주행통계
select
dr.DEPT_CODE,
de.DEPT_NAME,
sum(dr.DRV_END - dr.DRV_START),
to_char(sum(dr.DRV_MONEY), 'L999,999,999')
from TBL_DRIVE dr, TBL_DEPT de
where dr.DEPT_CODE = de.DEPT_CODE
group by
dr.DEPT_CODE,
de.DEPT_NAME
order by
case when dr.DEPT_CODE = '10' then dr.DEPT_CODE
when dr.DEPT_CODE = '20' then dr.DEPT_CODE
when dr.DEPT_CODE = '30' then de.DEPT_NAME
when dr.DEPT_CODE = '40' then dr.DEPT_CODE end

-- 차량조회
select 
CAR_NO,
CAR_MODEL,
CAR_COMPANY,
subStr(CAR_DATE, 0,4) || '년' ||subStr(CAR_DATE, 5,2) || '월' ||subStr(CAR_DATE, 7,2) || '일'
from TBL_CAR
order by CAR_NO