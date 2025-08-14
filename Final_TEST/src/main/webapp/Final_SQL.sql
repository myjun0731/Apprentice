<--1회 홈쇼핑 회원관리-->
drop table member_tbl_9;
drop table money_tbl_9;
create table member_tbl_9 (
custno number(6) not null primary key,
custname varchar2(20),
phone varchar2(13),
address varchar2(60),
joindate date,
grade char(1),
city char(2)
);

create table money_tbl_9 (
custno number(6) not null,
saleno number(8) not null,
pcost number(8),
amount number(4),
price number(8),
pcode varchar2(4),
sdate date,
primary key(custno, saleno)
);

insert into member_tbl_9 values(100001, '김행복', '010-1111-2222', '서울 동대문구 휘경1동', '20151202', 'A', '01');
insert into member_tbl_9 values(100002, '이축복', '010-1111-3333', '서울 동대문구 휘경2동', '20151206', 'B', '01');
insert into member_tbl_9 values(100003, '장믿음', '010-1111-4444', '울릉군 울릉읍 독도1리', '20151201', 'B', '30');
insert into member_tbl_9 values(100004, '최사랑', '010-1111-5555', '울릉군 울릉읍 독도2리', '20151213', 'A', '30');
insert into member_tbl_9 values(100005, '진평화', '010-1111-6666', '제주도 제주시 외나무골', '20151225', 'B', '60');
insert into member_tbl_9 values(100006, '차공단', '010-1111-7777', '제주도 제주시 감나무골', '20151211', 'C', '60');


insert into money_tbl_9 values(100001, 20160001, 500, 5, 2500, 'A001','20160101');
insert into money_tbl_9 values(100001, 20160002, 1000, 4, 4000, 'A002','20160101');
insert into money_tbl_9 values(100001, 20160003, 500, 3, 1500, 'A008','20160101');
insert into money_tbl_9 values(100002, 20160004, 2000, 1, 2000, 'A004','20160102');
insert into money_tbl_9 values(100002, 20160005, 500, 1, 500, 'A001','20160103');
insert into money_tbl_9 values(100003, 20160006, 1500, 2, 3000, 'A003','20160103');
insert into money_tbl_9 values(100004, 20160007, 500, 2, 1000, 'A001','20160104');
insert into money_tbl_9 values(100004, 20160008, 300, 1, 300, 'A005','20160104');
insert into money_tbl_9 values(100004, 20160009, 600, 1, 600, 'A006','20160104');
insert into money_tbl_9 values(100004, 20160020, 3000, 1, 3000, 'A007','20160106');

<--2회 학생성적조회-->
create table member_tbl_10 (
id varchar2(5) not null primary key,
name varchar2(20),
gender varchar2(3)
);

create table score_tbl_10 (
id varchar2(5) not null primary key,
korean number(3),
english number(3),
math number(3),
history number(3)
);

insert into member_tbl_10 values('10301', '권기현', '남');
insert into member_tbl_10 values('10302', '구지우', '여');
insert into member_tbl_10 values('10303', '권태준', '남');
insert into member_tbl_10 values('10304', '금기연', '여');
insert into member_tbl_10 values('10305', '김영진', '남');
insert into member_tbl_10 values('10401', '김주현', '남');
insert into member_tbl_10 values('10402', '김태민', '여');
insert into member_tbl_10 values('10403', '임수민', '여');
insert into member_tbl_10 values('10404', '남상도', '남');
insert into member_tbl_10 values('10405', '조은호', '여');

insert into score_tbl_10 values('10301', 70, 80, 75, 95);
insert into score_tbl_10 values('10302', 80, 73, 80, 85);
insert into score_tbl_10 values('10303', 45, 75, 45, 75);
insert into score_tbl_10 values('10304', 65, 73, 65, 65);
insert into score_tbl_10 values('10305', 90, 100, 68, 95);
insert into score_tbl_10 values('10401', 95, 75, 84, 60);
insert into score_tbl_10 values('10402', 65, 70, 50, 94);
insert into score_tbl_10 values('10403', 80, 60, 100, 80);
insert into score_tbl_10 values('10404', 64, 50, 40, 65);
insert into score_tbl_10 values('10405', 55, 70, 80, 75);


<--3회 매장별 커피 판매 관리-->
drop table tbl_product_9;
drop table tbl_shop_9;
drop table tbl_salelist_9;
create table tbl_product_9 (
pcode varchar2(10) not null primary key,
name varchar2(20),
cost number(10)
);

