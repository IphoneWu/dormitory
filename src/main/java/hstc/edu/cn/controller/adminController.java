package hstc.edu.cn.controller;

import hstc.edu.cn.po.*;
import hstc.edu.cn.service.AdminService;
import hstc.edu.cn.service.CommonService;
import hstc.edu.cn.util.RegisterCodeUtil;
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
 * Created by win8 on 2017/6/8.
 */
@Controller
@RequestMapping("/admin")
public class adminController {
    @Autowired
    private AdminService adminService;
    @Autowired
    private CommonService commonService;

    @RequestMapping("/getAllAdmin")
    @ResponseBody
    public ResponseList getAllAdmin(){
        ResponseList responseList = new ResponseList();
        responseList.setData(adminService.getAllAdmin());
        responseList.setCode(ResponseList.OK);
        return responseList;
    }

    @RequestMapping("/getNoStaAdmin")
    @ResponseBody
    public ResponseList getNoStaAdmin(){
        ResponseList responseList = new ResponseList();
        responseList.setData(adminService.getNoStaAdmin());
        responseList.setCode(ResponseList.OK);
        return responseList;
    }
    @RequestMapping("/getModifyAdmin")
    public String getModifyAdmin(Model model,int dormadminId){
        DormAdmin dormAdmin = adminService.getOneAdmin(dormadminId);
        model.addAttribute("dormAdmin",dormAdmin);
        return "/admin/ModifyAdmin";
    }

    @RequestMapping("/getBuildStatus")
    @ResponseBody
    public ResponseList getBedByStatus(int areaNum){
        List<Build> buildList = commonService.getBuildStatus(areaNum);
        ResponseList responseList = new ResponseList();
        responseList.setData(buildList);
        return responseList;
    }

    @RequestMapping("/modifyAdmin")
    @ResponseBody
    public ResponseObj modifyAdmin(DormAdmin dormAdmin,Area area,Build build,String Num){ResponseObj responseObj = new ResponseObj();


        build = commonService.getAdminBuild(build);
        area = commonService.getAdminArea(area);
        dormAdmin.setAdminAddrezz(area.getAreaName()+" "+build.getBuildName());

        if(dormAdmin.getDormadminNum()!=null&&dormAdmin.getAdminAddrezz()!=null){
            build.setBuildStatus(1);
            dormAdmin.setAdminType(2);
        }

        if ((adminService.getAdminByNum(dormAdmin.getDormadminNum()))==null||Num.equals(dormAdmin.getDormadminNum())){

            commonService.modifyBuildStatus(build);
            adminService.modifyAdmin(dormAdmin);
            responseObj.setCode(ResponseObj.OK);
        }else {
            responseObj.setCode(ResponseObj.FAILED);
            responseObj.setMsg("没按照要求填写信息");
        }
        return  responseObj;

    }
    @RequestMapping("/checkAdminNum")
    @ResponseBody
    public ResponseObj checkAdminNum(String dormadminNum){
        ResponseObj responseObj = new ResponseObj();
        DormAdmin dormAdmin = adminService.getAdminByNum(dormadminNum);
        if(dormAdmin==null){
            responseObj.setCode(ResponseObj.OK);
        }else {
            responseObj.setCode(ResponseObj.FAILED);
            responseObj.setMsg("该工号已经被分配");
        }
        return responseObj;
    }
    @RequestMapping("/deleteAdmin")
    @ResponseBody
    public ResponseObj deleteAdmin(int dormadminId){
        ResponseObj responseObj = new ResponseObj();
        adminService.deleteAdmin(dormadminId);
        responseObj.setCode(ResponseObj.OK);
        return responseObj;
    }
    @RequestMapping("/makeCode")
    @ResponseBody
    public ResponseObj makeCode(){
        ResponseObj responseObj = new ResponseObj();
        String code = RegisterCodeUtil.RegisterCode();
        RegisterCode registerCode = new RegisterCode();
        registerCode.setCode(code);
        adminService.updateCode(code);
        responseObj.setData(registerCode);
        return  responseObj;
    }
}
