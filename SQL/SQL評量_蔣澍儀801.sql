--2 �إ߸�ƪ�
create table VILLAGE (--��p�g ���W ���W�Τj�g
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

--3 �N��椺��Ʒs�W�ܸ�ƪ�
insert into FACILITY(FACILITY_ID,FACILITY_ADD,FACILITY_PEOPLE,FACILITY_FOOR,FACILITY_CATEGORY,VILLAGE_ID,BRANCH_ID)
values ('F01', '�]�߿��˫n���H��20��', '100', '1', 'P01','C001','M001');
insert into FACILITY(FACILITY_ID,FACILITY_ADD,FACILITY_PEOPLE,FACILITY_FOOR,FACILITY_CATEGORY,VILLAGE_ID,BRANCH_ID)
values ('F02', '�]�߿��˫n��M����79��', '3142', '1', 'P02','C002','M001');
insert into FACILITY(FACILITY_ID,FACILITY_ADD,FACILITY_PEOPLE,FACILITY_FOOR,FACILITY_CATEGORY,VILLAGE_ID,BRANCH_ID)
values ('F03', '�]�߿��˫n���s�s���T�q142��', '1072', '1', 'P02','C003','M001');
insert into FACILITY(FACILITY_ID,FACILITY_ADD,FACILITY_PEOPLE,FACILITY_FOOR,FACILITY_CATEGORY,VILLAGE_ID,BRANCH_ID)
values ('F04', '�]�߿����s���ظ�1498��', '32', '1', 'P03','C001','M001');
insert into FACILITY(FACILITY_ID,FACILITY_ADD,FACILITY_PEOPLE,FACILITY_FOOR,FACILITY_CATEGORY,VILLAGE_ID,BRANCH_ID)
values ('F05', '�]�߿��]�ߥ��̥���80��', '106', '1', 'P01','C005','M002');
insert into FACILITY(FACILITY_ID,FACILITY_ADD,FACILITY_PEOPLE,FACILITY_FOOR,FACILITY_CATEGORY,VILLAGE_ID,BRANCH_ID)
values ('F06', '�]�߿��]�ߥ����_��117��', '26', '1', 'P01','C005','M002');
insert into FACILITY(FACILITY_ID,FACILITY_ADD,FACILITY_PEOPLE,FACILITY_FOOR,FACILITY_CATEGORY,VILLAGE_ID,BRANCH_ID)
values ('F07', '�]�߿��]�ߥ��շR��109��', '2038', '2', 'P02','C005','M002');
insert into FACILITY(FACILITY_ID,FACILITY_ADD,FACILITY_PEOPLE,FACILITY_FOOR,FACILITY_CATEGORY,VILLAGE_ID,BRANCH_ID)
values ('F08', '�]�߿��]�ߥ��j�P��53��', '128', '2', 'P02','C005','M002');
insert into FACILITY(FACILITY_ID,FACILITY_ADD,FACILITY_PEOPLE,FACILITY_FOOR,FACILITY_CATEGORY,VILLAGE_ID,BRANCH_ID)
values ('F09', '�]�߿��Y�������ڨ��M����102��', '353', '1', 'P03','C006','M003');
insert into FACILITY(FACILITY_ID,FACILITY_ADD,FACILITY_PEOPLE,FACILITY_FOOR,FACILITY_CATEGORY,VILLAGE_ID,BRANCH_ID)
values ('F10', '�]�߿��Y�������������@��69��', '501', '1', 'P04','C007','M003');
insert into FACILITY(FACILITY_ID,FACILITY_ADD,FACILITY_PEOPLE,FACILITY_FOOR,FACILITY_CATEGORY,VILLAGE_ID,BRANCH_ID)
values ('F11', '�]�߿��Y�����H�q��������65��', '194', '1', 'P01','C008','M003');
insert into FACILITY(FACILITY_ID,FACILITY_ADD,FACILITY_PEOPLE,FACILITY_FOOR,FACILITY_CATEGORY,VILLAGE_ID,BRANCH_ID)
values ('F12', '�]�߿��Y�����H�q��������116��', '78', '1', 'P04','C008','M003');



insert into VILLAGE(VILLAGE_ID,VILLAGE_CATEGORY,VILLAGE_ADD,VILLAGE_TEL)
values ('C001', '�j�H��', '�˫n���q��1035��', '03 758 1072');
insert into VILLAGE(VILLAGE_ID,VILLAGE_CATEGORY,VILLAGE_ADD,VILLAGE_TEL)
values ('C002', '�˫n��', '�˫n��˫n�����s�� 103 ��', '037-472735');
insert into VILLAGE(VILLAGE_ID,VILLAGE_CATEGORY,VILLAGE_ADD,VILLAGE_TEL)
values ('C003', '�s�Ψ�', '�˫n��s�Ψ������ 14 ��', '037-614186');
insert into VILLAGE(VILLAGE_ID,VILLAGE_CATEGORY,VILLAGE_ADD,VILLAGE_TEL)
values ('C004', '�H����', '���s��H����������136-1��', '037-724839');
insert into VILLAGE(VILLAGE_ID,VILLAGE_CATEGORY,VILLAGE_ADD,VILLAGE_TEL)
values ('C005', '��]��', '�]�ߥ���]�������� 766 ��', '037-333240');
insert into VILLAGE(VILLAGE_ID,VILLAGE_CATEGORY,VILLAGE_ADD,VILLAGE_TEL)
values ('C006', '���ڨ�', '���ڨ����ڸ�96��', '037-660001');
insert into VILLAGE(VILLAGE_ID,VILLAGE_CATEGORY,VILLAGE_ADD,VILLAGE_TEL)
values ('C007', '������', '���������j��82��', '037-661145');
insert into VILLAGE(VILLAGE_ID,VILLAGE_CATEGORY,VILLAGE_ADD,VILLAGE_TEL)
values ('C008', '�H�q��', '�H�q���H�q��53��1��', '037-616072');

insert into FACILITY_CATEGORY(FACILITY_ID,FACILITY_NAME)
values ('P01', '���J');
insert into FACILITY_CATEGORY(FACILITY_ID,FACILITY_NAME)
values ('P02', '�j��');
insert into FACILITY_CATEGORY(FACILITY_ID,FACILITY_NAME)
values ('P03', '���@�]�I');
insert into FACILITY_CATEGORY(FACILITY_ID,FACILITY_NAME)
values ('P04', '�p����');

insert into BRANCH(BRANCH_ID,BRANCH_NAME,BRANCH_ADD,BRANCH_TEL)
values ('M001', '�˫n����','�]�߿��˫n����ڵ�72��','03 747 4796');
insert into BRANCH(BRANCH_ID,BRANCH_NAME,BRANCH_ADD,BRANCH_TEL)
values ('M002', '�]�ߤ���','�]�߿��]�ߥ������109��','03 732 0059');
insert into BRANCH(BRANCH_ID,BRANCH_NAME,BRANCH_ADD,BRANCH_TEL)
values ('M003', '�Y������','�]�߿��Y����������503��','03 766 3004');
COMMIT;

--4.1 �C�X�Һްϰ줺����@�����]�I�j��1000�e�H�ƶq���Һޤ����Τ����s���q�� �C
select B.BRANCH_NAME as �Һޤ���, B.BRANCH_TEL as �����q��
 from STUDENT.FACILITY F
 left join STUDENT.BRANCH B on F.BRANCH_ID = B.BRANCH_ID
 where F.FACILITY_PEOPLE > 1000
 group by B.BRANCH_NAME, B.BRANCH_TEL;

