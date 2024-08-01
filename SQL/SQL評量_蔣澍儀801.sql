--2 建立資料表
CREATE TABLE village (
    village_id VARCHAR2(100) PRIMARY KEY,
    village_category NVARCHAR2(100),
    village_add NVARCHAR2(100),
    village_tel VARCHAR2(100)
);

CREATE TABLE facility (
    facility_id VARCHAR2(100) PRIMARY KEY,
    facility_add NVARCHAR2(100),
    facility_people INTEGER,
    facility_foor INTEGER,
    facility_category VARCHAR2(100) references facility_category(facility_id),
    village_id VARCHAR2(100) references village(village_id),
    branch_id VARCHAR2(100) references branch(branch_id)
);

CREATE TABLE facility_category (
    facility_id VARCHAR2(100) PRIMARY KEY,
    facility_name NVARCHAR2(100)
);

CREATE TABLE branch (
    branch_id VARCHAR2(100) PRIMARY KEY,
    branch_name NVARCHAR2(100),
    branch_add NVARCHAR2(100),
    branch_tel VARCHAR2(100)
);

--3 將表格內資料新增至資料表內
insert into facility(facility_id,facility_add,facility_people,facility_foor,facility_category,village_id,branch_id)
values ('F01', '苗栗縣竹南鎮中埔街20號', '100', '1', 'P01','C001','M001');
insert into facility(facility_id,facility_add,facility_people,facility_foor,facility_category,village_id,branch_id)
values ('F02', '苗栗縣竹南鎮和平街79號', '3142', '1', 'P02','C002','M001');
insert into facility(facility_id,facility_add,facility_people,facility_foor,facility_category,village_id,branch_id)
values ('F03', '苗栗縣竹南鎮龍山路三段142號', '1072', '1', 'P02','C003','M001');
insert into facility(facility_id,facility_add,facility_people,facility_foor,facility_category,village_id,branch_id)
values ('F04', '苗栗縣後龍鎮中華路1498號', '32', '1', 'P03','C001','M001');
insert into facility(facility_id,facility_add,facility_people,facility_foor,facility_category,village_id,branch_id)
values ('F05', '苗栗縣苗栗市米市街80號', '106', '1', 'P01','C005','M002');
insert into facility(facility_id,facility_add,facility_people,facility_foor,facility_category,village_id,branch_id)
values ('F06', '苗栗縣苗栗市光復路117號', '26', '1', 'P01','C005','M002');
insert into facility(facility_id,facility_add,facility_people,facility_foor,facility_category,village_id,branch_id)
values ('F07', '苗栗縣苗栗市博愛街109號', '2038', '2', 'P02','C005','M002');
insert into facility(facility_id,facility_add,facility_people,facility_foor,facility_category,village_id,branch_id)
values ('F08', '苗栗縣苗栗市大同路53號', '128', '2', 'P02','C005','M002');
insert into facility(facility_id,facility_add,facility_people,facility_foor,facility_category,village_id,branch_id)
values ('F09', '苗栗縣頭份市民族里和平路102號', '353', '1', 'P03','C006','M003');
insert into facility(facility_id,facility_add,facility_people,facility_foor,facility_category,village_id,branch_id)
values ('F10', '苗栗縣頭份市忠孝忠孝一路69號', '501', '1', 'P04','C007','M003');
insert into facility(facility_id,facility_add,facility_people,facility_foor,facility_category,village_id,branch_id)
values ('F11', '苗栗縣頭份市信義里中正路65號', '194', '1', 'P01','C008','M003');
insert into facility(facility_id,facility_add,facility_people,facility_foor,facility_category,village_id,branch_id)
values ('F12', '苗栗縣頭份市信義里中正路116號', '78', '1', 'P04','C008','M003');



insert into village(village_id,village_category,village_add,village_tel)
values ('C001', '大埔里', '竹南鎮公義路1035號', '03 758 1072');
insert into village(village_id,village_category,village_add,village_tel)
values ('C002', '竹南里', '竹南鎮竹南里中山路 103 號', '037-472735');
insert into village(village_id,village_category,village_add,village_tel)
values ('C003', '山佳里', '竹南鎮山佳里國光街 14 號', '037-614186');
insert into village(village_id,village_category,village_add,village_tel)
values ('C004', '埔頂里', '後龍鎮埔頂里中興路136-1號', '037-724839');
insert into village(village_id,village_category,village_add,village_tel)
values ('C005', '綠苗里', '苗栗市綠苗里中正路 766 號', '037-333240');
insert into village(village_id,village_category,village_add,village_tel)
values ('C006', '民族里', '民族里民族路96號', '037-660001');
insert into village(village_id,village_category,village_add,village_tel)
values ('C007', '忠孝里', '忠孝里光大街82號', '037-661145');
insert into village(village_id,village_category,village_add,village_tel)
values ('C008', '信義里', '信義里信義路53巷1號', '037-616072');

