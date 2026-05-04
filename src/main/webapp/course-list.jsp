<%@ page import="java.util.List, com.user.model.CourseManagement" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course List</title>
    <link rel="stylesheet" href="CSS/global.css">
    <link rel="stylesheet" href="CSS/forms.css">
</head>
<body>
    <div class="container">
        <h1>All Courses</h1>
        
        <table>
            <thead>
                <tr>
                    <th>Course ID</th>
                    <th>Course Code</th>
                    <th>Course Name</th>
                    <th>Credits</th>
                    <th>Department ID</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<CourseManagement> courses = (List<CourseManagement>) request.getAttribute("courses");
                    if (courses != null && !courses.isEmpty()) {
                        for (CourseManagement course : courses) {
                %>
                <tr>
                    <td><%= course.getCourseId() %></td>
                    <td><%= course.getCourseCode() %></td>
                    <td><%= course.getCourseName() %></td>
                    <td><%= course.getCredits() %></td>
                    <td><%= course.getDeptId() != null ? course.getDeptId() : "N/A" %></td>
                </tr>
                <%      }
                    } else { %>
                <tr><td colspan="5" style="text-align: center;">No courses available.</td></tr>
                <% } %>
            </tbody>
        </table>

        <br>
        <div style="text-align: center;">
            <a href="Admin-course-management.jsp" class="button">Back to Course Management</a>
        </div>
    </div>
</body>
</html>
