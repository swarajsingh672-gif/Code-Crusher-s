<%@ page import="java.util.List, com.user.model.Department" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Department List</title>
    <link rel="stylesheet" href="CSS/global.css">
    <link rel="stylesheet" href="CSS/forms.css">
</head>
<body>
    <div class="container">
        <h1>University Departments</h1>
        
        <table>
            <thead>
                <tr>
                    <th>Department ID</th>
                    <th>Department Name</th>
                    <th>Department Head</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<Department> departments = (List<Department>) request.getAttribute("departments");
                    if (departments != null && !departments.isEmpty()) {
                        for (Department dept : departments) {
                %>
                <tr>
                    <td><%= dept.getDeptId() %></td>
                    <td><%= dept.getDeptName() %></td>
                    <td><%= dept.getDeptHead() != null ? dept.getDeptHead() : "N/A" %></td>
                </tr>
                <%      }
                    } else { %>
                <tr><td colspan="3" style="text-align: center;">No departments available.</td></tr>
                <% } %>
            </tbody>
        </table>

        <br>
        <div style="text-align: center;">
            <a href="adminDashboard" class="button">Back to Admin Dashboard</a>
        </div>
    </div>
</body>
</html>
