--2 建立資料表
create table VILLAGE (--改小寫 表格名 欄位名用大寫
    VILLAGE_ID VARCHAR2(100) PRIMARY KEY,
    VILLAGE_CATEGORY NVARCHAR2(100),
    VILLAGE_ADD NVARCHAR2(100),
    VILLAGE_TEL VARCHAR2(100)
);

create table FACILITY (
    FACILITY_ID VARCHAR2(100) PRIMARY KEY,
    FACILITY_ADD NVARCHAR2(100),
    FACILITY_PEOPLE INTEGER,
    FACILITY_FOOR INTEGER,
    FACILITY_CATEGORY VARCHAR2(100) references FACILITY_CATEGORY(FACILITY_ID),
    VILLAGE_ID VARCHAR2(100) references VILLAGE(VILLAGE_ID),
    BRANCH_ID VARCHAR2(100) references BRANCH(BRANCH_ID)
);

create table FACILITY_CATEGORY (
    FACILITY_ID VARCHAR2(100) PRIMARY KEY,
    FACILITY_NAME NVARCHAR2(100)
);

create table BRANCH (
    BRANCH_ID VARCHAR2(100) PRIMARY KEY,
    BRANCH_NAME NVARCHAR2(100),
    BRANCH_ADD NVARCHAR2(100),
    BRANCH_TEL VARCHAR2(100)
);

--3 將表格內資料新增至資料表內
insert into FACILITY(FACILITY_ID,FACILITY_ADD,FACILITY_PEOPLE,FACILITY_FOOR,FACILITY_CATEGORY,VILLAGE_ID,BRANCH_ID)
values ('F01', '苗栗縣竹南鎮中埔街20號', '100', '1', 'P01','C001','M001');
insert into FACILITY(FACILITY_ID,FACILITY_ADD,FACILITY_PEOPLE,FACILITY_FOOR,FACILITY_CATEGORY,VILLAGE_ID,BRANCH_ID)
values ('F02', '苗栗縣竹南鎮和平街79號', '3142', '1', 'P02','C002','M001');
insert into FACILITY(FACILITY_ID,FACILITY_ADD,FACILITY_PEOPLE,FACILITY_FOOR,FACILITY_CATEGORY,VILLAGE_ID,BRANCH_ID)
values ('F03', '苗栗縣竹南鎮龍山路三段142號', '1072', '1', 'P02','C003','M001');
insert into FACILITY(FACILITY_ID,FACILITY_ADD,FACILITY_PEOPLE,FACILITY_FOOR,FACILITY_CATEGORY,VILLAGE_ID,BRANCH_ID)
values ('F04', '苗栗縣後龍鎮中華路1498號', '32', '1', 'P03','C001','M001');
insert into FACILITY(FACILITY_ID,FACILITY_ADD,FACILITY_PEOPLE,FACILITY_FOOR,FACILITY_CATEGORY,VILLAGE_ID,BRANCH_ID)
values ('F05', '苗栗縣苗栗市米市街80號', '106', '1', 'P01','C005','M002');
insert into FACILITY(FACILITY_ID,FACILITY_ADD,FACILITY_PEOPLE,FACILITY_FOOR,FACILITY_CATEGORY,VILLAGE_ID,BRANCH_ID)
values ('F06', '苗栗縣苗栗市光復路117號', '26', '1', 'P01','C005','M002');
insert into FACILITY(FACILITY_ID,FACILITY_ADD,FACILITY_PEOPLE,FACILITY_FOOR,FACILITY_CATEGORY,VILLAGE_ID,BRANCH_ID)
values ('F07', '苗栗縣苗栗市博愛街109號', '2038', '2', 'P02','C005','M002');
insert into FACILITY(FACILITY_ID,FACILITY_ADD,FACILITY_PEOPLE,FACILITY_FOOR,FACILITY_CATEGORY,VILLAGE_ID,BRANCH_ID)
values ('F08', '苗栗縣苗栗市大同路53號', '128', '2', 'P02','C005','M002');
insert into FACILITY(FACILITY_ID,FACILITY_ADD,FACILITY_PEOPLE,FACILITY_FOOR,FACILITY_CATEGORY,VILLAGE_ID,BRANCH_ID)
values ('F09', '苗栗縣頭份市民族里和平路102號', '353', '1', 'P03','C006','M003');
insert into FACILITY(FACILITY_ID,FACILITY_ADD,FACILITY_PEOPLE,FACILITY_FOOR,FACILITY_CATEGORY,VILLAGE_ID,BRANCH_ID)
values ('F10', '苗栗縣頭份市忠孝忠孝一路69號', '501', '1', 'P04','C007','M003');
insert into FACILITY(FACILITY_ID,FACILITY_ADD,FACILITY_PEOPLE,FACILITY_FOOR,FACILITY_CATEGORY,VILLAGE_ID,BRANCH_ID)
values ('F11', '苗栗縣頭份市信義里中正路65號', '194', '1', 'P01','C008','M003');
insert into FACILITY(FACILITY_ID,FACILITY_ADD,FACILITY_PEOPLE,FACILITY_FOOR,FACILITY_CATEGORY,VILLAGE_ID,BRANCH_ID)
values ('F12', '苗栗縣頭份市信義里中正路116號', '78', '1', 'P04','C008','M003');



