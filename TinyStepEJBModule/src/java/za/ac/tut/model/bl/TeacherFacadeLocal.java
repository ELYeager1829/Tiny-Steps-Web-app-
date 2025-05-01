/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package za.ac.tut.model.bl;

import jakarta.ejb.Local;
import java.util.List;
import za.ac.tut.model.entity.Teacher;

/**
 *
 * @author El
 */
@Local
public interface TeacherFacadeLocal {

    void create(Teacher teacher);

    void edit(Teacher teacher);

    void remove(Teacher teacher);

    Teacher find(Object id);

    List<Teacher> findAll();

    List<Teacher> findRange(int[] range);

    int count();
    
}
