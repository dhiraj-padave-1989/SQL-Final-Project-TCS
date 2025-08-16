-- project phase 2 tata consultancy services
-- ---------------------------------------Phase 2(10Qr/T)(DDL<ML<QL<C&C<Op)----------------------------------------------------------------------------------

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

-- Table 1-----------------------------------------------------------------------------------------------------------------------------
drop table employees;
truncate employees;
show columns from employees;

-- select query--------------------
select * from employees;
select employee_id, status from employees;
select employee_id,first_name from employees where department="it";
select first_name,last_name from employees where employee_id>5;
select employee_id,designation from employees where not employee_id <>6;
select distinct department from employees;
select * from employees order by first_name desc;
select * from employees order by email limit 3;
select * from employees where employee_id between 3 and 5;
select * from employees where employee_id = 3 or employee_id = 5;
select * from employees where employee_id = 2 or employee_id =5;
select * from employees where employee_id in (2,4,5);
select * from employees order by last_name desc limit 3 offset 1;
select * from employees where designation like 's%';
select * from employees where first_name is null;
select max(employee_id) from employees;
select min(employee_id) from employees;
select department,count(*) from employees group by department;
select department,count(*) from employees group by department having count(*) >= 3;

-- update query--------------------
update employees set date_of_joining = '1989-11-01' where employee_id = 1;
update employees set department = 'hr' where employee_id in (7,18);
update employees set status = 'resigned' where employee_id > 18;

-- alter query----------------------
alter table employees add column salary int;
alter table employees modify phone_number varchar(20); 
alter table employees drop column salary;
alter table employees change first_name firstname VARCHAR(20);
alter table employees change firstname first_name VARCHAR(40);

-- delete query---------------------
delete from employees where employee_id > 20;
delete from employees where first_name = 'rajdeep';
delete from employees;

-- rename query---------------------
rename table employees to employeestcs;
rename table employeestcs to employees;


-- Table 2-----------------------------------------------------------------------------------------------------------------------------

drop table employee_salary;
truncate employee_salary;
show columns from employee_salary;

-- select query--------------------
select * from employee_salary;
select employee_id, hra from employee_salary;
select employee_id,basic_salary from employee_salary where net_salary=63000.00;
select salary_id,employee_id from employee_salary where hra>10000.00;
select employee_id,allowances from employee_salary where salary_id <>6;
select * from employee_salary order by net_salary desc;
select * from employee_salary order by basic_salary limit 3;
select * from employee_salary where salary_id between 3 and 5;
select * from employee_salary where salary_id = 3 or employee_id = 5;
select * from employee_salary where salary_id in (4,9,15);
select * from employee_salary order by hra desc limit 3 offset 1;
select max(net_salary) from employee_salary;
select min(net_salary) from employee_salary;

-- update query--------------------
update employee_salary set basic_salary = 51000.00 where employee_id = 1;
update employee_salary set allowances = 5000.00 where salary_id in (4,6,7);
update employee_salary set deductions = 2000.00 where employee_id > 18;

-- alter query----------------------
alter table employee_salary add column bonus int;
alter table employee_salary modify bonus varchar(20); 
alter table employee_salary drop column bonus;

-- delete query---------------------
delete from employee_salary where salary_id > 20;
delete from employee_salary where net_salary = 95000.00;
delete from employee_salary;

-- rename query---------------------
rename table employee_salary to employees_tcs;
rename table employees_tcs to employee_salary;


-- Table 3-----------------------------------------------------------------------------------------------------------------------------

drop table employee_contacts;
truncate employee_contacts;
show columns from employee_contacts;

-- select query--------------------
select * from employee_contacts;
select * from employee_contacts order by contact_id desc limit 3 offset 1;
select * from employee_contacts where address like '_2%';

-- update query--------------------
update employee_contacts set phone_number = '9876543200' where employee_id = 1;
update employee_contacts set emergency_contact = 'nathan carter - 9876543239' where contact_id in (2,7,18);

-- alter query----------------------
alter table employee_contacts add column pincode int;
alter table employee_contacts modify phone_number varchar(20); 
alter table employee_contacts drop column pincode;
alter table employee_contacts change phone_number phonenumber VARCHAR(20);
alter table employee_contacts change phonenumber phone_number VARCHAR(40);

-- delete query---------------------
delete from employee_contacts where contact_id = 25;
delete from employee_contacts;

-- rename query---------------------
rename table employee_contacts to employeestcs;
rename table employeestcs to employee_contacts;


