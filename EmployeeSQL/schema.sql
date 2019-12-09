DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp;

CREATE TABLE employees (
    emp_no INT PRIMARY KEY,
    birth_date DATE,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    gender CHAR(1),
    hire_date DATE
);

CREATE TABLE salaries (
    emp_no INT REFERENCES employees (emp_no),
    salary INT,
    from_date DATE,
    to_date DATE
);

CREATE TABLE titles (
    emp_no INT REFERENCES employees (emp_no),
    title VARCHAR(25),
    from_date DATE,
    to_date DATE
);

CREATE TABLE departments (
    dept_no CHAR(4) PRIMARY KEY,
    dept_name VARCHAR(20)
);

CREATE TABLE dept_manager (
	dept_no CHAR(4) REFERENCES departments (dept_no),
    emp_no INT REFERENCES employees (emp_no),
    from_date DATE,
    to_date DATE
);

CREATE TABLE dept_emp (
    emp_no INT REFERENCES employees (emp_no),
    dept_no CHAR(4) REFERENCES departments (dept_no),
    from_date DATE,
    to_date DATE
);
