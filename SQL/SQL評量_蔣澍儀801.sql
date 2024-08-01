--2 �إ߸�ƪ�
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

--3 �N��椺��Ʒs�W�ܸ�ƪ�
insert into facility(facility_id,facility_add,facility_people,facility_foor,facility_category,village_id,branch_id)
values ('F01', '�]�߿��˫n���H��20��', '100', '1', 'P01','C001','M001');
insert into facility(facility_id,facility_add,facility_people,facility_foor,facility_category,village_id,branch_id)
values ('F02', '�]�߿��˫n��M����79��', '3142', '1', 'P02','C002','M001');
insert into facility(facility_id,facility_add,facility_people,facility_foor,facility_category,village_id,branch_id)
values ('F03', '�]�߿��˫n���s�s���T�q142��', '1072', '1', 'P02','C003','M001');
insert into facility(facility_id,facility_add,facility_people,facility_foor,facility_category,village_id,branch_id)
values ('F04', '�]�߿����s���ظ�1498��', '32', '1', 'P03','C001','M001');
insert into facility(facility_id,facility_add,facility_people,facility_foor,facility_category,village_id,branch_id)
values ('F05', '�]�߿��]�ߥ��̥���80��', '106', '1', 'P01','C005','M002');
insert into facility(facility_id,facility_add,facility_people,facility_foor,facility_category,village_id,branch_id)
values ('F06', '�]�߿��]�ߥ����_��117��', '26', '1', 'P01','C005','M002');
insert into facility(facility_id,facility_add,facility_people,facility_foor,facility_category,village_id,branch_id)
values ('F07', '�]�߿��]�ߥ��շR��109��', '2038', '2', 'P02','C005','M002');
insert into facility(facility_id,facility_add,facility_people,facility_foor,facility_category,village_id,branch_id)
values ('F08', '�]�߿��]�ߥ��j�P��53��', '128', '2', 'P02','C005','M002');
insert into facility(facility_id,facility_add,facility_people,facility_foor,facility_category,village_id,branch_id)
values ('F09', '�]�߿��Y�������ڨ��M����102��', '353', '1', 'P03','C006','M003');
insert into facility(facility_id,facility_add,facility_people,facility_foor,facility_category,village_id,branch_id)
values ('F10', '�]�߿��Y�������������@��69��', '501', '1', 'P04','C007','M003');
insert into facility(facility_id,facility_add,facility_people,facility_foor,facility_category,village_id,branch_id)
values ('F11', '�]�߿��Y�����H�q��������65��', '194', '1', 'P01','C008','M003');
insert into facility(facility_id,facility_add,facility_people,facility_foor,facility_category,village_id,branch_id)
values ('F12', '�]�߿��Y�����H�q��������116��', '78', '1', 'P04','C008','M003');



insert into village(village_id,village_category,village_add,village_tel)
values ('C001', '�j�H��', '�˫n���q��1035��', '03 758 1072');
insert into village(village_id,village_category,village_add,village_tel)
values ('C002', '�˫n��', '�˫n��˫n�����s�� 103 ��', '037-472735');
insert into village(village_id,village_category,village_add,village_tel)
values ('C003', '�s�Ψ�', '�˫n��s�Ψ������ 14 ��', '037-614186');
insert into village(village_id,village_category,village_add,village_tel)
values ('C004', '�H����', '���s��H����������136-1��', '037-724839');
insert into village(village_id,village_category,village_add,village_tel)
values ('C005', '��]��', '�]�ߥ���]�������� 766 ��', '037-333240');
insert into village(village_id,village_category,village_add,village_tel)
values ('C006', '���ڨ�', '���ڨ����ڸ�96��', '037-660001');
insert into village(village_id,village_category,village_add,village_tel)
values ('C007', '������', '���������j��82��', '037-661145');
insert into village(village_id,village_category,village_add,village_tel)
values ('C008', '�H�q��', '�H�q���H�q��53��1��', '037-616072');

insert into facility_category(facility_id,facility_name)
values ('P01', '���J');
insert into facility_category(facility_id,facility_name)
values ('P02', '�j��');
insert into facility_category(facility_id,facility_name)
values ('P03', '���@�]�I');
insert into facility_category(facility_id,facility_name)
values ('P04', '�p����');

