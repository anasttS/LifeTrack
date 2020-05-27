package com.itis.app.service;

import com.itis.app.aspects.LogExecutionTime;
import com.itis.app.model.Dataset;
import com.itis.app.repository.DatasetRepository;
import com.itis.app.scope.SessionBean;
import lombok.SneakyThrows;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.block.BlockBorder;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.renderer.category.BarRenderer;
import org.jfree.chart.util.ResourceBundleWrapper;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.ui.ExtensionFileFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.mail.Session;
import javax.swing.*;
import java.io.File;
import java.util.ArrayList;
import java.util.ResourceBundle;

@Service
public class GraphicsServiceImpl implements GraphicsService {


    @Autowired
    SessionBean sessionBean;

    @Autowired
    DatasetRepository datasetRepository;

    @Autowired
    AnalyseDataService analyseDataService;


    public static int getCurrentYear() {
        java.util.Calendar calendar = java.util.Calendar.getInstance(java.util.TimeZone.getDefault(), java.util.Locale.getDefault());
        calendar.setTime(new java.util.Date());
        return calendar.get(java.util.Calendar.YEAR);
    }

    private void createData() {
        analyseDataService.getPercentOfActivityInYearByEachMonth(getCurrentYear());
    }


    private CategoryDataset createDataset() {
        createData();
        ArrayList<Float> percents = new ArrayList<>();
        ArrayList<Dataset> datasets = datasetRepository.getAllByUserAndYear(sessionBean.getUser(), Integer.toString(getCurrentYear()));

        for (Dataset dataset : datasets) {
            percents.add(dataset.getPercent());
        }

        DefaultCategoryDataset datasetForYear = new DefaultCategoryDataset();
        datasetForYear.addValue(percents.get(0), "activity", "Январь");
        datasetForYear.addValue(percents.get(1), "activity", "Февраль");
        datasetForYear.addValue(percents.get(2), "activity", "Март");
        datasetForYear.addValue(percents.get(3), "activity", "Апрель");
        datasetForYear.addValue(percents.get(4), "activity", "Май");
        datasetForYear.addValue(percents.get(5), "activity", "Июнь");
        datasetForYear.addValue(percents.get(6), "activity", "Июль");
        datasetForYear.addValue(percents.get(7), "activity", "Август");
        datasetForYear.addValue(percents.get(8), "activity", "Сентябрь");
        datasetForYear.addValue(percents.get(9), "activity", "Октябрь");
        datasetForYear.addValue(percents.get(10), "activity", "Ноябрь");
        datasetForYear.addValue(percents.get(11), "activity", "Декабрь");
        return datasetForYear;
    }

    private JFreeChart createChart() {
        CategoryDataset dataset = createDataset();
        JFreeChart chart = ChartFactory.createBarChart(
                "",
                null,                   // x-axis label
                "Процент активности",                // y-axis label
                dataset);

        CategoryPlot plot = (CategoryPlot) chart.getPlot();
        final NumberAxis rangeAxis = (NumberAxis) plot.getRangeAxis();
        rangeAxis.setRange(0.0, 100.0);
        rangeAxis.setStandardTickUnits(NumberAxis.createIntegerTickUnits());
        BarRenderer renderer = (BarRenderer) plot.getRenderer();
        renderer.setDrawBarOutline(false);
        chart.getLegend().setFrame(BlockBorder.NONE);
        return chart;
    }

    @Override
    @SneakyThrows
    @LogExecutionTime
    public void saveChart(Long id) {

        String filename = "C:\\ITIS.JAVA\\LifeTrack\\src\\main\\resources\\static\\assets\\img";
        filename = filename + "\\chart" + id + ".png";
        ChartUtilities.saveChartAsPNG(new File(filename), createChart(), 1000, 200);
    }
}