insert into VILLAGE(VILLAGE_ID,VILLAGE_CATEGORY,VILLAGE_ADD,VILLAGE_TEL)
values ('C001', '大埔里', '竹南鎮公義路1035號', '03 758 1072');
insert into VILLAGE(VILLAGE_ID,VILLAGE_CATEGORY,VILLAGE_ADD,VILLAGE_TEL)
values ('C002', '竹南里', '竹南鎮竹南里中山路 103 號', '037-472735');
insert into VILLAGE(VILLAGE_ID,VILLAGE_CATEGORY,VILLAGE_ADD,VILLAGE_TEL)
values ('C003', '山佳里', '竹南鎮山佳里國光街 14 號', '037-614186');
insert into VILLAGE(VILLAGE_ID,VILLAGE_CATEGORY,VILLAGE_ADD,VILLAGE_TEL)
values ('C004', '埔頂里', '後龍鎮埔頂里中興路136-1號', '037-724839');
insert into VILLAGE(VILLAGE_ID,VILLAGE_CATEGORY,VILLAGE_ADD,VILLAGE_TEL)
values ('C005', '綠苗里', '苗栗市綠苗里中正路 766 號', '037-333240');
insert into VILLAGE(VILLAGE_ID,VILLAGE_CATEGORY,VILLAGE_ADD,VILLAGE_TEL)
values ('C006', '民族里', '民族里民族路96號', '037-660001');
insert into VILLAGE(VILLAGE_ID,VILLAGE_CATEGORY,VILLAGE_ADD,VILLAGE_TEL)
values ('C007', '忠孝里', '忠孝里光大街82號', '037-661145');
insert into VILLAGE(VILLAGE_ID,VILLAGE_CATEGORY,VILLAGE_ADD,VILLAGE_TEL)
values ('C008', '信義里', '信義里信義路53巷1號', '037-616072');

insert into FACILITY_CATEGORY(FACILITY_ID,FACILITY_NAME)
values ('P01', '公寓');
insert into FACILITY_CATEGORY(FACILITY_ID,FACILITY_NAME)
values ('P02', '大樓');
insert into FACILITY_CATEGORY(FACILITY_ID,FACILITY_NAME)
values ('P03', '公共設施');
insert into FACILITY_CATEGORY(FACILITY_ID,FACILITY_NAME)
values ('P04', '私營單位');

insert into BRANCH(BRANCH_ID,BRANCH_NAME,BRANCH_ADD,BRANCH_TEL)
values ('M001', '竹南分局','苗栗縣竹南鎮民族街72號','03 747 4796');
insert into BRANCH(BRANCH_ID,BRANCH_NAME,BRANCH_ADD,BRANCH_TEL)
values ('M002', '苗栗分局','苗栗縣苗栗市金鳳街109號','03 732 0059');
insert into BRANCH(BRANCH_ID,BRANCH_NAME,BRANCH_ADD,BRANCH_TEL)
values ('M003', '頭份分局','苗栗縣頭份市中興路503號','03 766 3004');
commit;

--4.1 列出轄管區域內有單一避難設施大於1000容人數量的轄管分局及分局連絡電話 。
select B.BRANCH_NAME as 轄管分局, B.BRANCH_TEL as 分局電話
 from STUDENT.FACILITY F
 left join STUDENT.BRANCH B on F.BRANCH_ID = B.BRANCH_ID
 where F.FACILITY_PEOPLE > 1000
 group by B.BRANCH_NAME, B.BRANCH_TEL;

