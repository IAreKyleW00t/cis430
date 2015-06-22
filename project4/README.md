Project 4
---------
#### Description
  Continuing off Project 3, we will perform more advanced `SELECT` queries using multiple `SELECT` statements.
  
#### Example Query
  ```
  mysql> SELECT e.Fname, e.Lname FROM Company.Department dep JOIN Company.Employee e ON e.Dno = dep.Dnumber JOIN Company.Dependent d ON d.Essn = e.Ssn WHERE dep.Dname = 'Research' AND d.Relationship = 'Spouse' AND (SELECT COUNT(*) FROM Company.Dependent dd WHERE e.Ssn = dd.Essn AND (dd.Relationship = 'Son' OR dd.Relationship = 'Daughter')) = 0;
  +-------+---------+
  | Fname | Lname   |
  +-------+---------+
  | Joyce | English |
  +-------+---------+
  1 row in set (0.00 sec)
  ```
