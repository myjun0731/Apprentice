set line 400


/* ------------------------------------------------------------
   3. 학생 정보 조회 (문제 4)
   ------------------------------------------------------------ */

select
    a.ID as 학번,
    a.NAME as 이름,
    substr(a.ID, 1, 1) as 학년,
    substr(a.ID, 2, 2) as 반,
    substr(a.ID, 4, 2) as 번호,
    a.GENDER as 성별
from MEMBER_TBL a
order by a.ID asc;

/* ------------------------------------------------------------
   4. 데이터 삭제 (문제 5)
   ------------------------------------------------------------ */

-- 데이터 삭제
delete from MEMBER_TBL
 where ID like '104%';

-- 원래대로 복구
rollback;

/* ------------------------------------------------------------
   5. 성적 통계 및 석차 조회 (문제 6, 작업 6)
   ------------------------------------------------------------ */

select
    a.ID as 학번,
    a.NAME as 이름,
    substr(a.ID, 1, 1) as 학년,
    substr(a.ID, 2, 2) as 반,
    substr(a.ID, 4, 2) as 번호,
    a.GENDER as 성별,
    b.KOREAN as 국어,
    b.MATH as 수학,
    b.ENGLISH as 영어,
    b.HISTORY as 역사,
    (b.KOREAN + b.ENGLISH + b.MATH + b.HISTORY) as 합계,
    (b.KOREAN + b.ENGLISH + b.MATH + b.HISTORY) / 4 as 평균,
    rank() over (order by (b.KOREAN + b.ENGLISH + b.MATH + b.HISTORY) desc) as 순위
from MEMBER_TBL a
join SCORE_TBL b
  on a.ID = b.ID
order by 순위 asc;

select
    sum(korean) as 국어종합,
    sum(math) as 수학종합,
    sum(english) as 영어종합,
    sum(history) as 역사종합,
    sum(korean + math + english + history) as 종합,
    round(avg(korean + math + english + history), 1) as 총평균
from score_tbl;

