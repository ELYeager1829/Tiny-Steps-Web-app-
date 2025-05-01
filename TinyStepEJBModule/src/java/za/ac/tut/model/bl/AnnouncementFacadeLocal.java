/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package za.ac.tut.model.bl;

import jakarta.ejb.Local;
import java.util.List;
import za.ac.tut.model.entity.Announcement;

/**
 *
 * @author El
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
