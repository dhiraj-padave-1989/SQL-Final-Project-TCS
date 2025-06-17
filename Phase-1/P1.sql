-- project phase 1 tata consultancy services

-- creating database name as tata_consultancy_services
create database tata_consultancy_services;
-- deleting database tata_consultancy_services
drop database tata_consultancy_services;
-- using database tata_consultancy_services
use tata_consultancy_services;

show databases;

-- showing all table in database tata_consultancy_services 
show tables;

show table status;

-- total tables in database tata_consultancy_services
select count(*) as total_tables from information_schema.tables where table_schema = 'tata_consultancy_services';

/* creating 25 tables with 20 values each table and deleting tables,truncating all values of each tables and using select query to 
   show each table details
*/
-- --------------------------------------------------------------------------------------------------1
create table employees (
    employee_id int primary key auto_increment,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    email varchar(100) unique not null,
    phone_number varchar(15) unique,
    department varchar(50) not null,
    designation varchar(50) not null,
    date_of_joining date not null,
    status enum('active', 'inactive', 'resigned', 'terminated') default 'active'
);

insert into employees (first_name, last_name, email, phone_number, department, designation, date_of_joining, status) 
values 
('john', 'doe', 'john.doe@email.com', '9876543210', 'it', 'software engineer', '2022-01-15', 'active'), 
('alice', 'smith', 'alice.smith@email.com', '9876543211', 'hr', 'hr manager', '2020-05-20', 'active'), 
('bob', 'johnson', 'bob.johnson@email.com', '9876543212', 'finance', 'accountant', '2019-11-10', 'active'), 
('emma', 'davis', 'emma.davis@email.com', '9876543213', 'it', 'data scientist', '2021-07-18', 'active'), 
('michael', 'brown', 'michael.brown@email.com', '9876543214', 'marketing', 'marketing specialist', '2018-04-12', 'resigned'), 
('sophia', 'wilson', 'sophia.wilson@email.com', '9876543215', 'it', 'cybersecurity analyst', '2023-02-22', 'active'), 
('daniel', 'martinez', 'daniel.martinez@email.com', '9876543216', 'it', 'network engineer', '2017-09-05', 'terminated'), 
('olivia', 'anderson', 'olivia.anderson@email.com', '9876543217', 'hr', 'recruiter', '2021-12-01', 'active'), 
('james', 'thomas', 'james.thomas@email.com', '9876543218', 'operations', 'operations manager', '2016-03-27', 'resigned'), 
('emily', 'white', 'emily.white@email.com', '9876543219', 'it', 'software developer', '2020-08-15', 'active'), 
('david', 'harris', 'david.harris@email.com', '9876543220', 'finance', 'financial analyst', '2019-05-30', 'inactive'), 
('ava', 'clark', 'ava.clark@email.com', '9876543221', 'marketing', 'seo specialist', '2023-06-18', 'active'), 
('ethan', 'lewis', 'ethan.lewis@email.com', '9876543222', 'sales', 'sales executive', '2015-10-08', 'resigned'), 
('charlotte', 'hall', 'charlotte.hall@email.com', '9876543223', 'it', 'devops engineer', '2022-04-20', 'active'), 
('henry', 'young', 'henry.young@email.com', '9876543224', 'legal', 'legal advisor', '2017-07-22', 'inactive'), 
('isabella', 'king', 'isabella.king@email.com', '9876543225', 'finance', 'tax consultant', '2018-01-17', 'active'), 
('mason', 'scott', 'mason.scott@email.com', '9876543226', 'hr', 'training coordinator', '2021-09-05', 'active'), 
('amelia', 'green', 'amelia.green@email.com', '9876543227', 'it', 'ai engineer', '2022-10-25', 'active'), 
('logan', 'adams', 'logan.adams@email.com', '9876543228', 'operations', 'logistics manager', '2016-12-14', 'resigned'), 
('sophia', 'nelson', 'sophia.nelson@email.com', '9876543229', 'customer service', 'support lead', '2020-02-08', 'active');

drop table employees;
select * from employees;
truncate employees;
-- ---------------------------------------------------------------------------------------------------2

create table employee_contacts (
    contact_id int primary key auto_increment,
    employee_id int unique not null,
    phone_number varchar(15) unique,
    address text not null,
    emergency_contact varchar(50) not null,
    foreign key (employee_id) references employees(employee_id) on delete cascade
);

insert into employee_contacts (employee_id, phone_number, address, emergency_contact) 
values 
(1, '9876543210', '123 main st, new york, ny', 'jane doe - 9876543220'),
(2, '9876543211', '456 elm st, los angeles, ca', 'bob smith - 9876543221'),
(3, '9876543212', '789 pine st, chicago, il', 'alice johnson - 9876543222'),
(4, '9876543213', '321 oak st, houston, tx', 'michael davis - 9876543223'),
(5, '9876543214', '654 maple st, san francisco, ca', 'sophia brown - 9876543224'),
(6, '9876543215', '987 cedar st, seattle, wa', 'daniel martinez - 9876543225'),
(7, '9876543216', '741 birch st, boston, ma', 'olivia anderson - 9876543226'),
(8, '9876543217', '852 walnut st, miami, fl', 'james thomas - 9876543227'),
(9, '9876543218', '963 chestnut st, denver, co', 'emily white - 9876543228'),
(10, '9876543219', '159 spruce st, dallas, tx', 'david harris - 9876543229'),
(11, '9876543220', '357 redwood st, atlanta, ga', 'ava clark - 9876543230'),
(12, '9876543221', '258 aspen st, phoenix, az', 'ethan lewis - 9876543231'),
(13, '9876543222', '369 sycamore st, philadelphia, pa', 'charlotte hall - 9876543232'),
(14, '9876543223', '753 magnolia st, san diego, ca', 'henry young - 9876543233'),
(15, '9876543224', '951 palm st, las vegas, nv', 'isabella king - 9876543234'),
(16, '9876543225', '147 fir st, austin, tx', 'mason scott - 9876543235'),
(17, '9876543226', '258 cedar ave, portland, or', 'amelia green - 9876543236'),
(18, '9876543227', '369 oakwood rd, nashville, tn', 'logan adams - 9876543237'),
(19, '9876543228', '753 river st, minneapolis, mn', 'sophia nelson - 9876543238'),
(20, '9876543229', '951 hill st, charlotte, nc', 'nathan carter - 9876543239');

drop table employee_contacts;
select * from employee_contacts;
truncate employee_contact;
-- ---------------------------------------------------------------------------------------------------3
create table employee_salary (
    salary_id int primary key auto_increment,
    employee_id int unique not null,
    basic_salary decimal(10,2) check (basic_salary > 0),
    hra decimal(10,2) check (hra > 0),
    allowances decimal(10,2) check (allowances > 0),
    deductions decimal(10,2) check (deductions > 0),
    net_salary decimal(10,2) check (net_salary > 0),
    foreign key (employee_id) references employees(employee_id) on delete cascade
);