-- Table 4-----------------------------------------------------------------------------------------------------------------------------

show columns from employee_attendance;
drop table employee_attendance;
truncate employee_attendance;

-- select query--------------------
select * from employee_attendance;
select * from employee_attendance where status = "absent";
select distinct status from employee_attendance;
select max(attendance_date) from employee_attendance;
select min(attendance_date) from employee_attendance;
select status,count(*) from employee_attendance group by status;
select status,count(*) from employee_attendance group by status having count(*) > 3;

-- update query--------------------
update employee_attendance set attendance_date = '2025-02-02' where employee_id = 1;
update employee_attendance set status = 'absent' where employee_id > 18;

-- alter query----------------------
alter table employee_attendance add column reason_for_absent varchar(100);
alter table employee_attendance modify status varchar(50); 
alter table employee_attendance drop column reason_for_absent;

-- delete query---------------------
delete from employee_attendance where employee_id > 20;
delete from employee_attendance;

-- rename query---------------------
rename table employee_attendance to employees_tcs;
rename table employees_tcs to employee_attendance;

-- Table 5-----------------------------------------------------------------------------------------------------------------------------
drop table clients;
truncate clients;
show columns from clients;

-- select query--------------------
select * from clients;
select distinct status from clients;
select * from clients where address like '%__s_%';
select status,count(*) from clients group by status having count(*) = 5;

-- update query--------------------
update clients set status='inactive' where client_id = 20;

-- alter query----------------------
alter table clients add column project varchar(50);
alter table clients modify phone_number varchar(20); 
alter table clients drop column project;


-- delete query---------------------
delete from clients where client_id > 20;
delete from clients;

-- rename query---------------------
rename table clients to clientsstcs;
rename table clientstcs to clients;



-- Table 6-----------------------------------------------------------------------------------------------------------------------------

drop table projects;
truncate projects;
show columns from projects;

-- select query--------------------
select * from projects;
select * from projects order by status desc;
select max(budget) from projects;
select min(budget) from projects;
select status, sum(budget) as total_budget,avg(budget) as Average_budget from projects group by status;

-- update query--------------------
update projects set end_date = '2025-08-05' where employee_id = 1;
update projects set status = 'on hold' where employee_id > 18;

-- alter query----------------------
alter table projects modify status varchar(30); 

-- delete query---------------------
delete from projects where budget = 2500.00;
delete from projects;

-- rename query---------------------
rename table projects to projectstcs;
rename table projectstcs to projects;


-- Table 7-----------------------------------------------------------------------------------------------------------------------------

drop table project_assignments;
truncate project_assignments;
show columns from project_assignments;

-- select query--------------------
select * from project_assignments;
select assignment_id,project_id,employee_id from project_assignments;
select * from project_assignments order by role limit 3 offset 3;
select max(employee_id) from project_assignments;
select min(employee_id) from project_assignments;

-- update query--------------------
update project_assignments set end_date = '2025-09-05' where employee_id >= 19;

-- alter query----------------------
alter table project_assignments add column bonus int;
alter table project_assignments modify start_date datetime, modify end_date datetime; 
alter table project_assignments drop column bonus;

-- delete query---------------------
delete from project_assignments where project_id > 20;
delete from project_assignments where role = 'ceo';
delete from project_assignments;

-- rename query---------------------
rename table project_assignments to project_assignments_tcs;
rename table project_assignments_tcs to project_assignments;



-- Table 8-----------------------------------------------------------------------------------------------------------------------------

show columns from invoices;
drop table invoices;
truncate invoices;

-- select query--------------------
select * from invoices;
select distinct status from invoices;
select * from invoices order by amount desc;
select max(amount) from invoices;
select min(amount) from invoices;
select status,count(*) from invoices group by status;

-- update query--------------------
update invoices set invoice_date = '2025-05-14' where invoice_id = 1;
update invoices set status = 'paid' where employee_id = 1;

-- alter query----------------------
alter table invoices add column penalty int;
alter table invoices drop column penalty;

-- delete query---------------------
delete from invoices where amount < 4500.00;
delete from invoices;

-- rename query---------------------
rename table invoices to invoicestcs;
rename table invoicestcs to invoices;



-- Table 9-----------------------------------------------------------------------------------------------------------------------------
show columns from payments_received;
drop table payments_received;
truncate payments_received;


-- select query--------------------
select * from payments_received;
select distinct payment_method from payments_received;
select * from payments_received order by payment_method desc;
select * from payments_received where payment_method like 'b%';

