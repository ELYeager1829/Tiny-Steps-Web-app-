package za.ac.tut.entities;

import java.io.Serializable;
import java.time.LocalDate;
import javax.persistence.*;

@Entity
public class Report implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer reportId;

    @ManyToOne
    @JoinColumn(name = "student_id")
    private Student student;

    @Column
    private LocalDate reportDate;

    @Column(columnDefinition = "TEXT")
    private String meals;

    @Column(columnDefinition = "TEXT")
    private String napTime;

    @Column(columnDefinition = "TEXT")
    private String activities;

    @Column(columnDefinition = "TEXT")
    private String healthNotes;

    @ManyToOne
    @JoinColumn(name = "uploaded_by")
    private Teacher uploadedBy;

    // Getters and Setters

    public Integer getReportId() {
        return reportId;
    }

    public void setReportId(Integer reportId) {
        this.reportId = reportId;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public LocalDate getReportDate() {
        return reportDate;
    }

    public void setReportDate(LocalDate reportDate) {
        this.reportDate = reportDate;
    }

    public String getMeals() {
        return meals;
    }

    public void setMeals(String meals) {
        this.meals = meals;
    }

    public String getNapTime() {
        return napTime;
    }

    public void setNapTime(String napTime) {
        this.napTime = napTime;
    }

    public String getActivities() {
        return activities;
    }

    public void setActivities(String activities) {
        this.activities = activities;
    }

    public String getHealthNotes() {
        return healthNotes;
    }

    public void setHealthNotes(String healthNotes) {
        this.healthNotes = healthNotes;
    }

    public Teacher getUploadedBy() {
        return uploadedBy;
    }

    public void setUploadedBy(Teacher uploadedBy) {
        this.uploadedBy = uploadedBy;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (reportId != null ? reportId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Report)) {
            return false;
        }
        Report other = (Report) object;
        return (this.reportId != null || other.reportId == null) && (this.reportId == null || this.reportId.equals(other.reportId));
    }

    @Override
    public String toString() {
        return "za.ac.tut.entities.DailyReport[ id=" + reportId + " ]";
    }
}
