Project 2
---------
#### Description
  Continuing off Project 1, create each tables `PRIMARY KEY`, `FOREIGN KEY`, and add initial data as shown in `Figure 3-6`.
  
#### Example Table
  ```
  mysql> SELECT * FROM Company.Employee;
  +----------+-------+---------+-----------+------------+--------------------------+------+----------+-----------+------+
  | Fname    | Minit | Lname   | Ssn       | Bdate      | Address                  | Sex  | Salary   | Super_ssn | Dno  |
  +----------+-------+---------+-----------+------------+--------------------------+------+----------+-----------+------+
  | John     | B     | Smith   | 123456789 | 0000-00-00 | 731 Fondren, Houston, TX | M    | 30000.00 | 987654321 |    5 |
  | Franklin | T     | Wong    | 333445555 | 0000-00-00 | 638 Voss, Houston, TX    | M    | 40000.00 | 888665555 |    5 |
  | Joyce    | A     | English | 453453453 | 0000-00-00 | 5631 Rice, Houston, TX   | F    | 25000.00 | 333445555 |    5 |
  | Ramesh   | K     | Narayan | 666884444 | 0000-00-00 | 975 Fire Oak, Humble, TX | M    | 38000.00 | 333445555 |    5 |
  | James    | E     | Borg    | 888665555 | 0000-00-00 | 450 Stone, Houston, TX   | M    | 55000.00 |      NULL |    1 |
  | Jennifer | S     | Wallace | 987654321 | 0000-00-00 | 291 Berry, Bellaire, TX  | F    | 43000.00 | 888665555 |    4 |
  | Ahmad    | V     | Jabbar  | 987987987 | 0000-00-00 | 980 Dallas, Houston, TX  | M    | 25000.00 | 987654321 |    4 |
  | Alicia   | J     | Zelaya  | 999887777 | 0000-00-00 | 3321 Castle, SPring, TX  | F    | 25000.00 | 987654321 |    4 |
  +----------+-------+---------+-----------+------------+--------------------------+------+----------+-----------+------+
  8 rows in set (0.00 sec)
  ```
