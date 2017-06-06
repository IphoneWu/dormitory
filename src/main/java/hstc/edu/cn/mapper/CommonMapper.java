package hstc.edu.cn.mapper;

import hstc.edu.cn.po.Area;
import hstc.edu.cn.po.Bed;
import hstc.edu.cn.po.Build;
import hstc.edu.cn.po.Dorm;

import java.util.List;
import java.util.Map;

/**
 * Created by win8 on 2017/6/4.
 */
public interface CommonMapper {
//用于删除学生的住宿信息,通过修改bed 的 bedstatus
    public void modifyBedStatus(Map<String,Object> map);
//    获取可用床位
    public List<Bed> getBedByStatus(int dormNum);
    public List<Area> getAllArea();
    public List<Build> getBuildByareaNum(int areaNum);
    public List<Dorm>  getDormBybuildNum(int buildNum);
//    以上用于修改学生住宿信息模块



}