create table tbl_shop_9 (
scode varchar2(10) not null primary key,
sname varchar2(20)
);

create table tbl_salelist_9 (
saleno number(10) not null primary key,
pcode varchar2(10) not null,
saledate date,
scode varchar2(10) not null,
amount varchar2(10)
);

insert into tbl_product_9 values('AA01', '아메리카노', 3000);
insert into tbl_product_9 values('AA02', '에스프레소', 3500);
insert into tbl_product_9 values('AA03', '카페라떼', 4000);
insert into tbl_product_9 values('AA04', '카라멜마끼', 4500);
insert into tbl_product_9 values('AA05', '카푸치노', 5000);
insert into tbl_product_9 values('AA06', '초코롤케익', 6000);
insert into tbl_product_9 values('AA07', '녹차롤케익', 6500);
insert into tbl_product_9 values('AA08', '망고쥬스', 7000);
insert into tbl_product_9 values('AA09', '핫초코', 2500);

insert into tbl_shop_9 values('S001', '강남점');
insert into tbl_shop_9 values('S002', '강서점');
insert into tbl_shop_9 values('S003', '강동점');
insert into tbl_shop_9 values('S004', '강북점');
insert into tbl_shop_9 values('S005', '동대문점');
insert into tbl_shop_9 values('S006', '인천점');

insert into tbl_salelist_9 values(100001, 'AA01', '20180902', 'S001', 50);
insert into tbl_salelist_9 values(100002, 'AA03', '20180902', 'S002', 40);
insert into tbl_salelist_9 values(100003, 'AA04', '20180902', 'S002', 20);
insert into tbl_salelist_9 values(100004, 'AA04', '20180902', 'S001', 30);
insert into tbl_salelist_9 values(100005, 'AA05', '20180902', 'S004', 40);
insert into tbl_salelist_9 values(100006, 'AA03', '20180902', 'S004', 30);
insert into tbl_salelist_9 values(100007, 'AA01', '20180902', 'S003', 40);
insert into tbl_salelist_9 values(100008, 'AA04', '20180902', 'S004', 10);
insert into tbl_salelist_9 values(100009, 'AA01', '20180902', 'S003', 20);
insert into tbl_salelist_9 values(100010, 'AA05', '20180902', 'S003', 30);
insert into tbl_salelist_9 values(100011, 'AA01', '20180902', 'S001', 40);
insert into tbl_salelist_9 values(100012, 'AA03', '20180902', 'S002', 50);
insert into tbl_salelist_9 values(100013, 'AA04', '20180902', 'S002', 50);
insert into tbl_salelist_9 values(100014, 'AA05', '20180902', 'S004', 20);
insert into tbl_salelist_9 values(100015, 'AA01', '20180902', 'S003', 30);


<--4회 환자검사-->
create table tbl_patient_9(
p_no char(4) not null primary key,
p_name varchar2(20),
p_birth char(8),
p_gender char(1),
p_tel1 char(3),
p_tel2 char(4),
p_tel3 char(4),
p_city char(2)
);

create table tbl_lab_test_9 (
t_code char(4) not null primary key,
t_name varchar2(20)
);

create table tbl_result_9(
p_no char(4) not null,
t_code char(4) not null,
t_sdate date not null,
t_status char(4),
t_ldate date,
t_result char(4),
primary key(p_no, t_code, t_sdate)
);

insert into tbl_patient_9 values('1001', '김환자', '19850301', 'M', '010', '2222', '0001', '10');
insert into tbl_patient_9 values('1002', '이환자', '19900301', 'M', '010', '2222', '0002', '20');
insert into tbl_patient_9 values('1003', '박환자', '19770301', 'F', '010', '2222', '0003', '30');
insert into tbl_patient_9 values('1004', '조환자', '19650301', 'F', '010', '2222', '0004', '10');
insert into tbl_patient_9 values('1005', '황환자', '19400301', 'M', '010', '2222', '0005', '40');
insert into tbl_patient_9 values('1006', '양환자', '19440301', 'F', '010', '2222', '0006', '40');
insert into tbl_patient_9 values('1007', '허환자', '19760301', 'F', '010', '2222', '0007', '10');

insert into tbl_lab_test_9 values('T001', '결핵');
insert into tbl_lab_test_9 values('T002', '장티푸스');
insert into tbl_lab_test_9 values('T003', '수두');
insert into tbl_lab_test_9 values('T004', '홍역');
insert into tbl_lab_test_9 values('T005', '콜레라');

