--숫자 함수

--ROUND 반올림
SELECT ROUND(45.923), ROUND(45.923, 0), ROUND (45.923, 2), ROUND(45.923, -1) FROM DUAL;

 --TRUNC 절삭
SELECT TRUNC(45.923), TRUNC(45.923, 0), TRUNC(45.923, 2), TRUNC(45.923, -1)  FROM DUAL;

--ABS 절대값
--CEIL 올림
--FLOOR 내림
SELECT ABS(-45), CEIL(3.14), FLOOR(3.14) FROM DUAL;

--MOD 나머지
SELECT 5 / 3 , MOD(5, 3) FROM DUAL; --몫, 나머지

-------------------------------------------------------------------------------
--날짜 함수
SELECT SYSDATE FROM DUAL;   -- 년월일(시분초 숨기고 있음)
SELECT SYSTIMESTAMP FROM DUAL;  --년월일 시분초

--날짜는 연산이 됩니다.
SELECT HIRE_DATE, HIRE_DATE + 1, HIRE_DATE - 1 FROM EMPLOYEES;  --일자 기준으로 연산이 됩니다.
SELECT FIRST_NAME, (SYSDATE - HIRE_DATE) / 7 FROM EMPLOYEES;  --입사한 이후 몇주? 
SELECT FIRST_NAME, (SYSDATE - HIRE_DATE) / 365 FROM EMPLOYEES;  --입사한 이후 몇년?

--날짜의 반올림, 절삭
SELECT ROUND(SYSDATE), TRUNC(SYSDATE) FROM DUAL; -- 일자 기준으로 반올림, 절삭
SELECT ROUND(SYSDATE, 'MONTH'), TRUNC(SYSDATE, 'MONTH') FROM DUAL;  --월 기준으로 반올림, 절삭
SELECT ROUND(SYSDATE, 'YEAR'), TRUNC(SYSDATE, 'YEAR') FROM DUAL;    --연 기준으로 반올림, 절삭












