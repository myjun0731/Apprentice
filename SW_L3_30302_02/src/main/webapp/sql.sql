drop table tbl_screening_01;
drop table tbl_movie_01;
drop table tbl_booking_01;


-- 1
create table tbl_movie_01 (
    movie_id char(4) not null primary key,
    title varchar2(50),
    genre varchar2(20),
    rating varchar2(20),
    runtime number(3),
    grade char(1),
    joindate date
);

create table tbl_screening_01 (
    screen_id number(6) not null primary key,
    movie_id char(4),
    screen_date date,
    screen_time char(4),
    theater_no number(2),
    foreign key (movie_id) references tbl_movie_01(movie_id)
);

create table tbl_booking_01 (
    booking_id number(8) not null primary key,
    screen_id number(6),
    customer varchar2(20),
    seat_no char(4),
    pay_status char(1),
    foreign key (screen_id) references tbl_screening_01(screen_id)
);

insert into tbl_movie_01 values ('M001', '어벤져스 엔드게임', '액션', '12세이상', 181, 'V', to_date('20230105', 'yyyymmdd'));
insert into tbl_movie_01 values ('M002', '인사이드 아웃 2', '애니메이션', '전체관람가', 100, 'S', to_date('20230210', 'yyyymmdd'));
insert into tbl_movie_01 values ('M003', '범죄도시 4', '범죄', '15세이상', 109, 'N', to_date('20230315', 'yyyymmdd'));

insert into tbl_screening_01 values (100001, 'M001', to_date('20240801', 'yyyymmdd'), '1800', 1);
insert into tbl_screening_01 values (100002, 'M002', to_date('20240801', 'yyyymmdd'), '1500', 2);
insert into tbl_screening_01 values (100003, 'M003', to_date('20240802', 'yyyymmdd'), '2000', 3);

insert into tbl_booking_01 values (20240001, 100001, '김철수', 'A01', '1');
insert into tbl_booking_01 values (20240002, 100001, '이영희', 'A02', '1');
insert into tbl_booking_01 values (20240003, 100002, '박민수', 'B05', '0');
insert into tbl_booking_01 values (20240004, 100003, '최지현', 'C10', '1');

commit;

-- s1
select
 booking_id as 예매번호
,s.screen_id as 상영ID
,m.movie_id as 영화ID
,title as 영화제목
,seat_no as 좌석번호
,case when boo.pay_status = '1' then '완납' else '미납' end as 결제상태
from tbl_movie_01 mv
join tbl_screening_01 scr
on m.movie_id = s.movie_id
join tbl_booking_01 boo
on s.screen_id = boo.screen_id
and boo.pay_status = '1';

select
    b.booking_id as 예매번호
    ,b.customer as 고객명
    ,b.seat_no as 좌석번호
    ,case when b.pay_status = '1' then '완납' else '미납' end as 결제상태
from
    tbl_movie_01 m
    ,tbl_screening_01 s
    ,tbl_booking_01 b
where
    m.movie_id = s.movie_id
    and s.screen_id = b.screen_id
    and m.title = '어벤져스 엔드게임'
order by
    b.booking_id;

select
    m.title as 영화제목
    ,count(*) as 예매건수
    ,sum(case when b.pay_status = '1' then 1 else 0 end) as 완납건수
    ,sum(case when b.pay_status = '0' then 1 else 0 end) as 미납건수
from
    tbl_movie_01 m
    ,tbl_screening_01 s
    ,tbl_booking_01 b
where
    m.movie_id = s.movie_id
    and s.screen_id = b.screen_id
group by
    m.title
order by
    m.title;

-- 2
drop table tbl_genre_02;
drop table tbl_showtime_02;
    
create table tbl_genre_02 (
    type_code char(2) not null primary key,
    type_name varchar2(20),
);

create table tbl_showtime_02 (
    movie_id char(4) not null,
    show_no number(3) not null,
    title varchar2(50),
    type_code char(2),
    show_date char(8),
    show_time char(4),
    show_day number(1),
    primary key (movie_id, show_no)
);

insert into tbl_genre_02 values ('AC', '액션');
insert into tbl_genre_02 values ('AN', '애니메이션');
insert into tbl_genre_02 values ('CR', '범죄');

insert into tbl_showtime_02 values ('M001', 1, '어벤져스 엔드게임', 'AC', '20240801', '1800', 4);
insert into tbl_showtime_02 values ('M002', 1, '인사이드 아웃 2', 'AN', '20240801', '1500', 4);
insert into tbl_showtime_02 values ('M003', 1, '범죄도시 4', 'CR', '20240802', '2000', 5);
insert into tbl_showtime_02 values ('M001', 2, '어벤져스 엔드게임', 'AC', '20240803', '1900', 6);
insert into tbl_showtime_02 values ('M002', 2, '인사이드 아웃 2', 'AN', '20240803', '1400', 6);

commit;

-- s2
select
    '[인기장르]' as 구분
    ,g.type_name as 장르명
    ,s.movie_id
    ,s.show_no
    ,s.title
    ,to_char(to_date(s.show_date, 'yyyymmdd'), 'yyyy-mm-dd') as 상영일자
    ,substr(s.show_time, 1, 2) || ':' || substr(s.show_time, 3, 2) as 상영시간
    ,decode(s.show_day, 1, '월요일', 2, '화요일', 3, '수요일', 4, '목요일', 5, '금요일', 6, '토요일', 7, '일요일') as 상영요일
from
    tbl_showtime_02 s
    ,tbl_genre_02 g
where
    s.type_code = g.type_code
    and s.movie_id = 'M002'
    and s.show_no = 1
union all
select
    null as 구분
    ,g.type_name as 장르명
    ,s.movie_id
    ,s.show_no
    ,s.title
    ,to_char(to_date(s.show_date, 'yyyymmdd'), 'yyyy-mm-dd') as 상영일자
    ,substr(s.show_time, 1, 2) || ':' || substr(s.show_time, 3, 2) as 상영시간
    ,decode(s.show_day, 1, '월요일', 2, '화요일', 3, '수요일', 4, '목요일', 5, '금요일', 6, '토요일', 7, '일요일') as 상영요일
from tbl_showtime_02 s, tbl_genre_02 g
where s.type_code = g.type_code
order by
    구분 desc nulls last
    ,상영일자
    ,상영시간;