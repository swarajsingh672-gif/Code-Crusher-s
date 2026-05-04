package com.user.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.user.dao.AdminDashboardDAO;
import com.user.model.Department;

@WebServlet("/adminDashboard")
public class AdminDashboardServlet extends HttpServlet {
    private AdminDashboardDAO adminDashboardDAO;

    @Override
    public void init() throws ServletException {
        adminDashboardDAO = new AdminDashboardDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");

        if ("departments".equals(action)) {
            List<Department> departments = adminDashboardDAO.getAllDepartments();
            request.setAttribute("departments", departments);
            request.getRequestDispatcher("Admin-department-list.jsp").forward(request, response);
            return;
        }

        // Default action: Fetch counts and show dashboard
        int deptCount = adminDashboardDAO.getDepartmentCount();
        int userCount = adminDashboardDAO.getUserCount();
        int courseCount = adminDashboardDAO.getCourseCount();

        request.setAttribute("deptCount", deptCount);
        request.setAttribute("userCount", userCount);
        request.setAttribute("courseCount", courseCount);

        request.getRequestDispatcher("Admin-dashboard.jsp").forward(request, response);
    }
}
