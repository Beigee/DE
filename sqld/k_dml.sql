-- DML : DATA MANU LANGUAGE
-- 테이블에 값을 추가(INSERT) 하거나 수정(UPDATE) 하거나 삭제(DELETE)

-- INSERT
-- 새로운 행을 추가하는 구문
-- INSERT INTO 테이블명(컬러명1, 컬럼명2, ...) VALUES(데이터1, 데이터2, ...)
-- 컬럼을 지정하지 않으면 NULL이 들어간다.
-- 모든 컬럼에 값을 넣은 구문일 경우 컬러몀은 생략이 가능하다.
--EX) INSERT INTO 테이블명 VALUES(데이터1, 데이터2, ...)

--INSERT INTO YSJ_EMP(EID, PHONE, HIRE_DATE, ENO, ENAME, MARRIAGE, AGE)
--VALUES(0, '010-0000-1234', '2022-09-29', '940501-1111111', 'YSJ', 'N', 29);

-- 서브쿼리로 데이터 입력하기
CREATE TABLE YSJ_EMP_DEPT(
    EMP_ID NUMBER,
    EMP_NAME VARCHAR2(30, CHAR),
    DEPT_TITLE VARCHAR2(30, CHAR)
);

--4. UPDATE
-- 수정
-- UPDATE 테이블명 SET 컬럼명 = 변경할 값, ... [WHERE절]
UPDATE YSJ_EMP_DEPT SET DEPT_TITLE='인사잘함부' WHERE EMP_NAME='전지연';

UPDATE YSJ_EMP_DEPT 
SET DEPT_TITLE = (SELECT DEPT_CODE FROM EMPLOYEE WHERE EMP_NAME='전지연')
WHERE EMP_NAME='전지연';

--5. DELETE
-- 테이블의 행을 삭제하는 구문
-- WHERE절 지정하지 않으면 모든 데이터가 사라진다.
-- DELETE FROM 테이블명 WHERE 조건식

-- DELET YSJ_EMP_DEPT WHERE EMP_NAME='전지연'

-- TRUNCATE : 테이블 전체 행 삭제
--              장점 : 빠르다
--              단점 : 롤백이 안됨
TRUNCATE TABLE YSJ_EMP_DEPT;