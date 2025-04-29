/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package za.ac.tut.ejb.bl;

import java.util.List;
import javax.ejb.Local;
import za.ac.tut.entities.Announcement;

/**
 *
 * @author user
 */
@Local
public interface AnnouncementFacadeLocal {

    void create(Announcement announcement);

    void edit(Announcement announcement);

    void remove(Announcement announcement);

    Announcement find(Object id);

    List<Announcement> findAll();

    List<Announcement> findRange(int[] range);

    int count();
    
}
