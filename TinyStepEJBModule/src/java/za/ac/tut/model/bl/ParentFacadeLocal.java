/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package za.ac.tut.model.bl;

import jakarta.ejb.Local;
import java.util.List;
import za.ac.tut.model.entity.Parent;

/**
 *
 * @author El
 */
@Local
public interface ParentFacadeLocal {

    void create(Parent parent);

    void edit(Parent parent);

    void remove(Parent parent);

    Parent find(Object id);

    List<Parent> findAll();

    List<Parent> findRange(int[] range);

    int count();
    
}