--4.2 �C�X�Һްϰ줺����@�����]�I�j��1000�e�H�ƶq���Һޤ����Τ����s���q�ܨíp��X�U�]�I�ƶq �C
select
  B.BRANCH_NAME as �Һޤ���,
  B.BRANCH_TEL as �����q��,
  count(F.FACILITY_ID) as �]�I�ƶq
 from
  STUDENT.FACILITY F
 left join
  STUDENT.BRANCH B on F.BRANCH_ID = B.BRANCH_ID
 where
  F.FACILITY_PEOPLE > 1000
 group by
  B.BRANCH_NAME,B.BRANCH_TEL;
  
--4.3 �ӤW�D�A �A�ɤW�����]�I�a�}�B����
select
    B.BRANCH_NAME as �Һޤ���,
    B.BRANCH_TEL as �����s���q��,
    COUNT(F.FACILITY_ID) as �]�I�ƶq,
    F.FACILITY_ADD as �����]�I�a�},
    FC.FACILITY_NAME as ����
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


--4.3 �ӤW�D�A �A�ɤW�����]�I�a�}�B����
select
  B.BRANCH_NAME as �Һޤ���,
  B.BRANCH_TEL as �����q��,
  count(F.FACILITY_ID) over (partition by F.FACILITY_ID) as �]�I�ƶq,
  F.FACILITY_ADD as �����]�I�a�},
  FC.FACILITY_NAME as ����
 from
  STUDENT.FACILITY F
 left JOIN
  STUDENT.BRANCH B on F.BRANCH_ID = B.BRANCH_ID
 left JOIN
  STUDENT.FACILITY_CATEGORY FC on FC.FACILITY_ID = F.FACILITY_CATEGORY
 where
  F.FACILITY_PEOPLE > 1000;
  
