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

/*��ʧR���~��*/

ALTER TABLE SQL_CUSTOMER1
ADD FOREIGN KEY(EMP) references SQL_EMP1(EMP_ID);/*�s�W�~��*/

/*�s�W�@�ӥsSQL_EMP1_INDEX1��index�A�q���SQL_EMP1��DEP���*/
CREATE INDEX SQL_EMP1_INDEX1 ON SQL_EMP1(DEP);

/*�ƻs�@�ӦW��WATER1�qSQL_TAOYUAN_WATER*/
CREATE TABLE WATER1 AS SELECT * FROM SQL_TAOYUAN_WATER;

SELECT * FROM WATER1;

/*���w���O�W*/
SELECT WATER1.serial_number AS �Ǹ�,
WATER1.hydrogen AS �B���l�@�׫���,
WATER1.turbidity AS �B��,
WATER1.chlorine AS �ۥѦ��ľl��
FROM WATER1;

SELECT * FROM SQL_EMP;

SELECT * FROM SQL_EMP
WHERE DEP='�t�ζ}�o��' AND EMP_NM LIKE '�]%';

SELECT * FROM SQL_EMP
WHERE EMP_NM LIKE '�]%';

SELECT * FROM SQL_EMP
WHERE DEP='�t�ζ}�o��' OR DEP='�}�o�t�γ�'

SELECT * FROM SQL_EMP
WHERE EMP_ID>'00051111';

SELECT * FROM SQL_EMP
WHERE DEP='�t�ζ}�o��';

SELECT SQL_EMP.ID AS ���u�s��//ID�O�W
FROM SQL_EMP
WHERE NOT DEP='�t�ζ}�o��';//���󤣭n�O�t�ζ}�o��

SELECT * FROM CARS
WHERE PRICE BETWEEN 300 AND 600;

SELECT * FROM CARS
WHERE PRICE IN('700')
OR�@MIN_PRICE IN('300','600');

SELECT * FROM CARS
WHERE MANUFACTURER like '_o%'//�ĤG��OO
AND PRICE=700;

SELECT * FROM SQL_EMP1
WHERE TEL IS NOT null;

SELECT * FROM SQL_EMP1
WHERE TEL IS null;

--�m��5_Q1
SELECT WATER1.serial_number AS �Ǹ�,
WATER1.hydrogen AS �B���l�@�׫���,
WATER1.turbidity AS �B��,
WATER1.chlorine AS �ۥѦ��ľl��
FROM WATER1
WHERE (hydrogen='7.5' OR hydrogen='8') AND (chlorine>0.6) AND (PLACE='T22');

--�m��5_Q2
SELECT serial_number AS �Ǹ�,
hydrogen AS �B���l�@�׫���,
turbidity AS �B��,
chlorine AS �ۥѦ��ľl��
FROM SQL_TAOYUAN_WATER
WHERE (serial_number BETWEEN 521 AND 529)
OR (chlorine IN ('0.76','0.77','0.66') 
AND (hydrogen!='7.8') 
AND turbidity=0.6);

--�m��3
ALTER TABLE SQL_CUSTOMER1
ADD FOREIGN KEY ID REFERENCES SQL_EMP1(EMP_ID);
COMMIT;

SELECT DISTINCT MANUFACTURER ,COUNT(*) FROM CARS//�p�⤣�P���O���ƶq
GROUP BY MANUFACTURER;//����

SELECT * FROM CARS ORDER BY PRICE;//���V�Ƨ�
SELECT * FROM CARS ORDER BY PRICE DESC;//�ϦV�Ƨ�

--�m��6
SELECT DISTINCT 
    PLACE AS �a�I,
    serial_number AS �Ǹ�,
    hydrogen AS �B���l�@�׫���,
    turbidity AS �B��,
    chlorine AS �ۥѦ��ľl��
FROM SQL_TAOYUAN_WATER
WHERE (serial_number BETWEEN 521 AND 529)
    OR (chlorine IN ('0.76','0.77','0.66') 
    AND (hydrogen!='7.8') 
    AND turbidity=0.6)
    ORDER BY turbidity ASC, serial_number DESC;
    
