--�������� (�÷��� ���� ������ ����, ����, ���� �� �̻��� �����ϱ� ���� ����
--PRIMARY KEY - ���̺� ����Ű,  �ߺ� X, NULL (X), PK�� ���̺��� 1��
--NOT NULL - NULL�� ������� ����
--UNIQUE KEY - �ߺ� X, NULL (O)
--FOREIGN KEY - �����ϴ� ���̺��� PK�� �־���� Ű, �ߺ� O, NULL (O)
--CHECK - �÷������� ������ ����

--��ü �������� Ȯ��
SELECT * FROM USER_CONSTRAINTS;

DROP TABLE DEPTS;

-- 1ST (������ ��������)
CREATE TABLE DEPTS(
    DEPT_NO NUMBER(2)       CONSTRAINT DEPTS_DEPT_NO_PK PRIMARY KEY,
    DEPT_NAME VARCHAR2(30)  CONSTRAINT DEPTS_DEPT_NAME_NN NOT NULL,
    DEPT_DATE DATE          DEFAULT SYSDATE, --���������� �ƴϸ� (�÷��� �⺻��)
    DEPT_PHONE VARCHAR2(30) CONSTRAINT DEPTS_DEPT_PHONE_UK UNIQUE,   
    DEPT_GENDER CHAR(1)     CONSTRAINT DEPTS_DEPT_GENDER_CK CHECK(DEPT_GENDER IN ('F', 'M') ),
    LOCA_ID NUMBER(4)       CONSTRAINT DEPTS_LOCA_ID_FK REFERENCES LOCATIONS(LOCATION_ID)
);

INSERT INTO DEPTS(DEPT_NO, DEPT_NAME, DEPT_PHONE, DEPT_GENDER, LOCA_ID) 
VALUES(1, NULL, '010..', 'F', 1700 ); -- NOT NULL���� ����

INSERT INTO DEPTS(DEPT_NO, DEPT_NAME, DEPT_PHONE, DEPT_GENDER, LOCA_ID) 
VALUES(1, 'HONG', '010..', 'X', 1700 ); -- CHECK ���� ����

INSERT INTO DEPTS(DEPT_NO, DEPT_NAME, DEPT_PHONE, DEPT_GENDER, LOCA_ID) 
VALUES(1, 'HONG', '010..', 'F', 100 ); -- ���� ���� ����

INSERT INTO DEPTS(DEPT_NO, DEPT_NAME, DEPT_PHONE, DEPT_GENDER, LOCA_ID) 
VALUES(1, 'HONG', '010..', 'F', 1700 ); -- ����!

INSERT INTO DEPTS(DEPT_NO, DEPT_NAME, DEPT_PHONE, DEPT_GENDER, LOCA_ID) 
VALUES(2, 'HONG', '010..', 'F', 1700 ); -- ����ũ ���� ����

--2ND (���̺��� �������� ����)
DROP TABLE DEPTS;
CREATE TABLE DEPTS (
    DEPT_NO NUMBER(2),
    DEPT_NAME VARCHAR2(30) NOT NULL, --NOT NULL�� ������ ����
    DEPT_DATE DATE DEFAULT SYSDATE,
    DEPT_PHONE VARCHAR2(30),
    DEPT_GENDER CHAR(1),
    LOCA_ID NUMBER(4),
    CONSTRAINT DEPT_DEPT_NO_PK PRIMARY KEY (DEPT_NO /*, DEPT_NAME */), --�÷��� (����Ű�� ���̺����� ���� ������)
    CONSTRAINT DEPT_DEPT_PHONE_UK UNIQUE (DEPT_PHONE),
    CONSTRAINT DEPT_DEPT_GENDER_CK CHECK (DEPT_GENDER IN ('F', 'M') ),
    CONSTRAINT DEPT_LOCA_ID_FK FOREIGN KEY (LOCA_ID) REFERENCES LOCATIONS(LOCATION_ID)
);

DROP TABLE DEPTS;
--------------------------------------------------------------------------------
--ALTER�� �������� �߰�
CREATE TABLE DEPTS (
    DEPT_NO NUMBER(2),
    DEPT_NAME VARCHAR2(30),
    DEPT_DATE DATE DEFAULT SYSDATE,
    DEPT_PHONE VARCHAR2(30),
    DEPT_GENDER CHAR(1),
    LOCA_ID NUMBER(4)
);
--PK�߰�
ALTER TABLE DEPTS ADD CONSTRAINT DEPT_DEPT_NO_PK PRIMARY KEY (DEPT_NO);
--NOT NULL�� �� ����(MODIFY) �� �߰��մϴ�.
ALTER TABLE DEPTS MODIFY DEPT_NAME VARCHAR2(30) NOT NULL; 
--UNIQUE�߰�
ALTER TABLE DEPTS ADD CONSTRAINT DEPT_DEPT_PHONE_UK UNIQUE (DEPT_PHONE);
--FK�߰�
ALTER TABLE DEPTS ADD CONSTRAINT DEPT_LOCA_ID_FK FOREIGN KEY (LOCA_ID) REFERENCES LOCATIONS(LOCATION_ID);
--CHECK�߰�
ALTER TABLE DEPTS ADD CONSTRAINT DEPT_DEPT_GENDER_CK CHECK( DEPT_GENDER IN ('F', 'M') );

--�������� ����--
ALTER TABLE DEPTS DROP CONSTRAINT DEPT_DEPT_GENDER_CK; --�������Ǹ� ���
--------------------------------------------------------------------------------
--������ ���� ���̺��� �����ϰ� �����͸� insert�غ�����.
--���̺� ���������� �Ʒ��� �����ϴ�. 
--����) M_NAME �� ���������� 20byte, �ΰ��� ������� ����
--����) M_NUM �� ������ 5�ڸ�, PRIMARY KEY �̸�(mem_memnum_pk) 
--����) REG_DATE �� ��¥��, �ΰ��� ������� ����, UNIQUE KEY �̸�:(mem_regdate_uk)
--����) GENDER ���������� 1byte, CHECK���� (M, F)
--����) LOCA ������ 4�ڸ�, FOREIGN KEY ? ���� locations���̺�(location_id) �̸�:(mem_loca_loc_locid_fk)
DROP TABLE EMPS;

