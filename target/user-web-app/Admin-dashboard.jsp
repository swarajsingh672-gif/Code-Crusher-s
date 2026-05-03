<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>University Admin Portal</title>
    <link rel="stylesheet" href="CSS/University-Portal.css">
</head>
<body>
    <header class="uni-header">
        <h1>Admin Control Panel</h1>
        <div>Welcome, <%= session.getAttribute("userName") %> | <a href="index.jsp" class="logout-link-classic">Logout</a></div>
    </header>

    <div class="dashboard-layout">
        <nav class="sidebar">
            <h3>Management</h3>
            <ul>
                <li><a href="#">Department List</a></li>
                <li><a href="Admin-course-management.jsp">Course Catalog</a></li>
                <li><a href="section?action=list">Section Scheduling</a></li>
                <li><a href="Admin-user-management.jsp">User Accounts</a></li>
            </ul>
        </nav>

        <main class="main-content">
            <h2>Administrative Overview</h2>
            <div class="summary-grid">
                <div class="summary-card">
                    <h3>Departments</h3>
                    <p>1</p>
                </div>
                <div class="summary-card">
                    <h3>Total Users</h3>
                    <p>1</p>
                </div>
                <div class="summary-card">
                    <h3>Active Courses</h3>
                    <p>0</p>
                </div>
            </div>

            <h3>Recent Activity</h3>
            <table>
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Action</th>
                        <th>User</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>2024-05-01</td>
                        <td>Portal Initialized</td>
                        <td>System</td>
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
