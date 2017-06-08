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
}
