package hstc.edu.cn.controller;

import hstc.edu.cn.po.PageBean;
import hstc.edu.cn.po.ResponseList;
import hstc.edu.cn.po.ResponseObj;
import hstc.edu.cn.po.Situation;
import hstc.edu.cn.service.SituationService;
import hstc.edu.cn.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by win8 on 2017/6/11.
 */
@Controller
@RequestMapping("/admin/situation")
public class SituationController {
    @Autowired
    private SituationService situationService;


    @RequestMapping("/getSitList")
    @ResponseBody
    public ResponseList getSitList(@RequestParam(value="page", required=false)String page, int eventStatus){
        PageBean pageBean = new PageBean(Integer.parseInt(page),10);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("start",pageBean.getStart());
        map.put("pageSize",pageBean.getPageSize());
        map.put("eventStatus",eventStatus);

        List<Situation> situationList = situationService.getSituation(map);
        long total = situationService.getSituationTotal(map);
        int pageAmount = 1;
        if (total>=10){
            if(total%10!=0) {
                pageAmount = (Integer.parseInt(String.valueOf(total))/10)+1;
            }else {
                pageAmount = Integer.parseInt(String.valueOf(total))/10;
            }
        }
        ResponseList responseList = new ResponseList();
        responseList.setPageAmount(pageAmount);
        responseList.setTotalNum(total);
        responseList.setPageNum(Integer.parseInt(page));
        responseList.setData(situationList);
        return responseList;
    }

    @RequestMapping("/deleteSit")
    @ResponseBody
    public ResponseObj deleteSit(Integer[] position){
        ResponseObj responseObj = new ResponseObj();
        situationService.deleteSituation(position);
        responseObj.setCode(ResponseObj.OK);
        return responseObj;
    }

    @RequestMapping("/sitSearch")
    @ResponseBody
    public ResponseList sitSearch(@RequestParam(value="page", required=false)String page,String sitSearch,int eventStatus){
        PageBean pageBean = new PageBean(Integer.parseInt(page),10);
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("sitSearch", StringUtil.formatLike(sitSearch));
        map.put("start",pageBean.getStart());
        map.put("pageSize",pageBean.getPageSize());
        map.put("eventStatus",eventStatus);

        List<Situation> situationList = situationService.searchSituation(map);
        long total = situationService.getSituationSearchAll(map);
        int pageAmount = 1;
        if (total>=10){
            if(total%10!=0) {
                pageAmount = (Integer.parseInt(String.valueOf(total))/10)+1;
            }else {
                pageAmount = Integer.parseInt(String.valueOf(total))/10;
            }
        }
        ResponseList responseList = new ResponseList();
        responseList.setPageAmount(pageAmount);
        responseList.setTotalNum(total);
        responseList.setPageNum(Integer.parseInt(page));
        responseList.setData(situationList);

        return responseList;
    }

    @RequestMapping("/getSit")
    public String getSit(Model model, int situationId){
        Situation situation = situationService.getOneSituation(situationId);
        model.addAttribute("situation",situation);
        return "/admin/CheckSit";
    }

    @RequestMapping("/updateSit")
    @ResponseBody
    public ResponseObj updateSit(int eventStatus,int situationId){
        ResponseObj responseObj = new ResponseObj();
        Situation situation = new Situation();
        situation.setEventStatus(eventStatus);
        situation.setSituationId(situationId);
        situationService.updateSituation(situation);
        responseObj.setCode(ResponseObj.OK);
        return responseObj;
    }
    @RequestMapping("/readSit")
    public String readSit(Model model,int situationId){
        Situation situation = situationService.getOneSituation(situationId);
        model.addAttribute("situation",situation);
        return "/admin/ReadSit";
    }
}
