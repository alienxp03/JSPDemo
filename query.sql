-- create the table. duh
create table employee3 (
	employee_id number primary key,
	first_name varchar2(20),
	last_name varchar2(20),
	email varchar2(25)
);

-- insert sample data to the table created. where else?
insert into employee3 values (1,'Harry','Potter','potter@hogwarts.wiz');
insert into employee3 values (2,'Albus','Dumbledore','dumbledore@hogwarts.wiz');
insert into employee3 values (3,'Severus','Snape','adlan@hogwarts.wiz');
insert into employee3 values (4,'Dobby','Elf"','dobby@hogwarts.wiz');

-- a function to check whether there is any employee with first name given
-- return 0 if not exist, else return >= 1
create or replace function check_employee3 (p_email in varchar2)
	return number
is
		emp_result number := 0;
begin
		select count(*) into emp_result from employee3 where email = p_email;
		return emp_result;
end;
/

-- create the function to retrieve the data from table employee3
-- return a sys_refcursor. its just a cursor. don't say you've forgotten Bengkel 1
CREATE OR REPLACE PROCEDURE view_employee3(
	   c_dbuser OUT SYS_REFCURSOR)
IS
BEGIN
  OPEN c_dbuser FOR
  SELECT * FROM employee3;
END;
/

-- create the function to retrieve the data from table employee3 specifically by using employee_id
CREATE OR REPLACE PROCEDURE search_employee3(id IN number,
	   c_dbuser OUT SYS_REFCURSOR)
IS
BEGIN
  OPEN c_dbuser FOR
  SELECT * FROM employee3 WHERE employee_id = id;
END;
/


-- a function to update the employee data based on the id given
create or replace procedure update_employee3 (id in number, f_name in varchar2, l_name in varchar2, p_email in varchar2, status out number)
as
begin
		select employee_id into status from employee3 where employee_id = id;
		update employee3 set first_name = f_name, last_name = l_name, email = p_email where employee_id = id;
		
		exception
			when no_data_found then
				status := -1;
end;
/


-- a function to update the employee data based on the id given
create or replace procedure delete_employee3 (id in number, status out number)
as
begin
		select employee_id into status from employee3 where employee_id = id;
		delete from employee3 where employee_id = id;
		
		exception
			when no_data_found then
				status := -1;
end;
/

-- anonymous block, to test stored procedure working or should be edit again and again
set serveroutput on;
declare
	status number := '';
begin
	update_employee3(41,'','','',status);
	dbms_output.put_line('status '||status);
	delete_employee3(41,status);
	dbms_output.put_line('status '||status);
end;
/

commit;