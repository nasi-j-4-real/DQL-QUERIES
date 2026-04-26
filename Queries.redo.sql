CREATE TABLE Department (
    Num_S INTEGER PRIMARY KEY,
    Label VARCHAR(255) NOT NULL,
    Manager_Name VARCHAR(255)
)
CREATE TABLE Employee (
    Num_E INTEGER PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Position VARCHAR(255),
    Salary DECIMAL(10, 2),
    Department_Num_S INTEGER,
    FOREIGN KEY (Department_Num_S) REFERENCES Department(Num_S)
        ON DELETE SET NULL
        ON UPDATE CASCADE
)
CREATE TABLE Employee_Project (
    Employee_Num_E INTEGER,
    Project_Num_P INTEGER,
    Role VARCHAR(255),
    PRIMARY KEY (Employee_Num_E, Project_Num_P),
    FOREIGN KEY (Employee_Num_E) REFERENCES Employee(Num_E) 
        ON DELETE CASCADE,
    FOREIGN KEY (Project_Num_P) REFERENCES Project(Num_P) 
        ON DELETE CASCADE
)
CREATE TABLE Project (
    Num_P INTEGER PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Start_Date DATE,
    End_Date DATE,
    Department_Num_S INTEGER,
    FOREIGN KEY (Department_Num_S) REFERENCES Department(Num_S)
        ON DELETE CASCADE
        ON UPDATE CASCADE
)