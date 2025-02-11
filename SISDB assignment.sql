create database SISDB;
use SISDB;

CREATE TABLE Teachers (
    teacher_id INT PRIMARY KEY NOT NULL,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    course VARCHAR(30),
    email VARCHAR(50) UNIQUE
    
);

CREATE TABLE Students (
    student_id INT PRIMARY KEY NOT NULL,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    date_of_birth DATE,
    email VARCHAR(50),
    phone_number VARCHAR(15)
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY NOT NULL,
    course_name VARCHAR(30),
    credits INT,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id)
);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY NOT NULL,
    student_id INT,
    amount DECIMAL,
    payment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);
INSERT INTO Teachers (teacher_id, first_name, last_name, course, email) VALUES
(101, 'Rajesh', 'Sharma', 'Mathematics', 'rajesh.sharma@example.com'),
(102, 'Anita', 'Verma', 'Physics', 'anita.verma@example.com'),
(103, 'Suresh', 'Iyer', 'Chemistry', 'suresh.iyer@example.com'),
(104, 'Meera', 'Patel', 'Biology', 'meera.patel@example.com'),
(105, 'Vikram', 'Reddy', 'Computer Science', 'vikram.reddy@example.com'),
(106, 'Ananya', 'Nair', 'History', 'ananya.nair@example.com'),
(107, 'Arjun', 'Mehta', 'Economics', 'arjun.mehta@example.com'),
(108, 'Ishita', 'Das', 'English Literature', 'ishita.das@example.com'),
(109, 'Karan', 'Singh', 'Political Science', 'karan.singh@example.com'),
(110, 'Neha', 'Chopra', 'Psychology', 'neha.chopra@example.com');



INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number) VALUES
(1, 'Abby', 'Smith', '2000-05-15', 'abbysmith@example.com', '123-456-7890'),
(2, 'Jane', 'Smith', '1999-08-22', 'janesmith@example.com', '234-567-8901'),
(3, 'Michael', 'Johnson', '2001-02-10', 'michaelj@example.com', '345-678-9012'),
(4, 'Emily', 'Davis', '2002-11-30', 'emilyd@example.com', '456-789-0123'),
(5, 'David', 'Wilson', '1998-07-19', 'davidw@example.com', '567-890-1234'),
(6, 'Sarah', 'Brown', '2000-09-25', 'sarahb@example.com', '678-901-2345'),
(7, 'James', 'Anderson', '2001-04-03', 'jamesa@example.com', '789-012-3456'),
(8, 'Olivia', 'Martinez', '1999-06-12', 'oliviam@example.com', '890-123-4567'),
(9, 'William', 'Garcia', '2003-01-08', 'williamg@example.com', '901-234-5678'),
(10, 'Sophia', 'Rodriguez', '2002-03-27', 'sophiar@example.com', '012-345-6789');


INSERT INTO Courses (course_id, course_name, credits, teacher_id) VALUES
(1, 'Mathematics', 4, 101),
(2, 'Physics', 3, 102),
(3, 'Chemistry', 3, 103),
(4, 'Biology', 4, 104),
(5, 'Computer Science', 4, 105),
(6, 'History', 2, 106),
(7, 'Economics', 3, 107),
(8, 'English Literature', 3, 108),
(9, 'Political Science', 3, 109),
(10, 'Psychology', 3, 110);

INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date) VALUES
(1, 1, 3, '2024-01-15'),
(2, 2, 5, '2024-01-16'),
(3, 3, 1, '2024-01-17'),
(4, 4, 2, '2024-01-18'),
(5, 5, 4, '2024-01-19'),
(6, 6, 6, '2024-01-20'),
(7, 7, 8, '2024-01-21'),
(8, 8, 7, '2024-01-22'),
(9, 9, 9, '2024-01-23'),
(10, 10, 10, '2024-01-24');

INSERT INTO Payments (payment_id, student_id, amount, payment_date) VALUES
(1, 1, 15000.00, '2024-02-01'),
(2, 2, 12000.50, '2024-02-02'),
(3, 3, 18000.75, '2024-02-03'),
(4, 4, 10000.00, '2024-02-04'),
(5, 5, 13000.25, '2024-02-05'),
(6, 6, 20000.00, '2024-02-06'),
(7, 7, 9500.75, '2024-02-07'),
(8, 8, 17500.00, '2024-02-08'),
(9, 9, 11000.50, '2024-02-09'),
(10, 10, 16000.00, '2024-02-10');

-- TASK 2 1.
INSERT INTO Students VALUES (11, 'John','Doe','1995-08-15','john.doe@example.com',123456789);

-- TASK2 2.
INSERT INTO Enrollments 
VALUES (11,11,8,'21-09-20');

-- TASK2 3.
update Teachers SET email = 'rajesh@example.com' where 
teacher_id= 101;

-- TASK 2 4.
delete from Enrollments where student_id = 2 and 
course_id = 5;

--  TASK2 5. 
update Courses set course_id = 1 where teacher_id = 4;

-- TASK2 6.
DELETE FROM Enrollments WHERE student_id = 5;
DELETE FROM Students WHERE student_id = 5;
-- OR --
DELETE Students, Enrollments 
FROM Students 
INNER JOIN Enrollments 
ON Students.student_id = Enrollments.student_id 
WHERE Students.student_id = 5;

-- TASK2 7.
update Payments set amount = 50000 where payment_id=7;



-- TASK3 1.
SELECT SUM(p.amount) AS total_payments
FROM Payments p
JOIN Students s ON p.student_id = s.student_id
WHERE s.student_id = 7;

-- TASK3 2. 
SELECT c.course_id, c.course_name, COUNT(e.student_id) 
AS student_count
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;

-- TASK3 3. 
SELECT s.first_name
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.student_id IS NULL;

-- TASK3 4. 
SELECT s.first_name, s.last_name, c.course_name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id;

-- TASK3 5.
SELECT t.first_name, t.last_name, c.course_name
FROM Teachers t
JOIN Courses c ON t.teacher_id = c.teacher_id;

-- TASK3 6. 
SELECT t.first_name,t.last_name
FROM Teachers t
WHERE t.teacher_id NOT IN (
    SELECT c.teacher_id
    FROM Courses c
    WHERE c.teacher_id IS NOT NULL
);

-- TASK3 7. 
SELECT s.first_name, s.last_name
FROM Students s
LEFT JOIN Payments p ON s.student_id = p.student_id
WHERE p.payment_id IS NULL;

-- TASK3 8.
SELECT c.course_name
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
WHERE e.enrollment_id IS NULL;

-- TASK3 9. 
SELECT DISTINCT s.first_name
FROM Enrollments e1
JOIN Enrollments e2 ON e1.student_id = e2.student_id 
AND e1.course_id <> e2.course_id
JOIN Students s ON e1.student_id = s.student_id
GROUP BY s.first_name,s.last_name
HAVING COUNT(*) > 1;
 
 -- TASK3 10.
 SELECT t.first_name, t.last_name
FROM Teachers t
LEFT JOIN Courses c ON t.teacher_id = c.teacher_id
WHERE c.course_id IS NULL;


-- TASK4 1.
SELECT AVG(student_count) AS average_students_per_course
FROM (
    SELECT course_id, COUNT(student_id) AS student_count
    FROM Enrollments
    GROUP BY course_id
) AS course_enrollments;

-- TASK4 2.
SELECT s.first_name,s.last_name, p.amount
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
WHERE p.amount = (
    SELECT MAX(amount)
    FROM Payments
);

-- TASK4 3.