insert into tbl_result_9 values('1001', 'T001', '20200101', '1', '20200102', 'X');
insert into tbl_result_9 values('1002', 'T002', '20200101', '2', '20200102', 'P');
insert into tbl_result_9 values('1003', 'T003', '20200101', '2', '20200102', 'N');
insert into tbl_result_9 values('1004', 'T004', '20200101', '2', '20200102', 'P');
insert into tbl_result_9 values('1005', 'T005', '20200101', '2', '20200102', 'P');
insert into tbl_result_9 values('1006', 'T001', '20200101', '2', '20200102', 'N');
insert into tbl_result_9 values('1007', 'T002', '20200101', '2', '20200102', 'P');
insert into tbl_result_9 values('1005', 'T003', '20200101', '2', '20200102', 'P');
insert into tbl_result_9 values('1006', 'T004', '20200101', '2', '20200102', 'N');
insert into tbl_result_9 values('1007', 'T005', '20200101', '2', '20200102', 'N');


<--5회 카페 프랜차이즈 관리-->
drop table sale_tbl_9;
drop table menu_tbl_9;
drop table size_tbl_9;
drop table store_tbl_9;
create table menu_tbl_9(
menu_cd varchar2(5) not null primary key,
menu_nm varchar2(30),
price number(8),
menu_fg char(1)
);

create table size_tbl_9(
size_cd varchar2(2) not null primary key,
size_nm varchar2(20),
plus_price varchar2(4)
);

create table store_tbl_9(
store_cd varchar2(4) not null primary key,
store_nm varchar2(20),
store_loc varchar(2),
open_date date
);

create table sale_tbl_9(
sale_ymd varchar2(8) not null,
sale_no varchar2(4) not null,
store_cd varchar2(4),
menu_cd varchar2(5),
size_cd varchar2(2),
sale_cnt number(3),
pay_type varchar2(2),
primary key(sale_ymd, sale_no),
foreign key(store_cd) references store_tbl_9(store_cd),
foreign key(menu_cd) references menu_tbl_9(menu_cd),
foreign key(size_cd) references size_tbl_9(size_cd)
);

insert into menu_tbl_9 values('10001', '아메리카노', 3600, '0');
insert into menu_tbl_9 values('10002', '카페 라떼', 4100, '0');
insert into menu_tbl_9 values('10003', '카페 모카', 4600, '0');
insert into menu_tbl_9 values('10004', '카라멜 마끼아또', 5100, '0');
insert into menu_tbl_9 values('10005', '호지 티 라떼', 5400, '1');
insert into menu_tbl_9 values('10006', '그린 티 라떼', 5400, '1');
insert into menu_tbl_9 values('10007', '차이 티 라떼', 4100, '1');

insert into size_tbl_9 values('S1', 'short', '0');
insert into size_tbl_9 values('T1', 'tall', '500');
insert into size_tbl_9 values('G1', 'grande', '1000');
insert into size_tbl_9 values('V1', 'venti', '1500');

insert into store_tbl_9 values('A001', '동부이촌동점', '0', '20181001');
insert into store_tbl_9 values('A002', '이태원점', '0', '20181101');
insert into store_tbl_9 values('A003', '서울타워점', '0', '20181201');
insert into store_tbl_9 values('B004', '소공동점', '1', '20180101');
insert into store_tbl_9 values('B005', '명동길점', '1', '20180201');
insert into store_tbl_9 values('B006', '충무로역점', '1', '20180301');

insert into sale_tbl_9 values('20190429', '0001', 'A001', '10001', 'T1', 4, '02');
insert into sale_tbl_9 values('20190429', '0002', 'B004', '10002', 'S1', 1, '02');
insert into sale_tbl_9 values('20190429', '0003', 'B004', '10006', 'S1', 1, '02');
insert into sale_tbl_9 values('20190429', '0004', 'A002', '10006', 'T1', 1, '01');
insert into sale_tbl_9 values('20190429', '0005', 'B005', '10001', 'G1', 1, '01');
insert into sale_tbl_9 values('20190429', '0006', 'B005', '10003', 'S1', 2, '02');
insert into sale_tbl_9 values('20190429', '0007', 'A003', '10002', 'T1', 3, '02');
insert into sale_tbl_9 values('20190429', '0008', 'B006', '10001', 'S1', 4, '02');

