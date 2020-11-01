drop table is exists dept_emp, salaries, employees, titles, dept_manager, departments;

create table employees (
	emp_no INT NOT Null,
	emp_title_id varchar, 
	birth_date varchar,
	first_name varchar,
	last_name varchar,
	sex varchar,
	hire_date varchar
);

create table dept_emp (
	emp_no INT NOT Null,
	dept_no varchar
);

create table titles (
	titles varchar,
	title varchar
);

create table salaries (
	emp_no INT NOT Null,
	salary INT
);

create table departments (
	dept_no varchar,
	dept_name varchar
);

create table dept_manager (
	dept_no varchar,
	emp_no INT NOT Null
);

select * from dept_manager;

-- List the following details of each employee: employee number, last name, first name, sex, and salary.

select e.emp_no, e.last_name, e.first_name, e.sex, s.salary from employees as e
join salaries as s
on e.emp_no = s.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986. 
select first_name, last_name, hire_date from employees 
where hire_date like '%1986';

-- List the manager of each department with the following information: department number, 
-- department name, the manager's employee number, last name, first name.

select d.dept_no, dp.dept_name, e.emp_no, e.last_name, e.first_name  from employees as e
join dept_manager as d
on e.emp_no = d.emp_no
join departments as dp
on d.dept_no = dp.dept_no;

-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

select   e.emp_no, e.last_name, e.first_name, dp.dept_name  from employees as e
join dept_manager as d
on e.emp_no = d.emp_no
join departments as dp
on d.dept_no = dp.dept_no;

-- List first name, last name, and sex for employees 
-- whose first name is "Hercules" and last names begin with "B."

select first_name, last_name, sex from employees 
where first_name like 'Hercules' 
AND last_name like 'B%';

-- List all employees in the Sales department, including their 
-- employee number, last name, first name, and department name.

select   e.emp_no, e.last_name, e.first_name, dp.dept_name  from employees as e
join dept_emp as d
on e.emp_no = d.emp_no
join departments as dp
on d.dept_no = dp.dept_no
where dp.dept_no = 'd007';

-- List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.

select   e.emp_no, e.last_name, e.first_name, dp.dept_name  from employees as e
join dept_emp as d
on e.emp_no = d.emp_no
join departments as dp
on d.dept_no = dp.dept_no
where dp.dept_no = 'd007'
OR dp.dept_no = 'd005';

-- In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.

select last_name, count(last_name) as "# of people" 
from employees
group by last_name
order by "# of people" DESC;
