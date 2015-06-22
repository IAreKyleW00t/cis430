Project 3
---------
#### Description
  Continuing off Project 2, we will insert new data (ourselves) into the corresponding tables and perform some advanced `SELECT` queries.
  
#### Example Query
  ```
  mysql> SELECT d.Dnumber, d.Dname, e.Fname, e.Lname, s.Fname, s.Lname FROM Company.Employee e JOIN Company.Department d ON e.Dno = d.Dnumber LEFT JOIN Company.Employee s ON e.Super_ssn = s.Ssn ORDER BY d.Dnumber, d.Dname;
  +---------+----------------+----------+------------+----------+---------+
  | Dnumber | Dname          | Fname    | Lname      | Fname    | Lname   |
  +---------+----------------+----------+------------+----------+---------+
  |       1 | Headquarters   | James    | Borg       | NULL     | NULL    |
  |       4 | Administration | Jennifer | Wallace    | James    | Borg    |
  |       4 | Administration | Ahmad    | Jabbar     | Jennifer | Wallace |
  |       4 | Administration | Alicia   | Zelaya     | Jennifer | Wallace |
  |       5 | Research       | John     | Smith      | Jennifer | Wallace |
  |       5 | Research       | Franklin | Wong       | James    | Borg    |
  |       5 | Research       | Joyce    | English    | Franklin | Wong    |
  |       5 | Research       | Ramesh   | Narayan    | Franklin | Wong    |
  |       7 | Automation     | Kyle     | Colantonio | Jennifer | Wallace |
  +---------+----------------+----------+------------+----------+---------+
  9 rows in set (0.01 sec)
  ```
