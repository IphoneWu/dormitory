package hstc.edu.cn.service;

import hstc.edu.cn.po.Report;

import java.util.List;
import java.util.Map;

/**
 * Created by win8 on 2017/6/5.
 */
public interface ReportService {
    //    插入通告
    public void addReport(Report report);
    //    获取所有通告，区分超管和普通管理员
    public List<Report> getAllReport(Map<String,Object> map);
    //    获取通告总条数
    public long getReportTotal(Map<String,Object>map);
}
