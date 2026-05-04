-- 1. Create the Database
CREATE DATABASE IF NOT EXISTS UniversityLms;
USE UniversityLms;

-- 2. Create Departments Table
CREATE TABLE IF NOT EXISTS departments (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL,
    dept_head VARCHAR(100)
);

-- Seed departments with specific IDs to support both original and new data
INSERT INTO departments (dept_id, dept_name, dept_head) VALUES 
(1, 'Computer Science', 'Dr. Alan Turing'),
(101, 'Computer Science Research', 'Dr. Alan Turing'),
(102, 'Electrical Engineering', 'Dr. Nikola Tesla')
ON DUPLICATE KEY UPDATE dept_name=VALUES(dept_name), dept_head=VALUES(dept_head);

-- 3. Create Users Table
CREATE TABLE IF NOT EXISTS users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('STUDENT', 'INSTRUCTOR', 'ADMIN') NOT NULL,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- 4. Create Courses Table
CREATE TABLE IF NOT EXISTS courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_code VARCHAR(20) UNIQUE NOT NULL,
    course_name VARCHAR(100) NOT NULL,
    credits INT DEFAULT 3,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- 5. Create Sections Table (For scheduling courses)
CREATE TABLE IF NOT EXISTS sections (
    section_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    instructor_id INT NOT NULL,
    semester_id VARCHAR(20) NOT NULL,
    room VARCHAR(50),
    capacity INT DEFAULT 30,
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (instructor_id) REFERENCES users(user_id)
);

-- 6. Create Enrollments Table
CREATE TABLE IF NOT EXISTS enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    section_id INT NOT NULL,
    grade VARCHAR(2),
    enrolled_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES users(user_id),
    FOREIGN KEY (section_id) REFERENCES sections(section_id)
);

-- 7. Create Assignments Table
CREATE TABLE IF NOT EXISTS assignments (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    section_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    due_date DATETIME,
    max_points INT DEFAULT 100,
    FOREIGN KEY (section_id) REFERENCES sections(section_id)
);

-- 8. Create Submissions Table
CREATE TABLE IF NOT EXISTS submissions (
    submission_id INT AUTO_INCREMENT PRIMARY KEY,
    assignment_id INT NOT NULL,
    student_id INT NOT NULL,
    file_path VARCHAR(255),
    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    grade DECIMAL(5,2),
    feedback TEXT,
    FOREIGN KEY (assignment_id) REFERENCES assignments(assignment_id),
    FOREIGN KEY (student_id) REFERENCES users(user_id)
);

-- 9. Insert Default Data
INSERT IGNORE INTO users (name, email, password, role) VALUES 
('System Admin', 'admin@uni.com', 'admin123', 'ADMIN'),
('Prof. Turing', 'turing@uni.com', 'prof123', 'INSTRUCTOR'),
('Alice Student', 'alice@uni.com', 'student123', 'STUDENT');

UPDATE users SET dept_id = 101 WHERE email = 'turing@uni.com';
UPDATE users SET dept_id = 102 WHERE email = 'alice@uni.com';

INSERT IGNORE INTO courses (course_code, course_name, credits, dept_id) VALUES 
('CS101', 'Intro to Computer Science', 3, 1),
('CS202', 'Data Structures', 4, 1);
