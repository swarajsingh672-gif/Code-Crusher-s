<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.user.model.Section" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Section Management</title>
    <link rel="stylesheet" href="CSS/University-Portal.css">
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f9; }
        .container { max-width: 800px; margin: 50px auto; padding: 20px; background: #fff; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        h1, h2 { text-align: center; color: #333; }
        form { display: flex; flex-direction: column; gap: 15px; margin-bottom: 30px; }
        input, select { padding: 10px; font-size: 16px; border: 1px solid #ddd; border-radius: 5px; }
        button { background-color: #002147; color: #fff; cursor: pointer; border: none; padding: 10px; font-size: 16px; border-radius: 5px; }
        button:hover { background-color: #003366; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 10px; text-align: left; }
        th { background-color: #002147; color: white; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Section Management</h1>
        <h2>Create New Section</h2>
        <form action="section" method="post">
            <input type="hidden" name="action" value="create">
            <input type="number" name="courseId" placeholder="Course ID" required>
            <input type="number" name="instructorId" placeholder="Instructor ID" required>
            <input type="number" name="semesterId" placeholder="Semester ID" required>
            <input type="text" name="room" placeholder="Room (e.g. 101A)">
            <input type="number" name="capacity" placeholder="Capacity (e.g. 30)" value="30" required>
            <button type="submit">Create Section</button>
        </form>

        <h2>Existing Sections</h2>
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
                    <td><a href="section?action=delete&sectionId=<%= sec.getSectionId() %>">Delete</a></td>
                </tr>
                <%      }
                    } else { %>
                <tr><td colspan="7" style="text-align: center;">No sections found</td></tr>
                <% } %>
            </tbody>
        </table>
        <br>
        <div style="text-align: center;"><a href="Admin-dashboard.jsp">Back to Dashboard</a></div>
    </div>
</body>
</html>
