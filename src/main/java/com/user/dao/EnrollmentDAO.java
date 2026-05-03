package com.user.dao;

import com.user.model.Enrollment;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EnrollmentDAO {
    private Connection connection;

    public EnrollmentDAO(Connection connection) {
        this.connection = connection;
    }

    public boolean enrollStudent(int studentId, int sectionId) {
        String sql = "INSERT INTO enrollments (student_id, section_id) VALUES (?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, studentId);
            stmt.setInt(2, sectionId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Enrollment> getEnrollmentsForStudent(int studentId) {
        String sql = "SELECT * FROM enrollments WHERE student_id = ?";
        List<Enrollment> enrollments = new ArrayList<>();
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, studentId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Enrollment enrollment = new Enrollment();
                enrollment.setEnrollmentId(rs.getInt("enrollment_id"));
                enrollment.setStudentId(rs.getInt("student_id"));
                enrollment.setSectionId(rs.getInt("section_id"));
                enrollment.setGrade(rs.getString("grade"));
                enrollment.setEnrolledAt(rs.getTimestamp("enrolled_at"));
                enrollments.add(enrollment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return enrollments;
    }
}
