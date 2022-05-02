-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE Employees (
    EMP_No INTEGER   NOT NULL,
    EMP_Title_ID VARCHAR   NOT NULL,
    Birth_Date VARCHAR   NOT NULL,
    First_Name VARCHAR   NOT NULL,
    Last_Name VARCHAR   NOT NULL,
    Sex VARCHAR   NOT NULL,
    Hire_Date VARCHAR   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        EMP_No
     )
);

CREATE TABLE Department (
    DEPT_No VARCHAR   NOT NULL,
    DEPT_Name VARCHAR   NOT NULL,
    CONSTRAINT pk_Department PRIMARY KEY (
        DEPT_No
     )
);

CREATE TABLE Salaries (
    EMP_No INTEGER   NOT NULL,
    Salary INTEGER   NOT NULL,
    CONSTRAINT pk_Salaries PRIMARY KEY (
        EMP_No
     )
);

CREATE TABLE Titles (
    Title_ID VARCHAR   NOT NULL,
    Title VARCHAR   NOT NULL,
    CONSTRAINT pk_Titles PRIMARY KEY (
        Title_ID
     )
);

CREATE TABLE Dept_EMP (
    EMP_No INTEGER   NOT NULL,
    DEPT_No VARCHAR   NOT NULL,
    CONSTRAINT pk_Dept_EMP PRIMARY KEY (
        EMP_No,DEPT_No
     )
);

CREATE TABLE Dept_Manager (
    DEPT_No VARCHAR   NOT NULL,
    EMP_No INTEGER   NOT NULL,
    CONSTRAINT pk_Dept_Manager PRIMARY KEY (
        DEPT_No,EMP_No
     )
);

ALTER TABLE Employees ADD CONSTRAINT fk_Employees_EMP_Title_ID FOREIGN KEY(EMP_Title_ID)
REFERENCES Titles (Title_ID);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_EMP_No FOREIGN KEY(EMP_No)
REFERENCES Employees (EMP_No);

ALTER TABLE Dept_EMP ADD CONSTRAINT fk_Dept_EMP_EMP_No FOREIGN KEY(EMP_No)
REFERENCES Employees (EMP_No);

ALTER TABLE Dept_EMP ADD CONSTRAINT fk_Dept_EMP_DEPT_No FOREIGN KEY(DEPT_No)
REFERENCES Department (DEPT_No);

ALTER TABLE Dept_Manager ADD CONSTRAINT fk_Dept_Manager_DEPT_No FOREIGN KEY(DEPT_No)
REFERENCES Department (DEPT_No);

ALTER TABLE Dept_Manager ADD CONSTRAINT fk_Dept_Manager_EMP_No FOREIGN KEY(EMP_No)
REFERENCES Employees (EMP_No);