<--6회 지역구 의원 투표 관리 프로그램-->
drop table tbl_vote9;
drop table tbl_member_9;
drop table tbl_party_9;
create table tbl_vote9(
v_jumin char(13) not null primary key,
v_name varchar2(20),
m_no char(1),
v_time char(4),
v_area char(20),
v_confirm char(1)
);

create table tbl_member_9(
m_no char(1) not null primary key,
m_name varchar2(20),
p_code char(2),
p_school char(1),
m_jumin char(13),
m_city varchar2(20)
);

create table tbl_party_9(
p_code char(2) not null primary key,
p_name varchar2(20),
p_indate date,
p_reader varchar2(20),
p_tel1 char(3),
p_tel2 char(4),
p_tel3 char(4)
);

insert into tbl_vote9 values('99010110001', '김유권', '1', '0930', '제1투표장', 'N');
insert into tbl_vote9 values('89010120002', '이유권', '2', '0930', '제1투표장', 'N');
insert into tbl_vote9 values('69010110003', '박유권', '3', '0930', '제1투표장', 'Y');
insert into tbl_vote9 values('59010120004', '홍유권', '4', '0930', '제1투표장', 'Y');
insert into tbl_vote9 values('79010110005', '조유권', '5', '0930', '제1투표장', 'Y');
insert into tbl_vote9 values('89010120006', '최유권', '1', '0930', '제1투표장', 'Y');
insert into tbl_vote9 values('59010110007', '지유권', '1', '0930', '제1투표장', 'Y');
insert into tbl_vote9 values('49010120008', '장유권', '3', '0930', '제1투표장', 'Y');
insert into tbl_vote9 values('79010110009', '정유권', '3', '0930', '제1투표장', 'Y');
insert into tbl_vote9 values('89010120010', '강유권', '4', '0930', '제1투표장', 'Y');
insert into tbl_vote9 values('99010110011', '신유권', '5', '0930', '제1투표장', 'Y');
insert into tbl_vote9 values('79010120012', '오유권', '1', '1330', '제1투표장', 'Y');
insert into tbl_vote9 values('69010110013', '현유권', '4', '1330', '제2투표장', 'Y');
insert into tbl_vote9 values('89010110014', '왕유권', '2', '1330', '제2투표장', 'Y');
insert into tbl_vote9 values('99010110015', '유유권', '3', '1330', '제2투표장', 'Y');
insert into tbl_vote9 values('79010110016', '한유권', '2', '1330', '제2투표장', 'Y');
insert into tbl_vote9 values('88010110017', '문유권', '4', '1330', '제2투표장', 'Y');
insert into tbl_vote9 values('99010110018', '양유권', '2', '1330', '제2투표장', 'Y');
insert into tbl_vote9 values('99010110019', '구유권', '4', '1330', '제2투표장', 'Y');
insert into tbl_vote9 values('79010110020', '황유권', '5', '1330', '제2투표장', 'Y');
insert into tbl_vote9 values('69010110021', '배유권', '3', '1330', '제2투표장', 'Y');
insert into tbl_vote9 values('79010110022', '전유권', '3', '1330', '제2투표장', 'Y');
insert into tbl_vote9 values('99010110023', '고유권', '1', '1330', '제2투표장', 'Y');
insert into tbl_vote9 values('59010110024', '권유권', '3', '1330', '제2투표장', 'Y');

insert into tbl_member_9 values('1', '김후보', 'P1', '1', '6603011999991', '수선화동');
insert into tbl_member_9 values('2', '이후보', 'P2', '3', '5503011999992', '민들래동');
insert into tbl_member_9 values('3', '박후보', 'P3', '2', '7703011999993', '나팔꽃동');
insert into tbl_member_9 values('4', '조후보', 'P4', '2', '8803011999994', '진달래동');
insert into tbl_member_9 values('5', '최후보', 'P5', '3', '9903011999995', '개나리동');

insert into tbl_party_9 values('P1', 'A정당', '2010-01-01', '위대표', '02', '1111', '0001');
insert into tbl_party_9 values('P2', 'B정당', '2010-02-01', '명대표', '02', '1111', '0002');
insert into tbl_party_9 values('P3', 'C정당', '2010-03-01', '기대표', '02', '1111', '0003');
insert into tbl_party_9 values('P4', 'D정당', '2010-04-01', '옥대표', '02', '1111', '0004');
insert into tbl_party_9 values('P5', 'E정당', '2010-05-01', '임대표', '02', '1111', '0005');

<--7회 백신예약 프로그램-->
create table tbl_jumin_9(
jumin char(14) not null primary key,
pname varchar2(16),
tel varchar2(13),
address varchar2(10)
);

