drop table tbl_player_info;
drop table tbl_hitter_info;

create table tbl_player_info (
    registration_code char(4) not null primary key,
    name varchar2(18),
    birth_day varchar2(8),
    height number(3),
    weight number(3)
);

insert into tbl_player_info values ('A001', '김길동', '19900101', 180, 82);
insert into tbl_player_info values ('A005', '이길동', '20000101', 190, 85);
insert into tbl_player_info values ('B002', '홍길동', '19950101', 175, 75);
insert into tbl_player_info values ('B006', '조길동', '19950101', 185, 80);

create table tbl_hitter_info (
    registration_code char(4) not null primary key,
    game_numbers number(3),
    appearance number(3),
    hit_numbers number(3),
    home_runs number(3),
    put_out number(3),
    double_play number(3),
    error_count number(3)
);

insert into tbl_hitter_info values ('A001', 120, 330, 100, 20, 80, 27, 1);
insert into tbl_hitter_info values ('A005', 110, 300, 110, 30, 60, 5, 2);
insert into tbl_hitter_info values ('B002', 100, 270, 90, 5, 100, 10, 3);

commit;

select
p.registration_code,
p.name,
subStr(p.birth_day, 1, 4) || '년' ||
subStr(p.birth_day, 7, 5) || '월' ||
subStr(p.birth_day, 7, 8) || '일',
p.height,
p.weight,
((((((h.appearance+h.home_runs)/h.hit_numbers)*100)+home_runs) + (h.put_out+(h.double_play*2)-h.error_count*5)))/2,
decode(subStr(p.registration_code, 0,1), 'A', '1군', 'B', '2군'),
row_number() over(order by ((((h.appearance+h.home_runs)/h.hit_numbers)*100) + (h.put_out+(h.double_play*2)-h.error_count*5)) desc)
from
tbl_player_info p,
tbl_hitter_info h
where p.registration_code = h.registration_code

select
p.registration_code,
p.name,
h.game_numbers,
h.appearance,
h.hit_numbers,
h.home_runs,
to_char((((h.appearance+h.hit_numbers)/h.hit_numbers)*100) +100,'999.99'),
h.put_out,
h.double_play,
h.error_count,
h.put_out+(h.double_play*2)-(h.error_count*5)
from
tbl_player_info p,
tbl_hitter_info h
where p.registration_code = h.registration_code

--
((((h.appearance+h.home_runs)/h.hit_numbers)*100) + (h.put_out+(h.double_play*2)-h.error_count*5))