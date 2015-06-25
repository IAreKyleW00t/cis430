/* ------------------------------------------------ *
 *  Name:           Kyle Colantonio                 *
 *  CSU ID:         2595744                         *
 *  Assignment:     4                               *
 *  Description:    Advanced SELECT Queries.        *
 *  Date:           6-18-2015                       *
 *                                                  *
 *  Updated:        6-16-2015                       *
 * ------------------------------------------------ */
 
/* Insert new data into database. */
INSERT INTO Company.Dependent VALUES(453453453, 'Joe', 'M', '2015-06-16', 'Spouse');
INSERT INTO Company.Dependent VALUES(987654321, 'Erica', 'F', '2015-06-16', 'Daughter');
INSERT INTO Company.Works_On VALUES(987654321, 10, 0.0);

/* For each department, display a list of all employees
   working in that department with their name and supervisor
   sorted by each department number and name. */
SELECT d.Dnumber, d.Dname, e.Fname, e.Lname, s.Fname, s.Lname
FROM Company.Employee e
JOIN Company.Department d
ON e.Dno = d.Dnumber
LEFT JOIN Company.Employee s
ON e.Super_ssn = s.Ssn
ORDER BY d.Dnumber, e.Fname;

/* For each department, display a list of all employees
   working in that department with their name and list only
   those who do not have a supervisor. */
SELECT d.Dnumber, d.Dname, e.Fname, e.Lname, s.Fname, s.Lname
FROM Company.Employee e
JOIN Company.Department d
ON e.Dno = d.Dnumber
LEFT JOIN Company.Employee s
ON e.Super_ssn = s.Ssn
WHERE e.Super_ssn IS NULL
ORDER BY d.Dnumber, e.Fname;

/* Get the SSN and last name of all married female employees
   who work on 3 or more projects. */
SELECT e.Ssn, e.Lname
FROM Company.Dependent d
JOIN Company.Employee e
ON e.Ssn = d.Essn
WHERE d.Relationship = 'Spouse' AND e.Sex = 'F' AND (
    SELECT COUNT(*)
    FROM Company.Works_On w
    WHERE w.Essn = e.Ssn) >= 3;
    
/* List the names of employees who are working in the "Research"
   department and are married but have no children. */    
SELECT e.Fname, e.Lname
FROM Company.Department dep
JOIN Company.Employee e ON e.Dno = dep.Dnumber
JOIN Company.Dependent d ON d.Essn = e.Ssn
WHERE dep.Dname = 'Research' AND d.Relationship = 'Spouse' AND (
    SELECT COUNT(*)
    FROM Company.Dependent dd
    WHERE e.Ssn = dd.Essn AND (dd.Relationship = 'Son' OR dd.Relationship = 'Daughter')) = 0;

/* List the name of employees who are married and have no children but
   make less than $30,000. */
SELECT e.Fname, e.Lname
FROM Company.Employee e
JOIN Company.Dependent d ON d.Essn = e.Ssn
WHERE e.Salary < 30000 AND d.Relationship = 'Spouse' AND (
    SELECT COUNT(*)
    FROM Company.Dependent dd
    WHERE e.Ssn = dd.Essn AND (dd.Relationship = 'Son' OR dd.Relationship = 'Daughter')) = 0;

/* Get the last name of married employees who only have
   Daughters. */    
SELECT e.Lname
FROM Company.Employee e
JOIN Company.Dependent d ON d.Essn = e.Ssn
WHERE d.Relationship = 'Spouse' AND (
    SELECT COUNT(*)
    FROM Company.Dependent dd
    WHERE e.Ssn = dd.Essn AND (dd.Relationship = 'Son')) = 0;

/* Give the last name and SSN of employees who work in any project(s)
   where there are more female than male employees. */    
SELECT e.Lname, e.Ssn
FROM Company.Employee e
JOIN Company.Works_On w ON w.Essn = e.Ssn
WHERE (
    SELECT COUNT(*)
    FROM Company.Works_On w_m
    JOIN Company.Employee e_m ON e_m.Ssn = w_m.Essn
    WHERE e_m.Sex = 'M' AND w_m.Pno = w.Pno) < (
        SELECT COUNT(*)
        FROM Company.Works_On w_f
        JOIN Company.Employee e_f ON e_f.Ssn = w_f.Essn
        WHERE e_f.Sex = 'F' AND w_f.Pno = w.Pno);