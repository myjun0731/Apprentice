drop table tbl_point_201905;
drop table tbl_mento_201905;
drop table tbl_artist_201905;

create table tbl_artist_201905(
artist_id char(4) not null Primary key,
artist_name varchar2(20),
artist_birth char(8),
artist_gender char(1),
talent char(1),
agency varchar(30)
);

insert into tbl_artist_201905 values('AA01','김스타','19970101','F','1','A엔터테이먼트');
insert into tbl_artist_201905 values('AA02','조스타','19980201','M','2','B엔터테이먼트');
insert into tbl_artist_201905 values('AA03','왕스타','19900301','M','3','C엔터테이먼트');
insert into tbl_artist_201905 values('AA04','정스타','20000401','M','1','D엔터테이먼트');
insert into tbl_artist_201905 values('AA05','홍스타','20010501','F','2','E엔터테이먼트');

create table tbl_mento_201905(
mento_id char(4) not null Primary key,
mento_name varchar2(20)
);

insert into tbl_mento_201905 values('J001','함멘토');
insert into tbl_mento_201905 values('J002','박멘토');
insert into tbl_mento_201905 values('J003','장멘토');

create table tbl_point_201905(
serial_no number(8) not null Primary key,
artist_id char(4),
mento_id char(4),
point number(3)
);

insert into tbl_point_201905 values(2019001,'AA01','J001',78);
insert into tbl_point_201905 values(2019002,'AA01','J002',76);
insert into tbl_point_201905 values(2019003,'AA01','J003',70);
insert into tbl_point_201905 values(2019004,'AA02','J001',80);
insert into tbl_point_201905 values(2019005,'AA02','J002',72);
insert into tbl_point_201905 values(2019006,'AA02','J003',78);
insert into tbl_point_201905 values(2019007,'AA03','J001',90);
insert into tbl_point_201905 values(2019008,'AA03','J002',92);
insert into tbl_point_201905 values(2019009,'AA03','J003',88);
insert into tbl_point_201905 values(2019010,'AA04','J001',96);
insert into tbl_point_201905 values(2019011,'AA04','J002',90);
insert into tbl_point_201905 values(2019012,'AA04','J003',98);
insert into tbl_point_201905 values(2019013,'AA05','J001',88);
insert into tbl_point_201905 values(2019014,'AA05','J002',86);
insert into tbl_point_201905 values(2019015,'AA05','J003',86);

select artist_id,
artist_name,
subStr(artist_birth, 0,4),subStr(artist_birth, 5,2),subStr(artist_birth, 7,2),
decode(artist_gender, 'M', '남', 'F','여'),
decode(talent, '1','보컬', '2','댄스', '3','랩'),
agency
from tbl_artist_201905

select po.serial_no,
ar.artist_id,
ar.artist_name,
subStr(ar.artist_birth, 0,4),subStr(ar.artist_birth, 5,2),subStr(ar.artist_birth, 7,2),
po.point,
me.mento_name
from tbl_artist_201905 ar, tbl_point_201905 po, tbl_mento_201905 me
where ar.artist_id = po.artist_id and me.mento_id = po.mento_id;

select
ar.artist_id,
ar.artist_name,
sum(po.point),
to_char(sum(po.point)/count(*), '999.99'),
row_number() over(order by sum(po.point) DESC)
from tbl_artist_201905 ar, tbl_point_201905 po, tbl_mento_201905 me
where ar.artist_id = po.artist_id and me.mento_id = po.mento_id
group by ar.artist_id, ar.artist_name;