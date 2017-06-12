package hstc.edu.cn.mapper;

import hstc.edu.cn.po.Repair;

import java.util.List;
import java.util.Map;

/**
 * Created by win8 on 2017/6/8.
 */
public interface RepairMapper {
//    获取报修的信息
    public List<Repair> getRepair(Map<String,Object> map);
//    获取报修信息的总条数
    public long getRepairTotal(Map<String,Object> map);
//    批量删除
    public void deleteRepair(Integer[] position);
//    获取单个报修信息
    public Repair getOneRepair(int repairNum);
//    更新报修状态，0为未审批，1为通过，-1为不通过
    public void updateRepair(Repair repair);
//     搜索报修信息
    public List<Repair> searchRepair(Map<String,Object> map);
//    搜索信息的总条数
    public long getRepairSearchAll(Map<String,Object> map);
//    前台插入报修信息
    public void addRepair(Repair repair);
//    前台获取报修信息
    public List<Repair> getRepairByNum(int studentNum);
}
