-- 1. Total Employees
SELECT COUNT(*) AS Total_Employees FROM employee_data;

-- 2. Left Employees
SELECT COUNT(*) AS Left_Employees FROM employee_data WHERE Attrition = 'Yes';

-- 3. Attrition Rate
SELECT ROUND(COUNT(CASE WHEN Attrition='Yes' THEN 1 END)*100.0/COUNT(*),2) AS Attrition_Rate FROM employee_data;

-- 4. Attrition by Department
SELECT Department, COUNT(*) AS Total, SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Left_Emp FROM employee_data GROUP BY Department;

-- 5. Attrition by Job Role
SELECT Job_Role, COUNT(*) AS Total, SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Left_Emp FROM employee_data GROUP BY Job_Role ORDER BY Left_Emp DESC;

-- 6. Attrition by Gender
SELECT Gender, COUNT(*) AS Total, SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Left_Emp FROM employee_data GROUP BY Gender;

-- 7. Attrition by Education
SELECT Education, COUNT(*) AS Total, SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Left_Emp FROM employee_data GROUP BY Education;

-- 8. Attrition by Salary Slab
SELECT CASE WHEN Salary < 40000 THEN 'Low' WHEN Salary BETWEEN 40000 AND 70000 THEN 'Medium' ELSE 'High' END AS Salary_Slab, COUNT(*) AS Total, SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Left_Emp FROM employee_data GROUP BY Salary_Slab;

-- 9. Attrition by Experience
SELECT CASE WHEN Experience_Years = 0 THEN 'Fresher (0 Yr)' WHEN Experience_Years BETWEEN 1 AND 5 THEN '1-5 Yrs' ELSE '5+ Yrs' END AS Exp_Group, COUNT(*) AS Total, SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Left_Emp FROM employee_data GROUP BY Exp_Group;

-- 10. Avg Salary by Department
SELECT Department, ROUND(AVG(Salary),0) AS Avg_Salary FROM employee_data GROUP BY Department;