-- update query--------------------
update payments_received set payment_method = 'cheque' where payment_id = 1;

-- alter query----------------------
alter table payments_received add column Remarks varchar(50);
alter table payments_received drop column Remarks;

-- delete query---------------------
delete from payments_received where payment_id > 20;
delete from payments_received;

-- rename query---------------------
rename table payments_received to payments_receivedtcs;
rename table payments_receivedtcs to payments_received;


-- Table 10-----------------------------------------------------------------------------------------------------------------------------

show columns from recruitment;
drop table recruitment;
truncate recruitment;

-- select query--------------------
select * from recruitment;
select first_name,last_name from recruitment where status='applied';

-- update query--------------------
update recruitment set status = 'selected' where applicant_id = 20;

-- alter query----------------------
alter table recruitment add column salary int;
alter table recruitment modify status varchar(50); 
alter table recruitment drop column salary;

-- delete query---------------------
delete from recruitment where first_name = 'rajdeep';
delete from recruitment;

-- rename query---------------------
rename table recruitment to recruitmenttcs;
rename table recruitmenttcs to recruitment;



-- Table 11-----------------------------------------------------------------------------------------------------------------------------

show columns from training_sessions;
drop table training_sessions;
truncate training_sessions;

-- select query--------------------
select * from training_sessions;
select distinct status from training_sessions;
select * from training_sessions where status like 'p%';

-- update query--------------------
update training_sessions set end_date = '2025-01-01' where training_id in (21,25,29);

-- alter query----------------------
alter table training_sessions add column Grade varchar(15);
alter table training_sessions drop column Grade;

-- delete query---------------------
delete from training_sessions where training_id > 20;
delete from training_sessions;

-- rename query---------------------
rename table training_sessions to training_sessions_tcs;
rename table training_sessions_tcs to training_sessions;



-- Table 12-----------------------------------------------------------------------------------------------------------------------------

show columns from employee_certifications;
drop table employee_certifications;
truncate employee_certifications;

-- select query--------------------
select * from employee_certifications;
select employee_id, certification_name from employee_certifications;
select * from employee_certifications where employee_id is null;

-- update query--------------------
update employee_certifications set issued_date = '2024-11-01' where employee_id = 20;

-- alter query----------------------
alter table employee_certifications add column Percentage int;
alter table employee_certifications drop column Percentage;

-- delete query---------------------
delete from employee_certifications where employee_id > 20;
delete from employee_certifications;

-- rename query---------------------
rename table employee_certifications to employee_certificationstcs;
rename table employee_certificationstcs to employee_certifications;



-- Table 13-----------------------------------------------------------------------------------------------------------------------------

show columns from user_accounts;
drop table user_accounts;
truncate user_accounts;

-- select query--------------------
select * from user_accounts;
select employee_id, username from user_accounts;


-- update query--------------------
update user_accounts set role = 'admin' where employee_id = 18;
update user_accounts set status = 'disabled' where employee_id > 19;

-- alter query----------------------
alter table user_accounts add column salary int; 
alter table user_accounts drop column salary;

-- delete query---------------------
delete from user_accounts where user_id > 20;
delete from user_accounts;

-- rename query---------------------
rename table user_accounts to user_accountstcs;
rename table user_accountstcs to user_accounts;



-- Table 14-----------------------------------------------------------------------------------------------------------------------------

show columns from system_logs;
drop table system_logs;
truncate system_logs;

-- select query--------------------
select * from system_logs;
select * from system_logs order by action desc;
select * from system_logs where action is null;

-- update query--------------------
update system_logs set log_id = 21 where user_id in (27,28);

-- alter query----------------------
alter table system_logs modify action varchar(50); 

-- delete query---------------------
delete from system_logs where user_id > 20;
delete from system_logs;

-- rename query---------------------
rename table system_logs to system_logstcs;
rename table system_logstcs to system_logs;



-- Table 15-----------------------------------------------------------------------------------------------------------------------------
drop table asset_management;
truncate asset_management;
show columns from asset_management;

-- select query--------------------
select * from asset_management;
select asset_id,warranty_expiry from asset_management where not assigned_to <>6;
select * from asset_management order by asset_name desc limit 3 offset 1;

-- update query--------------------
update asset_management set warranty_expiry = '2027-11-01' where asset_id = 20;
update asset_management set purchase_date = '2022-09-30' where assigned_to > 18;

