package com.user.dao;

import com.user.model.CourseManagement;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CourseManagementDAO {
    private Connection connection;

    public CourseManagementDAO(Connection connection) {
        this.connection = connection;
    }

    public List<CourseManagement> getAllCourses() {
        List<CourseManagement> courses = new ArrayList<>();
        String query = "SELECT * FROM courses";

        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                CourseManagement course = new CourseManagement();
                course.setCourseId(rs.getInt("course_id"));
                course.setCourseCode(rs.getString("course_code"));
                course.setCourseName(rs.getString("course_name"));
                course.setCredits(rs.getInt("credits"));
                int deptId = rs.getInt("dept_id");
                if (!rs.wasNull()) course.setDeptId(deptId);
                courses.add(course);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return courses;
    }

    public CourseManagement getCourseById(int courseId) {
        String query = "SELECT * FROM courses WHERE course_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, courseId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    CourseManagement course = new CourseManagement();
                    course.setCourseId(rs.getInt("course_id"));
                    course.setCourseCode(rs.getString("course_code"));
                    course.setCourseName(rs.getString("course_name"));
                    course.setCredits(rs.getInt("credits"));
                    int deptId = rs.getInt("dept_id");
                    if (!rs.wasNull()) course.setDeptId(deptId);
                    return course;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void createCourse(CourseManagement course) {
        String query = "INSERT INTO courses (course_code, course_name, credits, dept_id) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, course.getCourseCode());
            stmt.setString(2, course.getCourseName());
            stmt.setInt(3, course.getCredits());
            if (course.getDeptId() != null) {
                stmt.setInt(4, course.getDeptId());
            } else {
                stmt.setNull(4, Types.INTEGER);
            }
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateCourse(CourseManagement course) {
        String query = "UPDATE courses SET course_code = ?, course_name = ?, credits = ?, dept_id = ? WHERE course_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, course.getCourseCode());
            stmt.setString(2, course.getCourseName());
            stmt.setInt(3, course.getCredits());
            if (course.getDeptId() != null) {
                stmt.setInt(4, course.getDeptId());
            } else {
                stmt.setNull(4, Types.INTEGER);
            }
            stmt.setInt(5, course.getCourseId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteCourse(int courseId) {
        String query = "DELETE FROM courses WHERE course_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, courseId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