insert into employee_salary (employee_id, basic_salary, hra, allowances, deductions, net_salary) 
values 
(1, 50000.00, 10000.00, 5000.00, 2000.00, 63000.00),
(2, 60000.00, 12000.00, 7000.00, 2500.00, 76500.00),
(3, 55000.00, 11000.00, 6000.00, 2300.00, 69700.00),
(4, 45000.00, 9000.00, 4000.00, 1800.00, 56200.00),
(5, 70000.00, 14000.00, 8000.00, 3000.00, 89000.00),
(6, 48000.00, 9500.00, 4200.00, 1900.00, 59800.00),
(7, 52000.00, 10500.00, 4500.00, 2000.00, 65000.00),
(8, 62000.00, 12500.00, 7500.00, 2600.00, 79400.00),
(9, 58000.00, 11500.00, 6800.00, 2400.00, 74900.00),
(10, 49000.00, 9800.00, 4100.00, 1850.00, 61050.00),
(11, 53000.00, 10800.00, 4700.00, 2100.00, 66900.00),
(12, 75000.00, 15000.00, 9000.00, 3500.00, 96500.00),
(13, 64000.00, 13000.00, 8500.00, 2800.00, 82700.00),
(14, 42000.00, 8500.00, 3800.00, 1600.00, 52100.00),
(15, 68000.00, 13500.00, 8700.00, 2900.00, 87300.00),
(16, 56000.00, 11200.00, 6200.00, 2200.00, 75200.00),
(17, 51000.00, 10200.00, 4600.00, 2050.00, 63750.00),
(18, 47000.00, 9200.00, 4300.00, 1950.00, 58650.00),
(19, 73000.00, 14600.00, 8800.00, 3300.00, 93100.00),
(20, 59000.00, 11800.00, 7000.00, 2500.00, 76300.00);

drop table employee_salary;
select * from employee_salary;
truncate employee_salary;
-- ----------------------------------------------------------------------------------------------------4
create table employee_attendance (
    attendance_id int primary key auto_increment,
    employee_id int unique not null,
    attendance_date date not null,
    status enum('present', 'absent', 'leave', 'work from home') default 'absent',
    foreign key (employee_id) references employees(employee_id) on delete cascade
);

insert into employee_attendance (employee_id, attendance_date, status) 
values 
(1, '2025-02-01', 'present'),
(2, '2025-02-01', 'absent'),
(3, '2025-02-01', 'work from home'),
(4, '2025-02-01', 'present'),
(5, '2025-02-01', 'leave'),
(6, '2025-02-02', 'present'),
(7, '2025-02-02', 'work from home'),
(8, '2025-02-02', 'present'),
(9, '2025-02-02', 'absent'),
(10, '2025-02-02', 'leave'),
(11, '2025-02-03', 'present'),
(12, '2025-02-03', 'absent'),
(13, '2025-02-03', 'present'),
(14, '2025-02-03', 'work from home'),
(15, '2025-02-03', 'present'),
(16, '2025-02-04', 'absent'),
(17, '2025-02-04', 'leave'),
(18, '2025-02-04', 'present'),
(19, '2025-02-04', 'work from home'),
(20, '2025-02-04', 'present');

drop table employee_attendance;
select * from employee_attendance;
truncate employee_attendance;
-- -----------------------------------------------------------------------------------------------------5

create table clients (
    client_id int primary key auto_increment,
    client_name varchar(100) not null,
    contact_person varchar(100) not null,
    email varchar(100) unique not null,
    phone_number varchar(15) not null,
    address text not null,
    industry varchar(50) not null,
    status enum('active', 'inactive') default 'active'
);

insert into clients (client_name, contact_person, email, phone_number, address, industry, status) 
values 
('tech solutions inc.', 'john doe', 'john.doe@techsolutions.com', '9876543210', '123 silicon st, san francisco, ca', 'technology', 'active'),
('green energy corp.', 'alice johnson', 'alice.johnson@greenenergy.com', '9876543211', '456 solar rd, austin, tx', 'energy', 'active'),
('global finance ltd.', 'robert smith', 'robert.smith@globalfinance.com', '9876543212', '789 wall st, new york, ny', 'finance', 'active'),
('health plus', 'emma brown', 'emma.brown@healthplus.com', '9876543213', '321 wellness ave, miami, fl', 'healthcare', 'inactive'),
('autodrive motors', 'michael davis', 'michael.davis@autodrive.com', '9876543214', '654 motorway dr, detroit, mi', 'automobile', 'active'),
('smart retailers', 'sophia wilson', 'sophia.wilson@smartretail.com', '9876543215', '987 commerce st, chicago, il', 'retail', 'active'),
('nextgen software', 'daniel martinez', 'daniel.martinez@nextgensoft.com', '9876543216', '741 code ln, seattle, wa', 'technology', 'active'),
('blue ocean shipping', 'olivia anderson', 'olivia.anderson@blueocean.com', '9876543217', '852 harbor rd, los angeles, ca', 'logistics', 'inactive'),
('edutech solutions', 'james thomas', 'james.thomas@edutech.com', '9876543218', '963 learning st, boston, ma', 'education', 'active'),
('infinity constructions', 'emily white', 'emily.white@infinityconstruct.com', '9876543219', '159 builder ave, denver, co', 'construction', 'active'),
('foodies delight', 'david harris', 'david.harris@foodiesdelight.com', '9876543220', '357 tasty st, dallas, tx', 'food & beverage', 'active'),
('prime pharmaceuticals', 'ava clark', 'ava.clark@primepharma.com', '9876543221', '258 medic ave, philadelphia, pa', 'pharmaceuticals', 'active'),
('future technologies', 'ethan lewis', 'ethan.lewis@futuretech.com', '9876543222', '369 ai blvd, san diego, ca', 'technology', 'inactive'),
('adventure travels', 'charlotte hall', 'charlotte.hall@adventuretravels.com', '9876543223', '753 explore rd, las vegas, nv', 'travel', 'active'),
('home interiors', 'henry young', 'henry.young@homeinteriors.com', '9876543224', '951 design st, austin, tx', 'interior design', 'active'),
('bright media', 'isabella king', 'isabella.king@brightmedia.com', '9876543225', '147 studio ln, portland, or', 'media & advertising', 'inactive'),
('rapid delivery', 'mason scott', 'mason.scott@rapiddelivery.com', '9876543226', '258 fast rd, nashville, tn', 'logistics', 'active'),
('power grid systems', 'amelia green', 'amelia.green@powergrid.com', '9876543227', '369 voltage st, minneapolis, mn', 'energy', 'active'),
('luxury resorts', 'logan adams', 'logan.adams@luxuryresorts.com', '9876543228', '753 vacation rd, honolulu, hi', 'hospitality', 'inactive'),
('agro farms', 'sophia nelson', 'sophia.nelson@agrofarms.com', '9876543229', '951 greenfield ln, charlotte, nc', 'agriculture', 'active');

