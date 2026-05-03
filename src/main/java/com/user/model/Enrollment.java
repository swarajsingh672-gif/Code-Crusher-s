package com.user.model;

import java.sql.Timestamp;

public class Enrollment {
    private int enrollmentId;
    private int studentId;
    private int sectionId;
    private String grade;
    private Timestamp enrolledAt;

    public Enrollment() {}

    public Enrollment(int enrollmentId, int studentId, int sectionId, String grade, Timestamp enrolledAt) {
        this.enrollmentId = enrollmentId;
        this.studentId = studentId;
        this.sectionId = sectionId;
        this.grade = grade;
        this.enrolledAt = enrolledAt;
    }

    public int getEnrollmentId() { return enrollmentId; }
    public void setEnrollmentId(int enrollmentId) { this.enrollmentId = enrollmentId; }

    public int getStudentId() { return studentId; }
    public void setStudentId(int studentId) { this.studentId = studentId; }

    public int getSectionId() { return sectionId; }
    public void setSectionId(int sectionId) { this.sectionId = sectionId; }

    public String getGrade() { return grade; }
    public void setGrade(String grade) { this.grade = grade; }

    public Timestamp getEnrolledAt() { return enrolledAt; }
    public void setEnrolledAt(Timestamp enrolledAt) { this.enrolledAt = enrolledAt; }
}
