/* ------------------------------------------------ *
 *  Name:           Kyle Colantonio                 *
 *  CSU ID:         2595744                         *
 *  Assignment:     3                               *
 *  Description:    Advanced SELECT Queries.        *
 *  Date:           6-10-2015                       *
 *                                                  *
 *  Updated:        6-08-2015                       *
 * ------------------------------------------------ */
 
/* Insert myself into the database with random data. */
INSERT INTO Company.Employee VALUES ('Kyle', 'A', 'Colantonio', 111111111, '1994-10-25', '3416 Malvern, Brunswick, OH', 'M', 42000, 987654321, 5);
INSERT INTO Company.Dependent VALUES (111111111, 'Eric', 'M', '1996-12-02', 'Brother'), (111111111, 'Robin', 'F', '1964-05-07', 'Mother');
INSERT INTO Company. Works_On VALUES (111111111, 10, 13.5), (111111111, 20, 10.0);

/* Show the data with one SELECT query. */
SELECT *
FROM Company.Employee e
JOIN Company.Dependent d ON d.Essn = e.Ssn
JOIN Company.Works_On w ON w.Essn = e.Ssn
WHERE e.Ssn = 111111111;

/* Display the name and address of all female managers. */
SELECT e.Fname, e.Lname, e.Address
FROM Company.Department m
JOIN Company.Employee e
ON e.Ssn = m.Mgr_ssn
WHERE e.Sex = 'F';

/* Display a list of projects that have an Employee
   with the last name "Smith". */
SELECT p.Pnumber
FROM Company.Employee e
JOIN Company.Department d
ON e.Dno = d.Dnumber
JOIN Company.Project p
ON p.Dnum = e.Dno
WHERE e.Lname = "Smith";

/* Display the name, address, and department for the
   highest ranked employee. */
SELECT e.Fname, e.Lname, e.Address, d.Dname
FROM Company.Employee e
JOIN Company.Department d
ON e.Dno = d.Dnumber
WHERE e.Super_ssn IS NULL;

/* For each department, display a list of all employees
   working in that department with their name and supervisor
   sorted by each department number and name. */
SELECT d.Dnumber, d.Dname, e.Fname, e.Lname, s.Fname, s.Lname
FROM Company.Employee e
JOIN Company.Department d
ON e.Dno = d.Dnumber
LEFT JOIN Company.Employee s
ON e.Super_ssn = s.Ssn
ORDER BY d.Dnumber, d.Dname;

/* List all managers who do not have any dependents. */
SELECT e.*
FROM Company.Employee e
JOIN Company.Department m ON m.Mgr_ssn = e.Ssn
LEFT JOIN Company.Dependent d ON d.Essn = e.Ssn
WHERE d.Essn IS NULL;