drop table clients;
select * from clients;
truncate clients;
-- ----------------------------------------------------------------------------------------------------6
create table projects (
    project_id int primary key auto_increment,
    project_name varchar(100) not null,
    client_id int not null,
    start_date date not null,
    end_date date not null,
    budget decimal(12,2) not null,
    status enum('planned', 'in progress', 'completed', 'on hold') default 'planned',
    foreign key (client_id) references clients(client_id) on delete cascade
);

insert into projects (project_name, client_id, start_date, end_date, budget, status) 
values 
('ai chatbot development', 1, '2025-01-15', '2025-06-15', 250000.00, 'in progress'),
('renewable energy optimization', 2, '2025-02-01', '2025-08-01', 500000.00, 'planned'),
('banking app upgrade', 3, '2025-03-10', '2025-09-10', 750000.00, 'in progress'),
('hospital management system', 4, '2025-01-20', '2025-07-20', 600000.00, 'planned'),
('autonomous vehicle prototype', 5, '2025-04-05', '2025-12-05', 1500000.00, 'on hold'),
('e-commerce website redesign', 6, '2025-02-15', '2025-07-15', 300000.00, 'completed'),
('enterprise crm development', 7, '2025-05-01', '2025-11-01', 800000.00, 'in progress'),
('global logistics platform', 8, '2025-06-10', '2026-01-10', 950000.00, 'planned'),
('ai-based learning system', 9, '2025-03-20', '2025-09-20', 450000.00, 'completed'),
('smart city infrastructure', 10, '2025-07-01', '2026-07-01', 2000000.00, 'planned'),
('food delivery mobile app', 11, '2025-02-05', '2025-06-05', 400000.00, 'in progress'),
('pharmaceutical research ai', 12, '2025-01-25', '2025-12-25', 1000000.00, 'on hold'),
('cybersecurity enhancement', 13, '2025-04-15', '2025-10-15', 550000.00, 'planned'),
('luxury travel booking system', 14, '2025-05-20', '2025-11-20', 700000.00, 'in progress'),
('smart home automation', 15, '2025-06-01', '2025-12-01', 850000.00, 'planned'),
('digital marketing campaign', 16, '2025-01-10', '2025-06-10', 300000.00, 'completed'),
('same-day delivery expansion', 17, '2025-07-15', '2026-01-15', 650000.00, 'planned'),
('national power grid monitoring', 18, '2025-08-05', '2026-02-05', 1200000.00, 'on hold'),
('exclusive resort development', 19, '2025-09-01', '2026-09-01', 1800000.00, 'planned'),
('sustainable farming initiative', 20, '2025-03-01', '2025-09-01', 400000.00, 'completed');

drop table projects;
select * from projects;
truncate projects;
-- ----------------------------------------------------------------------------------------------------7
create table project_assignments (
    assignment_id int primary key auto_increment,
    project_id int not null,
    employee_id int not null,
    role varchar(50) not null,
    start_date date not null,
    end_date date not null,
    foreign key (project_id) references projects(project_id) on delete cascade,
    foreign key (employee_id) references employees(employee_id) on delete cascade
);

insert into project_assignments (project_id, employee_id, role, start_date, end_date) 
values 
(1, 5, 'project manager', '2025-01-15', '2025-06-15'),
(2, 8, 'software engineer', '2025-02-01', '2025-08-01'),
(3, 3, 'ui/ux designer', '2025-03-10', '2025-09-10'),
(4, 10, 'business analyst', '2025-01-20', '2025-07-20'),
(5, 12, 'mechanical engineer', '2025-04-05', '2025-12-05'),
(6, 2, 'frontend developer', '2025-02-15', '2025-07-15'),
(7, 9, 'backend developer', '2025-05-01', '2025-11-01'),
(8, 4, 'quality analyst', '2025-06-10', '2026-01-10'),
(9, 6, 'data scientist', '2025-03-20', '2025-09-20'),
(10, 15, 'civil engineer', '2025-07-01', '2026-07-01'),
(11, 7, 'mobile app developer', '2025-02-05', '2025-06-05'),
(12, 14, 'ai researcher', '2025-01-25', '2025-12-25'),
(13, 1, 'cybersecurity specialist', '2025-04-15', '2025-10-15'),
(14, 13, 'marketing strategist', '2025-05-20', '2025-11-20'),
(15, 11, 'embedded systems engineer', '2025-06-01', '2025-12-01'),
(16, 18, 'seo analyst', '2025-01-10', '2025-06-10'),
(17, 16, 'logistics coordinator', '2025-07-15', '2026-01-15'),
(18, 20, 'electrical engineer', '2025-08-05', '2026-02-05'),
(19, 17, 'architect', '2025-09-01', '2026-09-01'),
(20, 19, 'agricultural consultant', '2025-03-01', '2025-09-01');

drop table project_assignments;
select * from project_assignments;
truncate project_assignments;
-- ---------------------------------------------------------------------------------------------------8
create table invoices (
    invoice_id int primary key auto_increment,
    client_id int not null,
    project_id int,
    invoice_date date not null,
    due_date date not null,
    amount decimal(12,2) not null,
    status enum('pending', 'paid', 'overdue') default 'pending',
    foreign key (client_id) references clients(client_id) on delete cascade,
    foreign key (project_id) references projects(project_id) on delete set null
);

insert into invoices (client_id, project_id, invoice_date, due_date, amount, status) 
values 
(1, 1, '2025-01-20', '2025-02-20', 50000.00, 'pending'),
(2, 2, '2025-02-05', '2025-03-05', 120000.00, 'paid'),
(3, 3, '2025-03-10', '2025-04-10', 75000.00, 'overdue'),
(4, 4, '2025-04-15', '2025-05-15', 200000.00, 'pending'),
(5, 5, '2025-05-01', '2025-06-01', 450000.00, 'paid'),
(6, 6, '2025-06-20', '2025-07-20', 150000.00, 'pending'),
(7, 7, '2025-07-25', '2025-08-25', 95000.00, 'overdue'),
(8, 8, '2025-08-30', '2025-09-30', 300000.00, 'pending'),
(9, 9, '2025-09-15', '2025-10-15', 125000.00, 'paid'),
(10, 10, '2025-10-01', '2025-11-01', 180000.00, 'pending'),
(11, 11, '2025-11-10', '2025-12-10', 600000.00, 'paid'),
(12, 12, '2025-12-20', '2026-01-20', 230000.00, 'pending'),
(13, 13, '2026-01-05', '2026-02-05', 85000.00, 'overdue'),
(14, 14, '2026-02-15', '2026-03-15', 300000.00, 'paid'),
(15, 15, '2026-03-01', '2026-04-01', 500000.00, 'pending'),
(16, 16, '2026-04-10', '2026-05-10', 90000.00, 'paid'),
(17, 17, '2026-05-15', '2026-06-15', 275000.00, 'pending'),
(18, 18, '2026-06-05', '2026-07-05', 140000.00, 'overdue'),
(19, 19, '2026-07-20', '2026-08-20', 200000.00, 'pending'),
(20, 20, '2026-08-10', '2026-09-10', 330000.00, 'paid');

