set line 400;

/* ------------------------------------------------------------
   1. 매출 현황 조회 (제 1과제 - 작업 5)
   - 날짜형식은 yyyy-mm-dd 로 편집
   - 상품코드를 기준으로 조인하여 상품명 출력
   ------------------------------------------------------------ */
select
    a.sale_no,
    to_char(a.sale_ymd, 'yyyy-mm-dd') as sale_ymd,
    a.sale_fg,
    a.goods_cd,
    b.goods_nm,
    a.sale_cnt
from sale_tbl_003 a
join tbl_goods_01 b
  on a.goods_cd = b.goods_cd
order by a.sale_no asc;


/* ------------------------------------------------------------
   2. 점포 정보 수정 (제 1과제 - 작업 6)
   - 점포정보테이블의 직영구분이 '1'(가맹)인 데이터를 '0'(직영)으로 변경
   ------------------------------------------------------------ */
update STORE_TBL_003
set STORE_FG = '0'
where STORE_FG = '1';

commit;


/* ------------------------------------------------------------
   3. 상품 정보 상세 조회 (제 2과제 - 작업 6)
   - 입고일자를 yy/mm/dd 형식으로 포맷팅하여 출력
   ------------------------------------------------------------ */
select
    a.goods_cd,
    a.goods_nm,
    a.goods_price,
    a.cost,
    to_char(a.in_date, 'yy/mm/dd') as in_date
from tbl_goods_01 a
order by a.goods_cd asc;