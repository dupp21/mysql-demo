use employees;
/*5*/
select
e.emp_no,
e.first_name,
e.last_name,
t.title,
t.from_date,
t.to_date
from
employees e,
titles t
where
e.emp_no = t.emp_no
and to_date > now();

/*6*/
SELECT 
    COUNT(e.emp_no) AS current_active_employee
FROM
    employees e,
    titles t
WHERE
    e.emp_no = t.emp_no AND to_date > NOW();
    
/*7*/
SELECT 
    t.title, COUNT(t.emp_no) AS total
FROM
    employees e
        INNER JOIN
    titles t ON e.emp_no = t.emp_no
WHERE
    t.to_date > NOW()
GROUP BY t.title;

/*8*/
SELECT 
    d.dep_name,
    COUNT(CASE
        WHEN e.gender = 'M' THEN 1
        ELSE NULL
    END) AS male,
    COUNT(CASE
        WHEN e.gender = 'F' THEN 1
        ELSE NULL
    END) AS female
FROM
    employees e
        INNER JOIN
    dept_emp de ON e.emp_no = de.emp_no
        INNER JOIN
    departamens d ON de.dept_no = d.dept_no
WHERE
    de.to_date > NOW()
GROUP BY d.dept_name
ORDER BY d.dept_no ASC;


/*9*/
SELECT 
    d.dept_name,
    COUNT(CASE
        WHEN e.gender = 'M' THEN 1
        ELSE NULL
    END) AS male,
    COUNT(CASE
        WHEN e.gender = 'F' THEN 1
        ELSE NULL
    END) AS female
FROM
    employees e
        INNER JOIN
    dept_emp de ON e.emp_no = de.emp_no
        INNER JOIN
    departments d ON de.dept_no = d.dept_no
WHERE
    de.to_date > NOW()
GROUP BY d.dept_name 
UNION ALL SELECT 
    'total',
    COUNT(CASE
        WHEN e.gender = 'M' THEN 1
        ELSE NULL
    END) AS male,
    COUNT(CASE
        WHEN e.gender = 'F' THEN 1
        ELSE NULL
    END) AS female
FROM
    employees e
        INNER JOIN
    dept_emp de ON e.emp_no = de.emp_no
WHERE
    de.to_date > NOW();

/*10*/
select
sum(case when t.title = "Engineer" then 1 else 0 end) as Engineer,
sum(case when t.title = "Manager" then 1 else 0 end) as Manager,
sum(case when t.title = "Senior Engineer" then 1 else 0 end) as 'Senior Engineer'
from employees e,
titles t
where
e.emp_no = t.emp_no and t.to_date > now()
group by e.gender;

