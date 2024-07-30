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

//練習5_Q1
SELECT WATER1.serial_number AS 序號,
WATER1.hydrogen AS 氫離子濃度指數,
WATER1.turbidity AS 濁度,
WATER1.chlorine AS 自由有效餘氯
FROM WATER1
WHERE (hydrogen='7.5' OR hydrogen='8') AND (chlorine>0.6) AND (PLACE='T22');

//練習5_Q2
SELECT serial_number AS 序號,
hydrogen AS 氫離子濃度指數,
turbidity AS 濁度,
chlorine AS 自由有效餘氯
FROM SQL_TAOYUAN_WATER
WHERE (serial_number BETWEEN 521 AND 529)
OR (chlorine IN ('0.76','0.77','0.66') 
AND (hydrogen!='7.8') 
AND turbidity=0.6);

//練習3
ALTER TABLE SQL_CUSTOMER1
ADD FOREIGN KEY ID REFERENCES SQL_EMP1(EMP_ID);
COMMIT;

SELECT DISTINCT MANUFACTURER ,COUNT(*) FROM CARS//計算不同類別的數量
GROUP BY MANUFACTURER;//分類

SELECT * FROM CARS ORDER BY PRICE;//正向排序
SELECT * FROM CARS ORDER BY PRICE DESC;//反向排序

//練習6
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
    
//練習6
SELECT DISTINCT 
    PLACE AS 地點,
    hydrogen AS 氫離子濃度指數
FROM SQL_TAOYUAN_WATER
WHERE (serial_number BETWEEN 521 AND 529)
    OR (chlorine IN ('0.76','0.77','0.66') 
    AND (hydrogen!='7.8') 
    AND turbidity=0.6);
    
//chatGPT
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

//練習7
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

//join補充
SELECT CUT.NAME, EMP.EMP_NM, DEP.ADDR--顯示的欄位
FROM SQL_CUSTOMER CUT--別名CUT
left JOIN SQL_EMP EMP ON CUT.EMP=EMP.EMP_ID--用CUT表格的EMP對應用EMP表格的EMP_ID
left JOIN SQL_DEP DEP ON EMP.DEP=DEP.DEP;

//練習8
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