--- 1. Employees assigned to more than one project
SELECT E.Name AS "Employee Name", COUNT(EP.Project_Num_P) AS "Total Projects"
FROM Employee E
JOIN Employee_Project EP ON E.Num_E = EP.Employee_Num_E
GROUP BY E.Num_E, E.Name
HAVING COUNT(EP.Project_Num_P) > 1;

--- 2. List of projects managed by each department
SELECT D.Label AS "Department Label", D.Manager_Name AS "Manager Name", P.Title AS "Project Title"
FROM Department D
JOIN Project P ON D.Num_S = P.Department_Num_S;

--- 3. Employees working on the "Website Redesign" project
SELECT E.Name AS "Employee Name", EP.Role AS "Project Role"
FROM Employee E
JOIN Employee_Project EP ON E.Num_E = EP.Employee_Num_E
JOIN Project P ON EP.Project_Num_P = P.Num_P
WHERE P.Title = 'Website Redesign';

--- 4. Department with the highest number of employees
SELECT D.Label AS "Department Label", D.Manager_Name AS "Manager Name", COUNT(E.Num_E) AS "Total Employees"
FROM Department D
LEFT JOIN Employee E ON D.Num_S = E.Department_Num_S
GROUP BY D.Num_S
ORDER BY "Total Employees" DESC
LIMIT 1;

--- 5. Employees earning > 60,000
SELECT E.Name AS "Employee Name", E.Position AS "Job Title", D.Label AS "Department Name"
FROM Employee E
JOIN Department D ON E.Department_Num_S = D.Num_S
WHERE E.Salary > 60000;

--- 6. Number of employees assigned to each project
SELECT P.Title AS "Project Title", COUNT(EP.Employee_Num_E) AS "Employee Count"
FROM Project P
LEFT JOIN Employee_Project EP ON P.Num_P = EP.Project_Num_P
GROUP BY P.Num_P, P.Title;

--- 7. Summary of roles across different projects
SELECT E.Name AS "Employee Name", P.Title AS "Project Title", EP.Role AS "Assigned Role"
FROM Employee E
JOIN Employee_Project EP ON E.Num_E = EP.Employee_Num_E
JOIN Project P ON EP.Project_Num_P = P.Num_P;

--- 8. Total salary expenditure for each department
SELECT D.Label AS "Department Label", D.Manager_Name AS "Manager Name", SUM(E.Salary) AS "Total Salary Expenditure"
FROM Department D
LEFT JOIN Employee E ON D.Num_S = E.Department_Num_S
GROUP BY D.Num_S;