create table tbl_hosp_9(
hospcode char(4) not null primary key,
hospname varchar2(10),
hosptel varchar2(10),
hospaddr varchar2(10)
);

create table tbl_vaccresv_9(
resvno char(8) not null primary key,
jumin char(14),
vcode char(4),
hospcode char(4),
resvdate char(8),
resvtime char(4)
);

insert into tbl_jumin_9 values('700101-1000001', '김주민', '010-1234-0001', '서울');
insert into tbl_jumin_9 values('700101-2000002', '이주민', '010-1234-0002', '서울');
insert into tbl_jumin_9 values('700101-1000003', '박주민', '010-1234-0003', '서울');
insert into tbl_jumin_9 values('700101-2000004', '조주민', '010-1234-0004', '대전');
insert into tbl_jumin_9 values('700101-1000005', '홍주민', '010-1234-0005', '대전');
insert into tbl_jumin_9 values('700101-2000006', '나주민', '010-1234-0006', '대구');
insert into tbl_jumin_9 values('700101-1000007', '황주민', '010-1234-0007', '대구');
insert into tbl_jumin_9 values('700101-2000008', '용주민', '010-1234-0008', '광주');
insert into tbl_jumin_9 values('700101-1000009', '백주민', '010-1234-0009', '광주');
insert into tbl_jumin_9 values('700101-2000010', '송주민', '010-1234-0010', '광주');

insert into tbl_hosp_9 values('H001', '가-병원', '1588-0001', '서울');
insert into tbl_hosp_9 values('H002', '나-병원', '1588-0002', '대전');
insert into tbl_hosp_9 values('H003', '다-병원', '1588-0003', '대구');
insert into tbl_hosp_9 values('H004', '라-병원', '1588-0004', '광주');

insert into tbl_vaccresv_9 values('20210001', '700101-1000001', 'V001', 'H001', '20210901', '0920');
insert into tbl_vaccresv_9 values('20210002', '700101-2000002', 'V001', 'H002', '20210901', '1030');
insert into tbl_vaccresv_9 values('20210003', '700101-1000003', 'V002', 'H003', '20210902', '1130');
insert into tbl_vaccresv_9 values('20210004', '700101-2000004', 'V002', 'H001', '20210902', '1230');
insert into tbl_vaccresv_9 values('20210005', '700101-1000005', 'V002', 'H002', '20210902', '1330');
insert into tbl_vaccresv_9 values('20210006', '700101-2000006', 'V003', 'H003', '20210903', '1430');
insert into tbl_vaccresv_9 values('20210007', '700101-1000007', 'V003', 'H001', '20210903', '1530');
insert into tbl_vaccresv_9 values('20210008', '700101-2000008', 'V003', 'H002', '20210903', '1630');
insert into tbl_vaccresv_9 values('20210009', '700101-1000009', 'V003', 'H003', '20210904', '1730');
insert into tbl_vaccresv_9 values('20210010', '700101-2000010', 'V003', 'H001', '20210904', '1830');




<--9회 편의점 매출관리-->
drop table sale_tbl_10;
drop table tbl_goods_10;
drop table store_tbl_10;
create table tbl_goods_10(
goods_cd number(6) not null primary key,
goods_nm varchar2(30),
goods_price number(8),
cost number(8),
in_date date
);

create table store_tbl_10(
store_cd varchar2(5) not null primary key,
store_nm varchar2(20),
store_fg varchar2(1)
); 

create table sale_tbl_10(
sale_no varchar2(4) not null primary key,
sale_ymd date not null,
sale_fg varchar2(1) not null,
store_cd varchar2(5),
goods_cd number(6),
sale_cnt number(3),
pay_type varchar2(2),
foreign key(store_cd) references store_tbl_10(store_cd),
foreign key(goods_cd) references tbl_goods_10(goods_cd)
);

insert into tbl_goods_10 values(110001, '라면', 1050, 750, '20190302');
insert into tbl_goods_10 values(110002, '빵', 1300, 800, '20190302');
insert into tbl_goods_10 values(110003, '과자', 2000, 1700, '20190302');
insert into tbl_goods_10 values(110004, '탄산음료', 900, 750, '20190302');
insert into tbl_goods_10 values(110005, '삼각김밥', 750, 300, '20190302');
insert into tbl_goods_10 values(110006, '초콜릿', 1500, 1300, '20190302');
insert into tbl_goods_10 values(110007, '우유', 850, 600, '20190302');

