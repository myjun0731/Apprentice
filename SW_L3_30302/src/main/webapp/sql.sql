set line 400;

-- 1
drop table TBL_RENTAL_03;
drop table TBL_MEMBER_03;
drop table TBL_BOOK_03;

create table TBL_MEMBER_03(
	MNO char(5) not null primary key,
	NAME varchar2(20),
	PHONE varchar2(13),
	FMAIL varchar2(30),
	GRADE char(1),
	JOINDATE date
);

insert into TBL_MEMBER_03 values('M0001','김철수','010-1111-2222','kim@naver.com','N','20210101');
insert into TBL_MEMBER_03 values('M0002','이영희','010-2222-3333','lee@gmail.com','V','20210105');
insert into TBL_MEMBER_03 values('M0003','김철수','010-3333-4444','park@daum.net','N','20210110');

create table TBL_BOOK_03(
	BNO char(5) not null primary key,
	TITLE varchar2(50),
	AUTHOR varchar2(30),
	PUB varchar2(30),
	PRICE number(7)
);

insert into TBL_BOOK_03 values('B0001','자바프로그래밍','홍길동','한빛',20000);
insert into TBL_BOOK_03 values('B0002','오라클SQL','이순신','한빛',25000);
insert into TBL_BOOK_03 values('B0003','JSP웹개발','강감찬','교학사',30000);

create table TBL_RENTAL_03(
	RNO number(8)  not null primary key,
	MNO char(5),
	BNO char(5),
	RENTDATE date,
	DUEDATE date,
	RETDATE date,
	STATUS char(1),
	FOREIGN KEY (MNO) REFERENCES TBL_MEMBER_03(MNO),
	FOREIGN KEY (BNO) REFERENCES TBL_BOOK_03(BNO)
);

insert into TBL_RENTAL_03 values(20210001,'M0001','B0001','2025-03-01','2025-03-08','2025-03-07','1');
insert into TBL_RENTAL_03 values(20210002,'M0002','B0002','2025-08-17','2025-08-17',null,'0');
insert into TBL_RENTAL_03 values(20210003,'M0003','B0003','2025-07-27','2025-07-27',null,'0');


commit;

select RNO as "대여번호"
       ,MNO as "회원번호"
       ,BNO as "도서번호"
       ,RENTDATE as "대여일자"
       ,DUEDATE as "반납예정일"
       ,RETDATE as "반납일자"
       ,STATUS as "상태"
from TBL_RENTAL_03
where RETDATE is null
order by RNO;

select RNO as "대여번호" 
       ,MNO as "회원번호"
       ,BNO as "도서번호"
       ,DUEDATE as "반납예정일"
       ,to_date('20250817', 'yyyymmdd') - DUEDATE as "연체일수"
from TBL_RENTAL_03
where RETDATE is null;

select b.BNO as "도서번호"
       ,b.TITLE as "도서명"
       ,count(r.BNO) as "대여횟수"
from TBL_BOOK_03 b, TBL_RENTAL_03 r
where b.BNO = r.BNO
group by b.BNO, b.TITLE
order by b.BNO;



-- 2
drop table TBL_RENTAL_INFO_02;
drop table TBL_GENRE_02;

create table TBL_GENRE_02(
	GCODE char(2) not null primary key,
	GNAME varchar2(20)
);

insert into TBL_GENRE_02 values('IT','프로그래밍');
insert into TBL_GENRE_02 values('DB','데이터베이스');
insert into TBL_GENRE_02 values('WB','웹개발');

create table TBL_RENTAL_INFO_02(
	RNO number(8) not null primary key,
	MNO char(5),
	BNO char(5),
	RENTDATE date,
	DUEDATE date,
	STATUS char(1),
	GCODE char(2),
	FOREIGN KEY (GCODE) REFERENCES TBL_GENRE_02(GCODE)
);

insert into TBL_RENTAL_INFO_02 values(20220001,'M0001','B0001','2025-03-01','2025-03-08','1','IT');
insert into TBL_RENTAL_INFO_02 values(20220002,'M0002','B0002','2025-08-10','2025-08-17','0','DB');
insert into TBL_RENTAL_INFO_02 values(20220003,'M0003','B0003','2025-07-20','2025-07-27','0','WB');

commit;

select
	case 
		when r.gcode = (select gcode 
						from (select gcode, count(*) as cnt
							from tbl_rental_info_02
							group by gcode
							order by cnt desc, gcode asc)
						where rownum = 1)
		then '[인기장르]'
		else null
	end as "구분"
       ,g.gname as "장르명"
       ,r.mno as "회원번호"
       ,r.bno as "도서번호"
       ,to_char(r.rentdate, 'yyyy-mm-dd') as "대여일자"
       ,to_char(r.duedate, 'yyyy-mm-dd dy') as "반납예정일"
       ,decode(r.status, '0', '대여중', '1', '반납완료') as "상태"
from tbl_rental_info_02 r, tbl_genre_02 g
where r.gcode = g.gcode
order by "구분" asc nulls last, r.rentdate, r.duedate;