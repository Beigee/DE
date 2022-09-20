-- *** JOIN ***
-- �ϳ� �̻��� ���̺��� �����͸� ��ȸ�ϱ� ���� ���
-- �������� �ϳ��� RESULT SET���� ���´�.
-- �����������ͺ��̽� ������ �������� �ߺ��� �ּ�ȭ �ϰ�,
-- �̻������� �����ϱ� ���� �����͸� ���̺� �˸°� �и��Ͽ� �����ϰ�,
-- ���̺� ���� ���踦 ���� �ʿ��� �����͸� �����Ͽ� ����ϱ� ����.

-- ��� ����� ������ȣ, ������, �μ��ڵ�, �μ����� ��ȸ
select emp_id, emp_name, dept_code, dept_title
from employee e join department d
on(e.dept_code = d.dept_id);

-- *** JOIN ���� ***

-- 0. CROSS JOIN (�Ⱦ�)
-- Cartension ���� �߻�
-- �� �� ���̺��� �� ��� �ٸ� ���̺��� ��� ���� ���յǴ� ���
select *
from employee cross join department
order by emp_id desc;

-- inner join, outer join(left outer join, right outer join)

-- 1. INNER JOIN (� ����)
-- join ���ǹ��� �ۼ��� ���ǹ��� �����ϴ� row�鸸 join ����
-- ���id, �����, �����ڵ�, ���޸�
select emp_id, emp_name, job_code, job_name
from employee e
inner join job j
using(job_code);
-- �� ���̺� ���� �÷����� ���� ��� on ��� using�� ���

-- n���� ���̺� �����ϱ�
-- �����ȣ, �����, �μ��ڵ�, �μ���, �μ������� ���
select emp_id, emp_name, dept_code, dept_title, local_name
from employee e
inner join department d on(e.dept_code = d.dept_id)
inner join location l on(d.location_id = l.local_code);

-- SELF JOIN
-- �����, �μ��ڵ�, �Ŵ���id, �Ŵ��� �̸� ���
select e.emp_name, e.dept_code, e.manager_id, m.emp_name
from employee e
inner join employee m
on(e.manager_id = m.emp_id);


-- 2. OUTER JOIN
-- 1) left [outer] join
select *
from job left join employee using(job_code) order by job_code;

-- 2) right [outer] join
select *
from job right join employee using(job_code) order by job_code;

-- 3) full [outer] join
select *
from employee full outer join job using(job_code) order by job_code;

--�̸��� '��'�� ���� ����� ���ID, ����̸�, ���޸��� ����ϼ���
select emp_id, emp_name, job_name
from employee e
inner join job j
using(job_code)
where emp_name like '%��%'
order by job_code;

--�μ����� D5, D6 �� ����� �̸�, ���޸�, �μ��ڵ�, �μ����� ����ϼ���
select emp_name, job_name, dept_code, dept_title
from employee e
right join job using (job_code)
inner join department d on (e.dept_code = d.dept_id)
where dept_code in ('D5', 'D6')
order by dept_code;

