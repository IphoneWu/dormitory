package hstc.edu.cn.controller;

import hstc.edu.cn.po.PageBean;
import hstc.edu.cn.po.Repair;
import hstc.edu.cn.po.ResponseList;
import hstc.edu.cn.service.RepairService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by win8 on 2017/6/8.
 */
@Controller
@RequestMapping("/admin/repair")
public class RepairController {
    @Autowired
    private RepairService repairService;

    /**
     * 这个未审核的报修
     * @param page
     * @return
     */
    @RequestMapping("/getRepairList")
    @ResponseBody
    public ResponseList getRepairNoneList(@RequestParam(value="page", required=false)String page,int repairStatus){
        PageBean pageBean = new PageBean(Integer.parseInt(page),10);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("start",pageBean.getStart());
        map.put("pageSize",pageBean.getPageSize());
        map.put("repairStatus",repairStatus);

        List<Repair> repairList = repairService.getRepair(map);
        long total = repairService.getRepairTotal(map);
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
        responseList.setData(repairList);
        return responseList;
    }
}
