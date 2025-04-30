-- SQL queries: SQL data definition, data types, specifying constraints, Queries for retrieval,insertion, deletion, updation, introduction to views.

-- 1. DATA DEFINITION (DDL) ------------------------

-- Drop existing tables
DROP TABLE IF EXISTS Enrollment;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Course;

-- Student Table
CREATE TABLE Student (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT CHECK (age >= 17),
    email VARCHAR(100) UNIQUE
);

-- Course Table
CREATE TABLE Course (
    code VARCHAR(10) PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    credits INT CHECK (credits BETWEEN 1 AND 5)
);

-- Enrollment Table with Foreign Keys
CREATE TABLE Enrollment (
    student_id INT,
    course_code VARCHAR(10),
    grade CHAR(2),
    PRIMARY KEY (student_id, course_code),
    FOREIGN KEY (student_id) REFERENCES Student(id) ON DELETE CASCADE,
    FOREIGN KEY (course_code) REFERENCES Course(code)
);

-- 2. DATA INSERTION --------------------------------

INSERT INTO Student (id, name, age, email) VALUES
(1, 'Ravi', 20, 'ravi@example.com'),
(2, 'Asha', 22, 'asha@example.com');

INSERT INTO Course (code, title, credits) VALUES
('CS101', 'Intro to CS', 3),
('MATH101', 'Calculus I', 4);

INSERT INTO Enrollment (student_id, course_code, grade) VALUES
(1, 'CS101', 'A'),
(2, 'MATH101', 'B');

-- 3. DATA RETRIEVAL QUERIES ------------------------

-- a) All students
SELECT * FROM Student;

-- b) All students enrolled in CS101
SELECT s.name, c.title, e.grade
FROM Student s
JOIN Enrollment e ON s.id = e.student_id
JOIN Course c ON c.code = e.course_code
WHERE c.code = 'CS101';

-- c) Students older than 21
SELECT name, age FROM Student WHERE age > 21;

-- d) Count of enrollments per course
SELECT course_code, COUNT(*) AS total_enrolled
FROM Enrollment
GROUP BY course_code;

-- 4. UPDATION --------------------------------------

-- a) Update grade
UPDATE Enrollment
SET grade = 'A+'
WHERE student_id = 2 AND course_code = 'MATH101';

-- b) Update email
UPDATE Student
SET email = 'asha.new@example.com'
WHERE id = 2;

-- 5. DELETION --------------------------------------

-- a) Remove an enrollment
DELETE FROM Enrollment
WHERE student_id = 1 AND course_code = 'CS101';

-- b) Remove student (CASCADE deletes enrollments)
DELETE FROM Student WHERE id = 1;

-- 6. VIEWS -----------------------------------------

-- a) Create a view of student grades
CREATE VIEW StudentGrades AS
SELECT s.name, c.title, e.grade
FROM Student s
JOIN Enrollment e ON s.id = e.student_id
JOIN Course c ON c.code = e.course_code;

-- b) Query the view
SELECT * FROM StudentGrades;

  
