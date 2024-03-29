
CREATE TABLE NJCT_A_REGIONS 
( 
    REGION_ID NUMBER(10) PRIMARY KEY,  --PK 
    REGION_NAME VARCHAR2(50) 
)

CREATE TABLE NJCT_A_COUNTRIES 
( 
    COUNTRY_ID NUMBER(10) PRIMARY KEY, --PK 
    COUNTRY_NAME VARCHAR2(50), 
    REGION_ID NUMBER(10) REFERENCES NJCT_A_REGIONS(REGION_ID)  --FK FROM REGION TABLE  
)

CREATE TABLE NJCT_A_LOCATIONS 
( 
    LOCATION_ID NUMBER(10) PRIMARY KEY,    --PK 
    STREET_ADDRESS VARCHAR2(50), 
    POSTAL_CODE NUMBER(10), 
    CITY VARCHAR2(30), 
    STATE_PROVINCE VARCHAR2(30), 
    COUNTRY_ID NUMBER(10) REFERENCES NJCT_A_COUNTRIES(COUNTRY_ID)    --FK FROM COUNTRIES TABLE 
)


CREATE TABLE NJCT_A_DEPARTMENTS 
( 
    DEPARTMENT_ID NUMBER(10) PRIMARY KEY,  --PK 
    DEPARTMENT_NAME VARCHAR2(50), 
    MANAGER_ID NUMBER(5) UNIQUE, --MAY BE TABLE IS OKAY WITHOUT UNIQUE CONSTRAINT
    LOCATION_ID NUMBER(10), 
    FOREIGN KEY(LOCATION_ID) REFERENCES NJCT_A_LOCATIONS(LOCATION_ID)    --FK FROM LOCATIONS 
)

CREATE TABLE NJCT_A_JOBS 
( 
    JOB_ID NUMBER(10) PRIMARY KEY, --PK 
    JOB_TITLE VARCHAR2(30), 
    MIN_SALARY NUMBER(10,2), 
    MAX_SALARY NUMBER(10,2) 
)


CREATE TABLE NJCT_A_EMPLOYEES 
( 
    EMPLOYEE_ID NUMBER(10) PRIMARY KEY, 
    FIRST_NAME VARCHAR2(30), 
    LAST_NAME VARCHAR2(30), 
    EMAIL VARCHAR2(30), 
    PHONE_NUMBER NUMBER(12), 
    HIRE_DATE DATE, 
    JOB_ID NUMBER(2), 
    SALARY NUMBER(10,2), 
    COMMISSION_PCT NUMBER(3,2), 
    MANAGER_ID NUMBER(10), 
    DEPARTMENT_ID NUMBER(10), 
    FOREIGN KEY(JOB_ID) REFERENCES NJCT_A_JOBS(JOB_ID), 
    FOREIGN KEY(MANAGER_ID) REFERENCES NJCT_A_EMPLOYEES(EMPLOYEE_ID),--self reference to employee_id from this table 
    FOREIGN KEY(DEPARTMENT_ID) REFERENCES NJCT_A_DEPARTMENTS(DEPARTMENT_ID) 
)

ALTER TABLE NJCT_A_DEPARTMENTS 
ADD FOREIGN KEY (MANAGER_ID) REFERENCES NJCT_A_EMPLOYEES(EMPLOYEE_ID)

CREATE TABLE NJCT_A_JOB_HISTORY 
( 
    EMPLOYEE_ID NUMBER(10) primary key, 
    START_DATE DATE,  
    END_DATE DATE, 
    JOB_ID NUMBER(10), 
    DEPARTMENT_ID NUMBER(10), 
    FOREIGN KEY(EMPLOYEE_ID) REFERENCES NJCT_A_EMPLOYEES(EMPLOYEE_ID),    --FK FROM EMPLOYEES 
    FOREIGN KEY(JOB_ID) REFERENCES NJCT_A_JOBS(JOB_ID), --FK FRPM JOBS TABLE 
    FOREIGN KEY(DEPARTMENT_ID) REFERENCES NJCT_A_DEPARTMENTS(DEPARTMENT_ID) --FK FROM DEPARTMENT TABLE 
)


/*WE HAVE CREATED TABLES SUCCESSFULLY NOW WE'LL INSERT A RECORD*/

