-- University LMS Normalized Schema
CREATE DATABASE IF NOT EXISTS UniversityLms;
USE UniversityLms;

-- 1. Departments
CREATE TABLE IF NOT EXISTS departments (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL,
    dept_head VARCHAR(100)
);

-- 2. Semesters
CREATE TABLE IF NOT EXISTS semesters (
    semester_id INT AUTO_INCREMENT PRIMARY KEY,
    semester_name VARCHAR(50) NOT NULL, -- e.g., Fall 2024
    start_date DATE,
    end_date DATE
);

-- 3. Users (Multi-role)
CREATE TABLE IF NOT EXISTS users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('STUDENT', 'INSTRUCTOR', 'ADMIN') NOT NULL,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- 4. Courses
CREATE TABLE IF NOT EXISTS courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_code VARCHAR(20) NOT NULL UNIQUE, -- e.g., CS101
    course_name VARCHAR(100) NOT NULL,
    credits INT DEFAULT 3,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

-- 5. Course Sections (Specific classes in a semester)
CREATE TABLE IF NOT EXISTS sections (
    section_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT NOT NULL,
    instructor_id INT NOT NULL,
    semester_id INT NOT NULL,
    room VARCHAR(50),
    capacity INT DEFAULT 30,
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (instructor_id) REFERENCES users(user_id),
    FOREIGN KEY (semester_id) REFERENCES semesters(semester_id)
);

-- 6. Enrollments (Join table for Students and Sections)
CREATE TABLE IF NOT EXISTS enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    section_id INT NOT NULL,
    grade VARCHAR(2), -- A, B, C, etc.
    enrolled_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES users(user_id),
    FOREIGN KEY (section_id) REFERENCES sections(section_id),
    UNIQUE(student_id, section_id) -- Prevent double enrollment
);

-- 7. Assignments
CREATE TABLE IF NOT EXISTS assignments (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    section_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    due_date DATETIME,
    total_points INT DEFAULT 100,
    FOREIGN KEY (section_id) REFERENCES sections(section_id)
);

-- 8. Submissions
CREATE TABLE IF NOT EXISTS submissions (
    submission_id INT AUTO_INCREMENT PRIMARY KEY,
    assignment_id INT NOT NULL,
    student_id INT NOT NULL,
    content_url VARCHAR(255), -- Link to file or text
    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    obtained_points INT,
    feedback TEXT,
    FOREIGN KEY (assignment_id) REFERENCES assignments(assignment_id),
    FOREIGN KEY (student_id) REFERENCES users(user_id)
);

-- Seed Initial Data
INSERT INTO departments (dept_name, dept_head) VALUES ('Computer Science', 'Dr. Alan Turing');
INSERT INTO semesters (semester_name, start_date, end_date) VALUES ('Fall 2024', '2024-09-01', '2024-12-15');

-- Default Admin
INSERT INTO users (name, email, password, role) VALUES ('System Admin', 'admin@uni.com', 'admin123', 'ADMIN');
