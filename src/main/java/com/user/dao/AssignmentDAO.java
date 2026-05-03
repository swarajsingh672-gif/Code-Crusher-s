package com.user.dao;

import com.user.model.Assignment;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AssignmentDAO {
    private final Connection connection;

    public AssignmentDAO(Connection connection) {
        this.connection = connection;
    }

    public boolean createAssignment(Assignment assignment) {
        String sql = "INSERT INTO assignments (section_id, title, description, due_date, max_points) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, assignment.getSectionId());
            stmt.setString(2, assignment.getTitle());
            stmt.setString(3, assignment.getDescription());
            stmt.setTimestamp(4, assignment.getDueDate());
            stmt.setInt(5, assignment.getMaxPoints());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Assignment> getAssignmentsBySection(int sectionId) {
        String sql = "SELECT * FROM assignments WHERE section_id = ?";
        List<Assignment> assignments = new ArrayList<>();
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, sectionId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Assignment assignment = new Assignment();
                assignment.setAssignmentId(rs.getInt("assignment_id"));
                assignment.setSectionId(rs.getInt("section_id"));
                assignment.setTitle(rs.getString("title"));
                assignment.setDescription(rs.getString("description"));
                assignment.setDueDate(rs.getTimestamp("due_date"));
                assignment.setMaxPoints(rs.getInt("max_points"));
                assignments.add(assignment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return assignments;
    }
}
