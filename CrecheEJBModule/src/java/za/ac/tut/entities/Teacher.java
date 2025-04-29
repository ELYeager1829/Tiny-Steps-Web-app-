package za.ac.tut.entities;

import java.io.Serializable;
import javax.persistence.*;

@Entity
public class Teacher implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    private Integer teacherId;

    @OneToOne
    @MapsId
    @JoinColumn(name = "teacher_id")
    private AppUser user;

    @Column(nullable = false, length = 100)
    private String fullName;

    @Column(length = 20)
    private String phone;

    @Column(length = 100)
    private String email;

    // Getters and Setters

    public Integer getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(Integer teacherId) {
        this.teacherId = teacherId;
    }

    public AppUser getUser() {
        return user;
    }

    public void setUser(AppUser user) {
        this.user = user;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (teacherId != null ? teacherId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Teacher)) {
            return false;
        }
        Teacher other = (Teacher) object;
        return (this.teacherId != null || other.teacherId == null) && (this.teacherId == null || this.teacherId.equals(other.teacherId));
    }

    @Override
    public String toString() {
        return "za.ac.tut.entities.Teacher[ id=" + teacherId + " ]";
    }
}