--�m��6
SELECT DISTINCT 
    PLACE AS �a�I,
    hydrogen AS �B���l�@�׫���
FROM SQL_TAOYUAN_WATER
WHERE (serial_number BETWEEN 521 AND 529)
    OR (chlorine IN ('0.76','0.77','0.66') 
    AND (hydrogen!='7.8') 
    AND turbidity=0.6);
    
--chatGPT
WITH RankedData AS (
    SELECT 
        PLACE AS �a�I,
        serial_number AS �Ǹ�,
        hydrogen AS �B���l�@�׫���,
        turbidity AS �B��,
        chlorine AS �ۥѦ��ľl��,
        ROW_NUMBER() OVER (PARTITION BY PLACE ORDER BY serial_number DESC) AS rn
    FROM SQL_TAOYUAN_WATER
    WHERE (serial_number BETWEEN 521 AND 529)
        OR (chlorine IN ('0.76','0.77','0.66') 
        AND hydrogen != '7.8'
        AND turbidity = 0.6)
)
SELECT 
    �a�I,
    �Ǹ�,
    �B���l�@�׫���,
    �B��,
    �ۥѦ��ľl��
FROM RankedData
WHERE rn = 1
ORDER BY �B�� ASC, �Ǹ� DESC;

SELECT * 
FROM SQL_EMP
WHERE EMP_ID IN (SELECT DISTINCT EMP FROM SQL_CUSTOMER);


SELECT EMP_NM,ID FROM SQL_EMP
UNION ALL
SELECT NAME,ID FROM SQL_CUSTOMER;

--�m��7
SELECT �a�I,�Ǹ�,�B���l�@�׫���,�B��,�ۥѦ��ľl��
FROM(
SELECT
    PLACE AS �a�I,
    serial_number AS �Ǹ�,
    hydrogen AS �B���l�@�׫���,
    turbidity AS �B��,
    chlorine AS �ۥѦ��ľl��
    FROM SQL_TAOYUAN_WATER
    WHERE serial_number BETWEEN 521 AND 529
UNION
    SELECT
    PLACE AS �a�I,
    serial_number AS �Ǹ�,
    hydrogen AS �B���l�@�׫���,
    turbidity AS �B��,
    chlorine AS �ۥѦ��ľl��
    FROM SQL_TAOYUAN_WATER
    WHERE chlorine IN ('0.76','0.77','0.66') 
    AND hydrogen!='7.8' 
    AND turbidity=0.6
)
ORDER BY �B�� ASC, �Ǹ� DESC;

SELECT CUT.ID, CUT.NAME, EMP.EMP_NM--��ܪ����
FROM SQL_CUSTOMER CUT--�O�WCUT
INNER JOIN SQL_EMP EMP--�O�WEMP
ON CUT.EMP=EMP.EMP_ID--��CUT��檺EMP������EMP��檺EMP_ID


SELECT CUT.ID, CUT.NAME, EMP.EMP_NM--��ܪ����
FROM SQL_CUSTOMER CUT--�O�WCUT
left JOIN SQL_EMP EMP--�O�WEMP
ON CUT.EMP=EMP.EMP_ID--��CUT��檺EMP������EMP��檺EMP_ID   

--join�ɥR
SELECT CUT.NAME, EMP.EMP_NM, DEP.ADDR--��ܪ����
FROM SQL_CUSTOMER CUT--�O�WCUT
left JOIN SQL_EMP EMP ON CUT.EMP=EMP.EMP_ID--��CUT��檺EMP������EMP��檺EMP_ID
left JOIN SQL_DEP DEP ON EMP.DEP=DEP.DEP;

--�m��8
SELECT
    DATA.SERIAL_NUMBER AS �Ǹ�,
    DATA.HYDROGEN AS �B���l�@�׫���,
    DATA.turbidity AS �B��,
    DATA.chlorine AS �ۥѦ��ľl��,
    SQL_TAOYUAN_WATER_SYSTEM.WATER_PURIFICATION_PLANT AS �b���t, 
    SQL_TAOYUAN_WATER_SYSTEM.WATER_SUPPLY AS �Ѥ��t��, 
    SQL_TAOYUAN_REGIONS.TOWNSHIP AS ��F��, 
    DATA.PLACE AS ���q
