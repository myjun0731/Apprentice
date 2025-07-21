drop table member_tbl_01;
drop table score_tbl_01;

create table member_tbl_01 (
id varchar2(5) not null primary key,
name varchar2(20),
gender varchar2(3)
);

create table score_tbl_01 (
id varchar2(5) not null primary key,
korean number(3),
english number(3),
math number(3),
history number(3)
);

insert into member_tbl_01 values('10301', '권기현', '남');
insert into member_tbl_01 values('10302', '구지우', '여');
insert into member_tbl_01 values('10303', '권태준', '남');
insert into member_tbl_01 values('10304', '금기연', '여');
insert into member_tbl_01 values('10305', '김영진', '남');
insert into member_tbl_01 values('10401', '김주현', '남');
insert into member_tbl_01 values('10402', '김태민', '여');
insert into member_tbl_01 values('10403', '임수민', '여');
insert into member_tbl_01 values('10404', '남상도', '남');
insert into member_tbl_01 values('10405', '조은호', '여');

insert into score_tbl_01 values('10301', 70, 80, 75, 95);
insert into score_tbl_01 values('10302', 80, 73, 80, 85);
insert into score_tbl_01 values('10303', 45, 75, 45, 75);
insert into score_tbl_01 values('10304', 65, 73, 65, 65);
insert into score_tbl_01 values('10305', 90, 100, 68, 95);
insert into score_tbl_01 values('10401', 95, 75, 84, 60);
insert into score_tbl_01 values('10402', 65, 70, 50, 94);
insert into score_tbl_01 values('10403', 80, 60, 100, 80);
insert into score_tbl_01 values('10404', 64, 50, 40, 65);
insert into score_tbl_01 values('10405', 55, 70, 80, 75);

commit;

select
id,
name,
subStr(id, 0,1),
subStr(id, 3,2),
subStr(id, 4,2),
gender
from member_tbl_01;


select
met.id,
met.name,
subStr(met.id, 0,1),
subStr(met.id, 3,2),
subStr(met.id, 4,2),
met.gender,
korean,
math,
english,
history,
sum(korean + math + english + history),
sum(korean + math + english + history)/4,
row_number() over(order by sum(korean + math + english + history))
from member_tbl_01 met, score_tbl_01 sco
where met.id = sco.id
group by
met.id,
met.name,
met.gender,
korean,
math,
english,
history

select
sum(korean),
sum(math),
sum(english),
sum(history),
to_char(sum(korean + math + english + history), '99999.9'),
avg(korean + math + english + history)
from score_tbl_01 sco