--4.4 �d�߳]�I�a�}�]�t�u���v�r�������]�I�A�C�X��ƥ����t�����O�B�����]�I�a�}�B�e�H�ƶq�B�Һޤ����Τ����s���q�� �C
select 
    V.VILLAGE_CATEGORY as �����O,
    F.FACILITY_ADD as �����]�I�a�},
    F.FACILITY_PEOPLE as �e�H�ƶq,
    B.BRANCH_NAME as �Һޤ���,
    B.BRANCH_TEL as �����s���q��
 from 
    STUDENT.FACILITY F
 left join
    STUDENT.VILLAGE V on F.VILLAGE_ID = V.VILLAGE_ID
 left join
    STUDENT.BRANCH B on F.BRANCH_ID = B.BRANCH_ID
 where
     F.FACILITY_ADD like '%��%';
    
--4.5 �d�ߩҦ����O�����J�Τj�Ӫ������]�I�C�X��ƥ����]�t�����O�B�����줽�Ǧ�m�B�����]�I�a�}�B�e�H�ƶq �C
select 
    V.VILLAGE_CATEGORY as �����O,
    V.VILLAGE_ADD as �����줽��,
    F.FACILITY_ADD as �����]�I�a�},
    F.FACILITY_PEOPLE as �e�H�ƶq
 from 
    STUDENT.FACILITY F
 left join
    STUDENT.VILLAGE V on F.VILLAGE_ID = V.VILLAGE_ID
 left JOIN
    STUDENT.FACILITY_CATEGORY FC on F.FACILITY_CATEGORY = FC.FACILITY_ID
 where 
--    FC.FACILITY_NAME='���J' OR FC.FACILITY_NAME='�j��';
      FC.FACILITY_NAME in ('���J','�j��');

--5
create table STUDENT.FACILITY2 as select * from FACILITY;--�קK���m��4�����ҥH�ƻs�@��
 commit;

--5.1 ��s�����]�I�a�} �O �u�]�߿��˫n��M����79���v���e�H�ƶq�� 5000 �H �C
update STUDENT.FACILITY2
 set FACILITY_PEOPLE='5000'
 where FACILITY_ADD='�]�߿��˫n��M����79��';
 commit;

--5.2 �R�������]�I�p �� 1000 �e�H�ƶq�� ��� �C
delete from STUDENT.FACILITY2
 where FACILITY_PEOPLE < 1000;
 commit;
