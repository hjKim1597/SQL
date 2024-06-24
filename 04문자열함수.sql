--���ڿ� �Լ�
SELECT LOWER('HELLO WORLD') FROM DUAL; -- SQL�� �����ϰ� �����ϱ� ���� ���� ���̺�

SELECT LOWER(FIRST_NAME), UPPER(FIRST_NAME), INITCAP(FIRST_NAME) FROM EMPLOYEES;

--LENGTH ���ڿ� ����
--INSTR ���ڿ� ã��
SELECT FIRST_NAME, LENGTH(FIRST_NAME) FROM EMPLOYEES;
SELECT FIRST_NAME, INSTR(FIRST_NAME, 'a') FROM EMPLOYEES; -- a�� �ִ� ��ġ ��ȯ, ������ 0

--SUBSTR ���ڿ� �ڸ��� 1. 3�̸� ���ڿ� ����// 2. 3��° ��ġ���� 2�� �ڸ�
SELECT FIRST_NAME, SUBSTR(FIRST_NAME, 3), SUBSTR(FIRST_NAME, 3, 2) FROM EMPLOYEES; 

--CONCAT ���ڿ� ��ġ�� // ||�� ����Ŭ������ ����
SELECT FIRST_NAME || LAST_NAME, CONCAT(FIRST_NAME, LAST_NAME) FROM EMPLOYEES;

--LPAD(���ʿ��� ä��), RPAD(�����ʿ��� ä��) ������ �����ϰ�, Ư�����ڷ� ���� ä��
SELECT LPAD('ABC', 10, '*') FROM DUAL; -- ABC�� �� 10ĭ���, ������ �κ��� ���ʿ��� *�� ä��
SELECT LPAD(FIRST_NAME, 10, '*'), RPAD(FIRST_NAME, 10, '-') FROM EMPLOYEES;-- �����ʿ��� ä��

--LTRIM(��), RTRIM(��), TRIM : ������� �Ǵ� ���ڻ���
SELECT TRIM(' HELLO WORLD  '), LTRIM(' HELLO WORLD  '), RTRIM(' HELLO WORLD  ') FROM DUAL; 
SELECT LTRIM('HELLO WORLD', 'HE') FROM DUAL;

--REPLACE ���ڿ� ����  //
SELECT REPLACE('���� �뱸 ���� �λ� ���', ' ' ,'->') FROM DUAL; -- ������ ȭ��ǥ�� �ٲ�  
SELECT REPLACE('���� �뱸 ���� �λ� ���', ' ' ,'') FROM DUAL; -- ������ ���� 

---------------------------------------------------------------------------------
--���� 1.
--EMPLOYEES ���̺� ���� �̸�, �Ի����� �÷����� �����ؼ� �̸������� �������� ��� �մϴ�.
--���� 1) �̸� �÷��� first_name, last_name�� �ٿ��� ����մϴ�.
--���� 2) �Ի����� �÷��� xx/xx/xx�� ����Ǿ� �ֽ��ϴ�. xxxxxx���·� �����ؼ� ����մϴ�.

SELECT CONCAT(FIRST_NAME,LAST_NAME) AS �̸�,  REPLACE(HIRE_DATE, '/', '') AS �Ի����� FROM EMPLOYEES ORDER BY FIRST_NAME ASC ;


--���� 2.
--EMPLOYEES ���̺� ���� phone_numbe�÷��� ###.###.####���·� ����Ǿ� �ִ�
--���⼭ ó�� �� �ڸ� ���� ��� ���� ������ȣ (02)�� �ٿ� ��ȭ ��ȣ�� ����ϵ��� ������ �ۼ��ϼ���

SELECT REPLACE(PHONE_NUMBER, SUBSTR(PHONE_NUMBER, 1, 4), '(02)') FROM EMPLOYEES;




--���� 3. EMPLOYEES ���̺��� JOB_ID�� it_prog�� ����� �̸�(first_name)�� �޿�(salary)�� ����ϼ���.
--���� 1) ���ϱ� ���� ���� �ҹ��ڷ� �Է��ؾ� �մϴ�.(��Ʈ : lower �̿�)
--���� 2) �̸��� �� 3���ڱ��� ����ϰ� �������� *�� ����մϴ�. 
--�� ���� �� ��Ī�� name�Դϴ�.(��Ʈ : rpad�� substr �Ǵ� substr �׸��� length �̿�)
--���� 3) �޿��� ��ü 10�ڸ��� ����ϵ� ������ �ڸ��� *�� ����մϴ�. 
--�� ���� �� ��Ī�� salary�Դϴ�.(��Ʈ : lpad �̿�)

SELECT RPAD(SUBSTR(FIRST_NAME, 1, 3), LENGTH(FIRST_NAME), '*') AS name, RPAD(SALARY, 10, '*') AS salary FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG';



