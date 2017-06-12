package hstc.edu.cn.controller;

import hstc.edu.cn.po.*;
import hstc.edu.cn.service.LinkService;
import hstc.edu.cn.service.ReportService;
import hstc.edu.cn.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by win8 on 2017/6/11.
 */

/**
 * 前台控制器
 */
@Controller
public class IndexController {
    @Autowired
    private ReportService reportService;
    @Autowired
    private LinkService linkService;

    @RequestMapping("/IndexreportList")
    @ResponseBody
    public ResponseList IndexreportList(HttpServletRequest request, HttpSession session,
                                   @RequestParam(value="page", required=false)String page){

        PageBean pageBean = new PageBean(Integer.parseInt(page),5);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("start",pageBean.getStart());
        map.put("pageSize",pageBean.getPageSize());


        List<Report> reportList = reportService.getAllReport(map);
        long total = reportService.getReportTotal(map);
        int pageAmount = 1;
        if (total>=5){
            if(total%5!=0) {
                pageAmount = (Integer.parseInt(String.valueOf(total))/5)+1;
            }else {
                pageAmount = Integer.parseInt(String.valueOf(total))/5;
            }
        }
        ResponseList responseList = new ResponseList();
        responseList.setPageAmount(pageAmount);
        responseList.setTotalNum(total);
        responseList.setPageNum(Integer.parseInt(page));
        responseList.setData(reportList);

        return responseList;
    }

    @RequestMapping("/ReadReport")
    @ResponseBody
    public ResponseObj ReadReport(int reportId){
        ResponseObj responseObj = new ResponseObj();
        responseObj.setData(reportService.getModifyReport(reportId));
        return responseObj;
    }

    @RequestMapping("/reportSearch")
    @ResponseBody
    public ResponseList reportSearch(@RequestParam(value="page", required=false)String page,String reportSearch){
        PageBean pageBean = new PageBean(Integer.parseInt(page),5);
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("reportSearch", StringUtil.formatLike(reportSearch));
        map.put("start",pageBean.getStart());
        map.put("pageSize",pageBean.getPageSize());

        List<Report> reportList = reportService.searchReport(map);
        long total = reportService.getReportSearchAll(map);
        int pageAmount = 1;
        if (total>=5){
            if(total%5!=0) {
                pageAmount = (Integer.parseInt(String.valueOf(total))/5)+1;
            }else {
                pageAmount = Integer.parseInt(String.valueOf(total))/5;
            }
        }
        ResponseList responseList = new ResponseList();
        responseList.setPageAmount(pageAmount);
        responseList.setTotalNum(total);
        responseList.setPageNum(Integer.parseInt(page));
        responseList.setData(reportList);

        return responseList;
    }

    @RequestMapping("/getIndexLink")
    @ResponseBody
    public ResponseList getIndexLink(){
        ResponseList responseList = new ResponseList();
        Map<String, Object> map = new HashMap<String, Object>();
        responseList.setData(linkService.getLink(map));
        responseList.setCode(ResponseList.OK);
        return responseList;
    }
}
