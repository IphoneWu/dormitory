package hstc.edu.cn.service.Impl;

import hstc.edu.cn.mapper.SituationMapper;
import hstc.edu.cn.po.Situation;
import hstc.edu.cn.service.SituationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by win8 on 2017/6/12.
 */
@Service("/situationService")
public class SituationServiceImpl implements SituationService {
    @Autowired
    SituationMapper situationMapper;
    public List<Situation> getSituation(Map<String, Object> map) {
        return situationMapper.getSituation(map);
    }

    public long getSituationTotal(Map<String, Object> map) {
        return situationMapper.getSituationTotal(map);
    }

    public void deleteSituation(Integer[] position) {
        situationMapper.deleteSituation(position);
    }

    public Situation getOneSituation(int situationId) {
        return situationMapper.getOneSituation(situationId);
    }

    public void updateSituation(Situation situation) {
        situationMapper.updateSituation(situation);
    }

    public List<Situation> searchSituation(Map<String, Object> map) {
        return situationMapper.searchSituation(map);
    }

    public long getSituationSearchAll(Map<String, Object> map) {
        return situationMapper.getSituationSearchAll(map);
    }

    public void addSituation(Situation situation) {
        situationMapper.addSituation(situation);
    }

    public List<Situation> getSituationByNum(int studentNum) {
        return situationMapper.getSituationByNum(studentNum);
    }
}
