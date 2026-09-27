|ANALYTICAL QUERIES|


-- Q1: Student Name, Job Title, and Application Status
SELECT s.First_Name, s.Last_Name, j.Job_Title, a.Status
FROM Students s JOIN Applications a ON s.Student_ID = a.Student_ID
JOIN Jobs j ON a.Job_ID = j.Job_ID;

-- Q2: Students with GPA higher than overall average
SELECT First_Name, Last_Name, GPA_Percentage
FROM Students
WHERE GPA_Percentage > (SELECT AVG(GPA_Percentage) FROM Students);

-- Q3: List all jobs and candidate applicants (including jobs with 0 applicants)
SELECT j.Job_Title, s.First_Name, s.Last_Name
FROM Jobs j
LEFT JOIN Applications a ON j.Job_ID = a.Job_ID
LEFT JOIN Students s ON a.Student_ID = s.Student_ID;

-- Q4: Highest salary package offered by each company
SELECT Company_ID, MAX(Salary_Package) AS Top_Salary
FROM Jobs
GROUP BY Company_ID;

-- Q5: Students actively pursuing multiple positions (>1 applications)
SELECT Student_ID, COUNT(Application_ID) AS Total_Applications
FROM Applications
GROUP BY Student_ID
HAVING COUNT(Application_ID) > 1;

-- Q6: Highest paying job profile details
SELECT Job_Title, Salary_Package
FROM Jobs
WHERE Salary_Package = (SELECT MAX(Salary_Package) FROM Jobs);

-- Q7: Average salary per industry (only industries averaging > 35,000)
SELECT c.Industry, AVG(j.Salary_Package) AS Avg_Salary
FROM Companies c
JOIN Jobs j ON c.Company_ID = j.Company_ID
GROUP BY c.Industry
HAVING AVG(j.Salary_Package) > 35000;

-- Q8: Enrollment volume distribution sorted by popular Majors
SELECT Major_ID, COUNT(Student_ID) AS Total_Students
FROM Students
GROUP BY Major_ID
ORDER BY COUNT(Student_ID) DESC;


| SECURITY ACCESS-CONTROL VIEWS|

-- Recruiter View masking student contact elements for data protection
CREATE VIEW Applicant_Tracking AS
SELECT j.Job_Title, s.First_Name, s.Last_Name, s.GPA_Percentage, a.Status
FROM Jobs j
JOIN Applications a ON j.Job_ID = a.Job_ID
JOIN Students s ON a.Student_ID = s.Student_ID;
