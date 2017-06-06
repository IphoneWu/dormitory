package hstc.edu.cn.service;

import hstc.edu.cn.po.Area;
import hstc.edu.cn.po.Bed;
import hstc.edu.cn.po.Build;
import hstc.edu.cn.po.Dorm;

import java.util.List;
import java.util.Map;

/**
 * Created by win8 on 2017/6/4.
 */
public interface CommonService {
    public void modifyBedStatus(Map<String,Object> map);
    public List<Bed> getBedByStatus(int dormNum);
    public List<Area> getAllArea();
    public List<Build> getBuildByareaNum(int areaNum);
    public List<Dorm>  getDormBybuildNum(int buildNum);
}
