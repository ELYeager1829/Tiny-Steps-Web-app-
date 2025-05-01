/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package za.ac.tut.model.bl;

import jakarta.ejb.Local;
import java.util.List;
import za.ac.tut.model.entity.DailyReports;

/**
 *
 * @author El
 */
@Local
public interface DailyReportsFacadeLocal {

    void create(DailyReports dailyReports);

    void edit(DailyReports dailyReports);

    void remove(DailyReports dailyReports);

    DailyReports find(Object id);

    List<DailyReports> findAll();

    List<DailyReports> findRange(int[] range);

    int count();
    
}
