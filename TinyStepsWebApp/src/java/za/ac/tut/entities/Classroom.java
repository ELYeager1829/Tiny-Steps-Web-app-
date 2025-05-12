/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package za.ac.tut.entities;

import java.util.List;

/**
 *
 * @author user
 */
public class Classroom {

    private Integer id;
    private String classGroup;
    private List<Student> students;

    public Classroom() {
    }

    public Integer getId() {
        return id;
    }

    public String getClassGroup() {
        return classGroup;
    }

    public List<Student> getStudents() {
        return students;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setClassGroup(String classGroup) {
        this.classGroup = classGroup;
    }

    public void setStudents(List<Student> students) {
        this.students = students;
    }
    
    public boolean addStudentToClassgroup(Student student){
        
        if(student!=null){
            students.add(student);
            return true;
        }
        return false;
    }
}
