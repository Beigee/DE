-- ��������(Sub Query)
-- �ϳ��� SQL�� �ȿ� ���Ե� �Ǵٸ� SQL��
-- SELECT, FROM, WHERE, HAVING ��� ��� ����

-- �������� ��ġ�� ���� �̸��� �ٸ���.
-- SELECT �� : ��Į�� ��������
-- FROM : �ζ��� ��
-- WHERE, HAVING : ��������

-- ���������� ���� ��ȯ�Ǵ� RESULT SET�� ��翡 ����
-- ������ :
-- ������ :
-- ���߿� :

-- �μ��ڵ尡 ���ö ����� ���� �μ��� ��������� ��ȸ �Ͻÿ�.
SELECT DEPT_CODE FROM EMPLOYEE WHERE EMP_NAME = '���ö';
SELECT * FROM EMPLOYEE WHERE DEPT_CODE = 'D9';

SELECT * FROM EMPLOYEE WHERE DEPT_CODE = (SELECT DEPT_CODE FROM EMPLOYEE WHERE EMP_NAME = '���ö');

-- �� ���� ��� �޿����� ���� �޿��� �ް� �ִ� ������
-- ���, �̸�, �����ڵ�, �޿��� ��ȸ�Ͻÿ�.
-- SELECT AVG(SALARY) FROM EMPLOYEE;
SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEE);

-- *** ������ ��������
-- ������ ��������, ���������� ��ȸ ��� ���� 1���� ��������

--1. ���ö ����� �޿����� ���� �޴� ������
-- ���, �̸�, �μ�, ����, �޿��� ��ȸ


--2. ���� ���� �޿��� �޴� ������
-- ���, �̸�, �޿�, �μ�, ����, �Ի����� ��ȸ


--3. �μ��� �޿��� �հ谡 ���� ū �μ��� ��ȸ
SELECT MAX(SUM(SALARY))
FROM EMPLOYEE
GROUP BY DEPT_CODE;

SELECT DEPT_CODE
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING SUM(SALARY) = (SELECT MAX(SUM(SALARY))
                        FROM EMPLOYEE
                        GROUP BY DEPT_CODE);


-- *** ������ ��������
-- ���������� ��ȸ ��� ���� ������ �� ��
-- IN, ANY, ALL, EXISTS

-- IN : ���������� ��� ���� �߿��� �ϳ���� ��ġ�ϴ� ���� ������ TRUE�� ��ȯ�� ��
-- �ְ�޿��� 49999999�� ���� ���� �޿������ ������ �ִ� ������ ��ȸ�Ͻÿ�.
SELECT sal_level from sal_grade WHERE max_sal < 4999999;

SELECT * FROM employee
-- WHERE sal_level = (SELECT sal_level FROM sal_grade WHERE max_sal < 4999999); (X)�����߻�
WHERE sal_level in (SELECT sal_level FROM sal_grade WHERE max_sal < 4999999);


-- �񱳿����� ANY : ���������� ��� ���� �߿��� �񱳿����� ����� �ϳ���� TRUE�� ������ TRUE ��ȯ
--              WHERE 1 > ANY(��������) -> ���������� ����� : [0,3,5] => TRUE
--                                  -> ���������� ����� : [7,3,5] => FALSE
                                    
                                    
-- �ڳ��� ���� �μ��� ���� ���� �޿��� �޴� ������� ������ ���� �ް�
-- �ڳ��� ���� �μ����� ���� ���� �޿��� �޴� ������ٴ� ���� �޿��� �޴� ������� ����� ��ȸ
select salary from employee where dept_code = 'D5';

SELECT *
FROM employee
WHERE salary < ANY(SELECT salary from employee WHERE dept_code =
                    (SELECT dept_code FROM employee WHERE emp_name='�ڳ���'))
AND salary > ANY(SELECT salary from employee WHERE dept_code =
                    (SELECT dept_code FROM employee WHERE emp_name='�ڳ���'));
                    
-- ** �񱳿����� ALL : ���������� ��� ����� �񱳿��� �� ��� TRUE�� ���;� TRUE
--              WHERE 1 > ALL(��������) -> ���������� ����� : [0,0.5,0.7] => TRUE

-- �ڳ��� ���� �μ��� ����� �� ���� ���� �޿��� �޴� ������� 
-- �� ���� �޿��� �޴� ������ ����� ��ȸ
SELECT *
FROM employee
WHERE salary > ALL(SELECT salary FROM employee WHERE dept_code =
            (SELECT dept_code FROM employee WHERE emp_name='�ڳ���'));

-- EXISTS : �������� ���� ������� �����ϸ� TRUE ������ FALSE
-- �Ŵ����� �������� �ʴ� ����� ��ȸ�Ͻÿ�
SELECT *
FROM employee e
WHERE NOT EXISTS(SELECT emp_id FROM employee WHERE emp_id = e.manager_id);

-- ����� ������ ���� �μ�, ���� ���޿� �ش��ϴ� ����� �̸�, ����, �μ�, �Ի����� ��ȸ
SELECT emp_name, job_code, dept_code, hire_date
FROM employee
WHERE dept_code in (SELECT dept_code FROM employee WHERE ent_yn = 'Y')
AND job_code in (SELECT job_code FROM employee WHERE ent_yn = 'Y');


-- ���߿� ��������
SELECT emp_name, job_code, dept_code, hire_date
FROM employee
WHERE (dept_code, job_code) in (SELECT dept_code, job_code FROM employee WHERE ent_yn = 'Y');


-- ��(ȣ��)�� ����
-- ���������� ����ϴ� �÷����� ���������� �̿��ϴ� ����
-- ���� ������ �÷����� ����Ǹ� ���������� ������� �ٲ��
SELECT *
FROM employee e
WHERE NOT EXISTS(SELECT emp_id FROM employee WHERE emp_id = e.manager_id);


-- *** ��Į�� ��������
-- select ������ ����ϴ� ��������
-- ��Į�� ���������� �ݵ�� ���ϰ��� ��ȯ�Ǿ�� �Ѵ�.
-- ��� ����� ���, �̸�, �����ڻ��, �����ڸ��� ��ȸ
select emp_id, emp_name, manager_id
, (select emp_name from employee where emp_id = e.manager_id)
from employee e
order by emp_name desc;


-- *** rownum
select rownum, emp_id, emp_name
from employee;


-- *** �ζ��� �� *** (�ٸ� �Ϳ� ���� ���� ����.)
-- from ������ �ۼ��ϴ� ��������
-- ���������� result set�� ���̺� ��� ���

-- �޿��� ���� �޴� ���� 5���� ��ȸ
select emp_name, salary
from
(select emp_name, salary
    from employee
    order by salary desc)
where rownum <= 5;
