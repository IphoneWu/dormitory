package hstc.edu.cn.controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import hstc.edu.cn.po.*;
import hstc.edu.cn.service.CommonService;
import hstc.edu.cn.service.ReportService;
import hstc.edu.cn.service.StudentService;
import hstc.edu.cn.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * Created by win8 on 2017/6/1.
 */
@Controller
@RequestMapping("/admin")
public class StudentController {
    @Autowired
    private StudentService studentService;
    @Autowired
    private CommonService commonService;
    @Autowired
    private ReportService reportService;

    @RequestMapping("/studentList")
    @ResponseBody
    public ResponseList studentList(@RequestParam(value="page", required=false)String page){

        PageBean pageBean = new PageBean(Integer.parseInt(page),10);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("start",pageBean.getStart());
        map.put("pageSize",pageBean.getPageSize());

        List<Student> studentList = studentService.getStudent(map);
        long total = studentService.getStuTotal(map);
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
        responseList.setData(studentList);

        return responseList;
    }
    @RequestMapping("/stuSearch")
    @ResponseBody
    public ResponseList stuSearch(@RequestParam(value="page", required=false)String page,String stuSearch){
        PageBean pageBean = new PageBean(Integer.parseInt(page),10);
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("stuSearch", StringUtil.formatLike(stuSearch));
        map.put("start",pageBean.getStart());
        map.put("pageSize",pageBean.getPageSize());

        List<Student> studentList = studentService.searchStu(map);
        long total = studentService.getStuSearchAll(map);
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
        responseList.setData(studentList);

        return responseList;
    }

    @RequestMapping("/deleteStu")
    @ResponseBody
    public ResponseObj deleteStu(Integer[] position ){
        ResponseObj responseObj = new ResponseObj();
        Student student = new Student();
        Map<String, Object> map = new HashMap<String, Object>();
        for(int i=0;i<position.length;i++){
            student = studentService.getModifyStu(position[i]);

            map.put("areaNum", student.getAreaNum());
            map.put("buildNum",student.getBuildNum());
            map.put("dormNum",student.getDormNum());
            map.put("bedNum",student.getBedNum());
            map.put("bedStatus",0);
            commonService.modifyBedStatus(map);
        }
        studentService.deleteStu(position);
        responseObj.setCode(ResponseObj.OK);
        return responseObj;
    }

    @RequestMapping("/getModifyStu")
    public String getStu(Model model,int studentNum){
        Student student = studentService.getModifyStu(studentNum);
        //清除床位使用状态，bedStatus=0
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("areaNum", student.getAreaNum());
        map.put("buildNum",student.getBuildNum());
        map.put("dormNum",student.getDormNum());
        map.put("bedNum",student.getBedNum());
        map.put("bedStatus",0);
        commonService.modifyBedStatus(map);

        model.addAttribute("student",student);
        return "/admin/ModifyStu";
    }

    /**
     * 获取可用的床位，即是bedStatus=0
     * @return bedList
     */
//    @RequestMapping("/getBedByStatus")
//    @ResponseBody
//    public Map getBedByStatus(){
//        List<Area> areaList = new ArrayList<Area>();
//        List<Build> buildList = new ArrayList<Build>();
//        List<Dorm> dormList = new ArrayList<Dorm>();
//        List<Bed> bedList = commonService.getBedByStatus();
////        for (int i=0;i<bedList.size();i++){
////            areaList.add(i,commonService.getAreaByBedStatus(bedList.get(i).getAreaNum()));
////            buildList.add(i,commonService.getBuildByBedStatus(bedList.get(i).getBuildNum()));
////            dormList.add(i,commonService.getDormByBedStatus(bedList.get(i).getDormNum(),bedList.get(i).getBuildNum()));
////        }
//        Map<String,Object> map = new HashMap<String, Object>();
//        map.put("bedList",bedList);
//        map.put("areaList",areaList);
//        map.put("buildList",buildList);
//        map.put("dormList",dormList);
//        return map;
//    }
    @RequestMapping("/getAllarea")
    @ResponseBody
    public ResponseList getAllarea(){
        List<Area> areaList = commonService.getAllArea();
        ResponseList responseList = new ResponseList();
        responseList.setData(areaList);
        return responseList;
    }

    @RequestMapping("/getBuildByareaNum")
    @ResponseBody
    public ResponseList getBuildByareaNum(int areaNum){
        List<Build> buildList = commonService.getBuildByareaNum(areaNum);
        ResponseList responseList = new ResponseList();
        responseList.setData(buildList);
        return responseList;
    }
    @RequestMapping("/getDormBybuildNum")
    @ResponseBody
    public ResponseList getDormBybuildNum(int buildNum){
        List<Dorm> dormList = commonService.getDormBybuildNum(buildNum);
        ResponseList responseList = new ResponseList();
        responseList.setData(dormList);
        return responseList;
    }
    @RequestMapping("/getBedByStatus")
    @ResponseBody
    public ResponseList getBedByStatus(int dormNum){
        List<Bed> bedList = commonService.getBedByStatus(dormNum);
        ResponseList responseList = new ResponseList();
        responseList.setData(bedList);
        return responseList;
    }

    @RequestMapping("/modifyStu")
    @ResponseBody
    public ResponseObj modifyStu(Student student){
//        修改床位使用，bedstatus=1
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("areaNum", student.getAreaNum());
        map.put("buildNum",student.getBuildNum());
        map.put("dormNum",student.getDormNum());
        map.put("bedNum",student.getBedNum());
        map.put("bedStatus",1);
        commonService.modifyBedStatus(map);

        studentService.modifyStu(student);
        ResponseObj responseObj = new ResponseObj();
        responseObj.setCode(ResponseObj.OK);
        return responseObj;
    }

    /**
     * 用于批量导入excel Student
     */
    @RequestMapping(value = "batchimport", method = RequestMethod.POST)
    @ResponseBody
    public ResponseObj batchimport(@RequestParam(value="filename") MultipartFile file,
                              HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
        ResponseObj responseObj = new ResponseObj();
        //判断文件是否为空
        if(file==null) return null;
        //获取文件名
        String name=file.getOriginalFilename();
        //进一步判断文件是否为空（即判断其大小是否为0或其名称是否为null）
        long size=file.getSize();
        if(name==null || ("").equals(name) && size==0) return null;

        String realPath = request.getServletContext().getRealPath("/static/upload/");
        File file1 = new File(realPath + new Date().getTime() + ".xlsx");
        //批量导入。参数：文件名，文件。
        boolean b = studentService.batchImport(name,file,file1);
        if(b){
            responseObj.setCode(ResponseObj.OK);
            responseObj.setMsg("批量导入EXCEL成功！");
        }else{
            responseObj.setCode(ResponseObj.FAILED);
            responseObj.setMsg("批量导入EXCEL失败！");
        }
        return responseObj;
    }

}
