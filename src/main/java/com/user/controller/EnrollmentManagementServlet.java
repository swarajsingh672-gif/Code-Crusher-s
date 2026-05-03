package com.user.controller;

import com.user.dao.EnrollmentDAO;
import com.user.dao.SectionDAO;
import com.user.model.Enrollment;
import com.user.model.Section;
import com.user.utility.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/enrollment")
public class EnrollmentManagementServlet extends HttpServlet {
    private EnrollmentDAO enrollmentDAO;
    private SectionDAO sectionDAO;

    @Override
    public void init() throws ServletException {
        Connection connection = DBConnection.getConnection();
        enrollmentDAO = new EnrollmentDAO(connection);
        sectionDAO = new SectionDAO(connection);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.isEmpty() || "listAvailable".equals(action)) {
            List<Section> availableSections = sectionDAO.getAllSections();
            request.setAttribute("sections", availableSections);
            request.getRequestDispatcher("Student-registration.jsp").forward(request, response);
        } else if ("myEnrollments".equals(action)) {
            javax.servlet.http.HttpSession session = request.getSession();
            Integer sessionUserId = (Integer) session.getAttribute("userId");
            if (sessionUserId != null) {
                List<Enrollment> myEnrollments = enrollmentDAO.getEnrollmentsForStudent(sessionUserId);
                request.setAttribute("enrollments", myEnrollments);
            }
            request.getRequestDispatcher("Student-registration.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("enroll".equals(action)) {
            int sectionId = Integer.parseInt(request.getParameter("sectionId"));
            int studentId = (Integer) request.getSession().getAttribute("userId");

            boolean success = enrollmentDAO.enrollStudent(studentId, sectionId);
            if (success) {
                request.setAttribute("message", "Successfully enrolled!");
            } else {
                request.setAttribute("error", "Enrollment failed. You might be already enrolled.");
            }
            doGet(request, response);
        }
    }
}
