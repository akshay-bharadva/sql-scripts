create table book
(
	bno number(5) primary key,
	title varchar2(10),
	author varchar2(10),
	no_of_copies number(5),
	category varchar2(10)
);

create table issued
(
	bno number(5),
	no_of_copies_issued number(5),
	issue_date date
);

create or replace procedure bookissue(bookname varchar2)
as
	v_bno number(5);
	v_no_of_copies number(5);

	cursor curbook is -- created cursor
	select bno,no_of_copies from book where title = bookname;
begin
	open curbook;

	if curbook%notfound then
		dbms_output.put_line('Error!!!');
	else
		fetch curbook into v_bno,v_no_of_copies;

		if v_no_of_copies > 0 then
			insert into issued values(v_bno,1,sysdate);

			update book set no_of_copies = no_of_copies-1
			where bno = v_bno;
		else
			dbms_output.put_line('All books were issued!');
		end if;
	end if;
end;


exec bookissue('bookname'); -- i.e, titel of book
