create table salesman_a (
	salesman_id int(10),
    sal_name varchar(45),
    city varchar(30),
    commission int(10),
    PRIMARY KEY(salesman_id)
);

insert into salesman_a (salesman_id,sal_name,city,commission)
values(1,'Anaya','Rome',0.11);
insert into salesman_a (salesman_id,sal_name,city,commission)
values(2,'Disal','Paris',0.12);
insert into salesman_a (salesman_id,sal_name,city,commission)
values(3,'Bob','London',0.13);
insert into salesman_a (salesman_id,sal_name,city,commission)
values(4,'Jon','Paris',0.24);
insert into salesman_a (salesman_id,sal_name,city,commission)
values(5,'Neel','USA',0.25);
insert into salesman_a (salesman_id,sal_name,city,commission)
values(6,'Kirti','Rome',0.26);

select * from salesman_a;

select sal_name,commission from salesman_a;

select sal_name,city from salesman_a where city = 'Paris';

create table item_mast_a (
	prd_id int(10),
    prd_name varchar(45),
    prd_price int(10),
    prd_company_code int(10),
    PRIMARY KEY (prd_id)
);

insert into item_mast_a (prd_id,prd_name,prd_price,prd_company_code)
values(193,'Pen',150,1201);
insert into item_mast_a (prd_id,prd_name,prd_price,prd_company_code)
values(194,'Paper',250,1202);
insert into item_mast_a (prd_id,prd_name,prd_price,prd_company_code)
values(195,'Pencils',350,120);
insert into item_mast_a (prd_id,prd_name,prd_price,prd_company_code)
values(196,'Scale',450,1204);
insert into item_mast_a (prd_id,prd_name,prd_price,prd_company_code)
values(197,'Eraser',550,1205);
insert into item_mast_a (prd_id,prd_name,prd_price,prd_company_code)
values(198,'Sharpner',650,1206);


select * from item_mast_a where prd_price between 200 and 600;

select prd_name,prd_price from item_mast_a where prd_price >= 250 order by prd_name;

select salesman_id, sal_name, city, commission from salesman_a where commission between 0.10 and 0.12;

select * from salesman_a where city in('Rome','Paris');

select * from salesman_a where city  in('Rome','Paris');

select * from salesman_a where city not in('Rome','Paris');

select * from salesman_a where sal_name like 'a%' or sal_name like 'k%';

select * from salesman_a where sal_name like '%n';

select * from salesman_a where sal_name like 'N__l%';

select avg(prd_price) as avg_prd_price from item_mast_a;

create table customer_a (
	customer_id int,
    cust_name varchar(45),
    city varchar(30),
    grade int,
    salesman_id int,
    primary key(customer_id),
    foreign key(salesman_id) references salesman_a(salesman_id)
);

insert into customer_a (customer_id,cust_name,city,grade,salesman_id)
values(3005,'Anaya','Rome',98,1);
insert into customer_a (customer_id,cust_name,city,grade,salesman_id)
values(3006,'Disal','Paris',99,2);
insert into customer_a (customer_id,cust_name,city,grade,salesman_id)
values(3007,'Bob','London',100,3);
insert into customer_a (customer_id,cust_name,city,grade,salesman_id)
values(3008,'Jon','Paris',101,4);
insert into customer_a (customer_id,cust_name,city,grade,salesman_id)
values(3009,'Neel','USA',102,5);
insert into customer_a (customer_id,cust_name,city,grade,salesman_id)
values(3010,'Kirti','Rome',103,6);

select * from customer_a;

select * from customer_a where customer_id in(30007,3008,3009);

select * from customer_a where cust_name like 'B%';

select * from customer_a where cust_name like '%n';

select * from customer_a where grade > 100;

select * from customer_a where city = 'Paris' and grade > 100;

select * from customer_a where city = 'Paris' or grade > 100;

select * from customer_a where city = 'Paris' or not grade  > 100;

select * from customer_a where not (city = 'Paris' or grade > 100);

select * from customer_a where grade > 0 /*OR grade not null*/;

select city,max(grade) as max from customer_a group by city order by grade desc;
