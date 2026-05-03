package com.user.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.user.model.Submissions;

public class SubmissionsDAO {
    private Connection connection;

    public SubmissionsDAO(Connection connection) {
        this.connection = connection;
    }

    public boolean submitAssignment(Submissions submission) {
        String query = "INSERT INTO submissions (assignment_id, student_id, file_path) VALUES (?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, submission.getAssignmentId());
            stmt.setInt(2, submission.getStudentId());
            stmt.setString(3, submission.getFilePath());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean gradeSubmission(int submissionId, double grade, String feedback) {
        String query = "UPDATE submissions SET grade = ?, feedback = ? WHERE submission_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setDouble(1, grade);
            stmt.setString(2, feedback);
            stmt.setInt(3, submissionId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<Submissions> getSubmissionsByAssignment(int assignmentId) {
        List<Submissions> submissions = new ArrayList<>();
        String query = "SELECT * FROM submissions WHERE assignment_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, assignmentId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Submissions submission = new Submissions();
                submission.setSubmissionId(rs.getInt("submission_id"));
                submission.setAssignmentId(rs.getInt("assignment_id"));
                submission.setStudentId(rs.getInt("student_id"));
                submission.setFilePath(rs.getString("file_path"));
                submission.setSubmittedAt(rs.getTimestamp("submitted_at"));
                if (rs.getObject("grade") != null) {
                    submission.setGrade(rs.getDouble("grade"));
                }
                submission.setFeedback(rs.getString("feedback"));
                submissions.add(submission);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return submissions;
    }
}