insert into store_tbl_10 values('A001', '이태원점', '0');
insert into store_tbl_10 values('A002', '한남점', '0');
insert into store_tbl_10 values('A003', '도원점', '0');
insert into store_tbl_10 values('B001', '혜화점', '1');
insert into store_tbl_10 values('C001', '방배점', '1');
insert into store_tbl_10 values('D001', '사당점', '0');
insert into store_tbl_10 values('D002', '흑석점', '1');
insert into store_tbl_10 values('E001', '금호점', '0');

insert into sale_tbl_10 values('0001', '20190325', '1', 'A001', 110001, 2, '02');
insert into sale_tbl_10 values('0002', '20190325', '1', 'B001', 110003, 2, '02');
insert into sale_tbl_10 values('0003', '20190325', '1', 'D001', 110003, 1, '01');
insert into sale_tbl_10 values('0004', '20190325', '1', 'A001', 110006, 5, '02');
insert into sale_tbl_10 values('0005', '20190325', '1', 'C001', 110003, 2, '02');
insert into sale_tbl_10 values('0006', '20190325', '2', 'C001', 110003, 2, '02');
insert into sale_tbl_10 values('0007', '20190325', '1', 'A002', 110005, 4, '02');
insert into sale_tbl_10 values('0008', '20190325', '1', 'A003', 110004, 4, '02');
insert into sale_tbl_10 values('0009', '20190325', '1', 'B001', 110001, 2, '01');
insert into sale_tbl_10 values('0010', '20190325', '1', 'A002', 110006, 1, '02');

<--골프장관리 -->
drop table TBL_TEACHER_9;
drop table TBL_MEMBER_9;
drop table TBL_CLASS_9;
CREATE TABLE TBL_TEACHER_9(
TEACHER_CODE CHAR(3) NOT NULL PRIMARY KEY,
TEACHER_NAME VARCHAR2(15),
CLASS_NAME VARCHAR2(20),
CLASS_PRICE NUMBER(8),
TEACHER_REGIST_DATE VARCHAR2(8)
);

CREATE TABLE TBL_MEMBER_9(
C_NO CHAR(5) NOT NULL PRIMARY KEY,
C_NAME VARCHAR2(15),
PHONE VARCHAR2(11),
ADDRESS VARCHAR2(50),
GRADE VARCHAR2(6)
);

CREATE TABLE TBL_CLASS_9(
REGIST_MONTH VARCHAR2(6),
C_NO CHAR(5),
CLASS_AREA VARCHAR2(15),
TUITION NUMBER(8),
TEACHER_CODE CHAR(3),
PRIMARY KEY (REGIST_MONTH, C_NO)
);

INSERT INTO TBL_TEACHER_9 VALUES('100','이초급','초급반',100000,'20220101');
INSERT INTO TBL_TEACHER_9 VALUES('200','김중급','중급반',200000,'20220102');
INSERT INTO TBL_TEACHER_9 VALUES('300','박고급','고급반',300000,'20220103');
INSERT INTO TBL_TEACHER_9 VALUES('400','정심화','심화반',400000,'20220104');

INSERT INTO TBL_MEMBER_9 VALUES('10001','홍길동','01011112222','서울시 강남구','일반');
INSERT INTO TBL_MEMBER_9 VALUES('10002','장발장','01022223333','성남시 분당구','일반');
INSERT INTO TBL_MEMBER_9 VALUES('10003','임꺽정','01033334444','대전시 유성구','일반');
INSERT INTO TBL_MEMBER_9 VALUES('20001','성춘향','01044445555','부산시 서구','VIP');
INSERT INTO TBL_MEMBER_9 VALUES('20002','이몽룡','01055556666','대구시 북구','VIP');

INSERT INTO TBL_CLASS_9 VALUES('202203','10001','서울본원',100000,'100');
INSERT INTO TBL_CLASS_9 VALUES('202203','10002','성남분원',100000,'100');
INSERT INTO TBL_CLASS_9 VALUES('202203','10003','대전분원',200000,'200');
INSERT INTO TBL_CLASS_9 VALUES('202203','20001','부산분원',150000,'300');
INSERT INTO TBL_CLASS_9 VALUES('202203','20002','대구분원',200000,'400');



<--성적관리 -->
drop table tbl_student_9;
drop table tbl_subject_9;
drop table tbl_grade_9;

create table tbl_student_9(
studentid char(8) not null primary key,
studentname varchar2(20),
majorcode char(2),
jumin varchar2(14),
phone varchar2(13),
course char(2)
);

