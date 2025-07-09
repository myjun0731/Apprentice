drop table TBL_PATIENT_202004;
drop table tbl_lab_test_202004;
drop table tbl_result_202004;

create table TBL_PATIENT_202004 (
p_no CHAR(4) NOT NULL PRIMARY KEY,
p_name VARCHAR2(20),
p_birth CHAR(8),
p_gender CHAR(1),
p_tel1 CHAR(3),
p_tel2 CHAR(4),
p_tel3 CHAR(4),
p_city CHAR(2)
);

insert into TBL_PATIENT_202004 values ('1001', '김환자', '19850301', 'M', '010', '2222', '0001', '10');
insert into TBL_PATIENT_202004 values ('1002', '이환자', '19891010', 'F', '010', '2222', '0002', '20');
insert into TBL_PATIENT_202004 values ('1003', '박환자', '19770301', 'M', '010', '2222', '0003', '30');
insert into TBL_PATIENT_202004 values ('1004', '조환자', '19650505', 'F', '010', '2222', '0004', '10');
insert into TBL_PATIENT_202004 values ('1005', '황환자', '19881212', 'M', '010', '2222', '0005', '40');
insert into TBL_PATIENT_202004 values ('1006', '양환자', '19760301', 'F', '010', '2222', '0006', '40');
insert into TBL_PATIENT_202004 values ('1007', '허환자', '19760301', 'F', '010', '2222', '0006', '10');

create table tbl_lab_test_202004 (
t_code CHAR(4) NOT NULL PRIMARY KEY,
t_name VARCHAR2(20)
);

insert into tbl_lab_test_202004 values ('T001', '결핵');
insert into tbl_lab_test_202004 values ('T002', '장티푸스');
insert into tbl_lab_test_202004 values ('T003', '수두');
insert into tbl_lab_test_202004 values ('T004', '홍역');
insert into tbl_lab_test_202004 values ('T005', '콜레라');

create table tbl_result_202004 (
p_no CHAR(4) NOT NULL,
t_code CHAR(4) NOT NULL,
sdate CHAR(8) NOT NULL,
t_status CHAR(1),
ldate DATE,
t_result CHAR(1),
primary key (p_no, t_code, sdate)
);

insert into tbl_result_202004 values (1001, 'T001', '20200101', 1, '20200102', 'X');
insert into tbl_result_202004 values (1002, 'T002', '20200101', 2, '20200102', 'P');
insert into tbl_result_202004 values (1003, 'T003', '20200101', 2, '20200102', 'N');
insert into tbl_result_202004 values (1004, 'T004', '20200101', 2, '20200102', 'P');
insert into tbl_result_202004 values (1005, 'T005', '20200101', 2, '20200102', 'P');
insert into tbl_result_202004 values (1006, 'T001', '20200101', 2, '20200102', 'N');
insert into tbl_result_202004 values (1007, 'T002', '20200101', 2, '20200102', 'P');
insert into tbl_result_202004 values (1005, 'T003', '20200101', 2, '20200102', 'P');
insert into tbl_result_202004 values (1006, 'T004', '20200101', 2, '20200102', 'N');
insert into tbl_result_202004 values (1007, 'T005', '20200101', 2, '20200102', 'P');
commit;

select
p_no as "환자 코드",
p_name as "환자 이름",
substr(p_birth, 1, 4) || '년' ||
substr(p_birth, 5, 2) || '월' ||
substr(p_birth, 7, 2) || '일' as "환자 생년월일",
case p_gender
when 'M' then '남'
when 'F' then '여'
end as "환자 성별",
p_tel1 || '-' || p_tel2 || '-' || p_tel3 as "환자 전화번호",
case p_city
when '10' then '서울'
when '20' then '경기'
when '30' then '강원'
when '40' then '대구'
end as "환자 거주지"
from TBL_PATIENT_202004
order by p_no;

select
r.p_no as "환자 코드",
p.p_name as "환자 이름",
t.t_name as "검사 명",
to_char(to_date(r.sdate, 'YYYYMMDD'), 'YYYY-MM-DD') as "검사 시작일",
case r.t_status
when '1' then '검사중'
when '2' then '검사완료'
else '상태없음'
end as "검사 상태",
to_char(r.ldate, 'YYYY-MM-DD') as "검사 완료일",
case r.t_result
when 'X' then '미입력'
when 'P' then '양성'
when 'N' then '음성'
else '미입력'
end as "검사 결과"
from
tbl_result_202004 r,
TBL_PATIENT_202004 p,
tbl_lab_test_202004 t
where
r.p_no = p.p_no and r.t_code = t.t_code
order by
r.p_no;


SELECT
    P.p_city,
    CASE P.p_city
        WHEN '10' THEN '서울'
        WHEN '20' THEN '경기'
        WHEN '30' THEN '강원'
        WHEN '40' THEN '대구'
        ELSE '기타'
    END AS "지역명",
    COUNT(R.p_no)
FROM
    TBL_PATIENT_202004 P,
    TBL_RESULT_202004 R
WHERE
    P.p_no = R.p_no
GROUP BY
    P.p_city
ORDER BY
    P.p_city;
    
