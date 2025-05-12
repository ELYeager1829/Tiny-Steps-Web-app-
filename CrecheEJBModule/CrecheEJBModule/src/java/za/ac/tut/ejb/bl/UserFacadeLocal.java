/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package za.ac.tut.ejb.bl;

import java.util.List;
import javax.ejb.Local;
import za.ac.tut.entities.AppUser;

/**
 *
 * @author user
 */
@Local
public interface UserFacadeLocal {

    void create(AppUser user);

    void edit(AppUser user);

    void remove(AppUser user);

    AppUser find(Object id);

    List<AppUser> findAll();

    List<AppUser> findRange(int[] range);

    int count();
    
}
