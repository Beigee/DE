-- where ��
-- ���̺��� ���ϴ� ������ row���� ��ȸ�ϱ� ���� �ۼ��ϴ� ���ǹ�
-- *** �񱳿�����, �������� ***
-- �񱳿����� : <, >, <=, >=, =
--      ���� �ʴ� : !=, ^=, <>
-- �������� : and, or, not

-- 1. employee ���̺��� �μ��ڵ尡 'D9'�� ������ �̸�, �μ��ڵ� ��ȸ
select emp_name, dept_code from employee where dept_code = 'D9';

-- 2. employee ���̺��� �޿��� 4000000 �̻��� �������� �̸��� ������ ��ȸ
select emp_name, salary * 12 ���� from employee where salary >= 4000000;

-- *** and, or ***
--1. �μ��ڵ尡 'D6' �̰� �޿��� 200���� ���� ���� �޴� ������ �̸�, �μ��ڵ�, �޿��� ��ȸ
select emp_name, dept_code, salary from employee 
where dept_code='D6' and salary >= 2000000;
                    
-- 2. EMPLOYEE ���̺��� ������ 400���� �̻��̰� JOB�ڵ尡 J2�� ����� ��� �÷��� ��ȸ
select * from employee where salary >= 4000000 and job_code='J2';

--3.EMPLOYEE ���̺��� �μ��ڵ尡 D9�̰ų� D5�� ��� �� ������� 01/08/01 ���� ����
--  ����� �̸�, �μ��ڵ�, ����� ��ȸ
select emp_name, dept_code, hire_date 
from employee 
where (dept_code='D9' 
    or dept_code ='D5') 
    and hire_date < '01/08/01';
-- *** and �� or ���� �켱������ �����̴�. ���� ���� �����ϰ� ���� or�� ��ȣ�� �����ش�. ***

-- *** LIKE ***
-- �÷��� ���ڰ��� LIKE���� ������ Ư�� ������ ������Ű�� TRUE, �ƴϸ� FALSE
-- ���� : �÷��� LIKE '����'
-- ���� : '%', '_'
-- '%' : '����%' ('����'�� �����ϴ� ���ڿ�)
--       '%����' ('����'�� ������ ���ڿ�)
--       '%����%' ('����'�� �����ϴ� ���ڿ�)

-- EMPLOYEE ���̺��� ���� ������ ����� ���, �̸�, ����� ��ȸ
select emp_id, emp_name, hire_date from employee
where emp_name like '��%';

-- EMPLOYEE ���̺��� �̸��� '��'�� ���� �μ��ڵ尡 'D5'�� ����� ��ȸ
select * from employee
where emp_name like '%��%' and dept_code='D5';

-- EMPLOYEE ���̺��� �̸��� '��'���� ������ ����� ��� ������ ��ȸ
select * from employee
where emp_name like '%��';

-- '_' : ���� �ڸ��� ������ �� ��� '_'�ϳ� �� ��ĭ ����
-- employee ���̺��� ��ȭ��ȣ�� 4��° �ڸ� ���� 9�� �����ϴ� ����� ���, �̸�, ��ȭ��ȣ ��ȸ
select emp_id, emp_name, phone 
from employee 
where phone like '___9%';

--
select emp_id, emp_name, phone 
from employee 
where phone like '%9___';

--�̸��� �� '_' �� �� ���ڰ� 3�ڸ��� �̸��� �ּҸ� ���� ����� ��� ���� ��ȸ
-- EX) SUN_DI@KH.OR.KR
-- �̹� ���ϵ�ī�� ���ڷ� ��ϵ� Ư�����ڸ� ����ؼ� �˻��ؾ��� ���
-- �ش� Ư������ �տ� ������ Ư�����ڸ� ����ϰ� ESCAPE OPTION���� ���
-- escape ó�� : ���ڿ��� �νĽ�Ű�� ���� ���� �տ� Ư����ȣ�� ���� �װ� escape�� �������ָ� ��
select * from employee
where email like '___$_%' escape '$';

-- *** in ***
-- in ��Ͽ� ��ġ�ϴ� ���� ������ True ������ False ��ȯ
-- �÷��� in(��1, ��2, ��3,...)

--D6�μ��� D8�μ��� ������� ��� ������ ��ȸ(�⺻��)
select * from employee where dept_code = 'D6' or dept_code ='D8';

-- �� ������ in Ȱ���ؼ� ����
select * from employee where dept_code in('D6', 'D8');

-- ***** between and *****
-- �÷��� between ���Ѱ� and ���Ѱ�

-- EMPLOYEE ���̺��� ������ 350���� �̻��̰� 600���� ������ ������ ��� ���� ��ȸ
-- �⺻��
select * from employee where salary >= 3500000 and salary <= 6000000;

-- between ��� ����
select * from employee where salary between 3500000 and 6000000;
select * from employee where salary not between 3500000 and 6000000;
-- between �� or, and, not ���ٵ� �켱������ ����.

-- ******* is null *******
-- �÷����� null�� ��� True ��ȯ �ƴϸ� False ��ȯ
-- ���ʽ��� ���� �ʴ�(BONUS �÷��� ���� NULL��)����� ��� ���� ��ȸ
select * from employee where bonus is null;
-- null�� �ƴ� ���
select * from employee where bonus is not null;

-- ***** ������ �켱���� ���� *****
-- 1. ���������
-- 2. �񱳿�����
-- 3. is null, like, in
-- 4. between-and
-- 5. not
-- 6. and
-- 7. or
