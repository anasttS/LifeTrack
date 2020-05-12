package com.itis.app.service;

import com.itis.app.model.Dataset;
import com.itis.app.model.User;
import com.itis.app.repository.DatasetRepository;
import com.itis.app.repository.NoteRepository;
import com.itis.app.scope.SessionBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.YearMonth;
import java.util.ArrayList;

@Service
public class AnalyseDataServiceImpl implements AnalyseDataService {

    @Autowired
    SessionBean sessionBean;

    @Autowired
    NoteRepository noteRepository;

    @Autowired
    DatasetRepository datasetRepository;

    @Override
    public void getPercentOfActivityInYearByEachMonth(Integer year) {
        String date;
        User user = sessionBean.getUser();
      //  System.out.println(user.toString());
        ArrayList<Dataset> datasets = datasetRepository.findAllByUser(user);
        ArrayList<Float> percents = new ArrayList<>();
        for (int month = 1; month <= 12; month++) {
            YearMonth yearMonthObject = YearMonth.of(year, month);
            Integer daysInMonth = yearMonthObject.lengthOfMonth();
            if (month < 10) {
                date = year + "-" + "0" + month + "-";
            } else {
                date = year + "-" + month + "-";
            }
            Integer notesInMonthFromUser = (noteRepository.findByUserAndDateContains(user, date)).size();

            Float percent = Float.valueOf((notesInMonthFromUser * 100) / daysInMonth);
            percents.add(percent);
        }

        if (datasets.size() != 0) {
            String monthstr = null;
            int monthth = 0;
            for (Dataset dataset : datasets) {
                monthth++;
                if (monthth < 10) {
                    monthstr = "0" + monthth;
                    dataset.setMonth(monthstr);
                } else {
                    dataset.setMonth(Integer.toString(monthth));
                }
                dataset.setYear(Integer.toString(year));
                dataset.setPercent(percents.get(monthth - 1));
                dataset.setUser(user);
                datasetRepository.save(dataset);
            }
        } else {
            for (int month = 1; month <= 12; month++) {
                if (month < 10) {
                    Dataset data = Dataset.builder()
                            .month("0" + month)
                            .year(Integer.toString(year))
                            .percent(percents.get(month - 1))
                            .user(user)
                            .build();
                    datasetRepository.save(data);
                } else {
                    Dataset data = Dataset.builder()
                            .month(Integer.toString(month))
                            .year(Integer.toString(year))
                            .percent(percents.get(month - 1))
                            .user(user)
                            .build();
                    datasetRepository.save(data);
                }
            }


        }
    }
}