-- alter query----------------------
alter table asset_management add column Price int;
alter table asset_management drop column Price;


-- delete query---------------------
delete from asset_management where employee_id > 20;
delete from asset_management where asset_name = 'acer laptop';
delete from asset_management;

-- rename query---------------------
rename table asset_management to asset_management_tcs;
rename table asset_management_tcs to asset_management;




-- Table 16-----------------------------------------------------------------------------------------------------------------------------
drop table support_tickets;
truncate support_tickets;
show columns from support_tickets;

-- select query--------------------
select * from support_tickets;
select distinct status from support_tickets;
select * from support_tickets order by issue_description desc;
select * from support_tickets where issue_description like 's%';
select status,count(*) from support_tickets group by status;
select status,count(*) from support_tickets group by status having count(*) >= 5;

-- update query--------------------
update support_tickets set date_of_joining = '1989-11-01' where employee_id = 1;
update support_tickets set department = 'hr' where employee_id in (7,18);
update support_tickets set status = 'resigned' where employee_id > 18;

-- alter query----------------------
alter table employees add column salary int;
alter table employees modify phone_number varchar(20); 
alter table employees drop column salary;
alter table employees change first_name firstname VARCHAR(20);
alter table employees change firstname first_name VARCHAR(40);

-- delete query---------------------
delete from support_tickets where ticket_id > 40;
delete from support_tickets where status = 'open' and client_id > 20;
delete from support_tickets;

-- rename query---------------------
rename table support_tickets to support_tickets_tcs;
rename table support_tickets_tcs to support_tickets;



-- Table 17-----------------------------------------------------------------------------------------------------------------------------
drop table service_requests;
truncate service_requests;
show columns from service_requests;

-- select query--------------------
select * from service_requests;
select request_id,client_id from service_requests where assigned_to > 5 or status = 'new';
select distinct status from service_requests;
select * from service_requests where request_details like '%s.';
select status,count(*) from service_requests group by status having count(*) >= 7;

-- update query--------------------
update service_requests set status = 'completed' where client_id = 1;

-- alter query----------------------
alter table service_requests add column note varchar(40);
alter table service_requests modify status varchar(50); 
alter table service_requests drop column note;

-- delete query---------------------
delete from service_requests where client_id > 20;
delete from service_requests where status = 'incomplete';
delete from service_requests;

-- rename query---------------------
rename table service_requests to service_requests_tcs;
rename table service_requests_tcs to service_requests;


-- Table 18-----------------------------------------------------------------------------------------------------------------------------
drop table network_devices;
truncate network_devices;
show columns from network_devices;

-- select query--------------------
select * from network_devices;
select device_name,mac_address from network_devices where not device_id <>25;
select * from network_devices where device_id in (21,24,35);
select max(device_id) from network_devices;
select min(assigned_to) from network_devices;

-- update query--------------------
update network_devices set ip_address = '192.168.1.31' where device_id = 31;

-- alter query----------------------
alter table network_devices add column device varchar(40);
alter table network_devices drop column device;

-- delete query---------------------
delete from network_devices where device_id < 20;
delete from network_devices where device_name = 'cisco';
delete from network_devices;

-- rename query---------------------
rename table network_devices to network_devices_tcs;
rename table network_devices_tcs to network_devices;


-- Table 19-----------------------------------------------------------------------------------------------------------------------------
drop table system_access_logs;
truncate system_access_logs;
show columns from system_access_logs;

-- select query--------------------
select * from system_access_logs;
select * from system_access_logs where logout_time is null;

-- update query--------------------
update system_access_logs set login_time = '2025-02-17 10:35:30' where access_id = 19;

-- alter query----------------------
alter table system_access_logs add column note varchar(20);
alter table system_access_logs drop column note;


-- delete query---------------------
delete from system_access_logs where user_id > 20;
delete from system_access_logs;

-- rename query---------------------
rename table system_access_logs to system_access_logs_tcs;
rename table system_access_logs_tcs to system_access_logs;


-- Table 20-----------------------------------------------------------------------------------------------------------------------------
drop table office_locations;
truncate office_locations;
show columns from office_locations;

-- select query--------------------
select * from office_locations;
select distinct country from office_locations;
select max(location_id) from office_locations;
select min(location_id) from office_locations;

-- update query--------------------
update office_locations set country = 'usa' where location_id = 14;

-- alter query----------------------
alter table office_locations add column pincode int;
alter table office_locations drop column pincode;

