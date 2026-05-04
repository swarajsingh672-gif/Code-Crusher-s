<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Portal - University LMS</title>
    <link rel="stylesheet" href="CSS/global.css">
    <link rel="stylesheet" href="CSS/dashboard.css">
</head>
<body>
    <header class="uni-header">
        <h1>Student Portal</h1>
        <div>Welcome, <%= session.getAttribute("userName") %> | <a href="index.jsp" style="color: white;">Logout</a></div>
    </header>

    <div class="dashboard-layout">
        <nav class="sidebar">
            <h3>My Academic Space</h3>
            <ul>
                <li><a href="enrollment?action=myEnrollments">My Courses</a></li>
                <li><a href="Student-assignments.jsp">Assignments</a></li>
                <li><a href="enrollment?action=listAvailable">Register for Courses</a></li>
                <li><a href="#">Grades & Transcripts</a></li>
                <li><a href="#">Financial Account</a></li>
            </ul>
        </nav>

        <main class="main-content">
            <h2>Semester Overview: Fall 2024</h2>
            
            <div class="summary-grid">
                <div class="summary-card">
                    <h3>Academic Standing</h3>
                    <p>4.0</p>
                    <div style="color: #777; font-size: 0.9rem;">Good Standing</div>
                </div>
            </div>

            <h3>My Enrolled Courses</h3>
            <table>
                <thead>
                    <tr>
                        <th>Course Code</th>
                        <th>Course Name</th>
                        <th>Instructor</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>CS101</td>
                        <td>Intro to Computer Science</td>
                        <td>Prof. Alan Turing</td>
                        <td>Active</td>
                    </tr>
                </tbody>
            </table>
        </main>
    </div>

    <footer class="dashboard-footer-classic">
        &copy; 2024 University. All Rights Reserved.
    </footer>
</body>
</html>
