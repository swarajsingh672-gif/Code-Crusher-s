<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.user.model.Assignment" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Assignments</title>
    <link rel="stylesheet" href="CSS/global.css">
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f9; }
        .container { max-width: 800px; margin: 50px auto; padding: 20px; background: #fff; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        h1, h2 { text-align: center; color: #333; }
        form { display: flex; flex-direction: column; gap: 15px; margin-bottom: 30px; }
        input, textarea { padding: 10px; font-size: 16px; border: 1px solid #ddd; border-radius: 5px; }
        button { background-color: #002147; color: #fff; cursor: pointer; border: none; padding: 10px; font-size: 16px; border-radius: 5px; }
        button:hover { background-color: #003366; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 10px; text-align: left; }
        th { background-color: #002147; color: white; }
        .message { color: green; text-align: center; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Manage Assignments</h1>

        <% if (request.getAttribute("message") != null) { %>
            <p class="message"><%= request.getAttribute("message") %></p>
        <% } %>

        <h2>Create Assignment</h2>
        <form action="AssignmentManagementServlet" method="post">
            <input type="hidden" name="action" value="create">
            <input type="number" name="sectionId" placeholder="Section ID" required>
            <input type="text" name="title" placeholder="Assignment Title" required>
            <textarea name="description" placeholder="Description" rows="4"></textarea>
            <label for="dueDate">Due Date:</label>
            <input type="datetime-local" id="dueDate" name="dueDate" required>
            <input type="number" name="maxPoints" placeholder="Max Points (e.g. 100)" value="100" required>
            <button type="submit">Create Assignment</button>
        </form>

        <h2>Section Assignments</h2>
        <form action="AssignmentManagementServlet" method="get" style="flex-direction: row; align-items: center; justify-content: center;">
            <input type="hidden" name="action" value="viewBySection">
            <input type="number" name="sectionId" placeholder="Enter Section ID" required style="width: auto;">
            <button type="submit" style="width: auto;">View Assignments</button>
        </form>

        <% 
            List<Assignment> assignments = (List<Assignment>) request.getAttribute("assignments");
            if (assignments != null) {
        %>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Due Date</th>
                    <th>Max Points</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% if (!assignments.isEmpty()) {
                        for (Assignment asm : assignments) {
                %>
                <tr>
                    <td><%= asm.getAssignmentId() %></td>
                    <td><%= asm.getTitle() %></td>
                    <td><%= asm.getDueDate() %></td>
                    <td><%= asm.getMaxPoints() %></td>
                    <td><a href="ViewSubmissionServlet?action=viewByAssignment&assignmentId=<%= asm.getAssignmentId() %>">Grade Submissions</a></td>
                </tr>
                <%      }
                    } else { %>
                <tr><td colspan="5" style="text-align: center;">No assignments found for this section.</td></tr>
                <% } %>
            </tbody>
        </table>
        <% } %>
        <br>
        <div style="text-align: center;"><a href="Instructor-dashboard.jsp">Back to Dashboard</a></div>
    </div>
</body>
</html>
