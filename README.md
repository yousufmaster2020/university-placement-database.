# University Student Placement Tracking System

A relational database system engineered to manage university student placements, track corporate job openings, and streamline recruitment pipelines with an integrated data-masking security layer.

## 📌 Project Overview
This project is an enterprise-focused database system engineered to manage university placement cells. It tracks student profiles, corporate partners, job postings, and recruitment workflows with strict relational constraints and security controls.

## 🛠️ Key Technical Highlights
- **Schema Architecture:** Engineered 6 highly normalized relational tables (`Students`, `Companies`, `Jobs`, `Applications`, `Majors`, and `Placement_Officers`) mapped with Primary/Foreign key constraints.
- **Advanced Query Engineering:** Developed analytical scripts utilizing multi-table inner/outer `JOIN` operations, aggregate functions (`MAX`, `COUNT`, `AVG`), and conditional subqueries to filter performance analytics.
- **Security & Privacy Engineering:** Built an abstract database layer using a secure SQL View (`Applicant_Tracking`) to mask structural identifiers (Student IDs, contact information). This ensures third-party corporate recruiters can evaluate candidate qualifications safely without compromising student privacy.

## 🚀 Future Integrations
Planning a NoSQL integration phase using MongoDB to account for highly variable unstructured data like student resumes, portfolio highlights, and certifications.
