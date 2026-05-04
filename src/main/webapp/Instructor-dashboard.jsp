<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Instructor Portal - University LMS</title>
    <link rel="stylesheet" href="CSS/global.css">
    <link rel="stylesheet" href="CSS/dashboard.css">
</head>
<body>
    <header class="uni-header">
        <h1>Instructor Portal</h1>
        <div>Welcome, Prof. <%= session.getAttribute("userName") %> | <a href="index.jsp" style="color: white;">Logout</a></div>
    </header>

    <div class="dashboard-layout">
        <nav class="sidebar">
            <h3>Teaching Workspace</h3>
            <ul>
                <li><a href="#">My Classes</a></li>
                <li><a href="Instructor-assignments.jsp">Assignments & Grading</a></li>
                <li><a href="#">Course Materials</a></li>
                <li><a href="#">Office Hours</a></li>
            </ul>
        </nav>

        <main class="main-content">
            <h2>Teaching Schedule: Fall 2024</h2>
            
            <div style="background: white; padding: 1.5rem; border: 1px solid #ddd; margin-bottom: 2rem;">
                <h3>Faculty Overview</h3>
                <p><strong>Department:</strong> Computer Science</p>
                <p><strong>Total Students:</strong> 30</p>
            </div>

            <h3>Active Course Sections</h3>
            <table>
                <thead>
                    <tr>
                        <th>Code</th>
                        <th>Course Name</th>
                        <th>Room</th>
                        <th>Enrollment</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>CS101-01</td>
                        <td>Intro to Computer Science</td>
                        <td>Room 302</td>
                        <td>30 / 30</td>
                    </tr>
                </tbody>
            </table>
        </main>
    </div>

    <footer style="text-align: center; padding: 1rem; background: #eee; border-top: 1px solid #ddd;">
        &copy; 2024 University. All Rights Reserved.
    </footer>
</body>
</html>
