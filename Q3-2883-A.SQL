create table student
(
	roll_number number(5),
	name varchar2(15),
	percent number(5,2),
	city varchar2(15)
);

create table student_audit
(
	roll_no number(5),
	oprtationDate date,
	username varchar2(15)
);

create or replace trigger audit_student
before insert or update or delete on student
for each row
declare
	v_roll_number student.roll_number%type;
begin

	v_roll_number := :new.roll_number;

	insert into student_audit (roll_no,oprtationDate,username)
	values (v_roll_number,sysdate,user);

	dbms_output.put_line('student data audited');
end;

insert into student values (4,'a',2.5,'b');

select * from student_audit;
/*
LINE/COL ERROR
-------- -----------------------------------------------------------------
4/26	 PLS-00049: bad bind variable 'NEW.V_ROLL_NUMBER'000
*/