drop table invoices;
select * from invoices;
truncate invoices;
-- ----------------------------------------------------------------------------------------------------9
create table payments_received (
    payment_id int primary key auto_increment,
    invoice_id int not null,
    amount_paid decimal(12,2) not null,
    payment_date date not null,
    payment_method enum('bank transfer', 'credit card', 'cheque') not null,
    foreign key (invoice_id) references invoices(invoice_id) on delete cascade
);

insert into payments_received (invoice_id, amount_paid, payment_date, payment_method) 
values 
(1, 50000.00, '2025-02-18', 'bank transfer'),
(2, 120000.00, '2025-03-04', 'credit card'),
(3, 75000.00, '2025-04-15', 'cheque'),
(4, 200000.00, '2025-05-10', 'bank transfer'),
(5, 450000.00, '2025-06-05', 'credit card'),
(6, 150000.00, '2025-07-18', 'cheque'),
(7, 95000.00, '2025-08-12', 'bank transfer'),
(8, 300000.00, '2025-09-22', 'credit card'),
(9, 125000.00, '2025-10-05', 'cheque'),
(10, 180000.00, '2025-11-03', 'bank transfer'),
(11, 600000.00, '2025-12-01', 'credit card'),
(12, 230000.00, '2026-01-07', 'cheque'),
(13, 85000.00, '2026-02-16', 'bank transfer'),
(14, 300000.00, '2026-03-10', 'credit card'),
(15, 500000.00, '2026-04-25', 'cheque'),
(16, 90000.00, '2026-05-15', 'bank transfer'),
(17, 275000.00, '2026-06-05', 'credit card'),
(18, 140000.00, '2026-07-11', 'cheque'),
(19, 200000.00, '2026-08-22', 'bank transfer'),
(20, 330000.00, '2026-09-01', 'credit card');


drop table payments_received;
select * from payments_received;
truncate payments_received;
-- -----------------------------------------------------------------------------------------------------10

create table recruitment (
    applicant_id int primary key auto_increment,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    email varchar(100) unique not null,
    phone_number varchar(15) not null,
    position_applied varchar(100) not null,
    status enum('applied', 'interview scheduled', 'selected', 'rejected') default 'applied'
);

insert into recruitment (first_name, last_name, email, phone_number, position_applied, status) 
values 
('amit', 'sharma', 'amit.sharma@example.com', '9876543210', 'software engineer', 'applied'),
('priya', 'verma', 'priya.verma@example.com', '9865321470', 'data analyst', 'interview scheduled'),
('rahul', 'kumar', 'rahul.kumar@example.com', '9988776655', 'project manager', 'selected'),
('neha', 'singh', 'neha.singh@example.com', '9876123456', 'hr manager', 'rejected'),
('vikram', 'yadav', 'vikram.yadav@example.com', '9812345678', 'devops engineer', 'applied'),
('ananya', 'mishra', 'ananya.mishra@example.com', '9823456789', 'backend developer', 'interview scheduled'),
('suresh', 'rao', 'suresh.rao@example.com', '9900112233', 'marketing manager', 'selected'),
('kavita', 'joshi', 'kavita.joshi@example.com', '9887766554', 'ux designer', 'rejected'),
('manish', 'gupta', 'manish.gupta@example.com', '9871234560', 'software architect', 'applied'),
('ritika', 'patel', 'ritika.patel@example.com', '9765432109', 'business analyst', 'interview scheduled'),
('rohan', 'kapoor', 'rohan.kapoor@example.com', '9753124680', 'ai engineer', 'selected'),
('sneha', 'bose', 'sneha.bose@example.com', '9898989898', 'cybersecurity analyst', 'rejected'),
('arjun', 'mehta', 'arjun.mehta@example.com', '9876567890', 'product manager', 'applied'),
('pooja', 'saxena', 'pooja.saxena@example.com', '9871122334', 'frontend developer', 'interview scheduled'),
('sahil', 'chopra', 'sahil.chopra@example.com', '9998887776', 'network engineer', 'selected'),
('meera', 'das', 'meera.das@example.com', '9888899990', 'database administrator', 'rejected'),
('kunal', 'sen', 'kunal.sen@example.com', '9877896543', 'cloud engineer', 'applied'),
('tina', 'roy', 'tina.roy@example.com', '9854321678', 'seo specialist', 'interview scheduled'),
('nitin', 'agarwal', 'nitin.agarwal@example.com', '9933221100', 'it support engineer', 'selected'),
('swati', 'pillai', 'swati.pillai@example.com', '9977554433', 'finance analyst', 'rejected');

drop table recruitment;
select * from recruitment;
truncate recruitment;
-- -------------------------------------------------------------------------------------------------------11
create table training_sessions (
    training_id int primary key auto_increment,
    training_name varchar(100) not null,
    trainer_name varchar(100) not null,
    start_date date not null,
    end_date date not null,
    status enum('planned', 'ongoing', 'completed') default 'planned'
);

insert into training_sessions (training_name, trainer_name, start_date, end_date, status) 
values 
('advanced python programming', 'john carter', '2025-03-01', '2025-03-10', 'planned'), 
('leadership & management', 'alice johnson', '2025-02-15', '2025-02-25', 'ongoing'), 
('cybersecurity essentials', 'robert smith', '2025-04-05', '2025-04-15', 'planned'), 
('cloud computing basics', 'emma davis', '2025-01-20', '2025-01-30', 'completed'), 
('ai & machine learning', 'michael brown', '2025-03-10', '2025-03-20', 'planned'), 
('agile project management', 'sophia martinez', '2025-02-05', '2025-02-15', 'ongoing'), 
('effective communication', 'daniel wilson', '2025-01-10', '2025-01-17', 'completed'), 
('database management', 'olivia anderson', '2025-04-01', '2025-04-10', 'planned'), 
('cyber threat intelligence', 'james thomas', '2025-03-20', '2025-03-30', 'planned'), 
('digital marketing strategy', 'emma white', '2025-02-18', '2025-02-28', 'ongoing'), 
('big data & analytics', 'henry lewis', '2025-04-15', '2025-04-25', 'planned'), 
('software testing fundamentals', 'grace hall', '2025-03-05', '2025-03-12', 'planned'), 
('customer relationship management', 'david wilson', '2025-01-15', '2025-01-25', 'completed'), 
('devops practices', 'jack harris', '2025-02-20', '2025-03-01', 'ongoing'), 
('time management skills', 'sophia brown', '2025-03-08', '2025-03-15', 'planned'), 
('ethical hacking workshop', 'charlie green', '2025-05-01', '2025-05-10', 'planned'), 
('emotional intelligence at work', 'emily taylor', '2025-02-01', '2025-02-10', 'completed'), 
('blockchain & cryptocurrency', 'nathan scott', '2025-06-01', '2025-06-10', 'planned'), 
('sales & negotiation techniques', 'isabella reed', '2025-04-10', '2025-04-20', 'planned'), 
('data science with r', 'ethan clark', '2025-05-15', '2025-05-25', 'planned');

