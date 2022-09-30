-- 서브쿼리(Sub Query)
-- 하나의 SQL문 안에 포함된 또다른 SQL문
-- SELECT, FROM, WHERE, HAVING 모두 사용 가능

-- 서브쿼리 위치에 따라서 이름이 다르다.
-- SELECT 절 : 스칼라 서브쿼리
-- FROM : 인라인 뷰
-- WHERE, HAVING : 서브쿼리

-- 서브쿼리로 부터 반환되는 RESULT SET의 모양에 따라
-- 단일행 :
-- 다중행 :
-- 다중열 :

-- 부서코드가 노옹철 사원과 같은 부서의 직원명단을 조회 하시오.
SELECT DEPT_CODE FROM EMPLOYEE WHERE EMP_NAME = '노옹철';
SELECT * FROM EMPLOYEE WHERE DEPT_CODE = 'D9';

SELECT * FROM EMPLOYEE WHERE DEPT_CODE = (SELECT DEPT_CODE FROM EMPLOYEE WHERE EMP_NAME = '노옹철');

-- 전 직원 평균 급여보다 많은 급여를 받고 있는 직원의
-- 사번, 이름, 직급코드, 급여를 조회하시오.
-- SELECT AVG(SALARY) FROM EMPLOYEE;
SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEE);

-- *** 단일행 서브쿼리
-- 단일행 서브쿼리, 서브쿼리의 조회 결과 값이 1개인 서브쿼리

--1. 노옹철 사원의 급여보다 많이 받는 직원의
-- 사번, 이름, 부서, 직급, 급여를 조회


--2. 가장 적은 급여를 받는 직원의
-- 사번, 이름, 급여, 부서, 직급, 입사일을 조회


--3. 부서별 급여의 합계가 가장 큰 부서를 조회
SELECT MAX(SUM(SALARY))
FROM EMPLOYEE
GROUP BY DEPT_CODE;

SELECT DEPT_CODE
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING SUM(SALARY) = (SELECT MAX(SUM(SALARY))
                        FROM EMPLOYEE
                        GROUP BY DEPT_CODE);


-- *** 다중행 서브쿼리
-- 서브쿼리의 조회 결과 값이 여러개 일 때
-- IN, ANY, ALL, EXISTS

-- IN : 서브쿼리의 결과 값들 중에서 하나라고 일치하는 값이 있으면 TRUE를 반환해 줌
-- 최고급여가 49999999원 보다 적은 급여등급을 가지고 있는 직원을 조회하시오.
SELECT sal_level from sal_grade WHERE max_sal < 4999999;

SELECT * FROM employee
-- WHERE sal_level = (SELECT sal_level FROM sal_grade WHERE max_sal < 4999999); (X)에러발생
WHERE sal_level in (SELECT sal_level FROM sal_grade WHERE max_sal < 4999999);


-- 비교연산자 ANY : 서브쿼리의 결과 값들 중에서 비교연산의 결과가 하나라고 TRUE가 나오면 TRUE 반환
--              WHERE 1 > ANY(서브쿼리) -> 서브쿼리의 결과값 : [0,3,5] => TRUE
--                                  -> 서브쿼리의 결과값 : [7,3,5] => FALSE
                                    
                                    
-- 박나라가 속한 부서의 가장 많은 급여를 받는 사람보다 연봉을 적게 받고
-- 박나라가 속한 부서에서 가장 적은 급여를 받는 사람보다는 많은 급여를 받는 사원들의 명단을 조회
select salary from employee where dept_code = 'D5';

SELECT *
FROM employee
WHERE salary < ANY(SELECT salary from employee WHERE dept_code =
                    (SELECT dept_code FROM employee WHERE emp_name='박나라'))
AND salary > ANY(SELECT salary from employee WHERE dept_code =
                    (SELECT dept_code FROM employee WHERE emp_name='박나라'));
                    
-- ** 비교연산자 ALL : 서브쿼리의 결과 값들과 비교연산 시 모두 TRUE가 나와야 TRUE
--              WHERE 1 > ALL(서브쿼리) -> 서브쿼리의 결과값 : [0,0.5,0.7] => TRUE

-- 박나라가 속한 부서의 사람들 중 가장 많은 급여를 받는 사람보다 
-- 더 많은 급여를 받는 직원의 명단을 조회
SELECT *
FROM employee
WHERE salary > ALL(SELECT salary FROM employee WHERE dept_code =
            (SELECT dept_code FROM employee WHERE emp_name='박나라'));

-- EXISTS : 서브쿼리 실행 결과값이 존재하면 TRUE 없으면 FALSE
-- 매니저가 존대하지 않는 사원을 조회하시오
SELECT *
FROM employee e
WHERE NOT EXISTS(SELECT emp_id FROM employee WHERE emp_id = e.manager_id);

-- 퇴사한 직원과 같은 부서, 같은 직급에 해당하는 사원의 이름, 직급, 부서, 입사일을 조회
SELECT emp_name, job_code, dept_code, hire_date
FROM employee
WHERE dept_code in (SELECT dept_code FROM employee WHERE ent_yn = 'Y')
AND job_code in (SELECT job_code FROM employee WHERE ent_yn = 'Y');


-- 다중열 서브쿼리
SELECT emp_name, job_code, dept_code, hire_date
FROM employee
WHERE (dept_code, job_code) in (SELECT dept_code, job_code FROM employee WHERE ent_yn = 'Y');


-- 상(호연)관 쿼리
-- 메인쿼리가 사용하는 컬럼값을 서브쿼리가 이용하는 쿼리
-- 메인 쿼리의 컬럼값이 변경되면 서브쿼리의 결과값도 바뀐다
SELECT *
FROM employee e
WHERE NOT EXISTS(SELECT emp_id FROM employee WHERE emp_id = e.manager_id);


-- *** 스칼라 서브쿼리
-- select 절에서 사용하는 서브쿼리
-- 스칼라 서브쿼리는 반드시 단일값이 반환되어야 한다.
-- 모든 사원의 사번, 이름, 관리자사번, 관리자명을 조회
select emp_id, emp_name, manager_id
, (select emp_name from employee where emp_id = e.manager_id)
from employee e
order by emp_name desc;


-- *** rownum
select rownum, emp_id, emp_name
from employee;


-- *** 인라인 뷰 *** (다른 것에 비해 자주 사용됨.)
-- from 절에서 작성하는 서브쿼리
-- 서브쿼리의 result set을 테이블 대신 사용

-- 급여를 많이 받는 상위 5명을 조회
select emp_name, salary
from
(select emp_name, salary
    from employee
    order by salary desc)
where rownum <= 5;
