--CREATE retirement_titles tables
SELECT E.emp_no, E.first_name, E.last_name, T.title, T.from_date, T.to_date
INTO retirement_titles
FROM public.employees AS E
INNER JOIN public.titles AS T
ON E.emp_no = T.emp_no
WHERE E.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no;
--133776

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO retirement_titles_distinct
FROM retirement_titles
ORDER BY emp_no, to_date DESC;
--90398

--CREATE retiring_titles tables 
SELECT COUNT(*) AS count, title
INTO retiring_titles
FROM retirement_titles_distinct
GROUP BY title
ORDER BY COUNT(*) DESC; 
--7

--CREATE mentorship_eligibilty table 
SELECT DISTINCT ON (E.emp_no) E.emp_no, E.first_name, E.last_name, E.birth_date, D.from_date, D.to_date, T.title
INTO mentorship_eligibilty
FROM public.employees AS E
INNER JOIN public.dept_employee AS D
ON E.emp_no = D.emp_no 
INNER JOIN public.titles AS T
ON E.emp_no = T.emp_no
WHERE E.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
AND (D.to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC; 
--1549

--mentorship_eligibilty by title
SELECT COUNT(*) AS count, title
FROM mentorship_eligibilty
GROUP BY title
ORDER BY COUNT(*) DESC; 
--6



