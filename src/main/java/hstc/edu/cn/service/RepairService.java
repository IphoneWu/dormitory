package hstc.edu.cn.service;

import hstc.edu.cn.po.Repair;

import java.util.List;
import java.util.Map;

/**
 * Created by win8 on 2017/6/8.
 */
public interface RepairService {
    //    获取报修的信息
    public List<Repair> getRepair(Map<String,Object> map);
    //    获取报修信息的总条数
    public long getRepairTotal(Map<String,Object> map);
}
