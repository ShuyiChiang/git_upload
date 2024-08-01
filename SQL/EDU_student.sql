CREATE TABLE TEST2
(
  COLUMN1 VARCHAR2(20) 
, COLUMN2 VARCHAR2(20) 
);

DROP TABLE TEST3;
     
     
DESC SQL_EMP;

SELECT EMP_ID,emp_nm FROM SQL_EMP WHERE EMP_ID='00012345';

CREATE TABLE SQL_EMP1(
    EMP_ID CHAR(8 BYTE)primary key,
    EMP_NM NVARCHAR2(20),
    ID VARCHAR2(10 BYTE),
    TEL VARCHAR(10 BYTE),
    DEP NVARCHAR2(20)
);

CREATE TABLE SQL_CUSTOMER1(
    ID VARCHAR2(10 BYTE)primary key,
    NAME NVARCHAR2(20),
    EMP CHAR(8 BYTE) references SQL_EMP1(EMP_ID)
);

/*手動刪除外鍵*/

ALTER TABLE SQL_CUSTOMER1
ADD FOREIGN KEY(EMP) references SQL_EMP1(EMP_ID);/*新增外鍵*/

/*新增一個叫SQL_EMP1_INDEX1的index，從表格SQL_EMP1的DEP欄位*/
CREATE INDEX SQL_EMP1_INDEX1 ON SQL_EMP1(DEP);

/*複製一個名為WATER1從SQL_TAOYUAN_WATER*/
CREATE TABLE WATER1 AS SELECT * FROM SQL_TAOYUAN_WATER;

SELECT * FROM WATER1;

/*指定欄位別名*/
SELECT WATER1.serial_number AS 序號,
WATER1.hydrogen AS 氫離子濃度指數,
WATER1.turbidity AS 濁度,
WATER1.chlorine AS 自由有效餘氯
FROM WATER1;

SELECT * FROM SQL_EMP;

SELECT * FROM SQL_EMP
WHERE DEP='系統開發部' AND EMP_NM LIKE '孫%';

SELECT * FROM SQL_EMP
WHERE EMP_NM LIKE '孫%';

SELECT * FROM SQL_EMP
WHERE DEP='系統開發部' OR DEP='開發系統部'

SELECT * FROM SQL_EMP
WHERE EMP_ID>'00051111';

SELECT * FROM SQL_EMP
WHERE DEP='系統開發部';

SELECT SQL_EMP.ID AS 員工編號//ID別名
FROM SQL_EMP
WHERE NOT DEP='系統開發部';//條件不要是系統開發部

SELECT * FROM CARS
WHERE PRICE BETWEEN 300 AND 600;

SELECT * FROM CARS
WHERE PRICE IN('700')
OR　MIN_PRICE IN('300','600');

SELECT * FROM CARS
WHERE MANUFACTURER like '_o%'//第二位是O
AND PRICE=700;

SELECT * FROM SQL_EMP1
WHERE TEL IS NOT null;

SELECT * FROM SQL_EMP1
WHERE TEL IS null;

--練習5_Q1
SELECT WATER1.serial_number AS 序號,
WATER1.hydrogen AS 氫離子濃度指數,
WATER1.turbidity AS 濁度,
WATER1.chlorine AS 自由有效餘氯
FROM WATER1
WHERE (hydrogen='7.5' OR hydrogen='8') AND (chlorine>0.6) AND (PLACE='T22');

--練習5_Q2
SELECT serial_number AS 序號,
hydrogen AS 氫離子濃度指數,
turbidity AS 濁度,
chlorine AS 自由有效餘氯
FROM SQL_TAOYUAN_WATER
WHERE (serial_number BETWEEN 521 AND 529)
OR (chlorine IN ('0.76','0.77','0.66') 
AND (hydrogen!='7.8') 
AND turbidity=0.6);

--練習3
ALTER TABLE SQL_CUSTOMER1
ADD FOREIGN KEY ID REFERENCES SQL_EMP1(EMP_ID);
COMMIT;

SELECT DISTINCT MANUFACTURER ,COUNT(*) FROM CARS//計算不同類別的數量
GROUP BY MANUFACTURER;//分類