drop table training_sessions;
select * from training_sessions;
truncate training_sessions;
-- --------------------------------------------------------------------------------------------------------12
create table employee_certifications (
    certification_id int primary key auto_increment,
    employee_id int not null,
    certification_name varchar(100) not null,
    issued_date date not null,
    expiry_date date not null,
    foreign key (employee_id) references employees(employee_id) on delete cascade
);

insert into employee_certifications (employee_id, certification_name, issued_date, expiry_date) 
values 
(1, 'aws certified solutions architect', '2023-01-15', '2026-01-15'),
(2, 'certified scrum master (csm)', '2022-06-20', '2025-06-20'),
(3, 'microsoft azure fundamentals', '2023-09-10', '2026-09-10'),
(4, 'cisco certified network associate (ccna)', '2021-12-05', '2024-12-05'),
(5, 'google cloud professional architect', '2022-04-18', '2025-04-18'),
(6, 'pmp (project management professional)', '2023-07-30', '2026-07-30'),
(7, 'oracle certified java programmer', '2020-11-10', '2023-11-10'),
(8, 'itil foundation certification', '2022-02-15', '2025-02-15'),
(9, 'certified ethical hacker (ceh)', '2021-08-25', '2024-08-25'),
(10, 'comptia security+', '2023-05-10', '2026-05-10'),
(11, 'google data analytics professional', '2022-10-15', '2025-10-15'),
(12, 'aws certified devops engineer', '2023-03-20', '2026-03-20'),
(13, 'salesforce administrator', '2021-09-05', '2024-09-05'),
(14, 'six sigma green belt', '2022-07-12', '2025-07-12'),
(15, 'certified kubernetes administrator', '2023-08-01', '2026-08-01'),
(16, 'certified data science professional', '2022-01-22', '2025-01-22'),
(17, 'azure devops engineer expert', '2023-11-11', '2026-11-11'),
(18, 'google ux design professional', '2021-05-19', '2024-05-19'),
(19, 'blockchain developer certification', '2022-06-08', '2025-06-08'),
(20, 'red hat certified engineer (rhce)', '2023-09-30', '2026-09-30');

drop table employee_certifications;
select * from employee_certifications;
truncate employee_certifications;
-- --------------------------------------------------------------------------------------------------------13
create table user_accounts (
    user_id int primary key auto_increment,
    employee_id int unique not null,
    username varchar(50) unique not null,
    password_hash varchar(255) not null,
    role enum('admin', 'manager', 'employee') not null,
    status enum('active', 'disabled') default 'active',
    foreign key (employee_id) references employees(employee_id) on delete cascade
);

insert into user_accounts (employee_id, username, password_hash, role, status) 
values 
(1, 'amit.sharma', '5f4dcc3b5aa765d61d8327deb882cf99', 'admin', 'active'),
(2, 'priya.verma', 'e99a18c428cb38d5f260853678922e03', 'manager', 'active'),
(3, 'rahul.kumar', '25d55ad283aa400af464c76d713c07ad', 'employee', 'active'),
(4, 'neha.singh', '96e79218965eb72c92a549dd5a330112', 'employee', 'active'),
(5, 'vikram.yadav', '098f6bcd4621d373cade4e832627b4f6', 'manager', 'active'),
(6, 'ananya.mishra', 'c4ca4238a0b923820dcc509a6f75849b', 'employee', 'active'),
(7, 'suresh.rao', 'c81e728d9d4c2f636f067f89cc14862c', 'manager', 'active'),
(8, 'kavita.joshi', 'eccbc87e4b5ce2fe28308fd9f2a7baf3', 'employee', 'active'),
(9, 'manish.gupta', 'a87ff679a2f3e71d9181a67b7542122c', 'admin', 'active'),
(10, 'ritika.patel', 'e4da3b7fbbce2345d7772b0674a318d5', 'employee', 'active'),
(11, 'rohan.kapoor', '1679091c5a880faf6fb5e6087eb1b2dc', 'manager', 'disabled'),
(12, 'sneha.bose', '8f14e45fceea167a5a36dedd4bea2543', 'employee', 'active'),
(13, 'arjun.mehta', 'c9f0f895fb98ab9159f51fd0297e236d', 'admin', 'active'),
(14, 'pooja.saxena', '45c48cce2e2d7fbdea1afc51c7c6ad26', 'employee', 'active'),
(15, 'sahil.chopra', 'd3d9446802a44259755d38e6d163e820', 'employee', 'active'),
(16, 'meera.das', '6512bd43d9caa6e02c990b0a82652dca', 'manager', 'disabled'),
(17, 'kunal.sen', 'c20ad4d76fe97759aa27a0c99bff6710', 'employee', 'active'),
(18, 'tina.roy', 'c51ce410c124a10e0db5e4b97fc2af39', 'employee', 'active'),
(19, 'nitin.agarwal', 'aab3238922bcc25a6f606eb525ffdc56', 'manager', 'active'),
(20, 'swati.pillai', '9bf31c7ff062936a96d3c8bd1f8f2ff3', 'admin', 'active');

drop table user_accounts;
select * from user_accounts;
truncate user_accounts;
-- --------------------------------------------------------------------------------------------------------14
create table system_logs (
    log_id int primary key auto_increment,
    user_id int,
    action varchar(255) not null,
    timestamp timestamp default current_timestamp,
    foreign key (user_id) references user_accounts(user_id) on delete set null
);

insert into system_logs (user_id, action) 
values 
(1, 'logged in'),
(2, 'updated employee record'),
(3, 'generated payroll report'),
(4, 'changed password'),
(5, 'added new project'),
(6, 'deleted a user account'),
(7, 'modified client details'),
(8, 'approved leave request'),
(9, 'updated system settings'),
(10, 'exported financial report'),
(11, 'assigned employee to project'),
(12, 'marked invoice as paid'),
(13, 'scheduled training session'),
(14, 'reviewed performance report'),
(15, 'logged out'),
(16, 'updated attendance records'),
(17, 'changed user role'),
(18, 'sent notification to all employees'),
(19, 'generated tax report'),
(20, 'disabled inactive user account');

drop table system_logs;
select * from system_logs;
truncate system_logs;
-- -------------------------------------------------------------------------------------------------------15
create table asset_management (
    asset_id int primary key auto_increment,
    asset_name varchar(100) not null,
    assigned_to int,
    purchase_date date not null,
    warranty_expiry date not null,
    foreign key (assigned_to) references employees(employee_id) on delete set null
);

