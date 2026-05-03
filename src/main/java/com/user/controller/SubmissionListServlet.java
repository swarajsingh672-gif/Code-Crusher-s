package com.user.controller;

import java.io.IOException;
import java.sql.Connection;

import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.user.dao.SubmissionsDAO;
import com.user.model.Submissions;

@WebServlet("/ViewSubmissionServlet")
public class SubmissionListServlet extends HttpServlet {
    private SubmissionsDAO submissionsDAO;

    @Override
    public void init() throws ServletException {
        try {
            // Establish database connection using utility class
            Connection connection = com.user.utility.DBConnection.getConnection();
            submissionsDAO = new SubmissionsDAO(connection);
        } catch (Exception e) {
            throw new ServletException("Failed to initialize DAO", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("viewByAssignment".equals(action)) {
            try {
                int assignmentId = Integer.parseInt(request.getParameter("assignmentId"));
                List<Submissions> submissions = submissionsDAO.getSubmissionsByAssignment(assignmentId);
                request.setAttribute("submissions", submissions);
                request.getRequestDispatcher("Instructor-submissions.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("message", "Failed to fetch submissions");
                request.getRequestDispatcher("Instructor-submissions.jsp").forward(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("submit".equals(action)) {
            try {
                Submissions submission = new Submissions();
                submission.setAssignmentId(Integer.parseInt(request.getParameter("assignmentId")));
                submission.setStudentId(Integer.parseInt(request.getParameter("studentId")));
                submission.setFilePath(request.getParameter("filePath")); // In real app, this would handle file upload
                
                boolean success = submissionsDAO.submitAssignment(submission);
                request.setAttribute("message", success ? "Submitted successfully!" : "Failed to submit.");
                request.getRequestDispatcher("Student-assignments.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if ("grade".equals(action)) {
            try {
                int submissionId = Integer.parseInt(request.getParameter("submissionId"));
                double grade = Double.parseDouble(request.getParameter("grade"));
                String feedback = request.getParameter("feedback");
                
                submissionsDAO.gradeSubmission(submissionId, grade, feedback);
                
                int assignmentId = Integer.parseInt(request.getParameter("assignmentId"));
                response.sendRedirect("ViewSubmissionServlet?action=viewByAssignment&assignmentId=" + assignmentId);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
