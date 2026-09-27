|SQL TABLE CREATION SCRIPTS|
  
1.CREATE TABLE Majors (
Major_ID NUMBER CONSTRAINT pk_majors_id PRIMARY KEY, Major_Name VARCHAR2(100) NOT NULL
);
2.CREATE TABLE Companies (
Company_ID NUMBER CONSTRAINT pk_companies_id PRIMARY KEY, Company_Name VARCHAR2(100) NOT NULL, Industry VARCHAR2(50)
);
3.CREATE TABLE Students (
Student_ID NUMBER CONSTRAINT pk_students_id PRIMARY KEY, First_Name VARCHAR2(50) NOT NULL, Last_Name VARCHAR2(50) NOT NULL, Email VARCHAR2(100) CONSTRAINT unq_student_email UNIQUE, Major_ID NUMBER NOT NULL, GPA_Percentage NUMBER(5,2), Resume_Summary VARCHAR2(500), CONSTRAINT fk_student_major FOREIGN KEY (Major_ID) REFERENCES Majors(Major_ID)
);
4.CREATE TABLE Placement_Officers (
Officer_ID NUMBER CONSTRAINT pk_officers_id PRIMARY KEY, Officer_Name VARCHAR2(100) NOT NULL, Contact_Email VARCHAR2(100), Major_ID NUMBER NOT NULL, CONSTRAINT fk_officer_major FOREIGN KEY (Major_ID) REFERENCES Majors(Major_ID)
);
5.CREATE TABLE Jobs (
Job_ID NUMBER CONSTRAINT pk_jobs_id PRIMARY KEY, Company_ID NUMBER NOT NULL, Job_Title VARCHAR2(100) NOT NULL, Salary_Package NUMBER(10,2), Min_GPA_Required NUMBER(5,2), CONSTRAINT fk_job_company FOREIGN KEY (Company_ID) REFERENCES Companies(Company_ID)
);
6.CREATE TABLE Applications (
Application_ID NUMBER CONSTRAINT pk_applications_id PRIMARY KEY, Student_ID NUMBER NOT NULL, Job_ID NUMBER NOT NULL, Officer_ID NUMBER NOT NULL, Application_Date DATE DEFAULT SYSDATE, Status VARCHAR2(20), Interview_Feedback VARCHAR2(400), Offer_Details VARCHAR2(200), CONSTRAINT fk_app_job FOREIGN KEY (Job_ID) REFERENCES Jobs(Job_ID), CONSTRAINT fk_app_officer FOREIGN KEY (Officer_ID) REFERENCES Placement_Officers(Officer_ID), CONSTRAINT fk_app_student FOREIGN KEY (Student_ID) REFERENCES Students(Student_ID)
);

|SAMPLE DATA|