FROM(
    SELECT
        PLACE,
        SERIAL_NUMBER,
        HYDROGEN,
        turbidity ,
        chlorine ,
        WATER_SYSTEM�@
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



--�U�����H��
SELECT DEP, COUNT(EMP_ID) AS CNT
FROM SQL_EMP
GROUP BY DEP;

--�A�ȶW�L1��Ȥ᪺�z�M�ƦW
SELECT DEP,

--�B��l
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

--�s��
SELECT	last_name||' is a '||job_id AS "Employee Details"
FROM 	employees;


--practice 9 Q1
select 
    place ,
    count(chlorine)AS �a���`����,
    max(chlorine)AS �ۥѦ��ľl��,
    min(chlorine)AS �ۥѦ��ľl��,
    sum(HYDROGEN)AS �B���l�@�׫���,
    avg(turbidity) AS �B��
from SQL_TAOYUAN_WATER
where place in ('T40','T44','T16')
Group by place;

--practice 9 Q2
select 
    TR.township AS ��F�a��,
    count(chlorine)AS �a���`����,
    avg(turbidity) AS �B��
from SQL_TAOYUAN_WATER TW
left join SQL_TAOYUAN_REGIONS TR on TR.serial=TW.place
Group by TR.township
having avg(turbidity)>0.7;

create table sql_emp_his as select * from sql_emp;--�s�ػP�ƻs���
truncate table sql_emp_his;--�M�����

--INSERT
insert into SQL_EMP_HIS
select EMP_ID,EMP_NM,ID,null,'��T�O��'--�e�T�������� ��ⵧINSERT
from SQL_EMP
where EMP_ID='00012345';
commit;--�T�w�o����ƬO�ڭn�� �aDML�y�k�@�w�n�� ���M�s�u���Ĥ��|�X�{

--UPDATE
UPDATE sql_emp
SET dep='��T�O��'
WHERE emp_id='00012345';--���g����|�ק������� �j�h���|�g����

--DELETE
DELETE FROM sql_emp
WHERE�@dep='�}�o�t�γ�'


--practice 10 Q1
create table PRACTICE_EMP_�Ǹ� as select * from sql_emp;
truncate table  PRACTICE_EMP_�Ǹ�;--�M�����

insert into PRACTICE_EMP_�Ǹ�(emp_id,emp_nm,id,tel,dep)
values ('012345', '��O��', 'Z99999999', '1000#1010', 'XXX��');
COMMIT;

--practice 10 Q2
UPDATE PRACTICE_EMP_�Ǹ�
SET ID='P0000000',TEL='999999999'
WHERE emp_id='012345';
COMMIT;--���g����|�ק������� �j�h���|�g����

--practice 10 Q3
DELETE FROM PRACTICE_EMP_�Ǹ�
WHERE emp_id='012345';
COMMIT;--���g����|�ק������� �j�h���|�g����

--�d����ܤu�@ID �P���u141 �ۦP�A�B�~�갪����u143 �����u
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

--�d����̧ܳC�~�ꪺ�Ҧ����u�m��B�u�@ID ���~��CMIN �s�ը�Ʒ|�N��@�ƭ�(2500) �Ǧ^�~���d�ߡC
SELECT LAST_NAME, JOB_ID, SALARY
FROM EMPLOYEES
WHERE SALARY=(
                SELECT MIN(SALARY)FROM EMPLOYEES
                );

--�d����̧ܳC�~�갪�󳡪�50 ���̧C�~�ꪺ�Ҧ������C
SELECT DEPARTMENT_ID,MIN(SALARY)
FROM EMPLOYEES
GROUP BY department_id
HAVING MIN(SALARY)>(
                SELECT MIN(SALARY)
                FROM EMPLOYEES
                WHERE DEPARTMENT_ID=50
                );
                

--�d������~��C��IT_PROG ���Ҧ����u�B�B��u�@���OIT_PROG �����u�C             
SELECT employee_id, last_name, job_id, salary
FROM   employees
WHERE  salary < ALL
                    (SELECT salary
                     FROM   employees
                     WHERE  job_id = 'IT_PROG')
AND    job_id != 'IT_PROG';


--Multiple-Row Subqueries
--�d�ҧ�X�U�������̧C�~�ꪺ���u�C
SELECT department_id, last_name, job_id, salary
FROM  employees
WHERE salary in(
    SELECT min(salary)
    FROM  employees
    group by department_id
);

--��ܭ��uHiggins �����u�s���B�W�ٻP�����s��
--������p�g�A�d
SELECT employee_id, last_name, department_id 
FROM   employees
WHERE  LOWER(last_name) = 'higgins';



SELECT employee_id, CONCAT(first_name, last_name) NAME, 
       job_id, LENGTH (last_name), 
       INSTR(lower(last_name), 'a') AS "Contains 'a'?"--last_name��a�b�ĴX��
FROM   employees
WHERE  SUBSTR(job_id, 4) = 'REP';--�q�ĥ|�Ӷ}�l


--�N�ȥ|�ˤ��J����w���p�Ʀ��
SELECT ROUND(45.923,2), ROUND(45.923,0),
       ROUND(45.923,-1)--�p���I�e1�� �|�ˤ��J
FROM   DUAL;--�������A�z�i�Ψ��˵���ƻP�B�⪺���G�C

--�N�ȺI�_�����w���p�Ʀ��
SELECT TRUNC(45.923,2), TRUNC(45.923),
       TRUNC(45.923,-1)
FROM   DUAL;

--�Ǧ^���k���l��
--�w��Ҧ�¾�٬��~�ȥN�����u�A�p����~�갣�H5,000 ����ѤU���l�ơC
select last_name, salary,MOD(salary, 5000)
FROM   employees
WHERE  job_id = 'SA_REP';


--�Ӥ���H�᪺last_name
SELECT last_name, hire_date
FROM   employees
WHERE  hire_date < '13-1�� -08';

SELECT sysdate
FROM   dual;


SELECT last_name,
  UPPER(CONCAT(SUBSTR (LAST_NAME, 1, 8), '_US'))
FROM   employees
WHERE  department_id = 60;

--�YJOB_ID ��IT_PROG�A�h�[�~10%�F�YJOB_ID ��ST_CLERK�A�h�[�~15%�F�YJOB_ID ��SA_REP�A�h�[�~20%�C�ܩ��L�Ҧ����u�@����A���~��ä��|�W�[�C
select last_name, job_id, salary,
        CASE job_id WHEN 'IT_PROG' THEN�@1.10*salary
                    WHEN 'ST_CLERK' THEN�@1.15*salary
                    WHEN 'SA_REP' THEN�@1.20*salary
                    ELSE      salary  END     "REVISED_SALARY"

FROM   employees;

--LEFT JOIN SQL_ITEM on SQL_ITEM.ITEM_NO= SQL_ORDER_DETAIL.ITEM_NO

SELECT  SQL_CUSTOMER_STORE.CUSTOMER_ID AS �Ȥ�s��,
        SQL_CUSTOMER_STORE.NAME AS �Ȥ�W��,
        count(SQL_ORDER_DETAIL.order_no) AS �ʶR����,
        sum(SQL_ORDER_DETAIL.money) AS �ʶR���B
FROM   SQL_CUSTOMER_STORE
INNER JOIN SQL_ORDER on SQL_ORDER.CUST_ID= SQL_CUSTOMER_STORE.CUSTOMER_ID
INNER JOIN SQL_ORDER_DETAIL on SQL_ORDER_DETAIL.ORDER_NO= SQL_ORDER.ORDER_NO
GROUP BY  SQL_CUSTOMER_STORE.CUSTOMER_ID,SQL_CUSTOMER_STORE.NAME
ORDER BY CUSTOMER_ID;