CREATE TABLE EMPS(
                M_NAME VARCHAR(20) NOT NULL,
                M_NUM NUMBER(5),
                REG_DATE DATE NOT NULL,
                GENDER CHAR(1), -- CHECK (GENDER IN('M', 'F')),
                LOCA NUMBER(4),
                 PRIMARY KEY (M_NUM),
                 UNIQUE KEY(REG_DATE),
                CONSTRAINT M_M_NUM_PK PRIMARY KEY (MEM_MEMNUM_PK),
                CONSTRAINT M_REG_DATE_UK UNIQUE KEY (MEM_REGDATE_UK),
                CONSTRAINT M_GENDER CK CHECK (M_GENDER IN('M', 'F')),
                CONSTRAINT M_LOCA_FK FOREIGN KEY (MEM_LOCA_LOC_LOCID_FK) REFERENCE LOCATIONS(LOCATION_ID)                 
);
ALTER TABLE EMPS ADD CONSTRAINT mem_memnum_pk PRIMARY KEY(M_NUM);
ALTER TABLE EMPS ADD CONSTRAINT mem_regdate_uk UNIQUE(REG_DATE);
ALTER TABLE EMPS ADD CONSTRAINT mem_gender_ck CHECK (GENDER IN ('M', 'F'));
ALTER TABLE EMPS ADD CONSTRAINT mem_loca_fk FOREIGN KEY (LOCA) REFERENCE LOCATION(LOCATION_ID);

INSERT INTO EMPS VALUES ('AAA', '2018-07-01', 'M', 1800);
INSERT INTO EMPS VALUES ('BBB', '2018-07-02', 'F', 1900);
INSERT INTO EMPS VALUES ('CCC', '2018-07-03', 'M', 2000);
INSERT INTO EMPS VALUES ('DDD', SYSDATE, 'M', 2000);


--����2.
--���� �뿩 �̷� ���̺��� �����Ϸ� �մϴ�.
--���� �뿩 �̷� ���̺���
--�뿩��ȣ(����) PK, ���⵵����ȣ(����), �뿩��(��¥), �ݳ���(��¥), �ݳ�����(Y/N)
--�� �����ϴ�.
--������ ���̺��� ������ ������.
DROP TABLE book_rental_history;
         
CREATE TABLE RENTALS (
    RENTALS_ID NUMBER(10),
    BOOK_ID VARCHAR2(30),
    RENTALS_DATE DATE DEFAULT SYSDATE,
    RETURNS_DATE DATE,
    RETURNS_YN CHAR(1) DEFAULT 'N'
);
  ALTER TABLE RENTALS ADD CONSTRAINT RENTALS_ID
         
         























