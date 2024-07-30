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

//�m��5_Q1
SELECT WATER1.serial_number AS �Ǹ�,
WATER1.hydrogen AS �B���l�@�׫���,
WATER1.turbidity AS �B��,
WATER1.chlorine AS �ۥѦ��ľl��
FROM WATER1
WHERE (hydrogen='7.5' OR hydrogen='8') AND (chlorine>0.6) AND (PLACE='T22');

//�m��5_Q2
SELECT serial_number AS �Ǹ�,
hydrogen AS �B���l�@�׫���,
turbidity AS �B��,
chlorine AS �ۥѦ��ľl��
FROM SQL_TAOYUAN_WATER
WHERE (serial_number BETWEEN 521 AND 529)
OR (chlorine IN ('0.76','0.77','0.66') 
AND (hydrogen!='7.8') 
AND turbidity=0.6);

//�m��3
ALTER TABLE SQL_CUSTOMER1
ADD FOREIGN KEY ID REFERENCES SQL_EMP1(EMP_ID);
COMMIT;

SELECT DISTINCT MANUFACTURER ,COUNT(*) FROM CARS//�p�⤣�P���O���ƶq
GROUP BY MANUFACTURER;//����

SELECT * FROM CARS ORDER BY PRICE;//���V�Ƨ�
SELECT * FROM CARS ORDER BY PRICE DESC;//�ϦV�Ƨ�

//�m��6
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
    
//�m��6
SELECT DISTINCT 
    PLACE AS �a�I,
    hydrogen AS �B���l�@�׫���
FROM SQL_TAOYUAN_WATER
WHERE (serial_number BETWEEN 521 AND 529)
    OR (chlorine IN ('0.76','0.77','0.66') 
    AND (hydrogen!='7.8') 
    AND turbidity=0.6);
    
//chatGPT
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

//�m��7
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

//join�ɥR
SELECT CUT.NAME, EMP.EMP_NM, DEP.ADDR--��ܪ����
FROM SQL_CUSTOMER CUT--�O�WCUT
left JOIN SQL_EMP EMP ON CUT.EMP=EMP.EMP_ID--��CUT��檺EMP������EMP��檺EMP_ID
left JOIN SQL_DEP DEP ON EMP.DEP=DEP.DEP;

//�m��8
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