create table tbl_subject_9(
subjectcode char(4) not null primary key,
subjectname varchar2(40),
professorname varchar2(20),
classifcation char(2)
);

create table tbl_grade_9(
studentid char(8) not null,
subjectcode char(4),
mid number(3),
final number(3),
attend number(3),
report number(3),
etc number(3),
primary key(studentid, subjectcode)
);

insert into tbl_student_9 values('20220001', '김길동', '03', '030101-3000001', '010-1111-0001', 'BD');
insert into tbl_student_9 values('20220002', '이길동', '03', '030101-3000002', '010-1111-0002', 'BD');
insert into tbl_student_9 values('20220003', '박길동', '03', '030101-3000003', '010-1111-0003', 'BD');
insert into tbl_student_9 values('20220004', '정길동', '03', '030101-4000004', '010-1111-0004', 'BD');
insert into tbl_student_9 values('20220005', '최길동', '03', '030101-4000005', '010-1111-0005', 'BD');
insert into tbl_student_9 values('20220006', '황길동', '03', '030101-4000006', '010-1111-0006', 'BD');

insert into tbl_subject_9 values('S001', '메타버스의이해', '김교수', '02');
insert into tbl_subject_9 values('S002', '게임엔진기초', '이교수', '01');
insert into tbl_subject_9 values('S003', '게임엔진심화', '박교수', '01');
insert into tbl_subject_9 values('S004', '인문학개론', '정교수', '04');

insert into tbl_grade_9 values('20220001','S001',70,80,100,100,90);
insert into tbl_grade_9 values('20220001','S002',80,85,100,90,90);
insert into tbl_grade_9 values('20220001','S003',70,80,100,100,100);
insert into tbl_grade_9 values('20220002','S001',70,80,90,90,100);
insert into tbl_grade_9 values('20220002','S002',60,70,100,90,100);
insert into tbl_grade_9 values('20220002','S003',70,70,100,100,90);
insert into tbl_grade_9 values('20220003','S001',90,90,90,100,100);
insert into tbl_grade_9 values('20220003','S002',90,85,100,100,100);
insert into tbl_grade_9 values('20220003','S003',100,100,100,90,100);
insert into tbl_grade_9 values('20220004','S004',90,90,90,90,90);


<--오디션 관리 -->
create table tbl_artist_9(
artist_id char(4) not null primary key,
artist_name varchar2(20),
artist_birth char(8),
artist_gender char(1),
talent char(1),
agency varchar2(30)
);

create table tbl_mento_9(
mento_id char(4) not null primary key,
mento_name varchar2(20)
);

create table tbl_point_9(
serial_no number(8) not null primary key,
artist_id char(4),
mento_id char(4),
point number(3)
);

insert into tbl_artist_9 values('AA01', '김스타', '19970101', 'F', '1', 'A엔터테이먼트');
insert into tbl_artist_9 values('AA02', '조스타', '19980201', 'M', '2', 'B엔터테이먼트');
insert into tbl_artist_9 values('AA03', '왕스타', '19900301', 'M', '3', 'C엔터테이먼트');
insert into tbl_artist_9 values('AA04', '정스타', '20000401', 'M', '1', 'D엔터테이먼트');
insert into tbl_artist_9 values('AA05', '홍스타', '20010501', 'F', '2', 'E엔터테이먼트');

insert into tbl_mento_9 values('J001', '함멘토');
insert into tbl_mento_9 values('J002', '박멘토');
insert into tbl_mento_9 values('J003', '장멘토');

insert into tbl_point_9 values(2019001, 'AA01', 'J001', 78);
insert into tbl_point_9 values(2019002, 'AA01', 'J002', 76);
insert into tbl_point_9 values(2019003, 'AA01', 'J003', 70);
insert into tbl_point_9 values(2019004, 'AA02', 'J001', 80);
insert into tbl_point_9 values(2019005, 'AA02', 'J002', 72);
insert into tbl_point_9 values(2019006, 'AA02', 'J003', 78);
insert into tbl_point_9 values(2019007, 'AA03', 'J001', 90);
insert into tbl_point_9 values(2019008, 'AA03', 'J002', 92);
insert into tbl_point_9 values(2019009, 'AA03', 'J003', 88);
insert into tbl_point_9 values(2019010, 'AA04', 'J001', 96);
insert into tbl_point_9 values(2019011, 'AA04', 'J002', 90);
insert into tbl_point_9 values(2019012, 'AA04', 'J003', 98);
insert into tbl_point_9 values(2019013, 'AA05', 'J001', 88);
insert into tbl_point_9 values(2019014, 'AA05', 'J002', 86);
insert into tbl_point_9 values(2019015, 'AA05', 'J003', 86);


