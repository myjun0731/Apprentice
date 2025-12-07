
/* ------------------------------------------------------------
   1. 문제 1-5: 완납한 수강생 리스트 조회
   - 수강증번호 순서로 정렬
   - 결제상태가 '1'인 데이터만 조회
   - 교시는 숫자 뒤에 '교시' 문자열 추가
   - 결제상태는 '완납'으로 변환
   ------------------------------------------------------------ */
select
    sl.recpno as 수강증번호,
    sl.sno as 수강생번호,
    st.name as 성명,
    sb.subname as 강좌명,
    sl.classno || '교시' as 교시,
    case sl.mstatus 
        when '1' then '완납' 
        else '미납' 
    end as 결제상태
from tbl_sublist_04 sl
join tbl_student_04 st
  on sl.sno = st.sno
join tbl_subject_04 sb
  on sl.subcode = sb.subcode
where sl.mstatus = '1'
order by sl.recpno asc;


/* ------------------------------------------------------------
   3. 문제 1-6: 영어초급반 출석부 조회
   - 강좌코드가 'E001'(영어초급)인 경우만 조회
   - 결제상태가 '완납'인 경우만 조회
   - 수강증번호 순서로 정렬
   ------------------------------------------------------------ */
select
	sb.subname as 강좌명,
    sl.classno || '교시' as 교시,
    sb.ROOM as 강의실,
    sl.recpno as 수강증번호,
    st.name as 성명,
    case sl.mstatus
        when '1' then '완납'
        else '미납'
    end as 결제상태
from tbl_sublist_04 sl
join tbl_student_04 st
  on sl.sno = st.sno
join tbl_subject_04 sb
  on sl.subcode = sb.subcode
where sl.subcode = 'E001'
  and sl.mstatus = '1'
order by sl.recpno asc;


/* ------------------------------------------------------------
   4. 문제 1-7: 강좌코드별 수강인원 통계
   - 강좌코드별 그룹핑
   - 인원수 집계
   ------------------------------------------------------------ */
select
    subcode as 강좌코드,
    count(*) as 인원수
from tbl_sublist_04
group by subcode;

/* --------------------------------------------------------- */

select
	s.PGMID || '[' || PGMCNT || '회]',
	s.PGMNAME,
	t.TYPENAME,
	s.PGMDATE,
	s.PGMTIME,
	decode(s.PGMTIME,'1','월','2','화','3','수','4','목','5','금','6','토','7','일')
from TBL_SCHEDULE_05 s
join TBL_PGMTYPE_05 t
on s.TYPECODE = t.TYPECODE;