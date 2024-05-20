-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT
    E.emp_no,
    E.last_name,
    E.first_name,
    E.sex,
	S.salary
FROM
    employees as E
INNER JOIN salaries as S
    ON E.emp_no = S.emp_no;
	
-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT
	E.first_name,
    E.last_name,
    E.hire_date
FROM
    employees as E
WHERE
	E.hire_date like '%1986';
	
-- List the manager of each department along with their 
-- department number, department name, employee number, last name, and first name.
SELECT
	D.dept_no,
	D.dept_name,
    E.emp_no,
    E.last_name,
    E.first_name
    
FROM
    employees as E
INNER JOIN dept_managers as DM
    ON E.emp_no = DM.emp_no
INNER JOIN departments as D
    ON D.dept_no = DM.dept_no

-- List the department number for each employee along with that employee’s employee number,
-- last name, first name, and department name.
SELECT
	D.dept_no,
    E.emp_no,
    E.last_name,
    E.first_name,
	D.dept_name
    
FROM
    employees as E
INNER JOIN dept_employees as DE
    ON E.emp_no = DE.emp_no
INNER JOIN departments as D
    ON D.dept_no = DE.dept_no
	
-- List the first name, last name, and sex of each employee whose first name is Hercules
-- and whose last name begins with the letter B.
SELECT
	E.first_name,
    E.last_name,
    E.sex
FROM
    employees as E
WHERE
	E.first_name = 'Hercules' and
	E.last_name like 'B%';
	
-- List each employee in the Sales department, including their employee number, 
-- last name, and first name.
SELECT
    E.emp_no,
    E.last_name,
    E.first_name,
	D.dept_name
    
FROM
    employees as E
INNER JOIN dept_employees as DE
    ON E.emp_no = DE.emp_no
INNER JOIN departments as D
    ON D.dept_no = DE.dept_no
WHERE D.dept_name = 'Sales'

-- List each employee in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT
    E.emp_no,
    E.last_name,
    E.first_name,
	D.dept_name
    
FROM
    employees as E
INNER JOIN dept_employees as DE
    ON E.emp_no = DE.emp_no
INNER JOIN departments as D
    ON D.dept_no = DE.dept_no
WHERE D.dept_name in ('Sales', 'Development') 

-- List the frequency counts, in descending order, of all the employee last names 
-- (that is, how many employees share each last name)
SELECT
    E.last_name,
	COUNT(E.last_name) AS frequency
FROM
    employees as E
GROUP BY E.last_name
ORDER BY frequency DESC