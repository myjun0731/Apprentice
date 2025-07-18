drop table tbl_student_202205;
drop table tbl_subject_202205;
drop table tbl_grade_202205;

create table tbl_student_202205 (
	studentid char(8) not null Primary key,
	studentname varchar2(20),
	majorcode char(2),
	jumin varchar2(14),
	phone varchar2(13),
	course char(2)
);

insert into tbl_student_202205 values('20220001','김길동','03','030101-3000001','010-1111-0001','BD');
insert into tbl_student_202205 values('20220002','이길동','03','030101-3000002','010-1111-0002','BD');
insert into tbl_student_202205 values('20220003','박길동','03','030101-3000003','010-1111-0003','BD');
insert into tbl_student_202205 values('20220004','정길동','03','030101-4000004','010-1111-0004','BD');
insert into tbl_student_202205 values('20220005','최길동','03','030101-4000005','010-1111-0005','BD');
insert into tbl_student_202205 values('20220006','황길동','03','030101-3000006','010-1111-0006','BD');


create table tbl_subject_202205 (
	subjectcode char(4) not null Primary key,
	subjectname varchar2(40),
	professorname varchar2(20),
	classification char(2)
);

insert into tbl_subject_202205 values('S001','메타버스의이해','김교수','02');
insert into tbl_subject_202205 values('S002','게임엔진기초','이교수','01');
insert into tbl_subject_202205 values('S003','게임엔진심화','박교수','01');
insert into tbl_subject_202205 values('S004','인문학개론','정교수','04');

create table tbl_grade_202205 (
	studentid char(8) not null,
	subjectcode char(4),
	mid number(3),
	final number(3),
	attend number(3),
	report number(3),
	etc number(3),
	Primary key(studentid, subjectcode)
);

insert into tbl_grade_202205 values('20220001','S001','70','80','100','100','90');
insert into tbl_grade_202205 values('20220001','S002','80','85','100','90','90');
insert into tbl_grade_202205 values('20220001','S003','70','80','100','100','100');
insert into tbl_grade_202205 values('20220002','S001','70','80','90','90','100');
insert into tbl_grade_202205 values('20220002','S002','60','70','100','90','100');
insert into tbl_grade_202205 values('20220002','S003','70','70','100','100','90');
insert into tbl_grade_202205 values('20220003','S001','90','90','90','100','100');
insert into tbl_grade_202205 values('20220003','S002','90','85','100','100','100');
insert into tbl_grade_202205 values('20220003','S003','100','100','100','90','100');
insert into tbl_grade_202205 values('20220004','S004','90','90','90','90','90');

select
decode(st.course, 'AD','전문학사','BD','학사','MD','석사','DD','박사'),
st.studentid,
st.studentname,
count(st.studentname) || '과목',
round(sum(gr.mid*0.3 + gr.final*0.3 + gr.attend*0.2 + gr.report*0.1 + gr.etc*0.1)),
to_char(round(sum(gr.mid*0.3 + gr.final*0.3 + gr.attend*0.2 + gr.report*0.1 + gr.etc*0.1), 1) / count(st.studentname), '99.9')
from
tbl_grade_202205 gr,
tbl_student_202205 st
where gr.studentid = st.studentid
group by
st.course,
st.studentid,
st.studentname
order by st.studentid desc;

select
st.studentid,
st.studentname,
decode(subStr(st.jumin, 8,1), '3','남','2','여', '4','여'),
sub.subjectname,
decode(sub.classification, '01','전공필수', '02','전공선택','03','교양필수','04','교양선택'),
sub.professorname,
gr.mid,
gr.final,
gr.attend,
gr.report,
gr.etc,
to_char(gr.mid*0.3 + gr.final*0.3 + gr.attend*0.2 + gr.report*0.1 + gr.etc*0.1, '9999.9'),
to_char(gr.mid*0.3 + gr.final*0.3 + gr.attend*0.2 + gr.report*0.1 + gr.etc*0.1,'999')
from
tbl_grade_202205 gr,
tbl_subject_202205 sub,
tbl_student_202205 st
where gr.studentid = st.studentid and gr.subjectcode = sub.subjectcode
order by st.studentid;