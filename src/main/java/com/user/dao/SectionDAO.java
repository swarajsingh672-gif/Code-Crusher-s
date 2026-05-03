package com.user.dao;

import com.user.model.Section;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SectionDAO {
    private Connection connection;

    public SectionDAO(Connection connection) {
        this.connection = connection;
    }

    public List<Section> getAllSections() {
        List<Section> sections = new ArrayList<>();
        String query = "SELECT * FROM sections";
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                Section section = new Section();
                section.setSectionId(rs.getInt("section_id"));
                section.setCourseId(rs.getInt("course_id"));
                section.setInstructorId(rs.getInt("instructor_id"));
                section.setSemesterId(rs.getInt("semester_id"));
                section.setRoom(rs.getString("room"));
                section.setCapacity(rs.getInt("capacity"));
                sections.add(section);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return sections;
    }

    public void createSection(Section section) {
        String query = "INSERT INTO sections (course_id, instructor_id, semester_id, room, capacity) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, section.getCourseId());
            stmt.setInt(2, section.getInstructorId());
            stmt.setInt(3, section.getSemesterId());
            stmt.setString(4, section.getRoom());
            stmt.setInt(5, section.getCapacity());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteSection(int sectionId) {
        String query = "DELETE FROM sections WHERE section_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, sectionId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