INSERT INTO NJCT_A_REGIONS VALUES(1,'Africa');
INSERT INTO NJCT_A_REGIONS VALUES(2,'Asia');
INSERT INTO NJCT_A_REGIONS VALUES(3,'Europe');
INSERT INTO NJCT_A_REGIONS VALUES(4,'Amarica');
INSERT INTO NJCT_A_REGIONS VALUES(5,'Pacific');
INSERT INTO NJCT_A_REGIONS VALUES(6,'Arab');


INSERT INTO NJCT_A_COUNTRIES VALUES(1,'CANADA',3);
INSERT INTO NJCT_A_COUNTRIES VALUES(2,'AMERICA',4);
INSERT INTO NJCT_A_COUNTRIES VALUES(3,'LONDON',3);
INSERT INTO NJCT_A_COUNTRIES VALUES(4,'INDIA',2);
INSERT INTO NJCT_A_COUNTRIES VALUES(5,'U.S.A.',4);
INSERT INTO NJCT_A_COUNTRIES VALUES(6,'SOUTH AFRICA',1);
INSERT INTO NJCT_A_COUNTRIES VALUES(7,'DUBAI',6);
--INSERT INTO COUNTRIES VALUES(8,'DUBAI',7);


INSERT INTO NJCT_A_LOCATIONS VALUES(1,'1-A',10101,'A1','A',1);
INSERT INTO NJCT_A_LOCATIONS VALUES(2,'2-B',20101,'B1','B',2);
INSERT INTO NJCT_A_LOCATIONS VALUES(3,'3-C',30101,'C1','C',3);
INSERT INTO NJCT_A_LOCATIONS VALUES(4,'4-D',40101,'D1','D',4);
INSERT INTO NJCT_A_LOCATIONS VALUES(5,'5-E',50101,'E1','E',1);
INSERT INTO NJCT_A_LOCATIONS VALUES(6,'6-F',60101,'F1','F',7);
INSERT INTO NJCT_A_LOCATIONS VALUES(7,'7-G',70101,'G1','G',6);
INSERT INTO NJCT_A_LOCATIONS VALUES(8,'8-H',80101,'H1','H',5);
INSERT INTO NJCT_A_LOCATIONS VALUES(9,'9-I',90101,'I1','I',1);
INSERT INTO NJCT_A_LOCATIONS VALUES(10,'10-J',11101,'J1','J',2);
INSERT INTO NJCT_A_LOCATIONS VALUES(11,'11-K',12101,'K1','K',1);
INSERT INTO NJCT_A_LOCATIONS VALUES(12,'12-L',13101,'L1','L',2);
--INSERT INTO LOCATIONS VALUES(13,'12-L',13101,'L1','L',9);


-- AS JOB_ID IS NEEDED IN EMPLOYEES TABLE WE WILL

INSERT INTO NJCT_A_JOBS VALUES(019,'S/W TESTER',15000,18000);
INSERT INTO NJCT_A_JOBS VALUES(021,'H/W TESTER',18000,21000);
INSERT INTO NJCT_A_JOBS VALUES(023,'S/W DEVLPER',21000,24000);
INSERT INTO NJCT_A_JOBS VALUES(025,'EDITING',24000,27000);
INSERT INTO NJCT_A_JOBS VALUES(027,'AUDIT',27000,30000);
INSERT INTO NJCT_A_JOBS VALUES(029,'STAFF MANAGEMENT',30000,33000);
INSERT INTO NJCT_A_JOBS VALUES(031,'HR',36000,39000);
INSERT INTO NJCT_A_JOBS VALUES(033,'RESOURCE MANAGEMENT',42000,45000);
INSERT INTO NJCT_A_JOBS VALUES(034,'RESOURCE STORAGE',5000,10000);



/*AS EMPLOYEES AND DEPARTMENTS TABLE IS CROSS REFERENCE WE'LL DO ACCORDINGLY
(1)DISABLE ANY OF THE CONSTRAINT FROM EMPLOYEES TO DEPARTMENTS
                                   OR DEPARTMENTS TO EMPLOYEES
I.E,
WE'LL FIND THE CONSTRAINT NAME FIRST,
SELECT * FROM user_cons_columns
WHERE table_name = 'EMPLOYEES';
OWNER,CONSTRAINT_NAME,TABLE_NAME,COLUMN_NAME,POSITION
SQL_OKXRNXMNHYNHSYAMYBVMACWMR,SYS_C0049989563,EMPLOYEES,EMPLOYEE_ID,1
SQL_OKXRNXMNHYNHSYAMYBVMACWMR,SYS_C0049989564,EMPLOYEES,JOB_ID,1
SQL_OKXRNXMNHYNHSYAMYBVMACWMR,SYS_C0049989565,EMPLOYEES,MANAGER_ID,1
SQL_OKXRNXMNHYNHSYAMYBVMACWMR,SYS_C0049989566,EMPLOYEES,DEPARTMENT_ID,1
AFTER THAT WE'LL DIABLE THE CONSTRAINT TO INSERT A DATA TO BOTH TABLE ELSE WE ARE NOT ABLE TO INSERT
ALTER TABLE EMPLOYEES
DISABLE CONSTRAINT SYS_C0049989566;
AFTER THAT WE ARE ABLE TO INSERT THE DATA TO LET'S GO =>
*/


