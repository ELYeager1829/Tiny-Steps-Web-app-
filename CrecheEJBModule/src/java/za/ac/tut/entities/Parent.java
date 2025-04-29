package za.ac.tut.entities;

import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name = "parent")
public class Parent implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    private Integer parentId;

    @OneToOne
    @MapsId
    @JoinColumn(name = "parent_id")
    private AppUser user;

    @Column(nullable = false, length = 100)
    private String fullName;

    @Column(length = 20)
    private String phone;

    @Column(length = 100)
    private String email;

    @Column(columnDefinition = "TEXT")
    private String address;

    // Getters and Setters

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (parentId != null ? parentId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Parent)) {
            return false;
        }
        Parent other = (Parent) object;
        return (this.parentId != null || other.parentId == null) && (this.parentId == null || this.parentId.equals(other.parentId));
    }

    @Override
    public String toString() {
        return "za.ac.tut.entities.Parent[ id=" + parentId + " ]";
    }
}
