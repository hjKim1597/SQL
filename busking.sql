SELECT * FROM 
RESERVATIONS R JOIN USERS U
ON R.USER_ID = U.USER_ID
JOIN LOCATIONS L
ON R.LOCA_ID = L.LOCA_ID
WHERE R.LOCA_ID = (SELECT LOCA_ID FROM MANAGER WHERE MANAGER_ID ='TEST')
AND R.RES_REGDATE LIKE '24/07/%'
AND ROWNUM 'PAGE';

SELECT * FROM users;
SELECT * FROM FAQ;
SELECT * FROM RESERVATIONS ;
DELETE FROM FAQ WHERE FAQ_NUM = 12;
DESCRIBE FAQ;
COMMIT;
INSERT INTO FAQ VALUES (1, '관리자', NULL, '한강공원은 어디에 있나요? 어떻게 가요?', '11개 한강공원 위치보기 
- 한강공원 > 전체공원현황 바로가기', SYSDATE, NULL, '관리자' );
INSERT INTO FAQ (FAQ_TITLE, FAQ_CONTENT) VALUES ('여의도 물빛무대(수상무대)', '[대관] 대관신청에 제한이 있나요? 
여의도 물빛무대 대관내규에 의거하여 
법령을 위반하는 내용의 공연 또는 행사의 목적으로 하는 경우, 예술성이 배제된 특정종교의 포교, 정치적인 목적의 공연 또는 행사 등이 제한됩니다.');
INSERT INTO FAQ VALUES (4, '관리자', NULL, '예약 날짜를 확인하고 싶어요', '예약날짜는 마이페이지의 예약현황을 통해 예약하신 일자를 확인할 수 있습니다.', SYSDATE, NULL, '관리자' );


    예약 날짜는 이달의 예약 메뉴에 있습니다
   
COMMIT;
SELECT * FROM RESERVATIONS WHERE LOCA_ID = '1' ORDER BY RES_DATE, RES_REGDATE ;

SELECT RES_RESULT FROM RESERVATIONS; 


SELECT * FROM LOCA_PLACE;

UPDATE FAQ
SET FAQ_NUM = 1
WHERE FAQ_NUM = 2;


SELECT * FROM BOARD_FREE;

SELECT * FROM USER_ERRORS WHERE NAME = 'RESERVATION_TRG';

예약 날짜를 확인하고 싶어요
    예약 날짜는 이달의 예약 메뉴에 있습니다
SELECT 
    R.RES_NUM AS RES_NUM,
    R.USER_ID AS USER_ID, 
    U.USER_NAME AS USER_NAME, 
    R.RES_DATE AS RES_DATE, 
    L.LOCA_NAME AS LOCA_NAME, 
    R.RES_AMP AS RES_AMP, 
    R.RES_CONTENT AS RES_CONTENT, 
    R.RES_COUNT AS RES_COUNT, 
    U.USER_PNO AS USER_PNO, 
    U.USER_EMAIL AS USER_EMAIL, 
    U.USER_ADDR AS USER_ADDR, 
    M.MANAGER_ID AS MANAGER_ID 
FROM 
    RESERVATIONS R 
    JOIN USERS U ON R.USER_ID = U.USER_ID 
    JOIN LOCATIONS L ON R.LOCA_ID = L.LOCA_ID 
    JOIN MANAGER M ON L.LOCA_PLACE = M.LOCA_PLACE 
WHERE 
    M.MANAGER_ID = #{managerId, jdbcType=VARCHAR} 
    AND TO_CHAR(R.RES_DATE, 'YY/MM/DD') LIKE '24/' || #{month, jdbcType=VARCHAR} || '/%';
    
SELECT 
    R.USER_ID AS USER_ID,  
    U.USER_NAME AS USER_NAME, 
    R.RES_DATE AS RES_DATE, 
    L.LOCA_NAME AS LOCA_NAME, 
    R.RES_AMP AS RES_AMP, 
    R.RES_CONTENT AS RES_CONTENT,
    R.RES_COUNT AS RES_COUNT, 
    U.USER_PNO AS USER_PNO, 
    U.USER_EMAIL AS USER_EMAIL, 
    U.USER_ADDR AS USER_ADDR,
    M.MANAGER_ID AS MANAGER_ID
FROM 
    RESERVATIONS R 
    JOIN USERS U ON R.USER_ID = U.USER_ID
    JOIN LOCATIONS L ON R.LOCA_ID = L.LOCA_ID
    JOIN MANAGER M ON L.LOCA_PLACE = M.LOCA_PLACE
WHERE 
    M.MANAGER_ID = 'hangang02'
    AND R.RES_DATE LIKE '24/08/%';
    
    
    SUBSTR(M.MANAGER_ID, 1, 7) = 'hangang' 
    AND SUBSTR(M.MANAGER_ID, 8) BETWEEN '01' AND '11'
    
INSERT INTO RESERVATIONS (USER_ID, RES_DATE, RES_AMP, RES_CONTENT, RES_COUNT)
        VALUES ('CCC123', TO_DATE('24/07/26', 'YY/MM/DD'), 'MICMICMIC', '밴드공연', 5);

SELECT USER_ID, RES_DATE, RES_AMP, RES_CONTENT, RES_COUNT FROM RESERVATIONS;

	AND R.RES_DATE LIKE '24//%'
SELECT
		R.USER_ID AS USER_ID,
		U.USER_NAME AS USER_NAME,
		R.RES_DATE AS RES_DATE,
		L.LOCA_NAME AS LOCA_NAME,
		R.RES_AMP AS RES_AMP,
		R.RES_CONTENT AS RES_CONTENT,
		R.RES_COUNT AS RES_COUNT,
		U.USER_PNO AS USER_PNO,
		U.USER_EMAIL AS USER_EMAIL,
		U.USER_ADDR AS USER_ADDR,
		M.MANAGER_ID AS MANAGER_ID
		FROM
		RESERVATIONS R
		JOIN USERS U ON R.USER_ID = U.USER_ID
		JOIN LOCATIONS L ON R.LOCA_ID = L.LOCA_ID
		JOIN MANAGER M ON L.LOCA_PLACE = M.LOCA_PLACE
		WHERE
		
		 M.MANAGER_ID = 'hangang02';
         
         
         
         
         SELECT
		R.USER_ID AS USER_ID,
		U.USER_NAME AS USER_NAME,
		R.RES_DATE AS RES_DATE,
		L.LOCA_NAME AS LOCA_NAME,
		R.RES_AMP AS RES_AMP,
		R.RES_CONTENT AS RES_CONTENT,
		R.RES_COUNT AS RES_COUNT,
		U.USER_PNO AS USER_PNO,
		U.USER_EMAIL AS USER_EMAIL,
		U.USER_ADDR AS USER_ADDR,
		M.MANAGER_ID AS MANAGER_ID
	FROM
		RESERVATIONS R
		JOIN USERS U ON R.USER_ID = U.USER_ID
		JOIN LOCATIONS L ON R.LOCA_ID = L.LOCA_ID
		JOIN MANAGER M ON L.LOCA_PLACE = M.LOCA_PLACE
	WHERE
		 M.MANAGER_ID = 'hangang02';
         
         
 SELECT * FROM MANAGER;        
	
     SELECT
    R.USER_ID AS USER_ID,
    U.USER_NAME AS USER_NAME,
    R.RES_DATE AS RES_DATE,
    L.LOCA_NAME AS LOCA_NAME,
    R.RES_AMP AS RES_AMP,
    R.RES_CONTENT AS RES_CONTENT,
    R.RES_COUNT AS RES_COUNT,
    U.USER_PNO AS USER_PNO,
    U.USER_EMAIL AS USER_EMAIL,
    U.USER_ADDR AS USER_ADDR,
    M.MANAGER_ID AS MANAGER_ID
FROM
    RESERVATIONS R
    JOIN USERS U ON R.USER_ID = U.USER_ID
    JOIN LOCATIONS L ON R.LOCA_ID = L.LOCA_ID
    JOIN MANAGER M ON L.LOCA_PLACE = M.LOCA_PLACE
WHERE M.MANAGER_ID = 'hangang01'
    AND R.RES_DATE LIKE TO_CHAR(TRUNC(SYSDATE, 'YYYY'), 'YYYY') || '/' || :month || '/%';  
    
    
   SELECT 
			R.RES_NUM AS RES_NUM,
			R.USER_ID AS USER_ID, 
			U.USER_NAME AS USER_NAME, 
			R.RES_DATE AS RES_DATE, 
			L.LOCA_NAME AS LOCA_NAME, 
			R.RES_AMP AS RES_AMP, 
			R.RES_CONTENT AS RES_CONTENT, 
			R.RES_COUNT AS RES_COUNT, 
			U.USER_PNO AS USER_PNO, 
			U.USER_EMAIL AS USER_EMAIL, 
			U.USER_ADDR AS USER_ADDR, 
			M.MANAGER_ID AS MANAGER_ID 
		FROM 
			RESERVATIONS R 
			JOIN USERS U ON R.USER_ID = U.USER_ID 
			JOIN LOCATIONS L ON R.LOCA_ID = L.LOCA_ID 
			JOIN MANAGER M ON L.LOCA_PLACE = M.LOCA_PLACE 
		WHERE M.MANAGER_ID = 'hangang02'
		AND R.RES_DATE LIKE CONCAT('24/', CONCAT(#{month, jdbcType=VARCHAR}, '/%'));
        
        
        
        
        
        
        
        
SELECT RES_RESULT FROM RESERVATIONS;         
        
        
SELECT * FROM USERS WHERE USER_ID LIKE '%hangang%';        
        
        
        
SELECT
			R.RES_NUM AS RES_NUM,
			R.USER_ID AS USER_ID,
			U.USER_NAME AS USER_NAME,
			R.RES_DATE AS RES_DATE,
			L.LOCA_NAME AS LOCA_NAME,
			R.RES_AMP AS RES_AMP,
			R.RES_CONTENT AS RES_CONTENT,
			R.RES_COUNT AS RES_COUNT,
			U.USER_PNO AS USER_PNO,
			U.USER_EMAIL AS USER_EMAIL,
			U.USER_ADDR AS USER_ADDR,
			M.MANAGER_ID AS MANAGER_ID
		FROM
			RESERVATIONS R
			JOIN USERS U ON R.USER_ID = U.USER_ID
			JOIN LOCATIONS L ON R.LOCA_ID = L.LOCA_ID
			JOIN MANAGER M ON L.LOCA_PLACE = M.LOCA_PLACE
		WHERE M.MANAGER_ID = 'hangang02';
		AND R.RES_DATE ('24/','08','/%') ;
        
        
        
        
        
        
        
        

