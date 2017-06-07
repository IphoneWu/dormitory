package hstc.edu.cn.service.Impl;

import hstc.edu.cn.mapper.ReportMapper;
import hstc.edu.cn.po.Report;
import hstc.edu.cn.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by win8 on 2017/6/5.
 */
@Service("reportService")
public class ReportServiceImpl implements ReportService {
    @Autowired
    ReportMapper reportMapper;
    public void addReport(Report report) {
        reportMapper.addReport(report);
    }

    public List<Report> getAllReport(Map<String, Object> map) {
        return reportMapper.getAllReport(map);
    }

    public long getReportTotal(Map<String, Object> map) {
        return reportMapper.getReportTotal(map);
    }

    public Report getModifyReport(int reportId) {
        return reportMapper.getModifyReport(reportId);
    }

    public void modifyReport(Report report) {
        reportMapper.modifyReport(report);
    }

    public void deleteReport(Integer[] position) {
        reportMapper.deleteReport(position);
    }

    public List<Report> searchReport(Map<String, Object> map) {
        return reportMapper.searchReport(map);
    }

    public long getReportSearchAll(Map<String, Object> map) {
        return reportMapper.getReportSearchAll(map);
    }
}
