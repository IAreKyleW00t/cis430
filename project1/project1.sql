/* ------------------------------------------------ *
 *  Name:           Kyle Colantonio                 *
 *  CSU ID:         2595744                         *
 *  Assignment:     1                               *
 *  Description:    Create a Database and Tables.   *
 *  Date:           5-27-2015                       *
 *                                                  *
 *  Updated:        5-26-2015                       *
 * ------------------------------------------------ */

/* Create a new Database called Company. */
CREATE DATABASE Company;

/* Create a new Table called Employee within the 
   Company Database. */
CREATE TABLE Company.Employee (
    Fname VARCHAR(32),
    Minit CHAR(1),
    Lname VARCHAR(32),
    Ssn INT(9) UNSIGNED UNIQUE NOT NULL,
    Bdate DATE,
    Address VARCHAR(128),
    Sex CHAR(1),
    Salary DECIMAL(10,2) UNSIGNED,
    Super_ssn INT(9) UNSIGNED,
    Dno INT(1) UNSIGNED,
    PRIMARY KEY(Ssn)
);

/* Create a new Table called Department within the 
   Company Database. */
CREATE TABLE Company.Department (
    Dname VARCHAR(32),
    Dnumber INT(1) UNSIGNED NOT NULL,
    Mgr_ssn INT(9) UNSIGNED,
    Mgr_start_date DATE,
    PRIMARY KEY(Dnumber)
);

/* Create a new Table called Dept_Locations within the 
   Company Database. */
CREATE TABLE Company.Dept_Locations (
    Dnumber INT(1) UNSIGNED NOT NULL,
    Dlocation VARCHAR(32) NOT NULL,
    PRIMARY KEY(Dnumber, Dlocation)
);

/* Create a new Table called Project within the 
   Company Database. */
CREATE TABLE Company.Project (
    Pname VARCHAR(32),
    Pnumber INT(7) UNSIGNED NOT NULL,
    Plocation VARCHAR(32),
    Dnum INT(1) UNSIGNED,
    PRIMARY KEY(Pnumber)
);

/* Create a new Table called Dependent within the 
   Company Database. */
CREATE TABLE Company.Dependent (
    Essn INT(9) UNSIGNED NOT NULL,
    Dependent_name VARCHAR(32) NOT NULL,
    Sex CHAR(1),
    Bdate DATE,
    Relationship VARCHAR(16),
    PRIMARY KEY(Essn, Dependent_name)
);