insert into asset_management (asset_name, assigned_to, purchase_date, warranty_expiry) 
values
('dell laptop', 1, '2023-01-10', '2026-01-10'),
('hp printer', 2, '2022-05-15', '2025-05-15'),
('cisco router', 3, '2021-09-20', '2024-09-20'),
('lenovo thinkpad', 4, '2023-03-05', '2026-03-05'),
('apple macbook pro', 5, '2023-06-12', '2026-06-12'),
('samsung monitor', 6, '2022-08-30', '2025-08-30'),
('logitech keyboard', 7, '2021-12-10', '2024-12-10'),
('seagate external hdd', 8, '2020-11-25', '2023-11-25'),
('microsoft surface', 9, '2023-07-18', '2026-07-18'),
('canon scanner', 10, '2022-10-05', '2025-10-05'),
('asus rog laptop', 11, '2021-06-14', '2024-06-14'),
('epson projector', 12, '2022-12-22', '2025-12-22'),
('synology nas', 13, '2023-02-17', '2026-02-17'),
('google pixel tablet', 14, '2023-09-01', '2026-09-01'),
('western digital ssd', 15, '2021-04-10', '2024-04-10'),
('sony headphones', 16, '2022-07-09', '2025-07-09'),
('brother laser printer', 17, '2023-05-13', '2026-05-13'),
('lenovo desktop', 18, '2022-03-27', '2025-03-27'),
('hp docking station', 19, '2021-11-11', '2024-11-11'),
('raspberry pi 4', 20, '2023-08-29', '2026-08-29');

drop table asset_management;
select * from asset_management;
truncate asset_management;
-- -------------------------------------------------------------------------------------------------------16
create table support_tickets (
    ticket_id int primary key auto_increment,
    client_id int,
    issue_description text not null,
    status enum('open', 'in progress', 'resolved', 'closed') default 'open',
    created_at timestamp default current_timestamp,
    foreign key (client_id) references clients(client_id) on delete cascade
);

insert into support_tickets (client_id, issue_description, status) 
values
(1, 'unable to login to the system.', 'open'),
(2, 'system crash when generating reports.', 'in progress'),
(3, 'payment not processing on checkout.', 'resolved'),
(4, 'receiving error 500 on the dashboard.', 'open'),
(5, 'email notifications are not being sent.', 'closed'),
(6, 'slow performance while using the mobile app.', 'open'),
(7, 'unable to reset password.', 'resolved'),
(8, 'integration with third-party api is failing.', 'in progress'),
(9, 'getting unexpected logout after 5 minutes.', 'open'),
(10, 'invoice generation is not working properly.', 'closed'),
(11, 'database connection timeout error.', 'in progress'),
(12, 'live chat support is not responding.', 'resolved'),
(13, 'profile picture upload fails on safari browser.', 'open'),
(14, 'two-factor authentication code is not received.', 'in progress'),
(15, 'user roles and permissions not applied correctly.', 'closed'),
(16, 'frequent disconnection from the vpn service.', 'resolved'),
(17, 'system backup process is failing.', 'open'),
(18, 'broken links on the client portal.', 'resolved'),
(19, 'cannot add new users to the platform.', 'in progress'),
(20, 'duplicate records appearing in the reports.', 'closed');

drop table support_tickets;
select * from support_tickets;
truncate support_tickets;
-- --------------------------------------------------------------------------------------------------------17
create table service_requests (
    request_id int primary key auto_increment,
    client_id int not null,
    request_details text not null,
    status enum('new', 'processing', 'completed') default 'new',
    assigned_to int,
    foreign key (client_id) references clients(client_id) on delete cascade,
    foreign key (assigned_to) references employees(employee_id) on delete set null
);

insert into service_requests (client_id, request_details, status, assigned_to) values
(1, 'request for software installation.', 'new', 1),
(2, 'upgrade server storage capacity.', 'processing', 2),
(3, 'on-site network troubleshooting.', 'completed', 3),
(4, 'request for additional user licenses.', 'new', 4),
(5, 'data migration assistance needed.', 'processing', 5),
(6, 'system security audit request.', 'completed', 6),
(7, 'hardware replacement for desktop.', 'new', 7),
(8, 'cloud backup configuration.', 'processing', 8),
(9, 'mobile app deployment assistance.', 'completed', 9),
(10, 'request for vpn setup.', 'new', 10),
(11, 'customization of invoicing module.', 'processing', 11),
(12, 'software bug fix request.', 'completed', 12),
(13, 'email account configuration help.', 'new', 13),
(14, 'request to set up remote access.', 'processing', 14),
(15, 'firewall rule modification.', 'completed', 15),
(16, 'upgrade to latest software version.', 'new', 16),
(17, 'new user onboarding and training.', 'processing', 17),
(18, 'system performance optimization.', 'completed', 18),
(19, 'request for access control policy update.', 'new', 19),
(20, 'data recovery from corrupted drive.', 'processing', 20);

drop table service_requests;
select * from service_requests;
truncate service_requests;
-- ---------------------------------------------------------------------------------------------------------18

create table network_devices (
    device_id int primary key auto_increment,
    device_name varchar(100) not null,
    ip_address varchar(15) not null,
    mac_address varchar(17) not null,
    assigned_to int,
    foreign key (assigned_to) references employees(employee_id) on delete set null
);

insert into network_devices (device_name, ip_address, mac_address, assigned_to) 
values 
('cisco router', '192.168.1.1', '00:1a:2b:3c:4d:5e',1), 
('hp switch', '192.168.1.2', '00:1b:3d:5f:7h:9j',2), 
('netgear access point', '192.168.1.3', '00:2c:4e:6g:8i:0k',3), 
('ubiquiti firewall', '192.168.1.4', '00:3d:5f:7h:9j:1l',4), 
('mikrotik router', '192.168.1.5', '00:4e:6g:8i:0k:2m',5), 
('d-link switch', '192.168.1.6', '00:5f:7h:9j:1l:3n',6), 
('aruba ap', '192.168.1.7', '00:6g:8i:0k:2m:4o',7), 
('tp-link repeater', '192.168.1.8', '00:7h:9j:1l:3n:5p',8), 
('juniper firewall', '192.168.1.9', '00:8i:0k:2m:4o:6q',9), 
('huawei router', '192.168.1.10', '00:9j:1l:3n:5p:7r',10), 
('zyxel load balancer', '192.168.1.11', '00:0k:2m:4o:6q:8s',11), 
('dell powerswitch', '192.168.1.12', '00:1l:3n:5p:7r:9t',12), 
('asus wifi router', '192.168.1.13', '00:2m:4o:6q:8s:0u',13), 
('synology nas', '192.168.1.14', '00:3n:5p:7r:9t:1v',14), 
('buffalo wireless bridge', '192.168.1.15', '00:4o:6q:8s:0u:2w',15), 
('linksys smart router', '192.168.1.16', '00:5p:7r:9t:1v:3x',16), 
('meraki cloud switch', '192.168.1.17', '00:6q:8s:0u:2w:4y',17), 
('fortinet firewall', '192.168.1.18', '00:7r:9t:1v:3x:5z',18), 
('extreme networks ap', '192.168.1.19', '00:8s:0u:2w:4y:6a',19), 
('draytek vpn router', '192.168.1.20', '00:9t:1v:3x:5z:7b',20);

drop table network_devices;
select * from network_devices;
truncate network_devices;
-- -----------------------------------------------------------------------------------------------------------19
create table system_access_logs (
    access_id int primary key auto_increment,
    user_id int not null,
    login_time timestamp default current_timestamp,
    logout_time timestamp null,
    ip_address varchar(15) not null,
    foreign key (user_id) references user_accounts(user_id) on delete cascade
);

