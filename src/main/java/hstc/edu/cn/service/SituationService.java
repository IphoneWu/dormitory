package hstc.edu.cn.service;

import hstc.edu.cn.po.Situation;

import java.util.List;
import java.util.Map;

/**
 * Created by win8 on 2017/6/12.
 */
public interface SituationService{
    //    获取请假的信息
    public List<Situation> getSituation(Map<String,Object> map);
    //    获取请假信息的总条数
    public long getSituationTotal(Map<String,Object> map);
    //    批量删除
    public void deleteSituation(Integer[] position);
    //    获取单个请假信息
    public Situation getOneSituation(int situationId);
    //    更新请假状态，0为未审批，1为通过，-1为不通过
    public void updateSituation(Situation situation);
    //     搜索请假信息
    public List<Situation> searchSituation(Map<String,Object> map);
    //    搜索信息的总条数
    public long getSituationSearchAll(Map<String,Object> map);
    //    前台插入请假
    public void addSituation(Situation situation);
    //    获取请假信息
    public List<Situation> getSituationByNum(int studentNum);
}
