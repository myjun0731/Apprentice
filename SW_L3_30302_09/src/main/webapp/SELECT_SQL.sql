set line 400

/* ------------------------------------------------------------
   4. 카드결제 고객 주문 내역 조회 (문제 1-5)
   ------------------------------------------------------------ */
select
    a.orderid as 주문번호,
    a.custid as 고객ID,
    b.name as 고객명,
    a.prodid as 상품ID,
    c.prodname as 상품명,
    a.qty as 수량,
    case when a.paytype = '1' then '카드'
         when a.paytype = '2' then '무통장'
         else a.paytype
    end as 결제수단,
    to_char(a.orderdate,'yyyy-mm-dd') as 주문일자
from tbl_order_04 a
join tbl_customer_04 b
  on a.custid = b.custid
join tbl_product_04 c
  on a.prodid = c.prodid
where a.paytype = '1'
order by a.orderid asc;

/* ------------------------------------------------------------
   5. 고객별 주문 총금액 집계 (문제 1-6)
   ------------------------------------------------------------ */
select
    b.custid,
    b.name,
    sum(c.price * a.qty) as total_order_price
from tbl_order_04 a
join tbl_customer_04 b
  on a.custid = b.custid
join tbl_product_04 c
  on a.prodid = c.prodid
group by b.custid, b.name
order by b.custid asc;

/* ------------------------------------------------------------
   6. 월별 매출 합계 조회 (문제 1-7)
   ------------------------------------------------------------ */
select
    to_char(a.orderdate, 'YYYY-MM') as order_month,
    sum(c.price * a.qty) as total_sales
from tbl_order_04 a
join tbl_product_04 c
  on a.prodid = c.prodid
group by to_char(a.orderdate, 'YYYY-MM')
order by order_month asc;