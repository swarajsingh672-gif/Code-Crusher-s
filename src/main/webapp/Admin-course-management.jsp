<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Management</title>
    <link rel="stylesheet" href="CSS/global.css">
    <link rel="stylesheet" href="CSS/forms.css">
    <script>
        function showForm(formId) {
            // Hide all forms
            document.getElementById("create-course-form").style.display = 'none';
            document.getElementById("update-course-form").style.display = 'none';
            document.getElementById("delete-course-form").style.display = 'none';

            // Show selected form
            document.getElementById(formId).style.display = 'block';
        }
    </script>
</head>
<body>
    <div class="container">
        <header class="header">
            <h1>Course Management</h1>
        </header>

        <div class="button-group">
            <button class="button" onclick="showForm('create-course-form')">Create Course</button>
            <button class="button" onclick="showForm('update-course-form')">Update Course</button>
            <button class="button" onclick="showForm('delete-course-form')">Delete Course</button>
            <a href="course?action=" class="button">View courses</a>
            </form>
        </div>

        <!-- Forms for creating, updating, and deleting courses -->
        <div id="create-course-form" class="form-container" style="display: none;">
            <h2>Create Course</h2>
            <form action="course" method="post">
                <input type="hidden" name="action" value="create">
                <input type="text" name="courseCode" placeholder="Course Code (e.g. CS101)" required>
                <input type="text" name="courseName" placeholder="Course Name" required>
                <input type="number" name="credits" placeholder="Credits (e.g. 3)" value="3" required>
                <input type="number" name="deptId" placeholder="Department ID (Optional)">
                <button type="submit">Create Course</button>
            </form>
        </div>

        <div id="update-course-form" class="form-container" style="display: none;">
            <h2>Update Course</h2>
            <form action="course" method="post">
                <input type="hidden" name="action" value="update">
                <input type="number" name="courseId" placeholder="Course ID" required>
                <input type="text" name="courseCode" placeholder="Course Code (e.g. CS101)" required>
                <input type="text" name="courseName" placeholder="Course Name" required>
                <input type="number" name="credits" placeholder="Credits (e.g. 3)" required>
                <input type="number" name="deptId" placeholder="Department ID (Optional)">
                <button type="submit">Update Course</button>
            </form>
        </div>

        <div id="delete-course-form" class="form-container" style="display: none;">
            <h2>Delete Course</h2>
            <form action="course" method="post">
                <input type="hidden" name="action" value="delete">
                <input type="number" name="courseId" placeholder="Course ID" required>
                <button type="submit">Delete Course</button>
            </form>
        </div>

        <div class="course-list">
        <br>
        <div style="text-align: center;"><a href="adminDashboard" class="button">Back to Dashboard</a></div>
    </div>
</body>
</html>
