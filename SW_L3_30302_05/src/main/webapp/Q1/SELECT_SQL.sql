set line 400;

/* [문제 1] 회원별 총 주문 금액 조회 */
select 
    m.NAME, 
    sum(o.PRICE) as "TOTAL PRICE"
from TBL_MEMBER m
join TBL_ORDER o on m.MNO = o.MNO
group by m.NAME
order by sum(o.PRICE) desc;

/* [문제 2] 강좌별 수강 인원수 조회 */
select 
    c.TITLE, 
    count(e.SNO) as CNT
from TBL_CLASS c
left join TBL_ENROLL e on c.CNO = e.CNO
group by c.TITLE
order by CNT desc;

/* [문제 3] 부서별 평균 급여 조회 */
select 
    d.DNAME, 
    avg(e.SALARY) as AVG_SALARY
from TBL_DEPT d
join TBL_EMP e on d.DNO = e.DNO
group by d.DNAME
order by d.DNAME;

/* [문제 4] 도서 분야별 판매 수량/매출 집계 */
select 
    b.CATEGORY, 
    sum(o.QTY) as TOTAL_QTY, 
    sum(b.PRICE * o.QTY) as TOTAL_SALES
from TBL_BOOK_04 b
join TBL_ORDER_04 o on b.BNO = o.BNO
group by b.CATEGORY
order by TOTAL_SALES desc;

/* [문제 5] 영화관 상영일자별 관객 수 및 매출 */
select 
    to_char(s.SCREEN_DATE, 'YYYY-MM-DD') as "SCREEN DATE",
    count(t.TID) as CNT,
    sum(t.PRICE) as "TOTAL SALES"
from TBL_SCREEN_05 s
join TBL_TICKET_05 t on s.SID = t.SID
group by s.SCREEN_DATE
order by s.SCREEN_DATE asc;

/* [문제 6] 과목별 평균 점수 및 인원수 */
select 
    sub.SUBNAME,
    round(avg(sc.SCORE), 0) as "AVG SCORE",
    count(sc.SNO) as CNT
from TBL_SUBJECT_06 sub
join TBL_SCORE_06 sc on sub.SUBNO = sc.SUBNO
group by sub.SUBNAME
order by "AVG SCORE" desc;

/* [문제 7] 회원별 누적 결제 금액 */
select 
    m.NAME,
    sum(p.AMT) as TOTAL_AMT
from TBL_MEMBER_07 m
join TBL_PAYMENT_07 p on m.MNO = p.MNO
group by m.NAME
having sum(p.AMT) >= 80000
order by TOTAL_AMT desc;

/* [문제 8] 나라별·여행상품별 총 예약 인원 */
select 
    c.CNAME,
    p.TITLE,
    sum(r.PERSON) as "TOTAL PERSON"
from TBL_COUNTRY_08 c
join TBL_PACKAGE_08 p on c.CNO = p.CNO
join TBL_RESERVE_08 r on p.PNO = r.PNO
group by c.CNAME, p.TITLE
order by c.CNAME asc, "TOTAL PERSON" desc;

/* [문제 9] 2학년 과목별 평균 점수 */
select 
    sj.SUBNAME,
    round(avg(sc.SCORE), 0) as AVG_SCORE,
    count(sc.SNO) as CNT
from TBL_SCORE_09 sc
join TBL_SUBJECT_09 sj on sc.SUBNO = sj.SUBNO
join TBL_STUDENT_09 st on sc.SNO = st.SNO
where st.GRADE = 2
group by sj.SUBNAME
having avg(sc.SCORE) >= 85
order by AVG_SCORE desc;

/* [문제 10] 기사별 배송 건수와 상태별 집계 */
select 
    d.DNAME,
    count(*) as TOTAL_CNT,
    sum(case when l.STATUS = '완료' then 1 else 0 end) as DONE_CNT,
    sum(case when l.STATUS = '지연' then 1 else 0 end) as DELAY_CNT,
    round((sum(case when l.STATUS = '완료' then 1 else 0 end) / count(*)) * 100, 0) as DONE_RATE
from TBL_DRIVER_10 d
join TBL_DELIVERY_10 l on d.DNO = l.DNO
group by d.DNAME
having count(*) >= 2
order by DONE_RATE desc;