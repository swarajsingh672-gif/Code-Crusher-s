<%@ page import="java.util.List, com.user.model.Enrollment, com.user.model.Section" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Registration</title>
    <link rel="stylesheet" href="CSS/global.css">
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f9; }
        .container { max-width: 800px; margin: 50px auto; padding: 20px; background: #fff; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        h1, h2 { text-align: center; color: #333; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 10px; text-align: left; }
        th { background-color: #002147; color: white; }
        button { background-color: #002147; color: #fff; cursor: pointer; border: none; padding: 5px 10px; border-radius: 5px; }
        button:hover { background-color: #003366; }
        .message { color: green; text-align: center; }
        .error { color: red; text-align: center; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Student Registration</h1>

        <% if (request.getAttribute("message") != null) { %>
            <p class="message"><%= request.getAttribute("message") %></p>
        <% } %>
        <% if (request.getAttribute("error") != null) { %>
            <p class="error"><%= request.getAttribute("error") %></p>
        <% } %>

        <h2>Available Sections</h2>
        <table>
            <thead>
                <tr>
                    <th>Section ID</th>
                    <th>Course ID</th>
                    <th>Instructor ID</th>
                    <th>Semester ID</th>
                    <th>Room</th>
                    <th>Capacity</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    List<Section> sections = (List<Section>) request.getAttribute("sections");
                    if (sections != null && !sections.isEmpty()) {
                        for (Section sec : sections) {
                %>
                <tr>
                    <td><%= sec.getSectionId() %></td>
                    <td><%= sec.getCourseId() %></td>
                    <td><%= sec.getInstructorId() %></td>
                    <td><%= sec.getSemesterId() %></td>
                    <td><%= sec.getRoom() %></td>
                    <td><%= sec.getCapacity() %></td>
                    <td>
                        <form action="enrollment" method="post" style="margin: 0;">
                            <input type="hidden" name="action" value="enroll">
                            <input type="hidden" name="sectionId" value="<%= sec.getSectionId() %>">
                            <input type="hidden" name="studentId" value="<%= session.getAttribute("userId") %>">
                            <button type="submit">Enroll</button>
                        </form>
                    </td>
                </tr>
                <%      }
                    } else { %>
                <tr><td colspan="7" style="text-align: center;">No sections available for enrollment.</td></tr>
                <% } %>
            </tbody>
        </table>

        <h2>My Enrollments</h2>
        <div style="text-align: center; margin-top: 10px;">
            <a href="enrollment?action=myEnrollments"><button>View My Enrollments</button></a>
        </div>
        <% 
            List<Enrollment> enrollments = (List<Enrollment>) request.getAttribute("enrollments");
            if (enrollments != null) {
        %>
        <table>
            <thead>
                <tr>
                    <th>Enrollment ID</th>
                    <th>Section ID</th>
                    <th>Grade</th>
                    <th>Enrolled At</th>
                </tr>
            </thead>
            <tbody>
                <% if (!enrollments.isEmpty()) {
                        for (Enrollment enr : enrollments) {
                %>
                <tr>
                    <td><%= enr.getEnrollmentId() %></td>
                    <td><%= enr.getSectionId() %></td>
                    <td><%= enr.getGrade() != null ? enr.getGrade() : "N/A" %></td>
                    <td><%= enr.getEnrolledAt() %></td>
                </tr>
                <%      }
                    } else { %>
                <tr><td colspan="4" style="text-align: center;">You are not enrolled in any sections.</td></tr>
                <% } %>
            </tbody>
        </table>
        <% } %>

        <br>
        <div style="text-align: center;"><a href="User-dashboard.jsp">Back to Student Dashboard</a></div>
    </div>
</body>
</html>
