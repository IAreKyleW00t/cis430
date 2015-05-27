Project 1
---------
#### Description
  Create a new database called `Company` and within it create five tables called `Employee`, `Department`, `Dept_Locations`, `Project`, and `Dependent` using the structure provided in `Figure 3-6`. All tables should be left empty after creation.
  
#### Example Table
  ```
  mysql> describe Company.Employee;
  +-----------+------------------+------+-----+---------+-------+
  | Field     | Type             | Null | Key | Default | Extra |
  +-----------+------------------+------+-----+---------+-------+
  | Fname     | varchar(32)      | YES  |     | NULL    |       |
  | Minit     | char(1)          | YES  |     | NULL    |       |
  | Lname     | varchar(32)      | YES  |     | NULL    |       |
  | Ssn       | int(9) unsigned  | NO   | PRI | NULL    |       |
  | Bdate     | date             | YES  |     | NULL    |       |
  | Address   | varchar(128)     | YES  |     | NULL    |       |
  | Sex       | char(1)          | YES  |     | NULL    |       |
  | Salary    | int(10) unsigned | YES  |     | NULL    |       |
  | Super_ssn | int(9) unsigned  | YES  |     | NULL    |       |
  | Dno       | int(1) unsigned  | YES  |     | NULL    |       |
  +-----------+------------------+------+-----+---------+-------+
  10 rows in set (0.00 sec)
  ```
