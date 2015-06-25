/* ------------------------------------------------ *
 *  Name:           Kyle Colantonio                 *
 *  CSU ID:         2595744                         *
 *  Assignment:     5                               *
 *  Description:    Triggers and Procedures.        *
 *  Date:           6-22-2015                       *
 *                                                  *
 *  Updated:        6-23-2015                       *
 * ------------------------------------------------ */

/* Create the new view with the following information. */
CREATE VIEW VDept_Headcount (Dept_Name, Dept_Number, No_Emp) AS
SELECT d.Dname, d.Dnumber, COUNT(*)
FROM Company.Department d
JOIN Company.Employee e ON e.Dno = d.Dnumber
GROUP BY d.Dnumber;

/* Update our view to include the number of Employees and total Salary */
CREATE OR REPLACE VIEW VDept_Headcount (Dept_Name, Dept_Number, No_Emp, Salary_Budget) AS
SELECT d.Dname, d.Dnumber, COUNT(*), SUM(e.Salary)
FROM Company.Department d
JOIN Company.Employee e ON e.Dno = d.Dnumber
GROUP BY d.Dnumber;

/* Create the Department Audit for keeping track of UPDATES and DELETES. */
CREATE TABLE Company.Audit_Dept_Table (
    date_of_change DATE,
    old_Dname VARCHAR(32),
    new_Dname VARCHAR(32),
    old_Dnumber INT(1) UNSIGNED,
    new_Dnumber INT(1) UNSIGNED,
    old_Mgr_ssn INT(9) UNSIGNED,
    new_Mgr_ssn INT(9) UNSIGNED
);

/* Create our procedure to add data into Audit_Dept_Table. */
CREATE PROCEDURE SP_Audit_Dept(IN old_Dname VARCHAR(32), IN new_Dname VARCHAR(32), IN old_Dnumber INT(1), IN new_Dnumber INT(1), IN old_Mgrssn INT(9), IN new_Mgrssn INT(9))
INSERT INTO Company.Audit_Dept_Table VALUES (CURDATE(), old_Dname, new_Dname, old_Dnumber, new_Dnumber, old_Mgrssn, new_Mgrssn)

/* Create our triggers to call our SP_Audit_Dept procedure. */
DELIMITER //
CREATE TRIGGER EMPDEPTFK_delete
AFTER DELETE ON Company.Department
FOR EACH ROW BEGIN
    UPDATE Company.Employee
    SET Company.Employee.Dno = 1
    WHERE Company.Employee.Dno = OLD.Dnumber;
    CALL SP_Audit_Dept(OLD.Dname, NULL, OLD.Dnumber, NULL, OLD.Mgr_ssn, NULL);
END//

CREATE TRIGGER EMPDEPTFK_update
AFTER UPDATE ON Company.Department
FOR EACH ROW BEGIN
    UPDATE Company.Employee
    SET Company.Employee.Dno = 1
    WHERE Company.Employee.Dno = OLD.Dnumber;
    CALL SP_Audit_Dept(OLD.Dname, NEW.Dname, OLD.Dnumber, NEW.Dnumber, OLD.Mgr_ssn, NEW.Mgr_ssn);
END//
DELIMITER ;

/* Perform some trigger tests. */
UPDATE Company.Department SET Dnumber = 99 WHERE Dnumber = 4;
DELETE Company.Department WHERE Dnumber = 5;