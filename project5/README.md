Project 5
---------
#### Description
  Starting from the end of Project 2, we will create multiple triggers, views, and stored procedures to keep our database valid as well as perform automated actions. These will replace our old `PRIMARY` and `FOREIGN` keys.
  
#### Example Query
  ```
  mysql> SELECT * FROM Company.Audit_Dept_Table;
  +----------------+----------------+----------------+-------------+-------------+-------------+-------------+
  | date_of_change | old_Dname      | new_Dname      | old_Dnumber | new_Dnumber | old_Mgr_ssn | new_Mgr_ssn |
  +----------------+----------------+----------------+-------------+-------------+-------------+-------------+
  | 2015-06-23     | Administration | Administration |           4 |          99 |   987654321 |   987654321 |
  | 2015-06-23     | Research       | NULL           |           5 |        NULL |   333445555 |        NULL |
  +----------------+----------------+----------------+-------------+-------------+-------------+-------------+
  2 rows in set (0.00 sec)

  mysql> UPDATE Company.Department SET Dnumber = 22 WHERE Department.Dnumber = 4;
  Query OK, 1 row affected (0.01 sec)
  Rows matched: 1  Changed: 1  Warnings: 0

  mysql> SELECT * FROM Company.Audit_Dept_Table;
  +----------------+----------------+----------------+-------------+-------------+-------------+-------------+
  | date_of_change | old_Dname      | new_Dname      | old_Dnumber | new_Dnumber | old_Mgr_ssn | new_Mgr_ssn |
  +----------------+----------------+----------------+-------------+-------------+-------------+-------------+
  | 2015-06-23     | Administration | Administration |           4 |          99 |   987654321 |   987654321 |
  | 2015-06-23     | Research       | NULL           |           5 |        NULL |   333445555 |        NULL |
  | 2015-06-24     | Administration | Administration |           4 |          22 |   987654321 |   987654321 |
  +----------------+----------------+----------------+-------------+-------------+-------------+-------------+
  3 rows in set (0.00 sec)
  ```
