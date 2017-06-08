package hstc.edu.cn.service.Impl;

import hstc.edu.cn.mapper.CommonMapper;
import hstc.edu.cn.po.Area;
import hstc.edu.cn.po.Bed;
import hstc.edu.cn.po.Build;
import hstc.edu.cn.po.Dorm;
import hstc.edu.cn.service.CommonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by win8 on 2017/6/4.
 */
@Service("commonService")
public class CommonServiceImpl implements CommonService {
    @Autowired
    CommonMapper commonMapper;
    public void modifyBedStatus(Map<String, Object> map) {
        commonMapper.modifyBedStatus(map);
    }

    public List<Bed> getBedByStatus(int dormNum) {
        return commonMapper.getBedByStatus(dormNum);
    }

    public List<Area> getAllArea() {
        return commonMapper.getAllArea();
    }

    public List<Build> getBuildByareaNum(int areaNum) {
        return commonMapper.getBuildByareaNum(areaNum);
    }

    public List<Dorm> getDormBybuildNum(int buildNum) {
        return commonMapper.getDormBybuildNum(buildNum);
    }

    public List<Build> getBuildStatus(int areaNum) {
        return commonMapper.getBuildStatus(areaNum);
    }

    public void modifyBuildStatus(Build build) {
        commonMapper.modifyBuildStatus(build);
    }

    public Build getAdminBuild(Build build) {
        return commonMapper.getAdminBuild(build);
    }

    public Area getAdminArea(Area area) {
        return commonMapper.getAdminArea(area);
    }


}
