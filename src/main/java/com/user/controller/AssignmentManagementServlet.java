package com.user.controller;

import com.user.dao.AssignmentDAO;
import com.user.model.Assignment;
import com.user.utility.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.util.List;

@WebServlet(name = "AssignmentManagementServlet", urlPatterns = { "/AssignmentManagementServlet", "/createAssignment", "/viewAssignments" })
public class AssignmentManagementServlet extends HttpServlet {
    private AssignmentDAO assignmentDAO;

    @Override
    public void init() throws ServletException {
        Connection connection = DBConnection.getConnection();
        assignmentDAO = new AssignmentDAO(connection);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("create".equals(action)) {
            try {
                int sectionId = Integer.parseInt(request.getParameter("sectionId"));
                String title = request.getParameter("title");
                String description = request.getParameter("description");
                java.sql.Timestamp dueDate = null;
                String dueDateStr = request.getParameter("dueDate");
                if (dueDateStr != null && !dueDateStr.isEmpty()) {
                    dueDate = java.sql.Timestamp.valueOf(dueDateStr.replace("T", " ") + ":00");
                }
                int maxPoints = Integer.parseInt(request.getParameter("maxPoints"));

                Assignment assignment = new Assignment();
                assignment.setSectionId(sectionId);
                assignment.setTitle(title);
                assignment.setDescription(description);
                assignment.setDueDate(dueDate);
                assignment.setMaxPoints(maxPoints);

                boolean success = assignmentDAO.createAssignment(assignment);
                String message = success ? "Assignment created successfully!" : "Failed to create assignment.";
                request.setAttribute("message", message);
                request.getRequestDispatcher("Instructor-assignments.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("message", "An error occurred while creating the assignment.");
                request.getRequestDispatcher("Instructor-assignments.jsp").forward(request, response);
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("viewBySection".equals(action)) {
            try {
                int sectionId = Integer.parseInt(request.getParameter("sectionId"));
                List<Assignment> assignments = assignmentDAO.getAssignmentsBySection(sectionId);
                request.setAttribute("assignments", assignments);
                request.getRequestDispatcher("Instructor-assignments.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("message", "An error occurred while fetching assignments.");
                request.getRequestDispatcher("Instructor-assignments.jsp").forward(request, response);
            }
        } else if ("studentViewBySection".equals(action)) {
            try {
                int sectionId = Integer.parseInt(request.getParameter("sectionId"));
                List<Assignment> assignments = assignmentDAO.getAssignmentsBySection(sectionId);
                request.setAttribute("assignments", assignments);
                request.getRequestDispatcher("Student-assignments.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("message", "An error occurred while fetching assignments.");
                request.getRequestDispatcher("Student-assignments.jsp").forward(request, response);
            }
        }
    }
}