insert into facility_category(facility_id,facility_name)
values ('P01', '公寓');
insert into facility_category(facility_id,facility_name)
values ('P02', '大樓');
insert into facility_category(facility_id,facility_name)
values ('P03', '公共設施');
insert into facility_category(facility_id,facility_name)
values ('P04', '私營單位');

insert into branch(branch_id,branch_name,branch_add,branch_tel)
values ('M001', '竹南分局','苗栗縣竹南鎮民族街72號','03 747 4796');
insert into branch(branch_id,branch_name,branch_add,branch_tel)
values ('M002', '苗栗分局','苗栗縣苗栗市金鳳街109號','03 732 0059');
insert into branch(branch_id,branch_name,branch_add,branch_tel)
values ('M003', '頭份分局','苗栗縣頭份市中興路503號','03 766 3004');
COMMIT;

--4.1 列出轄管區域內有單一避難設施大於1000容人數量的轄管分局及分局連絡電話 。
SELECT b.branch_name AS 轄管分局, b.branch_tel AS 分局電話
FROM facility f
JOIN branch b ON f.branch_id = b.branch_id
WHERE f.facility_people > 1000
GROUP BY b.branch_name, b.branch_tel;

--4.2 列出轄管區域內有單一避難設施大於1000容人數量的轄管分局及分局連絡電話並計算出各轄管分局數量 。
SELECT
  b.branch_name AS 轄管分局,
  b.branch_tel AS 分局電話,
  COUNT(f.facility_id) AS 設施數量
FROM
  facility f
JOIN
  branch b ON f.branch_id = b.branch_id
WHERE
  f.facility_people > 1000
GROUP BY
  b.branch_name,b.branch_tel;
  
--4.3 承上題， 再補上避難設施地址、類型
SELECT 
    b.branch_name AS 轄管分局,
    b.branch_tel AS 分局連絡電話,
    COUNT(f.facility_id) AS 設施數量,
    f.facility_add AS 避難設施地址,
    fc.facility_name AS 類型
FROM 
    facility f
JOIN 
    branch b ON f.branch_id = b.branch_id
JOIN 
    facility_category fc ON f.facility_category = fc.facility_id
WHERE 
    f.facility_people > 1000
GROUP BY 
    b.branch_name, b.branch_tel,f.facility_add,fc.facility_name;


--4.3 承上題， 再補上避難設施地址、類型
SELECT
  b.branch_name AS 轄管分局,
  b.branch_tel AS 分局電話,
  COUNT(f.facility_id) OVER (PARTITION BY b.branch_id) AS 設施數量,
  f.facility_add AS 避難設施地址,
  fc.facility_name AS 類型
FROM
  facility f
JOIN
  branch b ON f.branch_id = b.branch_id
JOIN
  facility_category fc ON fc.facility_id = f.facility_category
WHERE
  f.facility_people > 1000;
  
--4.4 查詢設施地址包含「中」字的避難設施，列出資料必須含村里別、避難設施地址、容人數量、轄管分局及分局連絡電話 。
SELECT 
    v.village_category AS 村里別,
    f.facility_add AS 避難設施地址,
    f.facility_people AS 容人數量,
    b.branch_name AS 轄管分局,
    b.branch_tel AS 分局連絡電話
FROM 
    facility f
JOIN 
    village v ON f.village_id = v.village_id
JOIN 
    branch b ON f.branch_id = b.branch_id
WHERE 
    f.facility_add LIKE '%中%';
    
--4.5 查詢所有類別為公寓及大樓的避難設施列出資料必須包含村里別、村里辦公室位置、避難設施地址、容人數量 。
SELECT 
    v.village_category AS 村里別,
    v.village_add AS 村里辦公室,
    f.facility_add AS 避難設施地址,
    f.facility_people AS 容人數量
FROM 
    facility f
JOIN 
    village v ON f.village_id = v.village_id
JOIN 
    facility_category fc ON f.facility_category = fc.facility_id
WHERE 
    fc.facility_name='公寓' OR fc.facility_name='大樓';

--5
CREATE TABLE facility2 AS SELECT * FROM facility;--避免改到練習4的表格所以複製一份
COMMIT;

--5.1 更新避難設施地址 是 「苗栗縣竹南鎮和平街79號」的容人數量為 5000 人 。
UPDATE facility2
SET facility_people='5000'
WHERE facility_add='苗栗縣竹南鎮和平街79號';

--5.2 刪除避難設施小 於 1000 容人數量的 資料 。
DELETE FROM facility2
WHERE facility_people<1000;
