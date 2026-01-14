-- project phase 3 tata consultancy services
-- ---------------------------------------Phase 3(10Qr/T)(A<Joins<SQ<Fun<B&UD)----------------------------------------------------------------------------------

use tata_consultancy_services;

show tables;

show table status;

select count(*) as total_tables from information_schema.tables where table_schema = 'tata_consultancy_services';

-- using this set query for foreign key checks constraint disable and enable
set foreign_key_checks = 0;
set foreign_key_checks = 1;

-- using this set query to disable and enable safe update mode
set sql_safe_updates = 0;
set sql_safe_updates = 1;

-- ---------------------------------------Alias-----------------------------------------------------------------------------------------------------------------

select employee_id as emp_id, department as depart,concat( first_name,' ' ,last_name) as full_name
from employees as employ;

select sum(net_salary) as total_salary
from employee_salary as employee_sal;

select project_id,datediff(end_date,start_date) as days
from projects as pro;

select project_id, if(budget > 500000,'Big','Small') as project_size
from projects as pro;

select invoice_id as inv_id, amount, case when amount < 80000 then 'good' when amount between 80000 and 100000 then 'very good' else 'best' end as invoice_rating
from invoices;

select concat(training_id,') ',training_name,' by ',trainer_name) as training_sessions_details
from training_sessions;

select count(training_id) as total_training_Sessions 
from training_sessions;

select max(net_salary) as highest_salary
from employee_salary as employee_sal;

select min(net_salary) as lowest_salary
from employee_salary as employee_sal;

select avg(net_salary) as average_salary
from employee_salary as employee_sal;

select upper(certification_name) as name_of_certificate 
from employee_certifications;

select length(password_hash) as password_length 
from user_accounts;

-- ---------------------------------------Joins-----------------------------------------------------------------------------------------------------------------

select e.employee_id,e.first_name,e.designation,s.net_salary
from employees as e
inner join employee_salary as s on e.employee_id=s.employee_id;

select e.employee_id,e.first_name,e.designation,s.net_salary,c.phone_number
from employees as e
left join employee_salary as s on e.employee_id=s.salary_id
left join employee_contacts as c on e.employee_id=c.contact_id;

select e.employee_id,e.first_name,e.designation,s.net_salary,c.address
from employees as e
right join employee_salary as s on e.employee_id=s.salary_id
right join employee_contacts as c on e.employee_id=c.contact_id;

select e.employee_id,e.first_name,e.designation,s.net_salary
from employees as e
left join employee_salary as s on e.employee_id=s.salary_id
union
select e.employee_id,e.first_name,e.designation,s.net_salary
from employees as e
right join employee_salary as s on e.employee_id=s.salary_id;

select e.employee_id,e.first_name,e.designation,s.net_salary,c.phone_number
from employees as e
left join employee_salary as s on e.employee_id=s.salary_id
left join employee_contacts as c on e.employee_id=c.contact_id
union
select e.employee_id,e.first_name,e.designation,s.net_salary,c.address
from employees as e
right join employee_salary as s on e.employee_id=s.salary_id
right join employee_contacts as c on e.employee_id=c.contact_id;

select e.employee_id,e.first_name,e.designation,a.salary_id,a.net_salary
from employees as e, employee_salary as a
where e.employee_id = a.employee_id;

select e.employee_id,e.first_name,e.designation,a.salary_id,a.net_salary
from employees as e 
cross join employee_salary as a;

-- ---------------------------------------Subqueries-----------------------------------------------------------------------------------------------------------------

select employee_id,first_name,last_name
from employees
where employee_id =
(
	select employee_id
    from employees
    order by length(first_name) asc
    limit 1
);

select employee_id,first_name,last_name,designation
from employees
where employee_id in
(
	select employee_id
    from employees
    where designation like '%engineer'
);

select count(*)
from employees
where first_name in
(
	select first_name
    from employees
    where first_name like '%a%'
);

select department,employee_id,first_name,last_name
from employees
where designation =
(
	select designation
    from employees
    where department = 'customer service'
);

select concat(first_name," ",last_name)
from  employees
where employee_id = (
select employee_id
from employees
order by length(first_name) desc
limit 1
);

select *
from employees
where employee_id = (
select employee_id
from employees
where first_name = 'henry'
);

-- ---------------------------------------Functions-----------------------------------------------------------------------------------------------------------------

delimiter //
create function salarybonus(bonus int)
returns int
deterministic
begin
    return bonus * 1.10;
end //
delimiter ;

select salarybonus(25000) as bonus;
select salary_id,net_salary,salarybonus(net_salary) as bonusplussalary from employee_salary;

drop function if exists salarybonus;


delimiter //
create function subtract(a int,b int)
returns int
deterministic
begin
    return a - b;
end //
delimiter ;

select subtract(25,10) as subtraction;
select salary_id,net_salary,salarybonus(net_salary) as bonusplussalary,subtract(salarybonus(net_salary),net_salary) as bonus from employee_salary;

drop function if exists subtract;


delimiter //
create function percentage(a int,b int)
returns int
deterministic
begin
    return (a*100) / b;
end //
delimiter ;

select percentage(5,25) as percent;
select salary_id,net_salary,salarybonus(net_salary) as bonusplussalary,subtract(salarybonus(net_salary),net_salary) as bonus,percentage(subtract(salarybonus(net_salary),net_salary),net_salary) as percentagebonus from employee_salary;

drop function if exists percentage;