-- delete query---------------------
delete from office_locations where employee_id > 20;
delete from office_locations;

-- rename query---------------------
rename table office_locations to office_locations_tcs;
rename table office_locations_tcs to office_locations;



-- Table 21-----------------------------------------------------------------------------------------------------------------------------
drop table visitor_logs;
truncate visitor_logs;
show columns from visitor_logs;

-- select query--------------------
select * from visitor_logs;
select distinct employee_visited from visitor_logs;
select max(visit_date) from visitor_logs;
select min(visit_date) from visitor_logs;

-- update query--------------------
update visitor_logs set visit_date = '2025-02-02' where visitor_id = 1;

-- alter query----------------------
alter table visitor_logs add column note varchar(50);
alter table visitor_logs modify purpose varchar(200); 

-- delete query---------------------
delete from visitor_logs where employee_visited > 10;
delete from visitor_logs;

-- rename query---------------------
rename table visitor_logs to visitor_logs_tcs;
rename table visitor_logs_tcs to visitor_logs;


-- Table 22-----------------------------------------------------------------------------------------------------------------------------
drop table event_management;
truncate event_management;
show columns from event_management;

-- select query--------------------
select * from event_management;
select * from event_management where organizer is null;
select max(event_name) from event_management;
select min(event_name) from event_management;

-- update query--------------------
update event_management set event_date = '2025-02-01' where event_id = 1;

-- alter query----------------------
alter table event_management add column location_number int;
alter table event_management modify event_name varchar(100); 
alter table event_management drop column location_number;

-- delete query---------------------
delete from event_management where event_id > 20;
delete from event_management;

-- rename query---------------------
rename table event_management to event_management_tcs;
rename table event_management_tcs to event_management;


-- Table 23-----------------------------------------------------------------------------------------------------------------------------
drop table travel_requests;
truncate travel_requests;
show columns from travel_requests;

-- select query--------------------
select * from travel_requests;
select distinct status from travel_requests;
select * from travel_requests where destination like 'S%';
select max(employee_id) from travel_requests;
select min(employee_id) from travel_requests;

-- update query--------------------
update travel_requests set end_date = '2025-05-23' where employee_id = 11;

-- alter query----------------------
alter table travel_requests modify destination varchar(40); 

-- delete query---------------------
delete from travel_requests where employee_id > 20;
delete from travel_requests;

-- rename query---------------------
rename table travel_requests to travel_requests_tcs;
rename table travel_requests_tcs to travel_requests;


-- Table 24-----------------------------------------------------------------------------------------------------------------------------
drop table safety_audits;
truncate safety_audits;
show columns from safety_audits;

-- select query--------------------
select * from safety_audits;
select * from safety_audits where location_id>5;
select distinct compliance_status from safety_audits;
select * from safety_audits order by audit_date desc;
select max(audit_date) from safety_audits;
select min(audit_date) from safety_audits;

-- update query--------------------
update safety_audits set audit_date = '2025-02-01' where audit_id = 1;
update safety_audits set compliance_status = 'Pass' where location_id in (2,5);

-- alter query----------------------
alter table safety_audits add column Remark varchar(100);
alter table safety_audits change Remark Remarks VARCHAR(20);
alter table safety_audits drop column Remarks;

-- delete query---------------------
delete from safety_audits where audit_date = '2025-07-01';
delete from safety_audits;

-- rename query---------------------
rename table safety_audits to safety_audits_tcs;
rename table safety_audits_tcs to safety_audits;



-- Table 25-----------------------------------------------------------------------------------------------------------------------------
drop table marketing_campaigns;
truncate marketing_campaigns;
show columns from marketing_campaigns;

-- select query--------------------
select * from marketing_campaigns;
select * from marketing_campaigns where budget>25000;
select * from marketing_campaigns order by budget limit 5;
select * from marketing_campaigns where campaign_name like 's%';
select max(budget) from marketing_campaigns;
select min(budget) from marketing_campaigns;

-- update query--------------------
update marketing_campaigns set budget = 16000 where campaign_id = 1;
update marketing_campaigns set budget = 35000 where campaign_id > 18;

-- alter query----------------------
alter table marketing_campaigns add column extra int;
alter table marketing_campaigns drop column extra;

-- delete query---------------------
delete from marketing_campaigns where employee_id > 20;
delete from marketing_campaigns;

-- rename query---------------------
rename table marketing_campaigns to marketing_campaigns_tcs;
rename table marketing_campaigns_tcs to marketing_campaigns;


