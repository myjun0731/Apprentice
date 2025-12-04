set line 400;

/* ------------------------------------------------------------
   1. 헬스장 회원 관리 (문제 1)
   - 회원번호, 이름, 연락처, 등급명 조회
   - 회원번호 기준 오름차순
   ------------------------------------------------------------ */
select
    m.mno,
    m.name,
    m.phone,
    g.gname
from tbl_member_21 m
join tbl_grade_21 g 
  on m.gcode = g.gcode
order by m.mno asc;


/* ------------------------------------------------------------
   2. 온라인 쇼핑몰 주문 관리 (문제 2)
   - 주문금액(price * qty) 계산
   - 주문일자 오름차순, 주문번호 오름차순
   ------------------------------------------------------------ */
select
    o.ono,
    o.odate,
    c.cname,
    p.pname,
    o.qty,
    (p.price * o.qty) as total_price
from tbl_order_22 o
join tbl_customer_22 c on o.cno = c.cno
join tbl_product_22 p on o.pno = p.pno
order by o.odate asc, o.ono asc;


/* ------------------------------------------------------------
   3. 학사관리 수강 신청 (문제 3)
   - 전공이 '컴퓨터공학'인 학생만 조회
   - 학번 오름차순, 과목명 오름차순
   ------------------------------------------------------------ */
select 
    s.sno,
    s.sname,
    sub.subname,
    sub.credit,
    e.grade
from tbl_enroll_23 e
join tbl_student_23 s on e.sno = s.sno
join tbl_subject_23 sub on e.subno = sub.subno
where s.major = '컴퓨터공학'
order by s.sno asc, sub.subname asc;


/* ------------------------------------------------------------
   4. 도서관 대출 시스템 (문제 4)
   - 반납여부(return_yn)가 'N'인 목록 조회
   - 반납예정일 오름차순, 대여번호 오름차순
   ------------------------------------------------------------ */
select 
    r.rno,
    m.mname,
    m.phone,
    b.btitle,
    r.rentdate,
    r.duedate
from tbl_rent_24 r
join tbl_member_24 m on r.mno = m.mno
join tbl_book_24 b on r.bno = b.bno
where r.return_yn = 'N'
order by r.duedate asc, r.rno asc;


/* ------------------------------------------------------------
   5. 호텔 예약 시스템 (문제 5)
   - 2025년 5월 체크인 예약 조회
   - 총요금(price * nights) 계산
   - 체크인일자 오름차순, 예약번호 오름차순
   ------------------------------------------------------------ */
select 
    rs.rsno,
    g.gname,
    g.phone,
    rm.rno,
    rm.rtype,
    rs.checkin,
    rs.nights,
    (rm.price * rs.nights) as total_fee
from tbl_reserve_25 rs
join tbl_guest_25 g on rs.gno = g.gno
join tbl_room_25 rm on rs.rno = rm.rno
where rs.checkin >= to_date('2025-05-01', 'YYYY-MM-DD')
  and rs.checkin <= to_date('2025-05-31', 'YYYY-MM-DD')
order by rs.checkin asc, rs.rsno asc;


/* ------------------------------------------------------------
   6. 프로젝트 관리 시스템 (문제 6)
   - 상태가 '진행중'인 프로젝트 참여자 조회
   - 프로젝트번호 오름차순, 직원이름 오름차순
   ------------------------------------------------------------ */
select 
    p.pno,
    p.pname,
    e.eno,
    e.ename,
    d.dname,
    e.position,
    a.role
from tbl_assign_26 a
join tbl_emp_26 e on a.eno = e.eno
join tbl_dept_26 d on e.dno = d.dno
join tbl_project_26 p on a.pno = p.pno
where p.status = '진행중'
order by p.pno asc, e.ename asc;

/* ------------------------------------------------------------
   7. 월별 매출 내역 (문제 7)
   - 2025년 6월 판매 내역 조회
   - 총액(price * qty) 계산
   - 판매일자 오름차순, 판매번호 오름차순
   ------------------------------------------------------------ */
select 
    s.sno,
    s.sdate,
    p.pname,
    c.cname,
    p.price,
    s.qty,
    (p.price * s.qty) as total_price
from tbl_sale_27 s
join tbl_product_27 p on s.pno = p.pno
join tbl_category_27 c on p.cno = c.cno
where s.sdate >= to_date('2025-06-01', 'YYYY-MM-DD')
  and s.sdate <= to_date('2025-06-30', 'YYYY-MM-DD')
order by s.sdate asc, s.sno asc;


/* ------------------------------------------------------------
   8. 택배 배송 추적 (문제 8)
   - 배송 상태가 '배송중'인 내역 조회
   - 고객명 오름차순
   ------------------------------------------------------------ */
select 
    d.dno,
    c.cname,
    c.phone,
    p.pname,
    d.from_loc,
    d.to_loc,
    d.status
from tbl_delivery_28 d
join tbl_customer_28 c on d.cno = c.cno
join tbl_product_28 p on d.pno = p.pno
where d.status = '배송중'
order by c.cname asc;


/* ------------------------------------------------------------
   9. 급여 계산 시스템 (문제 9)
   - 2025년 6월 근무 기록 기준 실급여 계산
   - 실급여 = 기본급 + (총 근무시간 * 시급)
   - 부서명 오름차순, 직원명 오름차순
   ------------------------------------------------------------ */
select 
    e.eno,
    e.ename,
    d.dname,
    e.basepay,
    to_char(sum(w.hours),'999,999,999,999,999') as work_hours,
    pc.hourly_pay,
    to_char((e.basepay + (sum(w.hours) * pc.hourly_pay)),'999,999,999,999,999') as total_pay
from tbl_emp_29 e
join tbl_dept_29 d on e.dno = d.dno
join tbl_payconf_29 pc on d.dno = pc.dno
join tbl_wtime_29 w on e.eno = w.eno
where w.work_date >= to_date('2025-06-01', 'YYYY-MM-DD')
  and w.work_date <= to_date('2025-06-30', 'YYYY-MM-DD')
group by e.eno, e.ename, d.dname, e.basepay, pc.hourly_pay
order by d.dname asc, e.ename asc;


/* ------------------------------------------------------------
   10. 쇼핑몰 리뷰 관리 (문제 10)
   - 고객, 리뷰, 상품, 카테고리, 주문 테이블 전체 조인
   - 리뷰번호 오름차순
   ------------------------------------------------------------ */
select 
    r.rno,
    c.cname,
    p.pname,
    cat.cname,
    r.score,
    r.content,
    o.odate
from tbl_review_30 r
join tbl_order_30 o on r.ono = o.ono
join tbl_customer_30 c on o.cno = c.cno
join tbl_product_30 p on o.pno = p.pno
join tbl_category_30 cat on p.cno2 = cat.cno2
order by r.rno asc;