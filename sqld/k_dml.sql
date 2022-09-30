-- DML : DATA MANU LANGUAGE
-- ���̺� ���� �߰�(INSERT) �ϰų� ����(UPDATE) �ϰų� ����(DELETE)

-- INSERT
-- ���ο� ���� �߰��ϴ� ����
-- INSERT INTO ���̺��(�÷���1, �÷���2, ...) VALUES(������1, ������2, ...)
-- �÷��� �������� ������ NULL�� ����.
-- ��� �÷��� ���� ���� ������ ��� �÷��m�� ������ �����ϴ�.
--EX) INSERT INTO ���̺�� VALUES(������1, ������2, ...)

--INSERT INTO YSJ_EMP(EID, PHONE, HIRE_DATE, ENO, ENAME, MARRIAGE, AGE)
--VALUES(0, '010-0000-1234', '2022-09-29', '940501-1111111', 'YSJ', 'N', 29);

-- ���������� ������ �Է��ϱ�
CREATE TABLE YSJ_EMP_DEPT(
    EMP_ID NUMBER,
    EMP_NAME VARCHAR2(30, CHAR),
    DEPT_TITLE VARCHAR2(30, CHAR)
);

--4. UPDATE
-- ����
-- UPDATE ���̺�� SET �÷��� = ������ ��, ... [WHERE��]
UPDATE YSJ_EMP_DEPT SET DEPT_TITLE='�λ����Ժ�' WHERE EMP_NAME='������';

UPDATE YSJ_EMP_DEPT 
SET DEPT_TITLE = (SELECT DEPT_CODE FROM EMPLOYEE WHERE EMP_NAME='������')
WHERE EMP_NAME='������';

--5. DELETE
-- ���̺��� ���� �����ϴ� ����
-- WHERE�� �������� ������ ��� �����Ͱ� �������.
-- DELETE FROM ���̺�� WHERE ���ǽ�

-- DELET YSJ_EMP_DEPT WHERE EMP_NAME='������'

-- TRUNCATE : ���̺� ��ü �� ����
--              ���� : ������
--              ���� : �ѹ��� �ȵ�
TRUNCATE TABLE YSJ_EMP_DEPT;