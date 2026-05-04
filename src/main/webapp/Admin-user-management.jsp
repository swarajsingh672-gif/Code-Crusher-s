<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management</title>
    <link rel="stylesheet" href="CSS/global.css">
    <link rel="stylesheet" href="CSS/forms.css">
    <script>
        function showForm(formId) {
            // Hide all forms
            document.getElementById("create-user-form").style.display = 'none';
            document.getElementById("update-user-form").style.display = 'none';
            document.getElementById("delete-user-form").style.display = 'none';

            // Show selected form
            document.getElementById(formId).style.display = 'block';
        }
    </script>
</head>
<body>
    <div class="container">
        <header class="header">
            <h1>User Management</h1>
        </header>

        <div class="button-group">
            <button class="button" onclick="showForm('create-user-form')">Create User</button>
            <button class="button" onclick="showForm('update-user-form')">Update User</button>
            <button class="button" onclick="showForm('delete-user-form')">Delete User</button>
            <!-- View Users Button now directs to the list action -->
            <a href="userManagement?action=list" class="button">View Users</a>
        </div>

        <!-- Forms for creating, updating, and deleting users -->
        <div id="create-user-form" class="form-container">
            <h2>Create User</h2>
            <form action="userManagement" method="post">
                <input type="hidden" name="action" value="add">
                <input type="text" name="name" placeholder="Name" required>
                <input type="email" name="email" placeholder="Email" required>
                <input type="password" name="password" placeholder="Password" required>
                <select name="role" required style="width: 100%; padding: 10px; margin: 10px 0; border: 1px solid #ccc; border-radius: 5px;">
                    <option value="">Select Role</option>
                    <option value="STUDENT">Student</option>
                    <option value="INSTRUCTOR">Instructor</option>
                    <option value="ADMIN">Admin</option>
                </select>
                <input type="number" name="deptId" placeholder="Department ID (Optional)">
                <button type="submit">Create User</button>
            </form>
        </div>

        <div id="update-user-form" class="form-container">
            <h2>Update User</h2>
            <form action="userManagement" method="post">
                <input type="hidden" name="action" value="update">
                <input type="number" name="id" placeholder="User ID" required>
                <input type="text" name="name" placeholder="Name" required>
                <input type="email" name="email" placeholder="Email" required>
                <input type="password" name="password" placeholder="Password" required>
                <select name="role" required style="width: 100%; padding: 10px; margin: 10px 0; border: 1px solid #ccc; border-radius: 5px;">
                    <option value="">Select Role</option>
                    <option value="STUDENT">Student</option>
                    <option value="INSTRUCTOR">Instructor</option>
                    <option value="ADMIN">Admin</option>
                </select>
                <input type="number" name="deptId" placeholder="Department ID (Optional)">
                <button type="submit">Update User</button>
            </form>
        </div>

        <div id="delete-user-form" class="form-container">
            <h2>Delete User</h2>
            <form action="userManagement" method="post">
                <input type="hidden" name="action" value="delete">
                <input type="number" name="id" placeholder="User ID" required>
                <button type="submit">Delete User</button>
            </form>
        </div>

        <br>
        <div style="text-align: center;"><a href="adminDashboard" class="button">Back to Dashboard</a></div>
    </div>
</body>
</html>