SELECT * FROM CARS ORDER BY PRICE;//正向排序
SELECT * FROM CARS ORDER BY PRICE DESC;//反向排序

--練習6
SELECT DISTINCT 
    PLACE AS 地點,
    serial_number AS 序號,
    hydrogen AS 氫離子濃度指數,
    turbidity AS 濁度,
    chlorine AS 自由有效餘氯
FROM SQL_TAOYUAN_WATER
WHERE (serial_number BETWEEN 521 AND 529)
    OR (chlorine IN ('0.76','0.77','0.66') 
    AND (hydrogen!='7.8') 
    AND turbidity=0.6)
    ORDER BY turbidity ASC, serial_number DESC;
    
--練習6
SELECT DISTINCT 
    PLACE AS 地點,
    hydrogen AS 氫離子濃度指數
FROM SQL_TAOYUAN_WATER
WHERE (serial_number BETWEEN 521 AND 529)
    OR (chlorine IN ('0.76','0.77','0.66') 
    AND (hydrogen!='7.8') 
    AND turbidity=0.6);
    
--chatGPT
WITH RankedData AS (
    SELECT 
        PLACE AS 地點,
        serial_number AS 序號,
        hydrogen AS 氫離子濃度指數,
        turbidity AS 濁度,
        chlorine AS 自由有效餘氯,
        ROW_NUMBER() OVER (PARTITION BY PLACE ORDER BY serial_number DESC) AS rn
    FROM SQL_TAOYUAN_WATER
    WHERE (serial_number BETWEEN 521 AND 529)
        OR (chlorine IN ('0.76','0.77','0.66') 
        AND hydrogen != '7.8'
        AND turbidity = 0.6)
)
SELECT 
    地點,
    序號,
    氫離子濃度指數,
    濁度,
    自由有效餘氯
FROM RankedData
WHERE rn = 1
ORDER BY 濁度 ASC, 序號 DESC;

SELECT * 
FROM SQL_EMP
WHERE EMP_ID IN (SELECT DISTINCT EMP FROM SQL_CUSTOMER);


SELECT EMP_NM,ID FROM SQL_EMP
UNION ALL
SELECT NAME,ID FROM SQL_CUSTOMER;

--練習7
SELECT 地點,序號,氫離子濃度指數,濁度,自由有效餘氯
FROM(
SELECT
    PLACE AS 地點,
    serial_number AS 序號,
    hydrogen AS 氫離子濃度指數,
    turbidity AS 濁度,
    chlorine AS 自由有效餘氯
    FROM SQL_TAOYUAN_WATER
    WHERE serial_number BETWEEN 521 AND 529
UNION
    SELECT
    PLACE AS 地點,
    serial_number AS 序號,
    hydrogen AS 氫離子濃度指數,
    turbidity AS 濁度,
    chlorine AS 自由有效餘氯
    FROM SQL_TAOYUAN_WATER
    WHERE chlorine IN ('0.76','0.77','0.66') 
    AND hydrogen!='7.8' 
    AND turbidity=0.6
)
ORDER BY 濁度 ASC, 序號 DESC;

SELECT CUT.ID, CUT.NAME, EMP.EMP_NM--顯示的欄位
FROM SQL_CUSTOMER CUT--別名CUT
INNER JOIN SQL_EMP EMP--別名EMP
ON CUT.EMP=EMP.EMP_ID--用CUT表格的EMP對應用EMP表格的EMP_ID


SELECT CUT.ID, CUT.NAME, EMP.EMP_NM--顯示的欄位
FROM SQL_CUSTOMER CUT--別名CUT
left JOIN SQL_EMP EMP--別名EMP
ON CUT.EMP=EMP.EMP_ID--用CUT表格的EMP對應用EMP表格的EMP_ID   

--join補充
SELECT CUT.NAME, EMP.EMP_NM, DEP.ADDR--顯示的欄位
FROM SQL_CUSTOMER CUT--別名CUT
left JOIN SQL_EMP EMP ON CUT.EMP=EMP.EMP_ID--用CUT表格的EMP對應用EMP表格的EMP_ID
left JOIN SQL_DEP DEP ON EMP.DEP=DEP.DEP;