--FINDING CONSTRAINT
SELECT * FROM user_cons_columns
WHERE table_name = 'NJCT_A_EMPLOYEES';

--DISABLING CONSTRAINT
ALTER TABLE NJCT_A_EMPLOYEES
DISABLE CONSTRAINT SYS_C0049987225;

--CONSTRAINT IS DISABLED SO LET'S INSERT DATA TO EMPLOYEES
--MANAGER
INSERT INTO NJCT_A_EMPLOYEES VALUES(91,'Q','A','QA@GMAIL.COM',987654,'19-MAR-18',019,16000,1.1,NULL,501);
INSERT INTO NJCT_A_EMPLOYEES VALUES(92,'Z','A','ZA@GMAIL.COM',987654,'19-MAR-19',021,18600,1.2,NULL,502);
INSERT INTO NJCT_A_EMPLOYEES VALUES(93,'A','B','AB@GMAIL.COM',123456,'23-JAN-20',023,22500,1.3,NULL,601);
INSERT INTO NJCT_A_EMPLOYEES VALUES(94,'C','D','CD@GMAIL.COM',234567,'29-JUN-17',025,25500,2.2,NULL,602);
INSERT INTO NJCT_A_EMPLOYEES VALUES(95,'E','G','EG@GMAIL.COM',564615,'20-DEC-15',027,29000,5.2,NULL,701);
INSERT INTO NJCT_A_EMPLOYEES VALUES(96,'F','V','FV@GMAIL.COM',153486,'21-JUL-12',029,32500,5.3,NULL,702);
INSERT INTO NJCT_A_EMPLOYEES VALUES(97,'J','G','JG@GMAIL.COM',136844,'23-JUN-15',031,36500,6.1,NULL,801);
INSERT INTO NJCT_A_EMPLOYEES VALUES(98,'L','K','LK@GMAIL.COM',857894,'25-MAY-15',033,43500,8.1,NULL,802);
INSERT INTO NJCT_A_EMPLOYEES VALUES(99,'N','J','NJ@GMAIL.COM',574124,'30-APR-15',034,9000,10.0,NULL,901);
--EMPLOYEE UNDER MANAGER
INSERT INTO NJCT_A_EMPLOYEES VALUES(100,'A','Z','ATOZ@GMAIL.COM',214680,'19-MAR-14',019,15500,0.1,91,501);
INSERT INTO NJCT_A_EMPLOYEES VALUES(101,'B','Q','BENQ@GMAIL.COM',545641,'19-APR-19',021,18200,NULL,92,502);
INSERT INTO NJCT_A_EMPLOYEES VALUES(102,'C','P','CP@GMAIL.COM',671548,'23-MAY-20',023,22600,1.3,93,601);
INSERT INTO NJCT_A_EMPLOYEES VALUES(103,'D','O','DONE@GMAIL.COM',274561,'29-JUN-17',025,25400,NULL,94,602);
INSERT INTO NJCT_A_EMPLOYEES VALUES(104,'E','N','EFN@GMAIL.COM',566786,'20-JUL-14',027,28500,NULL,95,701);
INSERT INTO NJCT_A_EMPLOYEES VALUES(105,'F','M','FAM@GMAIL.COM',987421,'21-AUG-12',029,32000,5.3,96,702);
INSERT INTO NJCT_A_EMPLOYEES VALUES(106,'G','L','GIL@GMAIL.COM',425311,'23-SEP-15',031,36300,6.1,97,801);
INSERT INTO NJCT_A_EMPLOYEES VALUES(107,'H','K','HKI@GMAIL.COM',534652,'25-JAN-15',033,43100,NULL,98,802);
INSERT INTO NJCT_A_EMPLOYEES VALUES(108,'I','J','IOJ@GMAIL.COM',534652,'30-FRB-16',034,8550,10.0,99,901);
INSERT INTO NJCT_A_EMPLOYEES VALUES(109,'J','I','JIO@GMAIL.COM',965241,'19-OCT-14',021,18600,NULL,92,502);
INSERT INTO NJCT_A_EMPLOYEES VALUES(110,'K','H','KAHN@GMAIL.COM',159357,'29-NOV-17',025,25000,NULL,94,602);
INSERT INTO NJCT_A_EMPLOYEES VALUES(111,'L','G','LAG@GMAIL.COM',753690,'23-JUN-15',031,36450,6.1,97,801);
INSERT INTO NJCT_A_EMPLOYEES VALUES(112,'M','F','MAF@GMAIL.COM',751862,'14-FEB-16',033,43633,NULL,98,802);
INSERT INTO NJCT_A_EMPLOYEES VALUES(113,'N','E','NEO@GMAIL.COM',457452,'19-MAR-02',025,25650,2.2,94,602);
INSERT INTO NJCT_A_EMPLOYEES VALUES(114,'O','D','ODB@GMAIL.COM',101018,'30-JUL-15',034,9650,NULL,99,901);
INSERT INTO NJCT_A_EMPLOYEES VALUES(115,'P','C','PC@GMAIL.COM',316497,'25-JUN-17',033,43400,NULL,98,802);
INSERT INTO NJCT_A_EMPLOYEES VALUES(116,'Q','B','QAB@GMAIL.COM',714816,'19-JAN-18',019,15610,1.1,91,501);
INSERT INTO NJCT_A_EMPLOYEES VALUES(117,'Z','A','ZAZ@GMAIL.COM',248163,'31-DEC-20',021,18620,1.2,92,502);









