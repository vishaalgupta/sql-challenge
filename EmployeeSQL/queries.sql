--List the following details of each employee: employee number, last name, first name, sex, and salary.
select e.EMP_No, e.Last_Name, e.First_Name, e.Sex, s.Salary
from Employees as e
Join Salaries as s on e.EMP_No = s.EMP_No

--List first name, last name, and hire date for employees who were hired in 1986.
select first_name, last_name, hire_date
from Employees
where right(hire_date, 4) = '1986'

--List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name.
select de.dept_no, d.dept_name, de.emp_no, e.last_name, e.first_name
from dept_manager de
join department d on de.dept_no = d.dept_no
join employees e on de.emp_no = e.emp_no

--List the department of each employee with the following information: employee number, last name, first name, 
--and department name.
select de.emp_no, e.last_name, e.first_name, d.dept_name
from dept_emp de
join department d on de.dept_no = d.dept_no
join employees e on de.emp_no = e.emp_no

--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name, last_name, sex
from Employees
where first_name = 'Hercules'
and last_name like 'B%'

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
join dept_emp de on e.emp_no = de.emp_no
join department d on de.dept_no = d.dept_no
where d.dept_name = 'Sales'

--List all employees in the Sales and Development departments, including their employee number, last name, first name, 
--and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e
join dept_emp de on e.emp_no = de.emp_no
join department d on de.dept_no = d.dept_no
where d.dept_name = 'Sales'
or d.dept_name = 'Development'

--List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.
select last_name, count(last_name)
from employees
group by last_name
order by count(last_name) desc