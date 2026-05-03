package com.user.controller;

import com.user.dao.SectionDAO;
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

@WebServlet("/section")
public class SectionServlet extends HttpServlet {
    private SectionDAO sectionDAO;

    @Override
    public void init() throws ServletException {
        Connection connection = DBConnection.getConnection();
        sectionDAO = new SectionDAO(connection);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.isEmpty() || "list".equals(action)) {
            List<Section> sections = sectionDAO.getAllSections();
            request.setAttribute("sections", sections);
            request.getRequestDispatcher("Admin-section-management.jsp").forward(request, response);
        } else if ("delete".equals(action)) {
            int sectionId = Integer.parseInt(request.getParameter("sectionId"));
            sectionDAO.deleteSection(sectionId);
            response.sendRedirect("section?action=list");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("create".equals(action)) {
            Section section = new Section();
            section.setCourseId(Integer.parseInt(request.getParameter("courseId")));
            section.setInstructorId(Integer.parseInt(request.getParameter("instructorId")));
            section.setSemesterId(Integer.parseInt(request.getParameter("semesterId")));
            section.setRoom(request.getParameter("room"));
            section.setCapacity(Integer.parseInt(request.getParameter("capacity")));
            sectionDAO.createSection(section);
            response.sendRedirect("section?action=list");
        }
    }
}