insert into system_access_logs (user_id, login_time, logout_time, ip_address) values
(1, '2025-02-17 08:15:32', '2025-02-17 12:30:45', '192.168.1.10'),
(2, '2025-02-17 09:00:10', '2025-02-17 13:45:20', '192.168.1.11'),
(3, '2025-02-17 10:22:55', '2025-02-17 14:30:15', '192.168.1.12'),
(4, '2025-02-17 07:50:40', '2025-02-17 11:15:55', '192.168.1.13'),
(5, '2025-02-17 08:35:22', '2025-02-17 12:00:30', '192.168.1.14'),
(6, '2025-02-17 09:15:10', null, '192.168.1.15'), -- still logged in
(7, '2025-02-17 07:00:45', '2025-02-17 11:45:20', '192.168.1.16'),
(8, '2025-02-17 06:30:55', '2025-02-17 10:20:35', '192.168.1.17'),
(9, '2025-02-17 08:05:30', '2025-02-17 12:10:40', '192.168.1.18'),
(10, '2025-02-17 10:45:12', null, '192.168.1.19'), -- still logged in
(11, '2025-02-17 09:50:30', '2025-02-17 13:10:55', '192.168.1.20'),
(12, '2025-02-17 07:30:20', '2025-02-17 11:40:10', '192.168.1.21'),
(13, '2025-02-17 06:45:05', '2025-02-17 10:50:50', '192.168.1.22'),
(14, '2025-02-17 08:25:30', '2025-02-17 12:20:15', '192.168.1.23'),
(15, '2025-02-17 09:10:40', '2025-02-17 13:35:25', '192.168.1.24'),
(16, '2025-02-17 07:55:50', '2025-02-17 11:30:45', '192.168.1.25'),
(17, '2025-02-17 06:20:10', '2025-02-17 10:40:20', '192.168.1.26'),
(18, '2025-02-17 08:50:15', '2025-02-17 12:55:35', '192.168.1.27'),
(19, '2025-02-17 10:30:25', null, '192.168.1.28'), -- still logged in
(20, '2025-02-17 09:40:35', '2025-02-17 13:25:50', '192.168.1.29');

drop table system_access_logs;
select * from system_access_logs;
truncate system_access_logs;
-- -------------------------------------------------------------------------------------------------------------20

create table office_locations (
    location_id int primary key auto_increment,
    address text not null,
    city varchar(50) not null,
    state varchar(50)  not null,
    country varchar(50) not null
);

insert into office_locations (address, city, state, country) 
values 
('123 main st', 'new york', 'new york', 'usa'), 
('456 oak ave', 'los angeles', 'california', 'usa'), 
('789 pine rd', 'chicago', 'illinois', 'usa'), 
('101 maple ln', 'houston', 'texas', 'usa'), 
('202 birch blvd', 'san francisco', 'california', 'usa'), 
('303 cedar dr', 'seattle', 'washington', 'usa'), 
('404 walnut st', 'boston', 'massachusetts', 'usa'), 
('505 elm ave', 'miami', 'florida', 'usa'), 
('606 spruce ct', 'denver', 'colorado', 'usa'), 
('707 aspen pl', 'atlanta', 'georgia', 'usa'), 
('808 magnolia st', 'toronto', 'ontario', 'canada'), 
('909 willow ave', 'vancouver', 'british columbia', 'canada'), 
('1010 cherry rd', 'montreal', 'quebec', 'canada'), 
('1111 oakwood ln', 'london', 'england', 'united kingdom'), 
('1212 redwood st', 'manchester', 'england', 'united kingdom'), 
('1313 sycamore blvd', 'sydney', 'new south wales', 'australia'), 
('1414 cypress ave', 'melbourne', 'victoria', 'australia'), 
('1515 palm st', 'berlin', 'berlin', 'germany'), 
('1616 beech rd', 'paris', 'île-de-france', 'france'), 
('1717 juniper pl', 'tokyo', 'tokyo', 'japan');

drop table office_locations;
select * from office_locations;
truncate office_locations;
-- -------------------------------------------------------------------------------------------------------------21
create table visitor_logs (
    visitor_id int primary key auto_increment,
    visitor_name varchar(100) not null,
    purpose text not null,
    visit_date date not null,
    employee_visited int,
    foreign key (employee_visited) references employees(employee_id) on delete set null
);

insert into visitor_logs (visitor_name, purpose, visit_date, employee_visited) 
values 
('john doe', 'business meeting', '2025-02-10', 1), 
('jane smith', 'job interview', '2025-02-11', 2), 
('michael johnson', 'delivery of office supplies', '2025-02-12', 1), 
('emily davis', 'it consultation', '2025-02-13', 2), 
('robert wilson', 'vendor partnership discussion', '2025-02-14', 2), 
('sophia martinez', 'internship application', '2025-02-15', 3), 
('james anderson', 'software demo', '2025-02-16', 3), 
('olivia thomas', 'client contract discussion', '2025-02-17', 3), 
('william taylor', 'security inspection', '2025-02-18', 3), 
('ava hernandez', 'health and safety audit', '2025-02-19', 3), 
('benjamin lee', 'employee training session', '2025-02-20', 3), 
('charlotte white', 'corporate meeting', '2025-02-21', 4), 
('daniel harris', 'network maintenance', '2025-02-22', 4), 
('mia clark', 'marketing collaboration', '2025-02-23', 4), 
('ethan lewis', 'equipment repair', '2025-02-24', 5), 
('amelia walker', 'legal compliance meeting', '2025-02-25', 6), 
('alexander young', 'financial audit', '2025-02-26', 6), 
('harper hall', 'technical support visit', '2025-02-27', 8), 
('mason allen', 'annual performance review', '2025-02-28', 7), 
('ella scott', 'press interview', '2025-03-01', 10);

drop table visitor_logs;
select * from visitor_logs;
truncate visitor_logs;
-- -------------------------------------------------------------------------------------------------------------22
create table event_management (
    event_id int primary key auto_increment,
    event_name varchar(100) not null,
    event_date date not null,
    location_id int,
    organizer varchar(100) not null,
    foreign key (location_id) references office_locations(location_id) on delete set null
);

insert into event_management (event_name, event_date, location_id, organizer) 
values 
('annual general meeting', '2025-03-10', 1, 'john doe'), 
('tech innovation conference', '2025-04-15', 2, 'jane smith'), 
('employee training workshop', '2025-05-05', 3, 'michael johnson'), 
('company anniversary celebration', '2025-06-20', 4, 'emily davis'), 
('product launch event', '2025-07-10', 5, 'robert wilson'), 
('cybersecurity awareness seminar', '2025-08-18', 6, 'sophia martinez'), 
('marketing strategy meeting', '2025-09-25', 7, 'james anderson'), 
('corporate social responsibility drive', '2025-10-12', 8, 'olivia thomas'), 
('financial year-end review', '2025-11-05', 9, 'william taylor'), 
('holiday gala dinner', '2025-12-22', 10, 'ava hernandez'), 
('startup networking meetup', '2025-03-28', 11, 'benjamin lee'), 
('diversity and inclusion workshop', '2025-04-07', 12, 'charlotte white'), 
('sales leadership summit', '2025-05-16', 13, 'daniel harris'), 
('ai and data science summit', '2025-06-30', 14, 'mia clark'), 
('annual sports day', '2025-07-25', 15, 'ethan lewis'), 
('cloud computing symposium', '2025-08-14', 16, 'amelia walker'), 
('customer appreciation event', '2025-09-08', 17, 'alexander young'), 
('business growth panel discussion', '2025-10-19', 18, 'harper hall'), 
('remote work best practices webinar', '2025-11-11', 19, 'mason allen'), 
('press conference on new policies', '2025-12-05', 20, 'ella scott');