--練習8
SELECT
    DATA.SERIAL_NUMBER AS 序號,
    DATA.HYDROGEN AS 氫離子濃度指數,
    DATA.turbidity AS 濁度,
    DATA.chlorine AS 自由有效餘氯,
    SQL_TAOYUAN_WATER_SYSTEM.WATER_PURIFICATION_PLANT AS 淨水廠, 
    SQL_TAOYUAN_WATER_SYSTEM.WATER_SUPPLY AS 供水系統, 
    SQL_TAOYUAN_REGIONS.TOWNSHIP AS 行政區, 
    DATA.PLACE AS 路段
FROM(
    SELECT
        PLACE,
        SERIAL_NUMBER,
        HYDROGEN,
        turbidity ,
        chlorine ,
        WATER_SYSTEM　
    FROM SQL_TAOYUAN_WATER
    WHERE SERIAL_NUMBER BETWEEN 521 AND 529
    OR(chlorine IN ('0.76','0.77','0.66') 
    AND hydrogen!='7.8' 
    AND turbidity=0.6)
) DATA
LEFT JOIN SQL_TAOYUAN_REGIONS
ON SQL_TAOYUAN_REGIONS.serial=DATA.PLACE
LEFT JOIN SQL_TAOYUAN_WATER_SYSTEM
ON SQL_TAOYUAN_WATER_SYSTEM.serial=DATA.WATER_SYSTEM
ORDER BY turbidity ASC, SERIAL_NUMBER DESC;

SELECT * FROM EMPLOYEES;
COMMIT;

CREATE TABLE "STUDENT"."EMPLOYEES" 
   (	"EMPLOYEE_ID" NUMBER(6,0),
	"FIRST_NAME" VARCHAR2(20 BYTE), 
	"LAST_NAME" VARCHAR2(25 BYTE), 
	"EMAIL" VARCHAR2(25 BYTE) , 
	"PHONE_NUMBER" VARCHAR2(20 BYTE), 
	"HIRE_DATE" DATE, 
	"JOB_ID" VARCHAR2(10 BYTE), 
	"SALARY" NUMBER(8,2), 
	"COMMISSION_PCT" NUMBER(2,2), 
	"MANAGER_ID" NUMBER(6,0), 
	"DEPARTMENT_ID" NUMBER(4,0));

 CREATE TABLE "STUDENT"."DEPARTMENTS" 
   (	"DEPARTMENT_ID" NUMBER(4,0), 
	"DEPARTMENT_NAME" VARCHAR2(30 BYTE) , 
	"MANAGER_ID" NUMBER(6,0), 
	"LOCATION_ID" NUMBER(4,0));

CREATE TABLE "STUDENT"."JOBS" 
   (	"JOB_ID" VARCHAR2(10 BYTE), 
	"JOB_TITLE" VARCHAR2(35 BYTE), 
	"MIN_SALARY" NUMBER(6,0), 
	"MAX_SALARY" NUMBER(6,0)
   ) ;

CREATE TABLE "STUDENT"."LOCATIONS" 
   (	"LOCATION_ID" NUMBER(4,0), 
	"STREET_ADDRESS" VARCHAR2(40 BYTE), 
	"POSTAL_CODE" VARCHAR2(12 BYTE), 
	"CITY" VARCHAR2(30 BYTE) , 
	"STATE_PROVINCE" VARCHAR2(25 BYTE), 
	"COUNTRY_ID" CHAR(2 BYTE));



SELECT DISTINCT EE.DEPARTMENT_ID, DD.DEPARTMENT_NAME, COUNT (EE.EMPLOYEE_ID) 
FROM employees EE
LEFT JOIN DEPARTMENTS DD ON EE.DEPARTMENT_ID=DD.DEPARTMENT_ID 
GROUP BY EE.DEPARTMENT_ID, DD.DEPARTMENT_NAME;

