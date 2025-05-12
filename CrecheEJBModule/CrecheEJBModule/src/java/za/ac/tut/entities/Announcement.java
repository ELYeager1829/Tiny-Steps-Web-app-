
package za.ac.tut.entities;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;
import javax.persistence.*;

@Entity
public class Announcement implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "announcement_id")
    private Integer announcementId;

    @Column(name ="title" ,length = 100)
    private String title;

    @Column(name = "body",length= 250, nullable = false)
    private String body;

    @Enumerated(EnumType.ORDINAL)
    @Column(name = "target_role",length = 10)
    private TargetRole targetRole;

    @Column(name = "posted_at" ,updatable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date postedAt;

    @ManyToOne
    @JoinColumn(name = "posted_by")
    private AppUser postedBy;

    // Getters and Setters

    public Integer getAnnouncementId() {
        return announcementId;
    }

    public void setAnnouncementId(Integer announcementId) {
        this.announcementId = announcementId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public TargetRole getTargetRole() {
        return targetRole;
    }

    public void setTargetRole(TargetRole targetRole) {
        this.targetRole = targetRole;
    }

    public Date getPostedAt() {
        return postedAt;
    }

    public void setPostedAt(Date postedAt) {
        this.postedAt = postedAt;
    }

    public AppUser getPostedBy() {
        return postedBy;
    }

    public void setPostedBy(AppUser postedBy) {
        this.postedBy = postedBy;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (announcementId != null ? announcementId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Announcement)) {
            return false;
        }
        Announcement other = (Announcement) object;
        return (this.announcementId != null || other.announcementId == null) && (this.announcementId == null || this.announcementId.equals(other.announcementId));
    }

    @Override
    public String toString() {
        return "za.ac.tut.entities.Announcement[ id=" + announcementId + " ]";
    }

    public enum TargetRole {
        ALL, TEACHER, PARENT
    }
}