--CONSTRAINT IS DISABLED SO LET'S INSERT DATA TO DEPARTMENTS
INSERT INTO NJCT_A_DEPARTMENTS VALUES(501,'AUDITING',91,6);
INSERT INTO NJCT_A_DEPARTMENTS VALUES(502,'CATERING',92,5);
INSERT INTO NJCT_A_DEPARTMENTS VALUES(601,'PAINT SHOP',93,4);
INSERT INTO NJCT_A_DEPARTMENTS VALUES(602,'DEVELOPMENT',94,3);
INSERT INTO NJCT_A_DEPARTMENTS VALUES(701,'IT INFRA',95,6);
INSERT INTO NJCT_A_DEPARTMENTS VALUES(702,'IT SOLUTIONS',96,1);
INSERT INTO NJCT_A_DEPARTMENTS VALUES(801,'FINANCE',97,11);
INSERT INTO NJCT_A_DEPARTMENTS VALUES(802,'INVEST',98,9);
INSERT INTO NJCT_A_DEPARTMENTS VALUES(901,'HR',99,10);

--WE HAD SUCCESSFULLY INSERTED DATA TO BOTH CROSS-REFERENCED TABLE SO LET'S ENABLE THE CONSTRAINT
ALTER TABLE NJCT_A_EMPLOYEES
ENABLE CONSTRAINT SYS_C0049987225;
--IF WE HAD A MISSMATCHED DATA IN EMPLOYEES OR DEOARTMENT THE WE'LL GET ERROR
/*
ORA-02298: cannot validate (SQL_OKXRNXMNHYNHSYAMYBVMACWMR.SYS_C0049989566) - parent keys not found 
*/


--AFTER ALTERING (ENABLING CONSTRAINT YOU CAN NOT INSERT RECORD [POV OF DEPARTMENT])
INSERT INTO NJCT_A_DEPARTMENTS VALUES(902,'HR',100,10);

ORA-02291: integrity constraint (SQL_PSCTZGPOJDCEVECMKLCMUYGUM.SYS_C0049987226)
violated - parent key not found ORA-06512: at "SYS.DBMS_SQL"

--AFTER ALTERING (ENABLING CONSTRAINT YOU CAN NOT INSERT RECORD [POV OF EMPLOYEES])
INSERT INTO NJCT_A_EMPLOYEES VALUES(100,'N','J','NJ@GMAIL.COM',574124,'30-APR-15',034,9000,0,NULL,902);

ORA-02291: integrity constraint (SQL_PSCTZGPOJDCEVECMKLCMUYGUM.SYS_C0049987225)
violated - parent key not found ORA-06512: at "SYS.DBMS_SQL"


/*
THAT'S ALL FOR TABLE (*.*)-> :)
*/
