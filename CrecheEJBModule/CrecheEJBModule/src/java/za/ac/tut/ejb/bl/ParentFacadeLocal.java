/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package za.ac.tut.ejb.bl;

import java.util.List;
import javax.ejb.Local;
import za.ac.tut.entities.Parent;

/**
 *
 * @author user
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
