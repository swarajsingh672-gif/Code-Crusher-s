<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.user.model.Assignment" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Assignments</title>
    <link rel="stylesheet" href="CSS/global.css">
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f9; }
        .container { max-width: 800px; margin: 50px auto; padding: 20px; background: #fff; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        h1, h2 { text-align: center; color: #333; }
        form { display: flex; flex-direction: column; gap: 15px; margin-bottom: 30px; }
        input { padding: 10px; font-size: 16px; border: 1px solid #ddd; border-radius: 5px; }
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
        <h1>My Assignments</h1>

        <% if (request.getAttribute("message") != null) { %>
            <p class="message"><%= request.getAttribute("message") %></p>
        <% } %>

        <form action="AssignmentManagementServlet" method="get" style="flex-direction: row; align-items: center; justify-content: center;">
            <input type="hidden" name="action" value="studentViewBySection">
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
                    <th>Description</th>
                    <th>Due Date</th>
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
                    <td><%= asm.getDescription() %></td>
                    <td><%= asm.getDueDate() %></td>
                    <td>
                        <form action="ViewSubmissionServlet" method="post" style="margin: 0; display: flex; flex-direction: column; gap: 5px;">
                            <input type="hidden" name="action" value="submit">
                            <input type="hidden" name="assignmentId" value="<%= asm.getAssignmentId() %>">
                            <input type="hidden" name="studentId" value="<%= session.getAttribute("userId") %>">
                            <input type="text" name="filePath" placeholder="File URL / Path" required style="padding: 5px; font-size: 12px;">
                            <button type="submit" style="padding: 5px; font-size: 12px;">Submit Work</button>
                        </form>
                    </td>
                </tr>
                <%      }
                    } else { %>
                <tr><td colspan="5" style="text-align: center;">No assignments found for this section.</td></tr>
                <% } %>
            </tbody>
        </table>
        <% } %>
        <br>
        <div style="text-align: center;"><a href="User-dashboard.jsp">Back to Dashboard</a></div>
    </div>
</body>
</html>
