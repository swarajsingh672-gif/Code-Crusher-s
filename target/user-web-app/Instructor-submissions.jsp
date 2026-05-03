<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.user.model.Submissions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Grade Submissions</title>
    <link rel="stylesheet" href="CSS/University-Portal.css">
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f9; }
        .container { max-width: 900px; margin: 50px auto; padding: 20px; background: #fff; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        h1, h2 { text-align: center; color: #333; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ddd; padding: 10px; text-align: left; }
        th { background-color: #002147; color: white; }
        input[type="number"], input[type="text"] { width: 100%; padding: 5px; box-sizing: border-box; }
        button { background-color: #002147; color: #fff; border: none; padding: 5px 10px; border-radius: 5px; cursor: pointer; }
        button:hover { background-color: #003366; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Grade Submissions</h1>

        <% 
            List<Submissions> submissions = (List<Submissions>) request.getAttribute("submissions");
            if (submissions != null) {
        %>
        <table>
            <thead>
                <tr>
                    <th>Submission ID</th>
                    <th>Student ID</th>
                    <th>File Path</th>
                    <th>Submitted At</th>
                    <th>Grade</th>
                    <th>Feedback</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% if (!submissions.isEmpty()) {
                        for (Submissions sub : submissions) {
                %>
                <tr>
                    <form action="ViewSubmissionServlet" method="post" style="margin: 0;">
                        <input type="hidden" name="action" value="grade">
                        <input type="hidden" name="submissionId" value="<%= sub.getSubmissionId() %>">
                        <input type="hidden" name="assignmentId" value="<%= sub.getAssignmentId() %>">
                        <td><%= sub.getSubmissionId() %></td>
                        <td><%= sub.getStudentId() %></td>
                        <td><a href="<%= sub.getFilePath() %>" target="_blank">View File</a></td>
                        <td><%= sub.getSubmittedAt() %></td>
                        <td><input type="number" name="grade" step="0.01" value="<%= sub.getGrade() != null ? sub.getGrade() : "" %>" required></td>
                        <td><input type="text" name="feedback" value="<%= sub.getFeedback() != null ? sub.getFeedback() : "" %>"></td>
                        <td><button type="submit">Save Grade</button></td>
                    </form>
                </tr>
                <%      }
                    } else { %>
                <tr><td colspan="7" style="text-align: center;">No submissions found for this assignment.</td></tr>
                <% } %>
            </tbody>
        </table>
        <% } %>
        <br>
        <div style="text-align: center;"><a href="Instructor-dashboard.jsp">Back to Dashboard</a></div>
    </div>
</body>
</html>