SELECT DISTINCT EE.DEPARTMENT_ID,DD.DEPARTMENT_NAME
FROM employees EE , DEPARTMENTS DD 
WHERE EE.DEPARTMENT_ID=DD.DEPARTMENT_ID;

SELECT DISTINCT EE.DEPARTMENT_ID, DD.DEPARTMENT_NAME, COUNT(EE.EMPLOYEE_ID) 
FROM employees EE, DEPARTMENTS DD
WHERE EE.DEPARTMENT_ID=DD.DEPARTMENT_ID 
GROUP BY EE.DEPARTMENT_ID, DD.DEPARTMENT_NAME;



--各部門人數
SELECT DEP, COUNT(EMP_ID) AS CNT
FROM SQL_EMP
GROUP BY DEP;

--服務超過1位客戶的理專排名
SELECT DEP,

--運算子
SELECT last_name ,salary, salary+300
FROM employees;

SELECT last_name, salary, 12*salary+100
FROM   employees;

SELECT last_name, salary, 12*(salary+100)
FROM   employees;

SELECT last_name, job_id, salary, commission_pct
FROM   employees;

SELECT last_name, 12*salary*commission_pct
FROM   employees;

--連結
SELECT	last_name||' is a '||job_id AS "Employee Details"
FROM 	employees;


--practice 9 Q1
select 
    place ,
    count(chlorine)AS 地區總筆數,
    max(chlorine)AS 自由有效餘氯,
    min(chlorine)AS 自由有效餘氯,
    sum(HYDROGEN)AS 氫離子濃度指數,
    avg(turbidity) AS 濁度
from SQL_TAOYUAN_WATER
where place in ('T40','T44','T16')
Group by place;

--practice 9 Q2
select 
    TR.township AS 行政地區,
    count(chlorine)AS 地區總筆數,
    avg(turbidity) AS 濁度
from SQL_TAOYUAN_WATER TW
left join SQL_TAOYUAN_REGIONS TR on TR.serial=TW.place
Group by TR.township
having avg(turbidity)>0.7;

create table sql_emp_his as select * from sql_emp;--新建與複製表格
truncate table sql_emp_his;--清空欄位

--INSERT
insert into SQL_EMP_HIS
select EMP_ID,EMP_NM,ID,null,'資訊板塊'--前三筆抓取原表 後兩筆INSERT
from SQL_EMP
where EMP_ID='00012345';
commit;--確定這筆資料是我要的 帶DML語法一定要做 不然連線失效不會出現

--UPDATE
UPDATE sql_emp
SET dep='資訊板塊'
WHERE emp_id='00012345';--不寫條件會修改全部資料 大多都會寫條件

--DELETE
DELETE FROM sql_emp
WHERE　dep='開發系統部'


--practice 10 Q1
create table PRACTICE_EMP_學號 as select * from sql_emp;
truncate table  PRACTICE_EMP_學號;--清空欄位

insert into PRACTICE_EMP_學號(emp_id,emp_nm,id,tel,dep)
values ('012345', '王O白', 'Z99999999', '1000#1010', 'XXX部');
COMMIT;

--practice 10 Q2
UPDATE PRACTICE_EMP_學號
SET ID='P0000000',TEL='999999999'
WHERE emp_id='012345';
COMMIT;--不寫條件會修改全部資料 大多都會寫條件

--practice 10 Q3
DELETE FROM PRACTICE_EMP_學號
WHERE emp_id='012345';
COMMIT;--不寫條件會修改全部資料 大多都會寫條件

--範例顯示工作ID 與員工141 相同，且薪資高於員工143 的員工
SELECT LAST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE JOB_ID=(
                SELECT JOB_ID --ST_CLERK
                FROM EMPLOYEES
                WHERE EMPLOYEE_ID=141)
AND SALARY>(
                SELECT SALARY --2600
                FROM EMPLOYEES
                WHERE EMPLOYEE_ID=143);
COMMIT;

--範例顯示最低薪資的所有員工姓氏、工作ID 及薪資。MIN 群組函數會將單一數值(2500) 傳回外部查詢。
SELECT LAST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY=(
                SELECT MIN(SALARY)FROM EMPLOYEES
                );

