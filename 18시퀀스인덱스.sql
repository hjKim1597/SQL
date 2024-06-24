--시퀀스 (순차적으로 증가하는 값)
--주로 PK에 적용될 수 있음

SELECT * FROM USER_SEQUENCES;

--시퀀스 생성(외우기)
CREATE SEQUENCE DEPTS_SEQ
       INCREMENT BY 1 -- 1씩 증가
       START WITH 1   -- 1에서 시작
       MAXVALUE 10    -- 최대값 10
       NOCACHE        -- 캐시에 시퀀스를 두지 않음
       NOCYCLE;       -- 최대값에 도달했을 때 재사용X

--ㄴ적용
DROP TABLE DEPTS;
CREATE TABLE DEPTS (
       DEPT_NO NUMBER(2) PRIMARY KEY,
       DEPT_NAME VARCHAR2(30)
);

--시퀀스 사용방법 2개
SELECT DEPTS_SEQ.CURRVAL FROM DUAL; --현재 시퀀스 (NEXTVAL가 선행 실행되어야함)
SELECT DEPTS_SEQ.NEXTVAL FROM DUAL; --현재 시퀀스 증가값만큼 증가

--시퀀스 적용
INSERT INTO DEPTS VALUES(DEPTS_SEQ.NEXTVAL, 'EXAMPLE'); -- 10까지 가능

SELECT * FROM DEPTS;

--시퀀스 수정
ALTER SEQUENCE DEPTS_SEQ MAXVALUE 1000;
ALTER SEQUENCE DEPTS_SEQ INCREMENT BY 10;

--시퀀스가 이미 사용되고 있다면, DROP하면 안됩니다.
--만약 시퀀스를 초기화 해야 한다면?
--시퀀스의 증가값을 - 음수로 만들어서 초기화 인것 처럼 쓸 수는 있음
SELECT DEPTS_SEQ.CURRVAL FROM DUAL;

--1. 시퀀스의 증가를 -(현재값 -1)로 바꿈
ALTER SEQUENCE DEPTS_SEQ INCREMENT BY -109;
--2. 현재 시퀀스를 전진
SELECT DEPTS_SEQ.NEXTVAL FROM DUAL;
--3. 다시 증가값을 1로 변경
ALTER SEQUENCE DEPTS_SEQ INCREMENT BY 1;
--------------------------------------------------------
--시퀀스 응용 (나중에 테이블을 설계할 때, 데이터가 엄청 많다면 PK에 시퀀스의 사용 고려)
--문자열 PK(연도값 - 일련번호)
--년도가 바뀌면 시퀀스를 초기화함
CREATE TABLE DEPTS2 (
       DEPT_NO VARCHAR2(20) PRIMARY KEY,
       DEPT_NAME VARCHAR2(20)
);
INSERT INTO DEPTS2 VALUES(TO_CHAR(SYSDATE, 'YYYY-MM-') || LPAD(DEPTS_SEQ.NEXTVAL, 6, 0), 'EXAMPLE');
SELECT * FROM DEPTS2;
--시퀀스 삭제
DROP SEQUENCE 시퀀스명;

------------------------------------------------------------------------------
--INDEX
--INDEX는 PK, UNIQUE에 자동으로 생성되고, 조회를 빠르게 하는 HINT 역할을 합니다.
--INDEX 종류는 고유인덱스, 비고유인덱스가 있음
--UNIQUE한 컬럼에는 UNIQUE인덱스(고유) 인덱스가 쓰임
--일반컬럼에는 비고유 인덱스를 지정할 수 있음
--INDEX는 조회를 빠르게 하지만, DML구문이 많이 사용되는 컬럼은 오히려 성능저하를 부를 수도 있음

--인덱스 생성
CREATE TABLE EMPS_IT AS (SELECT * FROM EMPLOYEES);

--인덱스가 없을 떄 조회
SELECT * FROM EMPS_IT WHERE FIRST_NAME = 'Nancy';
--비고유 인덱스 생성
CREATE INDEX EMPS_IT_IX ON EMPS_IT (FIRST_NAME);

--인덱스 생성후 FIRST_NAME으로 다시 조회
SELECT * FROM EMPS_IT WHERE FIRST_NAME = 'Nancy';

--인덱스 삭제 (인덱스는 삭제하더라도 테이블에 영향을 미치지 않음)
DROP INDEX EMPS_IT_IX;

--결합인덱스 (여러개 컬럼을 동시에 인덱스로 지정)
CREATE INDEX EMPS_IT_IX ON EMPS_IT (FIRST_NAME, LAST_NAME);

SELECT * FROM EMPLOYEES WHERE FIRST_NAME = 'Nancy'; --힌트를 얻음
SELECT * FROM EMPLOYEES WHERE FIRST_NAME = 'Nancy' AND LAST_NAME = 'Greenberg';--힌트를 얻음
SELECT * FROM EMPLOYEES WHERE LAST_NAME = 'Greenberg';

--고유인덱스 (PK, UNIQUE에서 자동 생성됨)
CREATE UNIQUE INDEX 인덱스명 ~~~~~~~~;

