<--타자 성적관리 -->
create table tbl_player_info_9(
registration_code char(4) not null primary key,
name varchar2(18),
birth_day varchar2(8),
height number(3),
weight number(3)
);

create table tbl_hitter_info_9(
registration_code char(4) not null primary key,
game_numbers number(3),
appearance number(3),
hit_numbers number(3),
home_runs number(3),
put_out number(3),
double_play number(3),
error_count number(3)
);

insert into tbl_player_info_9 values('A001', '김길동', '19900101', 180, 82);
insert into tbl_player_info_9 values('A005', '이길동', '20000101', 190, 85);
insert into tbl_player_info_9 values('B002', '홍길동', '19950101', 175, 75);
insert into tbl_player_info_9 values('B006', '조길동', '19950101', 185, 80);

insert into tbl_hitter_info_9 values('A001', 120, 330, 100, 20, 80, 27, 1);
insert into tbl_hitter_info_9 values('A005', 110, 300, 110, 30, 60, 5, 2);
insert into tbl_hitter_info_9 values('B002', 100, 270, 90, 5, 100, 10, 3);


<--피자매출 관리 -->
create table tbl_pizza_9(
pcode char(4) not null primary key,
pname varchar2(30),
cost number(7)
);

create table tbl_shop_9(
scode char(4) not null primary key,
sname varchar2(20)
);

create table tbl_salelist_9(
saleno number(7) not null primary key,
scode char(4) not null,
saledate date,
pcode char(4) not null,
amount number(5),
foreign key(scode) references tbl_shop_9(scode),
foreign key(pcode) references tbl_pizza_9(pcode)
);

insert into tbl_pizza_9 values('AA01', '고르곤졸라피자', 6000);
insert into tbl_pizza_9 values('AA02', '치즈피자', 6500);
insert into tbl_pizza_9 values('AA03', '페퍼로니피자', 7000);
insert into tbl_pizza_9 values('AA04', '콤비네이션피자', 7500);
insert into tbl_pizza_9 values('AA05', '고구마피자', 6000);
insert into tbl_pizza_9 values('AA06', '포테이토피자', 7000);
insert into tbl_pizza_9 values('AA07', '불고기피자', 8000);
insert into tbl_pizza_9 values('AA08', '나폴리피자', 8000);

insert into tbl_shop_9 values('S001', '강남점');
insert into tbl_shop_9 values('S002', '강서점');
insert into tbl_shop_9 values('S003', '강동점');
insert into tbl_shop_9 values('S004', '영동점');
insert into tbl_shop_9 values('S005', '시청점');
insert into tbl_shop_9 values('S006', '인천점');

insert into tbl_salelist_9 values(100001, 'S001', '2018-12-02', 'AA01', 50);
insert into tbl_salelist_9 values(100002, 'S001', '2018-12-02', 'AA02', 30);
insert into tbl_salelist_9 values(100003, 'S001', '2018-12-02', 'AA03', 20);
insert into tbl_salelist_9 values(100004, 'S001', '2018-12-02', 'AA04', 50);
insert into tbl_salelist_9 values(100005, 'S003', '2018-12-03', 'AA01', 40);
insert into tbl_salelist_9 values(100006, 'S003', '2018-12-03', 'AA02', 60);
insert into tbl_salelist_9 values(100007, 'S003', '2018-12-03', 'AA04', 60);
insert into tbl_salelist_9 values(100008, 'S003', '2018-12-04', 'AA05', 70);
insert into tbl_salelist_9 values(100009, 'S005', '2018-12-02', 'AA01', 80);
insert into tbl_salelist_9 values(100010, 'S005', '2018-12-02', 'AA03', 30);
insert into tbl_salelist_9 values(100011, 'S005', '2018-12-02', 'AA04', 40);
insert into tbl_salelist_9 values(100012, 'S005', '2018-12-02', 'AA05', 50);
insert into tbl_salelist_9 values(100013, 'S004', '2018-12-04', 'AA01', 30);
insert into tbl_salelist_9 values(100014, 'S004', '2018-12-04', 'AA02', 20);
insert into tbl_salelist_9 values(100015, 'S004', '2018-12-04', 'AA06', 50);