--範例顯示最低薪資高於部門50 的最低薪資的所有部門。
SELECT DEPARTMENT_ID,MIN(SALARY)
FROM EMPLOYEES
GROUP BY department_id
HAVING MIN(SALARY)>(
                SELECT MIN(SALARY)
                FROM EMPLOYEES
                WHERE DEPARTMENT_ID=50
                );
                

--範例顯示薪資低於IT_PROG 的所有員工、且其工作不是IT_PROG 的員工。             
SELECT employee_id, last_name, job_id, salary
FROM   employees
WHERE  salary < ALL
                    (SELECT salary
                     FROM   employees
                     WHERE  job_id = 'IT_PROG')
AND    job_id != 'IT_PROG';


--Multiple-Row Subqueries
--範例找出各部門中最低薪資的員工。
SELECT department_id, last_name, job_id, salary
FROM  employees
WHERE salary in(
    SELECT min(salary)
    FROM  employees
    group by department_id
);

--顯示員工Higgins 的員工編號、名稱與部門編號
--全部轉小寫再查
SELECT employee_id, last_name, department_id 
FROM   employees
WHERE  LOWER(last_name) = 'higgins';



SELECT employee_id, CONCAT(first_name, last_name) NAME, 
       job_id, LENGTH (last_name), 
       INSTR(lower(last_name), 'a') AS "Contains 'a'?"--last_name的a在第幾位
FROM   employees
WHERE  SUBSTR(job_id, 4) = 'REP';--從第四個開始


--將值四捨五入到指定的小數位數
SELECT ROUND(45.923,2), ROUND(45.923,0),
       ROUND(45.923,-1)--小數點前1位 四捨五入
FROM   DUAL;--虛擬表格，您可用來檢視函數與運算的結果。

--將值截斷為指定的小數位數
SELECT TRUNC(45.923,2), TRUNC(45.923),
       TRUNC(45.923,-1)
FROM   DUAL;

--傳回除法的餘數
--針對所有職稱為業務代表的員工，計算其薪資除以5,000 之後剩下的餘數。
select last_name, salary,MOD(salary, 5000)
FROM   employees
WHERE  job_id = 'SA_REP';


--該日期以後的last_name
SELECT last_name, hire_date
FROM   employees
WHERE  hire_date < '13-1月 -08';

SELECT sysdate
FROM   dual;


SELECT last_name,
  UPPER(CONCAT(SUBSTR (LAST_NAME, 1, 8), '_US'))
FROM   employees
WHERE  department_id = 60;

--若JOB_ID 為IT_PROG，則加薪10%；若JOB_ID 為ST_CLERK，則加薪15%；若JOB_ID 為SA_REP，則加薪20%。至於其他所有的工作角色，其薪資並不會增加。
select last_name, job_id, salary,
        CASE job_id WHEN 'IT_PROG' THEN　1.10*salary
                    WHEN 'ST_CLERK' THEN　1.15*salary
                    WHEN 'SA_REP' THEN　1.20*salary
                    ELSE      salary  END     "REVISED_SALARY"

FROM   employees;

--LEFT JOIN SQL_ITEM on SQL_ITEM.ITEM_NO= SQL_ORDER_DETAIL.ITEM_NO

SELECT  SQL_CUSTOMER_STORE.CUSTOMER_ID AS 客戶編號,
        SQL_CUSTOMER_STORE.NAME AS 客戶名稱,
        count(SQL_ORDER_DETAIL.order_no) AS 購買次數,
        sum(SQL_ORDER_DETAIL.money) AS 購買金額
FROM   SQL_CUSTOMER_STORE
INNER JOIN SQL_ORDER on SQL_ORDER.CUST_ID= SQL_CUSTOMER_STORE.CUSTOMER_ID
INNER JOIN SQL_ORDER_DETAIL on SQL_ORDER_DETAIL.ORDER_NO= SQL_ORDER.ORDER_NO
GROUP BY  SQL_CUSTOMER_STORE.CUSTOMER_ID,SQL_CUSTOMER_STORE.NAME
ORDER BY CUSTOMER_ID;








