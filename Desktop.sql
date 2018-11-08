/*DDL ----------------------------------------------*/
use impactbyte;
create table customers (
	id int not null auto_increment,
    first_name varchar(100) not null,
    last_name varchar(100),
    address text(100),
    age int (3),
    date_of_birth date,
    primary key(id)    
);    
/*DROP -------*/
drop table customers;


/*ALTER*/
alter table customers
add column email varchar (45) not null;
alter table customers
drop column email;

/*INSERT*/
insert into customers(first_name,last_name,address,age,date_of_birth,email)
values
("Domingos","Bento","Jln",29,"1983-01-8","luakay@gmail.com"),
("Budi","Ini","Jln",9,"2000-01-2","budi@li.com"),
("Susi","Jono","Jn",10,"2012-01-2","susi@y.com"),
("Lino","Dono","Jn",12,"1980-01-2","dono@g.com");

/*SELECT*/
select * from customers;
select  first_name, last_name from customers;

/*SELECT WHERE*/
select * from customers where first_name ="Domingos";
select * from customers where id=3;
select * from customers where first_name ="Domingos" and last_name="Bento";
select * from customers where first_name ="Domingos" or age= 12;

/*SELECT DISTINCT ----menhilangkan data yang dobel----*/
select distinct age from customers;

/*SELECT LOGICAL OPERATOR*/
select * from customers where age < 15;
select * from customers where age between 12 and 29;

/*SELECT LIKE*/
select * from customers where first_name like "%i";
select * from customers where first_name like "%a";
select * from customers where first_name like "%b%";
select * from customers where first_name like "%dom";

/* FOREIGN KEY*/
create table products(
id int not null auto_increment,
name varchar(255) not null,
price double(11,6) not null,
primary key (id)
);

INSERT INTO `impactbyte`.`products`
(`name`,`price`)
VALUES
("Mie", 2500),
("Sabun", 500),
("Ayam", 2500),
("Kambing", 12500),
("Kerbau", 2500),
("Ayam Jantan", 2500);

create table orders(
id int not null auto_increment,
product_id int not null,
customer_id int not null,
order_date datetime not null default current_timestamp,
primary key(id),
foreign key(product_id) references products(id),
foreign key(customer_id) references customers(id)
);

insert into orders (product_id,customer_id) 
values
(1,2),
(2,4),
(4,1),
(4,2),
(3,3);

select * from orders;
/*SELECT FROM MULTIPLE TABLE */
select 
o.id as order_id, c.first_name, c.last_name 
from customers c,
orders o 
where c.id = o.customer_id;
