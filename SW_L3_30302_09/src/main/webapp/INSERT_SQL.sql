/* ------------------------------------------------------------
   1. 고객정보 시스템 (TBL_CUSTOMER_04)
   ------------------------------------------------------------ */
drop table TBL_CUSTOMER_04 cascade constraints;

create table TBL_CUSTOMER_04 (
    CUSTID char(6) primary key,
    NAME varchar2(20),
    PHONE varchar2(13),
    ADDRESS varchar2(50),
    JOINDATE date
);

insert into TBL_CUSTOMER_04 values ('C10001', '김철수', '010-1111-1111', '서울시 강남구 삼성동', date '2023-01-01');
insert into TBL_CUSTOMER_04 values ('C10002', '이영희', '010-2222-2222', '서울시 송파구 잠실동', date '2023-01-05');
insert into TBL_CUSTOMER_04 values ('C10003', '박민수', '010-3333-3333', '경기도 성남시 분당구', date '2023-01-10');
insert into TBL_CUSTOMER_04 values ('C10004', '최지현', '010-4444-4444', '인천시 연수구 송도동', date '2023-01-12');
insert into TBL_CUSTOMER_04 values ('C10005', '정우성', '010-5555-5555', '부산시 해운대구 우동', date '2023-01-15');

commit;

/* ------------------------------------------------------------
   2. 상품정보 시스템 (TBL_PRODUCT_04)
   ------------------------------------------------------------ */
drop table TBL_PRODUCT_04 cascade constraints;

create table TBL_PRODUCT_04 (
    PRODID char(6) primary key,
    PRODNAME varchar2(30),
    PRICE number(7),
    STOCK number(5)
);

insert into TBL_PRODUCT_04 values ('P20001', '노트북', 1200000, 15);
insert into TBL_PRODUCT_04 values ('P20002', '키보드', 35000, 100);
insert into TBL_PRODUCT_04 values ('P20003', '무선마우스', 25000, 200);
insert into TBL_PRODUCT_04 values ('P20004', '모니터', 300000, 30);
insert into TBL_PRODUCT_04 values ('P20005', '이어폰', 50000, 150);

commit;

/* ------------------------------------------------------------
   3. 주문정보 시스템 (TBL_ORDER_04)
   ------------------------------------------------------------ */
drop table TBL_ORDER_04 cascade constraints;

create table TBL_ORDER_04 (
    ORDERID char(8) primary key,
    CUSTID char(6),
    PRODID char(6),
    QTY number(3),
    PAYTYPE char(1),
    ORDERDATE date,
    constraint FK_ORDER_CUST foreign key (CUSTID) references TBL_CUSTOMER_04(CUSTID),
    constraint FK_ORDER_PROD foreign key (PRODID) references TBL_PRODUCT_04(PRODID)
);

insert into TBL_ORDER_04 values ('O230001', 'C10001', 'P20001', 1, '1', date '2023-02-01');
insert into TBL_ORDER_04 values ('O230002', 'C10002', 'P20002', 2, '1', date '2023-02-01');
insert into TBL_ORDER_04 values ('O230003', 'C10003', 'P20003', 3, '2', date '2023-02-02');
insert into TBL_ORDER_04 values ('O230004', 'C10001', 'P20004', 1, '1', date '2023-02-03');
insert into TBL_ORDER_04 values ('O230005', 'C10004', 'P20005', 2, '2', date '2023-02-05');
insert into TBL_ORDER_04 values ('O230006', 'C10005', 'P20001', 1, '1', date '2023-02-06');

commit;
