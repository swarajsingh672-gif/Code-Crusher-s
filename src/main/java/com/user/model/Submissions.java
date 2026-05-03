package com.user.model;

public class Submissions {
    private int submissionId;
    private int assignmentId;
    private int studentId;
    private String filePath;
    private java.sql.Timestamp submittedAt;
    private Double grade;
    private String feedback;

    public int getSubmissionId() { return submissionId; }
    public void setSubmissionId(int submissionId) { this.submissionId = submissionId; }

    public int getAssignmentId() { return assignmentId; }
    public void setAssignmentId(int assignmentId) { this.assignmentId = assignmentId; }

    public int getStudentId() { return studentId; }
    public void setStudentId(int studentId) { this.studentId = studentId; }

    public String getFilePath() { return filePath; }
    public void setFilePath(String filePath) { this.filePath = filePath; }

    public java.sql.Timestamp getSubmittedAt() { return submittedAt; }
    public void setSubmittedAt(java.sql.Timestamp submittedAt) { this.submittedAt = submittedAt; }

    public Double getGrade() { return grade; }
    public void setGrade(Double grade) { this.grade = grade; }

    public String getFeedback() { return feedback; }
    public void setFeedback(String feedback) { this.feedback = feedback; }
}
