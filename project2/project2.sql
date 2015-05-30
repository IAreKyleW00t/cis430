/* ------------------------------------------------ *
 *  Name:           Kyle Colantonio                 *
 *  CSU ID:         2595744                         *
 *  Assignment:     2                               *
 *  Description:    Create PK's and FK's.           *
 *  Date:           6-03-2015                       *
 *                                                  *
 *  Updated:        5-29-2015                       *
 * ------------------------------------------------ */

/* Create a new Table called Works_On within the 
   Company Database. */
CREATE TABLE Company.Works_On (
    Essn INT(9) UNSIGNED NOT NULL,
    Pno INT(7) UNSIGNED NOT NULL,
    Hours DECIMAL(7, 1) UNSIGNED,
    PRIMARY KEY (Essn, Pno)
);

/* Insert all the data into the Employee table
   based on the data provided in the assignment. */
INSERT INTO Company.Employee VALUES ('John', 'B', 'Smith', 123456789, '09-Jan-55', '731 Fondren, Houston, TX', 'M', 30000, 987654321, 5),
									('Franklin', 'T', 'Wong', 333445555, '08-Dec-45', '638 Voss, Houston, TX', 'M', 40000, 888665555, 5),
                                    ('Joyce', 'A', 'English', 453453453, '31-Jul-62', '5631 Rice, Houston, TX', 'F', 25000, 333445555, 5),
                                    ('Ramesh', 'K', 'Narayan', 666884444, '15-Sep-52', '975 Fire Oak, Humble, TX', 'M', 38000, 333445555, 5),
                                    ('James', 'E', 'Borg', 888665555, '10-Nov-27', '450 Stone, Houston, TX', 'M', 55000, NULL, 1),
                                    ('Jennifer', 'S', 'Wallace', 987654321, '20-Jun-31', '291 Berry, Bellaire, TX', 'F', 43000, 888665555, 4),
                                    ('Ahmad', 'V', 'Jabbar', 987987987, '29-Mar-59', '980 Dallas, Houston, TX', 'M', 25000, 987654321, 4),
                                    ('Alicia', 'J', 'Zelaya', 999887777, '19-Jul-58', '3321 Castle, SPring, TX', 'F', 25000, 987654321, 4);

/* Insert all the data into the Department table
   based on the data provided in the assignment. */
INSERT INTO Company.Department VALUES ('Headquarters', 1, 888665555, '19-Jun-71'),
									  ('Administration', 4, 987654321, '01-Jan-85'),
                                      ('Research', 5, 333445555, '22-May-78'),
                                      ('Automation', 7, 123456789, '06-Oct-05');

/* Insert all the data into the Dept_Locations table
   based on the data provided in the assignment. */
INSERT INTO Company.Dept_Locations VALUES (1, 'Houston'),
										  (4, 'Stafford'),
                                          (5, 'Bellaire'),
                                          (5, 'Sugarland'),
                                          (5, 'Houston');

/* Insert all the data into the Dependent table
   based on the data provided in the assignment. */
INSERT INTO Company.Dependent VALUES (123456789, 'Alice', 'F', '31-Dec-78', 'Daughter'),
									 (123456789, 'Elizabeth', 'F', '05-May-57', 'Spouse'),
                                     (123456789, 'Michael', 'M', '01-Jan-78', 'Son'),
                                     (333445555, 'Alice', 'F', '05-Apr-76', 'Daughter'),
                                     (333445555, 'Joy', 'F', '03-May-48', 'Spouse'),
                                     (333445555, 'Theodore', 'M', '25-Oct-73', 'Son'),
                                     (987654321, 'Abner', 'M', '29-Feb-32', 'Spouse');

/* Insert all the data into the Project table
   based on the data provided in the assignment. */
INSERT INTO Company.Project VALUES ('ProductX', 1, 'Bellaire', 5),
								   ('ProductY', 2, 'Sugarland', 5),
                                   ('ProductZ', 3, 'Houston', 5),
                                   ('Computerization', 10, 'Stafford', 4),
                                   ('Reorganization', 20, 'Houston', 1),
                                   ('Newbenefits', 30, 'Stafford', 4);

/* Insert all the data into the Works_On table
   based on the data provided in the assignment. */
INSERT INTO Company.Works_On VALUES (123456789, 1, 32.5),
                                    (123456789, 2, 7.5),
                                    (333445555, 2, 10),
                                    (333445555, 3, 10),
                                    (333445555, 10, 10),
                                    (333445555, 20, 10),
                                    (453453453, 1, 20),
                                    (453453453, 2, 20),
                                    (666884444, 3, 40),
                                    (888665555, 20, NULL),
                                    (987654321, 20, 15),
                                    (987654321, 30, 20),
                                    (987987987, 10, 35),
                                    (987987987, 30, 5),
                                    (999887777, 10, 10),
                                    (999887777, 30, 30);

/* After add all the initial data, alter 
   the tables to include foreign keys. */                                   
ALTER TABLE Company.Employee ADD FOREIGN KEY (Super_ssn) REFERENCES Company.Employee (Ssn);
ALTER TABLE Company.Employee ADD FOREIGN KEY (Dno) REFERENCES Company.Department (Dnumber);
                                 
ALTER TABLE Company.Department ADD FOREIGN KEY (Mgr_ssn) REFERENCES Company.Employee (Ssn);

ALTER TABLE Company.Dependent ADD FOREIGN KEY (Essn) REFERENCES Company.Employee (Ssn);

ALTER TABLE Company.Dept_Locations ADD FOREIGN KEY (Dnumber) REFERENCES Company.Department (Dnumber);

ALTER TABLE Company.Project ADD FOREIGN KEY (Dnum) REFERENCES Company.Department (Dnumber);

ALTER TABLE Company.Works_On ADD FOREIGN KEY (Essn) REFERENCES Company.Employee (Ssn);