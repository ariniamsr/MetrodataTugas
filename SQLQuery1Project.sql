CREATE DATABASE db_hr_Project;

USE db_hr_Project;


CREATE TABLE tbl_region(
	id INT IDENTITY PRIMARY KEY,
	name VARCHAR(25) NOT NULL
 );


 CREATE TABLE tbl_country(
	id VARCHAR(2) PRIMARY KEY,
	name VARCHAR(40) NOT NULL,
	region_id INT,

	FOREIGN KEY (region_id) REFERENCES tbl_region(id)

 );


 CREATE TABLE tbl_location(
	id INT IDENTITY PRIMARY KEY,
	street_address VARCHAR(40) NULL,
	postal_code VARCHAR(12) NULL,
	city VARCHAR(30) NOT NULL,
	state_province VARCHAR(25) NULL,
	country_id VARCHAR(2),

	FOREIGN KEY (country_id) REFERENCES tbl_country(id)

 );

CREATE TABLE tbl_department(
	id INT IDENTITY PRIMARY KEY,
	name VARCHAR(30) NOT NULL,
	location_id INT NOT NULL,

	
);


 CREATE TABLE tbl_job(
	id VARCHAR(10) PRIMARY KEY,
	title VARCHAR(35) NOT NULL,
	min_salary INT  NULL,
	max_salary INT  NULL

 );




CREATE TABLE tbl_employee(
	id INT IDENTITY PRIMARY KEY,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(25) NOT NULL,
	email VARCHAR(25) NOT NULL UNIQUE,
	phone_number VARCHAR(20) NULL,
	hire_date DATE NOT NULL,
	salary INT NULL,
	comission_pct FLOAT NULL,
	manager_id INT NULL,
	job_id VARCHAR(10) NOT NULL,
	department_id INT NOT NULL,


	FOREIGN KEY (manager_id) REFERENCES tbl_employee(id),
	FOREIGN KEY (job_id) REFERENCES tbl_job(id),
	FOREIGN KEY (department_id) REFERENCES tbl_department(id)

);

	

ALTER TABLE tbl_department ADD manager_id INT

	

 CREATE TABLE tbl_history(
	start_date DATE  NOT NULL,
	end_date DATE NOT NULL,
	department_id INT NOT NULL,
	employee_id INT NOT NULL,
	job_id VARCHAR(10),

	Constraint PK_tbl_history PRIMARY KEY (employee_id, start_date),
	FOREIGN KEY (job_id) REFERENCES tbl_job(id),
	FOREIGN KEY (department_id) REFERENCES tbl_department(id),
	FOREIGN KEY (employee_id) REFERENCES tbl_employee(id)

 );



ALTER TABLE tbl_department ADD FOREIGN KEY (location_id) REFERENCES tbl_location(id);


ALTER TABLE tbl_employee ADD FOREIGN KEY (department_id) REFERENCES tbl_department(id);