package com.user.model;

import java.sql.Date;

public class Assignment {
    private int assignmentId;
    private int sectionId;
    private String title;
    private String description;
    private java.sql.Timestamp dueDate;
    private int maxPoints;

    public int getAssignmentId() { return assignmentId; }
    public void setAssignmentId(int assignmentId) { this.assignmentId = assignmentId; }

    public int getSectionId() { return sectionId; }
    public void setSectionId(int sectionId) { this.sectionId = sectionId; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public java.sql.Timestamp getDueDate() { return dueDate; }
    public void setDueDate(java.sql.Timestamp dueDate) { this.dueDate = dueDate; }

    public int getMaxPoints() { return maxPoints; }
    public void setMaxPoints(int maxPoints) { this.maxPoints = maxPoints; }
}
