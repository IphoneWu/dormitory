package hstc.edu.cn.service.Impl;

import hstc.edu.cn.mapper.RepairMapper;
import hstc.edu.cn.po.Repair;
import hstc.edu.cn.service.RepairService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by win8 on 2017/6/8.
 */
@Service("repairService")
public class RepairServiceImpl implements RepairService {
    @Autowired
    RepairMapper repairMapper;
    public List<Repair> getRepair(Map<String, Object> map) {
        return repairMapper.getRepair(map);
    }

    public long getRepairTotal(Map<String, Object> map) {
        return repairMapper.getRepairTotal(map);
    }

    public void deleteRepair(Integer[] position) {
        repairMapper.deleteRepair(position);
    }

    public Repair getOneRepair(int repairNum) {
        return repairMapper.getOneRepair(repairNum);
    }

    public void updateRepair(Repair repair) {
        repairMapper.updateRepair(repair);
    }

    public List<Repair> searchRepair(Map<String, Object> map) {
        return repairMapper.searchRepair(map);
    }

    public long getRepairSearchAll(Map<String, Object> map) {
        return repairMapper.getRepairSearchAll(map);
    }

    public void addRepair(Repair repair) {
        repairMapper.addRepair(repair);
    }

    public List<Repair> getRepairByNum(int studentNum) {
        return repairMapper.getRepairByNum(studentNum);
    }
}