i.
INSERT INTO Majors (Major_ID, Major_Name) VALUES (1, 'Computer Science');
INSERT INTO Majors (Major_ID, Major_Name) VALUES (2, 'Cyber Security');
INSERT INTO Majors (Major_ID, Major_Name) VALUES (3, 'Business Studies');
INSERT INTO Majors (Major_ID, Major_Name) VALUES (4, 'Accounting');
ii.
INSERT INTO Companies (Company_ID, Company_Name, Industry) VALUES (105, 'Dubai Duty Free', 'Retail');
INSERT INTO Companies (Company_ID, Company_Name, Industry) VALUES (106, 'Tally Solutions', 'Software');
INSERT INTO Companies (Company_ID, Company_Name, Industry) VALUES (107, 'Dabur International', 'FMCG');
INSERT INTO Companies (Company_ID, Company_Name, Industry) VALUES (108, 'Charles and Darwish
Associates', 'Accounting');
INSERT INTO Companies (Company_ID, Company_Name, Industry) VALUES (109, 'TCR Innovation',
'Technology');
iii.
INSERT INTO Placement_Officers (Officer_ID, Officer_Name, Contact_Email, Major_ID) VALUES (501, 'Sarah
Johnson', 's.johnson@uwl.ac.uk', 1);
INSERT INTO Placement_Officers (Officer_ID, Officer_Name, Contact_Email, Major_ID) VALUES (502, 'Michael
Chen', 'm.chen@uwl.ac.uk', 2);
INSERT INTO Placement_Officers (Officer_ID, Officer_Name, Contact_Email, Major_ID) VALUES (503, 'Emma
Davis', 'e.davis@uwl.ac.uk', 3);
INSERT INTO Placement_Officers (Officer_ID, Officer_Name, Contact_Email, Major_ID) VALUES (504, 'Robert
Taylor', 'r.taylor@uwl.ac.uk', 4);
INSERT INTO Placement_Officers (Officer_ID, Officer_Name, Contact_Email, Major_ID) VALUES (505, 'Linda
White', 'l.white@uwl.ac.uk', 3);
iv.
INSERT INTO Students (Student_ID, First_Name, Last_Name, Email, Major_ID, GPA_Percentage, Resume_Summary) VALUES (2001, 'John', 'Doe', 'j.doe@student.uwl.ac.uk', 1, 3.8, 'Java developer');
INSERT INTO Students (Student_ID, First_Name, Last_Name, Email, Major_ID, GPA_Percentage, Resume_Summary) VALUES (2002, 'Alice', 'Smith', 'a.smith@student.uwl.ac.uk', 2, 3.5, 'Cyber specialist');
INSERT INTO Students (Student_ID, First_Name, Last_Name, Email, Major_ID, GPA_Percentage, Resume_Summary) VALUES (2003, 'Bob', 'Brown', 'b.brown@student.uwl.ac.uk', 3, 2.9, 'Marketing enthusiast');
INSERT INTO Students (Student_ID, First_Name, Last_Name, Email, Major_ID, GPA_Percentage, Resume_Summary) VALUES (2004, 'Charlie', 'Wilson', 'c.wilson@student.uwl.ac.uk', 1, 3.9, 'Web developer');
INSERT INTO Students (Student_ID, First_Name, Last_Name, Email, Major_ID, GPA_Percentage, Resume_Summary) VALUES (2005, 'Fatima', 'Ahmed', 'f.ahmed@student.uwl.ac.uk', 1, 3.7, 'Data analyst');
INSERT INTO Students (Student_ID, First_Name, Last_Name, Email, Major_ID, GPA_Percentage, Resume_Summary) VALUES (2006, 'Rahul', 'Sharma', 'r.sharma@student.uwl.ac.uk', 4, 3.4, 'Tax accounting');
INSERT INTO Students (Student_ID, First_Name, Last_Name, Email, Major_ID, GPA_Percentage, Resume_Summary) VALUES (2007, 'Sara', 'Khan', 's.khan@student.uwl.ac.uk', 3, 3.1, 'HR trainee');
INSERT INTO Students (Student_ID, First_Name, Last_Name, Email, Major_ID, GPA_Percentage, Resume_Summary) VALUES (2008, 'James', 'Miller', 'j.miller@student.uwl.ac.uk', 3, 3.7, 'Financial analyst');
INSERT INTO Students (Student_ID, First_Name, Last_Name, Email, Major_ID, GPA_Percentage, Resume_Summary) VALUES (2009, 'Anjali', 'Nair', 'a.nair@student.uwl.ac.uk', 1, 3.2, 'Software tester');
INSERT INTO Students (Student_ID, First_Name, Last_Name, Email, Major_ID, GPA_Percentage, Resume_Summary) VALUES (2010, 'Kevin', 'Lee', 'k.lee@student.uwl.ac.uk', 2, 3.6, 'Network admin');
v.
INSERT INTO Jobs (Job_ID, Company_ID, Job_Title, Salary_Package, Min_GPA_Required) VALUES (305, 105,
'Management Trainee', 55000, 3.0);
INSERT INTO Jobs (Job_ID, Company_ID, Job_Title, Salary_Package, Min_GPA_Required) VALUES (306, 106,
'Software Support Engineer', 42000, 2.8);
INSERT INTO Jobs (Job_ID, Company_ID, Job_Title, Salary_Package, Min_GPA_Required) VALUES (307, 108,
'Tax Associate Intern', 35000, 3.2);
INSERT INTO Jobs (Job_ID, Company_ID, Job_Title, Salary_Package, Min_GPA_Required) VALUES (308, 109,
'Web Development Intern', 30000, 2.5);
vi.
INSERT INTO Applications (Application_ID, Student_ID, Job_ID, Officer_ID, Application_Date, Status)
VALUES (4001, 2001, 308, 501, DATE '2026-04-20', 'Interviewed');
INSERT INTO Applications (Application_ID, Student_ID, Job_ID, Officer_ID, Application_Date, Status)
VALUES (4002, 2004, 308, 501, DATE '2026-04-21', 'Applied');
INSERT INTO Applications (Application_ID, Student_ID, Job_ID, Officer_ID, Application_Date, Status)
VALUES (4003, 2005, 308, 501, DATE '2026-04-22', 'Offered');
INSERT INTO Applications (Application_ID, Student_ID, Job_ID, Officer_ID, Application_Date, Status)
VALUES (4004, 2003, 305, 503, DATE '2026-04-25', 'Applied');
INSERT INTO Applications (Application_ID, Student_ID, Job_ID, Officer_ID, Application_Date, Status)
VALUES (4005, 2007, 305, 503, DATE '2026-04-26', 'Interviewed');
INSERT INTO Applications (Application_ID, Student_ID, Job_ID, Officer_ID, Application_Date, Status)
VALUES (4006, 2008, 305, 505, DATE '2026-04-28', 'Applied');
INSERT INTO Applications (Application_ID, Student_ID, Job_ID, Officer_ID, Application_Date, Status)
VALUES (4007, 2001, 306, 501, DATE '2026-04-30', 'Applied');
INSERT INTO Applications (Application_ID, Student_ID, Job_ID, Officer_ID, Application_Date, Status)
VALUES (4008, 2009, 306, 501, DATE '2026-05-01', 'Rejected');
INSERT INTO Applications (Application_ID, Student_ID, Job_ID, Officer_ID, Application_Date, Status)
VALUES (4009, 2004, 306, 501, DATE '2026-05-02', 'Offered');
INSERT INTO Applications (Application_ID, Student_ID, Job_ID, Officer_ID, Application_Date, Status)
VALUES (4010, 2006, 307, 504, DATE '2026-05-03', 'Offered');
INSERT INTO Applications (Application_ID, Student_ID, Job_ID, Officer_ID, Application_Date, Status)
VALUES (4011, 2008, 307, 505, DATE '2026-05-04', 'Interviewed');
INSERT INTO Applications (Application_ID, Student_ID, Job_ID, Officer_ID, Application_Date, Status)
VALUES (4012, 2002, 305, 502, DATE '2026-05-05', 'Offered');
INSERT INTO Applications (Application_ID, Student_ID, Job_ID, Officer_ID, Application_Date, Status)
VALUES (4013, 2010, 306, 502, DATE '2026-05-05', 'Applied');
INSERT INTO Applications (Application_ID, Student_ID, Job_ID, Officer_ID, Application_Date, Status)
VALUES (4014, 2001, 305, 501, DATE '2026-05-06', 'Rejected');
INSERT INTO Applications (Application_ID, Student_ID, Job_ID, Officer_ID, Application_Date, Status)
VALUES (4015, 2005, 307, 501, DATE '2026-05-07', 'Applied');
