<%@ page import="java.util.List, com.user.model.UserManagement" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User List</title>
    <link rel="stylesheet" href="CSS/global.css">
    <link rel="stylesheet" href="CSS/forms.css">
</head>
<body>
    <div class="container">
        <h1>All Users</h1>
        
        <table>
            <thead>
                <tr>
                    <th>User ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>Department ID</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<UserManagement> users = (List<UserManagement>) request.getAttribute("users");
                    if (users != null && !users.isEmpty()) {
                        for (UserManagement user : users) {
                %>
                <tr>
                    <td><%= user.getId() %></td>
                    <td><%= user.getName() %></td>
                    <td><%= user.getEmail() %></td>
                    <td><%= user.getRole() %></td>
                    <td><%= user.getDeptId() != null ? user.getDeptId() : "N/A" %></td>
                </tr>
                <%      }
                    } else { %>
                <tr><td colspan="5" style="text-align: center;">No users available.</td></tr>
                <% } %>
            </tbody>
        </table>

        <br>
        <div style="text-align: center;">
            <a href="Admin-user-management.jsp" class="button">Back to User Management</a>
        </div>
    </div>
</body>
</html>
