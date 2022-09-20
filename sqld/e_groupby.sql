-- ***** GROUP BY *****

-- Ư�� �÷��� �������� �׷��� ����� �ش�.
-- GROUOP BY�� �������� HAVING������ �׷��Լ��� ����� �� �ִ�.(WHERE�������� ��� �Ұ�)
-- GROUP �Լ� : SUM, COUNT, AVG, MAX, MIN

-- group by �÷���... (gruop by ���Ŀ� ����� �÷� �̿ܿ��� select���� �� �� ����)
-- �μ��� �޿� �Ѿװ� ��� �޿��� ���غ���
select dept_code, sum(salary), avg(salary)
from  employee
group by dept_code;

-- ���� �÷��� ������ �׷��� �����
-- �μ� �� ���޺� �޿��� �հ�� ����� ���غ���
select dept_code, job_code, sum(salary), avg(salary)
from employee
group by dept_code, job_code
-- �μ��� ���� �׷��� �����, �� �ȿ��� ���޺��� �׷��� ����
order by dept_code asc, job_code asc;

-- 1. �޿��� 300���� �̻��� ������� �μ��� �޿� �Ѿ��� ���غ���
select dept_code, sum(salary)
from employee
where salary >= 3000000
group by dept_code;

--2. �޿��� ����� 300���� �̻��� �μ��� ��ȸ
select dept_code, avg(salary)
from employee
group by dept_code
having avg(salary) >= 3000000;

--3. �μ� �� ���� �� ���� ���� �� �޿��� �ְ� ������ �ּ� ������ ���Ͻÿ�
--  ���� �� �μ��� �������� �������� �����ϰ� NULL���� �Ʒ��� �����Ͻÿ�
select dept_code, job_code, sal_level, max(salary * 12), min(salary * 12)
from employee
group by dept_code, job_code, sal_level
order by dept_code asc, job_code asc, sal_level asc nulls last;

select *
from employee
where dept_code = 'D6' and job_code = 'J3' and sal_level = 'S4';


-- *** �����Լ�(ROLLUP, CUBE) ***
-- ROLLUP : �׷캰 �߰� ���踦 ���
-- group by rollup(�÷�, �÷�, �÷�)
select dept_code, job_code, sal_level, sum(salary)
from employee
group by rollup(dept_code, job_code, sal_level)
order by dept_code asc, job_code asc, sal_level asc;

-- CUBE : �׷����� ������ ��� ���տ� ���� �߰����踦 ���
-- group by cube(�÷�, �÷�, �÷�)
select dept_code, job_code, sal_level, sum(salary)
from employee
group by cube(dept_code, job_code, sal_level)
order by dept_code asc, job_code asc, sal_level asc;