insert into branch(branch_id,branch_name,branch_add,branch_tel)
values ('M001', '�˫n����','�]�߿��˫n����ڵ�72��','03 747 4796');
insert into branch(branch_id,branch_name,branch_add,branch_tel)
values ('M002', '�]�ߤ���','�]�߿��]�ߥ������109��','03 732 0059');
insert into branch(branch_id,branch_name,branch_add,branch_tel)
values ('M003', '�Y������','�]�߿��Y����������503��','03 766 3004');
COMMIT;

--4.1 �C�X�Һްϰ줺����@�����]�I�j��1000�e�H�ƶq���Һޤ����Τ����s���q�� �C
SELECT b.branch_name AS �Һޤ���, b.branch_tel AS �����q��
FROM facility f
JOIN branch b ON f.branch_id = b.branch_id
WHERE f.facility_people > 1000
GROUP BY b.branch_name, b.branch_tel;

--4.2 �C�X�Һްϰ줺����@�����]�I�j��1000�e�H�ƶq���Һޤ����Τ����s���q�ܨíp��X�U�Һޤ����ƶq �C
SELECT
  b.branch_name AS �Һޤ���,
  b.branch_tel AS �����q��,
  COUNT(f.facility_id) AS �]�I�ƶq
FROM
  facility f
JOIN
  branch b ON f.branch_id = b.branch_id
WHERE
  f.facility_people > 1000
GROUP BY
  b.branch_name,b.branch_tel;
  
--4.3 �ӤW�D�A �A�ɤW�����]�I�a�}�B����
SELECT 
    b.branch_name AS �Һޤ���,
    b.branch_tel AS �����s���q��,
    COUNT(f.facility_id) AS �]�I�ƶq,
    f.facility_add AS �����]�I�a�},
    fc.facility_name AS ����
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


--4.3 �ӤW�D�A �A�ɤW�����]�I�a�}�B����
SELECT
  b.branch_name AS �Һޤ���,
  b.branch_tel AS �����q��,
  COUNT(f.facility_id) OVER (PARTITION BY b.branch_id) AS �]�I�ƶq,
  f.facility_add AS �����]�I�a�},
  fc.facility_name AS ����
FROM
  facility f
JOIN
  branch b ON f.branch_id = b.branch_id
JOIN
  facility_category fc ON fc.facility_id = f.facility_category
WHERE
  f.facility_people > 1000;
  
--4.4 �d�߳]�I�a�}�]�t�u���v�r�������]�I�A�C�X��ƥ����t�����O�B�����]�I�a�}�B�e�H�ƶq�B�Һޤ����Τ����s���q�� �C
SELECT 
    v.village_category AS �����O,
    f.facility_add AS �����]�I�a�},
    f.facility_people AS �e�H�ƶq,
    b.branch_name AS �Һޤ���,
    b.branch_tel AS �����s���q��
FROM 
    facility f
JOIN 
    village v ON f.village_id = v.village_id
JOIN 
    branch b ON f.branch_id = b.branch_id
WHERE 
    f.facility_add LIKE '%��%';
    
--4.5 �d�ߩҦ����O�����J�Τj�Ӫ������]�I�C�X��ƥ����]�t�����O�B�����줽�Ǧ�m�B�����]�I�a�}�B�e�H�ƶq �C
SELECT 
    v.village_category AS �����O,
    v.village_add AS �����줽��,
    f.facility_add AS �����]�I�a�},
    f.facility_people AS �e�H�ƶq
FROM 
    facility f
JOIN 
    village v ON f.village_id = v.village_id
JOIN 
    facility_category fc ON f.facility_category = fc.facility_id
WHERE 
    fc.facility_name='���J' OR fc.facility_name='�j��';

--5
CREATE TABLE facility2 AS SELECT * FROM facility;--�קK���m��4�����ҥH�ƻs�@��
COMMIT;

--5.1 ��s�����]�I�a�} �O �u�]�߿��˫n��M����79���v���e�H�ƶq�� 5000 �H �C
UPDATE facility2
SET facility_people='5000'
WHERE facility_add='�]�߿��˫n��M����79��';

--5.2 �R�������]�I�p �� 1000 �e�H�ƶq�� ��� �C
DELETE FROM facility2
WHERE facility_people<1000;
