/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package za.ac.tut.model.bl;

import jakarta.ejb.Local;
import java.util.List;
import za.ac.tut.model.entity.AppUser;

/**
 *
 * @author El
 */
@Local
public interface AppUserFacadeLocal {

    void create(AppUser appUser);

    void edit(AppUser appUser);

    void remove(AppUser appUser);

    AppUser find(Object id);

    List<AppUser> findAll();

    List<AppUser> findRange(int[] range);

    int count();
    
}