drop table event_management;
select * from event_management;
truncate event_management;
-- ---------------------------------------------------------------------------------------------------------------23
CREATE TABLE travel_requests (
    request_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT not null,
    destination VARCHAR(100) not null,
    start_date DATE not null,
    end_date DATE not null,
    status ENUM('Pending', 'Approved', 'Rejected') DEFAULT 'Pending',
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id) ON DELETE CASCADE
);

INSERT INTO travel_requests (employee_id, destination, start_date, end_date, status) VALUES
(1, 'New York, USA', '2025-04-10', '2025-04-15', 'Pending'),
(2, 'London, UK', '2025-05-05', '2025-05-12', 'Approved'),
(3, 'Tokyo, Japan', '2025-06-20', '2025-06-28', 'Rejected'),
(4, 'Paris, France', '2025-07-10', '2025-07-18', 'Pending'),
(5, 'Berlin, Germany', '2025-08-15', '2025-08-22', 'Approved'),
(6, 'Sydney, Australia', '2025-09-01', '2025-09-10', 'Pending'),
(7, 'Toronto, Canada', '2025-10-05', '2025-10-12', 'Rejected'),
(8, 'Dubai, UAE', '2025-11-10', '2025-11-20', 'Approved'),
(9, 'Singapore', '2025-12-01', '2025-12-10', 'Pending'),
(10, 'Mumbai, India', '2025-04-05', '2025-04-12', 'Rejected'),
(11, 'Los Angeles, USA', '2025-05-15', '2025-05-22', 'Pending'),
(12, 'Hong Kong, China', '2025-06-25', '2025-07-02', 'Approved'),
(13, 'Bangkok, Thailand', '2025-07-18', '2025-07-25', 'Rejected'),
(14, 'Rome, Italy', '2025-08-30', '2025-09-07', 'Pending'),
(15, 'Cape Town, South Africa', '2025-09-12', '2025-09-20', 'Approved'),
(16, 'Amsterdam, Netherlands', '2025-10-22', '2025-10-29', 'Pending'),
(17, 'Chicago, USA', '2025-11-15', '2025-11-22', 'Rejected'),
(18, 'Seoul, South Korea', '2025-12-10', '2025-12-18', 'Approved'),
(19, 'Istanbul, Turkey', '2026-01-05', '2026-01-12', 'Pending'),
(20, 'Rio de Janeiro, Brazil', '2026-02-20', '2026-02-28', 'Approved');

drop table travel_requests;
select * from travel_requests;
truncate travel_requests;
-- -----------------------------------------------------------------------------------------------------------------24

CREATE TABLE safety_audits (
    audit_id INT PRIMARY KEY AUTO_INCREMENT,
    location_id INT not null,
    audit_date DATE not null,
    compliance_status ENUM('Pass', 'Fail'),
    FOREIGN KEY (location_id) REFERENCES office_locations(location_id) ON DELETE CASCADE
);

insert into safety_audits (location_id, audit_date, compliance_status) 
values 
(1, '2025-02-10', 'pass'), 
(2, '2025-02-12', 'fail'), 
(3, '2025-02-14', 'pass'), 
(4, '2025-02-16', 'pass'), 
(5, '2025-02-18', 'fail'), 
(6, '2025-02-20', 'pass'), 
(7, '2025-02-22', 'pass'), 
(8, '2025-02-24', 'fail'), 
(9, '2025-02-26', 'pass'), 
(10, '2025-02-28', 'pass'), 
(11, '2025-03-02', 'fail'), 
(12, '2025-03-04', 'pass'), 
(13, '2025-03-06', 'pass'), 
(14, '2025-03-08', 'fail'), 
(15, '2025-03-10', 'pass'), 
(16, '2025-03-12', 'pass'),
(17, '2025-03-14', 'fail'), 
(18, '2025-03-16', 'pass'), 
(19, '2025-03-18', 'fail'), 
(20, '2025-03-20', 'pass');

drop table safety_audits;
select * from safety_audits;
truncate safety_audits;
-- ------------------------------------------------------------------------------------------------------------------25
CREATE TABLE marketing_campaigns (
    campaign_id INT PRIMARY KEY AUTO_INCREMENT,
    campaign_name VARCHAR(100) not null,
    start_date DATE not null,
    end_date DATE not null,
    budget DECIMAL(12,2)
);

insert into marketing_campaigns (campaign_name, start_date, end_date, budget) 
values 
('spring sale promotion', '2025-03-01', '2025-03-15', 15000.00), 
('summer product launch', '2025-06-01', '2025-06-30', 50000.00), 
('back to school campaign', '2025-08-01', '2025-08-20', 20000.00), 
('christmas discount event', '2025-12-01', '2025-12-25', 30000.00), 
('black friday flash sale', '2025-11-20', '2025-11-27', 25000.00), 
('new year countdown campaign', '2025-12-28', '2025-12-31', 10000.00), 
('valentine’s day special offers', '2025-02-01', '2025-02-14', 12000.00), 
('spring newsletter campaign', '2025-03-10', '2025-03-25', 8000.00), 
('tech conference sponsorship', '2025-05-15', '2025-05-18', 45000.00), 
('easter weekend deals', '2025-04-01', '2025-04-04', 7000.00), 
('summer travel discounts', '2025-06-15', '2025-07-05', 18000.00), 
('influencer partnership campaign', '2025-07-01', '2025-07-31', 22000.00), 
('holiday season countdown', '2025-11-01', '2025-11-30', 35000.00), 
('rebranding launch campaign', '2025-05-01', '2025-05-31', 60000.00), 
('social media awareness campaign', '2025-04-10', '2025-04-30', 13000.00), 
('product bundle offers', '2025-09-01', '2025-09-15', 17000.00), 
('customer loyalty program', '2025-10-01', '2025-10-31', 25000.00), 
('spring fashion collection', '2025-03-05', '2025-03-20', 12000.00), 
('cyber monday mega sale', '2025-11-29', '2025-11-30', 30000.00), 
('tech gadgets giveaway', '2025-07-10', '2025-07-25', 15000.00);

drop table marketing_campaigns;
select * from marketing_campaigns;
truncate marketing_campaigns;

-- using this set query for foreign key checks constraint disable and enable
set foreign_key_checks = 0;
set foreign_key_checks = 1;

-- using this set query to disable and enable safe update mode
set sql_safe_updates = 0;
set sql_safe_updates = 1;


