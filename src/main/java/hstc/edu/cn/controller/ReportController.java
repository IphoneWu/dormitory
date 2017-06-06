package hstc.edu.cn.controller;

import com.sun.deploy.net.HttpResponse;
import hstc.edu.cn.po.PageBean;
import hstc.edu.cn.po.Report;
import hstc.edu.cn.po.ResponseList;
import hstc.edu.cn.po.ResponseObj;
import hstc.edu.cn.service.ReportService;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import org.apache.shiro.web.session.HttpServletSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by win8 on 2017/6/5.
 */
@Controller
@RequestMapping("/admin/report")
public class ReportController {
    @Autowired
    private ReportService reportService;

    /**
     * 上传图片
    */
    @RequestMapping("/uploadImage")
    public String uploadImage(HttpServletRequest request,HttpSession httpSession ,@RequestParam("reportImage") MultipartFile file){
        //判断文件是否为空
        if(file==null) return null;
        //获取文件名
        String name=file.getOriginalFilename();
        //进一步判断文件是否为空（即判断其大小是否为0或其名称是否为null）
        long size=file.getSize();
        if(name==null || ("").equals(name) && size==0) return null;
        String realPath = request.getServletContext().getRealPath("/static/upload/image/");
        String url = realPath + new Date().getTime() + name;
        File file1 = new File(url);
        CommonsMultipartFile cf= (CommonsMultipartFile)file;
        try {
            cf.getFileItem().write(file1);
            httpSession.setAttribute("reportImage",url);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    @RequestMapping("/addReport")
    @ResponseBody
    public ResponseObj addReport(Report report,HttpServletRequest request,HttpSession session){
        ResponseObj responseObj = new ResponseObj();

        String reportImage = (String) session.getAttribute("reportImage");
        report.setReportImage(reportImage);
        reportService.addReport(report);
        responseObj.setCode(ResponseObj.OK);
        return responseObj;
    }

    @RequestMapping("/reportList")
    @ResponseBody
    public ResponseList reportList(@RequestParam(value="page", required=false)String page){

        PageBean pageBean = new PageBean(Integer.parseInt(page),10);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("start",pageBean.getStart());
        map.put("pageSize",pageBean.getPageSize());

        List<Report> reportList = reportService.getAllReport(map);
        long total = reportService.getReportTotal(map);
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
        responseList.setData(reportList);

        return responseList;
    }

}
