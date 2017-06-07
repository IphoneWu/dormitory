package hstc.edu.cn.mapper;

import hstc.edu.cn.po.Report;

import java.util.List;
import java.util.Map;

/**
 * Created by win8 on 2017/6/5.
 */
public interface ReportMapper {
//    插入通告
    public void addReport(Report report);
//    获取所有通告，区分超管和普通管理员
    public List<Report> getAllReport(Map<String,Object>map);
//    获取通告总条数
    public long getReportTotal(Map<String,Object>map);
//    获取修改的通告
    public Report getModifyReport(int reportId);
//    修改通告
    public void modifyReport(Report report);
    //    批量删除通告信息
    public void deleteReport(Integer[] position);

    //    搜索通告信息
    public List<Report> searchReport(Map<String,Object>map);
    //    获取总搜索条数
    public long getReportSearchAll(Map<String,Object>map);
}