--4.2 列出轄管區域內有單一避難設施大於1000容人數量的轄管分局及分局連絡電話並計算出各設施數量 。
select
  B.BRANCH_NAME as 轄管分局,
  B.BRANCH_TEL as 分局電話,
  count(F.FACILITY_ID) as 設施數量
 from
  STUDENT.FACILITY F
 left join
  STUDENT.BRANCH B on F.BRANCH_ID = B.BRANCH_ID
 where
  F.FACILITY_PEOPLE > 1000
 group by
  B.BRANCH_NAME,B.BRANCH_TEL;
  
--4.3 承上題， 再補上避難設施地址、類型
select
    B.BRANCH_NAME as 轄管分局,
    B.BRANCH_TEL as 分局連絡電話,
    COUNT(F.FACILITY_ID) as 設施數量,
    F.FACILITY_ADD as 避難設施地址,
    FC.FACILITY_NAME as 類型
 from
    STUDENT.FACILITY F
 left join
    STUDENT.BRANCH B on F.BRANCH_ID = B.BRANCH_ID
 left join
    STUDENT.FACILITY_CATEGORY FC on F.FACILITY_CATEGORY = FC.FACILITY_ID
 where
    F.FACILITY_PEOPLE > 1000
 group by
     B.BRANCH_NAME, B.BRANCH_TEL,F.FACILITY_ADD,FC.FACILITY_NAME;


--4.3 承上題， 再補上避難設施地址、類型
select
  B.BRANCH_NAME as 轄管分局,
  B.BRANCH_TEL as 分局電話,
  count(F.FACILITY_ID) over (partition by F.FACILITY_ID) as 設施數量,
  F.FACILITY_ADD as 避難設施地址,
  FC.FACILITY_NAME as 類型
 from
  STUDENT.FACILITY F
 left join
  STUDENT.BRANCH B on F.BRANCH_ID = B.BRANCH_ID
 left join
  STUDENT.FACILITY_CATEGORY FC on FC.FACILITY_ID = F.FACILITY_CATEGORY
 where
  F.FACILITY_PEOPLE > 1000;
  
--4.4 查詢設施地址包含「中」字的避難設施，列出資料必須含村里別、避難設施地址、容人數量、轄管分局及分局連絡電話 。
select 
    V.VILLAGE_CATEGORY as 村里別,
    F.FACILITY_ADD as 避難設施地址,
    F.FACILITY_PEOPLE as 容人數量,
    B.BRANCH_NAME as 轄管分局,
    B.BRANCH_TEL as 分局連絡電話
 from 
    STUDENT.FACILITY F
 left join
    STUDENT.VILLAGE V on F.VILLAGE_ID = V.VILLAGE_ID
 left join
    STUDENT.BRANCH B on F.BRANCH_ID = B.BRANCH_ID
 where
     F.FACILITY_ADD like '%中%';
    
--4.5 查詢所有類別為公寓及大樓的避難設施列出資料必須包含村里別、村里辦公室位置、避難設施地址、容人數量 。
select 
    V.VILLAGE_CATEGORY as 村里別,
    V.VILLAGE_ADD as 村里辦公室,
    F.FACILITY_ADD as 避難設施地址,
    F.FACILITY_PEOPLE as 容人數量
 from 
    STUDENT.FACILITY F
 left join
    STUDENT.VILLAGE V on F.VILLAGE_ID = V.VILLAGE_ID
 left join
    STUDENT.FACILITY_CATEGORY FC on F.FACILITY_CATEGORY = FC.FACILITY_ID
 where 
--    FC.FACILITY_NAME='公寓' OR FC.FACILITY_NAME='大樓';
      FC.FACILITY_NAME in ('公寓','大樓');

--5
create table STUDENT.FACILITY2 as select * from FACILITY;--避免改到練習4的表格所以複製一份
 commit;

--5.1 更新避難設施地址 是 「苗栗縣竹南鎮和平街79號」的容人數量為 5000 人 。
update STUDENT.FACILITY2
 set FACILITY_PEOPLE='5000'
 where FACILITY_ADD='苗栗縣竹南鎮和平街79號';
 commit;

--5.2 刪除避難設施小 於 1000 容人數量的 資料 。
delete from STUDENT.FACILITY2
 where FACILITY_PEOPLE < 1000;
 commit;
