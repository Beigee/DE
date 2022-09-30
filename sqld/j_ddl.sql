-- CREATE, ALTER, DROP

-- ������ ���Ἲ : �������� ��Ȯ��, �ϰ����� �����Ǵ� ��
-- ��Ȯ�� : �ߺ��̳� ������ ���� ����
-- �ϰ��� : ���ΰ� ����� ���������� ����Ǵ� ����

create table YSJ_EMP(
    -- �⺻Ű
    -- �⺻Ű�� ���̺��� �� ���� �����ϰ� �ĺ��ϴ� ������ ����Ѵ�.
    -- �⺻Ű�� �ּҼ�(NOT NULL)�� ���ϼ���(UNIQUE) �����Ǿ�� �Ѵ�.
    -- �ּҼ��� ���ϼ��� �����Ǵ� �÷��� ���� ���
    -- ��ǥ���� ���ϴ� �÷��� �⺻Ű�� �����Ѵ�.
    -- �⺻Ű�� �����ϸ� ���� �ε����� �ڵ����� �����ȴ�.
    EID NUMBER PRIMARY KEY,

    -- �÷���(�Ӽ�) ��������
    -- �������� ���� �߰�
    PHONE VARCHAR2(13),
    
    -- DEFAULT : �⺻ �� ����, ���� ���̺� ROW�� �߰��� �� �ش� �÷������� ������ ���� ������
    --          NULL ��� �⺻ ������ ������ �� �Է�
    HIRE_DATE DATE DEFAULT SYSDATE,
    
    -- ���� ���Ἲ(UNIQUE)
    -- : ���̺��� Ư�� �÷����� ���ؼ� �� ROW�� ������ ��� ���� �޶�� �Ѵٴ� ����(�ߺ��� X)
    ENO CHAR(14) UNIQUE,
    
    -- NULL ���Ἲ : ���̺��� Ư�� �÷����� NULL�� �� �� ����
    ENAME VARCHAR2(30 CHAR) NOT NULL,
    
    -- ������ ���Ἲ : Ư�� �÷����� �� �÷��� ���ǵ� �����ο� ���� ���̾�� �Ѵٴ� ����
    MARRIAGE CHAR(1) DEFAULT 'N' CHECK(MARRIAGE IN ('Y','N')),
    
    AGE NUMBER CHECK(AGE > 20)
    
    -- �ܷ�Ű(����Ű)
    -- ���� ���Ἲ : �⺻Ű�� ����Ű(�ܷ�Ű) ���� ���谡 �׻� ���� ��
    -- CONSTRAIN FOREIGH KEY(�÷���) REFERENCES �θ����̺�(�÷���)
    -- ON UPDATE CASCADE : �θ����̺��� ���� �����Ǹ� �ڽ����̺��� �൵ ���� ����(����Ŭ ����X)
    -- ON DELETE CASCADE : �θ����̺��� ���� �����Ǹ� �ڽ����̺��� �൵ ���� ����
    --                  �ɼ� ���� �� �ϸ� �θ����̺� ������ ���� �Ұ���
    -- ON DELETE SET NULL : �θ����̺��� ���� �����Ǹ� �ڽ����̺��� ���� NULL�� ����
    
);

--�������� ��ܺ���
--1. AGE�� 20���� ���� ���� �ְ�, MARRIAGE�� 'Z'�� �־ �����ι��Ἲ�� ��ܺ���!
--2. NOT NULL �� ������ �÷��� NULL�� �־ NULL���Ἲ�� ��ܺ���!
--3. PROMARY KEY�� ������ E_ID�� NULL���� �־ �⺻Ű�� �ּҼ��� Ȯ���ϰ�
--  �ߺ��� ���� �־ �⺻Ű�� ���ϼ��� Ȯ��
--4. HIRE_DATE�� NULL�� �־ DEFAULT�� ������ ���� �� �ԷµǴ��� Ȯ��

INSERT INTO YSJ_EMP(EID, PHONE, HIRE_DATE, ENO, ENAME, MARRIAGE, AGE)
VALUES(0, '010-0000-1234', '2022-09-29', '940501-1111111', 'YSJ', 'N', 29);

--INSERT INTO YSJ_EMP(EID, PHONE, HIRE_DATE, ENO, MARRIAGE, AGE)
--VALUES(1, '010-1111-1234', '2022-09-28', '980101-2111111', 'N', 25);

--INSERT INTO YSJ_EMP(EID, PHONE, HIRE_DATE, ENO, ENAME, MARRIAGE, AGE)
--VALUES(0, '010-0001-1234', '2022-09-29', '940501-1111111', 'YSJ', 'N', 29);

--INSERT INTO YSJ_EMP(PHONE, HIRE_DATE, ENO, ENAME, MARRIAGE, AGE)
--VALUES('010-0001-1234', '2022-09-29', '940501-1111111', 'YSJ', 'N', 29);

INSERT INTO YSJ_EMP(EID, ENO, ENAME, MARRIAGE, AGE)
VALUES(1, '940501-1112112', 'YSK', 'N', 29);

COMMIT;

-- ���̺� ���� �� ������ ����
CREATE TABLE CP_YSJ_EMP
AS SELECT * FROM EMPLOYEE WHERE ENT_YN = 'Y';

DROP TABLE CP_YSJ_EMP;

-- ���̺� �÷��� �����ؿ���
CREATE TABLE CP_YSJ_EMP
AS SELECT * FROM EMPLOYEE WHERE 1=0;

------------------------------------------------------------------------------
-- ���̺� ����
-- ALTER TABLE ���̺�� ADD | MODIFY | DROP(�÷��� ��������)

-- �÷� �߰� ADD
ALTER TABLE YSJ_EMP ADD(JOB_CODE CHAR(2));
SELECT * FROM YSJ_EMP;

-- �÷� ���� MODIFY
--1. �÷��� Ÿ���� ���̺� �÷����� �ϳ��� ���� ��쿡�� ������ ����
--2. �÷��� ũ��� ���ݺ��� ū ũ��θ� ������ ����
--3. ���������� ������ ��� �ش� ���������� ��� �����Ͱ� ���� �ؼ��� �ȵȴ�.
-- NOT NULL, �� NULL�� �����Ͱ� �� �ϳ��� ���� ���� ���� ����
-- UNIQUE, �� �ߺ� �����Ͱ� ���� ����

ALTER TABLE YSJ_EMP MODIFY(JOB_CODE NOT_NULL);
ALTER TABLE YSJ_EMP MODIFY(JOB_CODE CHAR(10));
ALTER TABLE YSJ_EMP MODIFY(JOB_CODE UNIQUE);

-- �÷� ����
ALTER TABLE YSJ_EMP DROP COLUMN JOB_CODE;

-- ���̺� ����
-- DROP
-- �ڽ����̺��� �ִ� ��� ���̺� ���� �Ұ���
-- �������� ������ �����ϸ鼭 ���̺��� ���� �ϰ� ���� ���
-- DROP TABLE YSJ_EMP CASCADE CONSTRAINTS;
DROP TABLE YSJ_EMP;

