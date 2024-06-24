--PLSQL(���α׷� SQL)

--������ F5���� ������ ���Ѽ� �����ŵ�ϴ� (CTRL+ ENTER X)

--��±����� ���� ���๮
SET SERVEROUTPUT ON;
--�͸���
DECLARE
    V_NUM NUMBER;--������ ����
    V_NAME VARCHAR2(10) := 'ȫ�浿'; --����� ���� ���ÿ� ����
BEGIN
    
    V_NUM := 10;
    V_NAME := 'ȫ�浿';

    DBMS_OUTPUT.PUT_LINE(V_NAME || '���� ���̴� ' || V_NUM || '�Դϴ�.');

END;

--DML ������ �Բ� ����� �� �ֽ��ϴ�
--SELECT -> INSERT-> INSERT
DECLARE
    NAME VARCHAR2(30);
    SALARY NUMBER;
    LAST_NAME EMPLOYEES.LAST_NAME%TYPE; -- EMPLOYEE ���̺��� LAST_NAME �÷��� ������ Ÿ������ �����ϰ���
BEGIN

    SELECT FIRST_NAME, LAST_NAME, SALARY 
    INTO NAME, LAST_NAME, SALARY -- ���� ����� ������ ����
    FROM EMPLOYEES 
    WHERE EMPLOYEE_ID = 100;
    
    DBMS_OUTPUT.PUT_LINE(NAME);
    DBMS_OUTPUT.PUT_LINE(SALARY);
    DBMS_OUTPUT.PUT_LINE(LAST_NAME);
    
END;

--------------------------------------------------------------------------------
--2008�� �Ի��� ����� �޿� ����� ���ؼ� ���ο� ���̺� INSERT
CREATE TABLE EMP_SAL(
    YEARS VARCHAR2(50),
    SALARY NUMBER(10)
);

DECLARE
    YEARS VARCHAR2(50):= 2010;
    SALARY NUMBER;
    
BEGIN
    SELECT AVG(SALARY) 
    INTO SALARY -- ���� SALARY �� ����
    FROM EMPLOYEES WHERE TO_CHAR(HIRE_DATE, 'YYYY') = 2008;
    
    INSERT INTO EMP_SAL(YEARS, SALARY) VALUES (YEARS, SALARY);
    COMMIT;
    
END;

-- 
SELECT * FROM EMP_SAL;

-----------------------------------------------------------------------------
--��� ���̺��� �����ȣ�� ���� ū ����� ã�Ƴ� ��, 
--	 �� ��ȣ +1������ �Ʒ��� ����� emps���̺� 
--employee_id, last_name, email, hire_date, job_id��  �ű� �Է��ϴ� �͸� ����� ����� ���ô�.
--<�����>   : steven
--<�̸���>   : stevenjobs
--<�Ի�����> : ���ó�¥
--<JOB_ID> : CEO


CREATE TABLE EMPS_IT AS (SELECT * FROM EMPLOYEES);

DECLARE
    NUM NUMBER;
BEGIN
    SELECT MAX(EMPLOYEE_ID) + 1
    INTO NUM
    FROM EMPLOYEES;
    
    INSERT INTO EMPS_IT(EMPLOYEE_ID, LAST_NAME, EMAIL, HIRE_DATE, JOB_ID)
    VALUES (NUM, 'steven', 'stevenjobs', SYSDATE, 'CEO');
    
    COMMIT;
END;

SELECT * FROM EMPS_IT;







