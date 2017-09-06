package hstc.edu.cn.controller;

import hstc.edu.cn.po.*;
import hstc.edu.cn.realm.UsernamePasswordUsertypeToken;
import hstc.edu.cn.service.CommonService;
import hstc.edu.cn.service.RepairService;
import hstc.edu.cn.service.SituationService;
import hstc.edu.cn.service.UserService;
import hstc.edu.cn.util.CompressTools;
import hstc.edu.cn.util.CryptographyUtil;
import hstc.edu.cn.util.FileTools;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.Iterator;
import java.util.List;


/**
 * Created by win8 on 2017/5/15.
 */
@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private SituationService situationService;
    @Autowired
    private RepairService repairService;
    @Autowired
    private CommonService commonService;

    @RequestMapping("/studentLogin")
    @ResponseBody
    public ResponseObj studentLogin(Student student, Model model, HttpSession httpSession){
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordUsertypeToken token = new UsernamePasswordUsertypeToken(String.valueOf(student.getStudentNum()),student.getStudentName(),"student");
        String userName=student.getStudentName();
        ResponseObj responseObj = new ResponseObj();
        try{
            subject.login(token);
            httpSession.setAttribute("userName",userName);
            responseObj.setCode(ResponseObj.OK);
            return responseObj;
        }catch (AuthenticationException e){
            e.printStackTrace();
            responseObj.setCode(ResponseObj.FAILED);
            responseObj.setMsg(ResponseObj.FAILED_STR);
            return responseObj;
        }

    }
    @RequestMapping("/stulogout")
    public String logout() throws Exception {
        SecurityUtils.getSubject().logout();
        return "redirect:/index.jsp";
    }

    @RequestMapping("/adminLogin")
    @ResponseBody
    public ResponseObj adminLogin(DormAdmin dormAdmin,Model model,HttpSession httpSession){
        Subject subject = SecurityUtils.getSubject();
        String newPassword = CryptographyUtil.md5(dormAdmin.getDormadminPassword(),"javacoder");

        UsernamePasswordUsertypeToken token = new UsernamePasswordUsertypeToken(dormAdmin.getDormadminNum(),newPassword,"dormAdmin");

        ResponseObj responseObj = new ResponseObj();

//        String userName=dormAdmin.getDormadminName();
        try{
            subject.login(token);
//            httpSession.setAttribute("userName",userName);
            responseObj.setCode(ResponseObj.OK);
            responseObj.setMsg(ResponseObj.OK_STR);
            return responseObj;
        }catch (AuthenticationException e){
            e.printStackTrace();
            responseObj.setCode(ResponseObj.FAILED);
            responseObj.setMsg(ResponseObj.FAILED_STR);
//            model.addAttribute("errorInfo","用户或者密码错误！");
            return responseObj;

        }

    }
    @RequestMapping("/adminLogout")
    public String adminlogout() throws Exception {
        SecurityUtils.getSubject().logout();
        return "redirect:/index.jsp";
    }

    @RequestMapping("/checkDormAdminName")
    @ResponseBody
    public ResponseObj checkDormAdminName(String dormadminName) {
        ResponseObj responseObj = new ResponseObj();
        DormAdmin dormAdmin = new DormAdmin();
        dormAdmin.setDormadminName(dormadminName);
        if (userService.getDormAdminByName(dormAdmin) != null) {
            responseObj.setCode(ResponseObj.FAILED);
            responseObj.setMsg("该用户已经被注册！");
        }else {
            responseObj.setCode(ResponseObj.OK);
        }
        return responseObj;
    }

    @RequestMapping("/checkDormAdminPhone")
    @ResponseBody
    public ResponseObj checkDormAdminPhone(String dormadminPhone) {
        ResponseObj responseObj = new ResponseObj();
        DormAdmin dormAdmin = new DormAdmin();
        dormAdmin.setDormadminPhone(dormadminPhone);
        if (userService.getDormAdminByPhone(dormAdmin) != null) {
            responseObj.setCode(ResponseObj.FAILED);
            responseObj.setMsg("该手机已经被注册！");
        }else {
            responseObj.setCode(ResponseObj.OK);
        }
        return responseObj;
    }


    @RequestMapping("/saveDormAdmin")
    @ResponseBody
    public ResponseObj saveDormAdmin(DormAdmin dormAdmin, Model model,String code){
        dormAdmin.setDormadminPassword(CryptographyUtil.md5(dormAdmin.getDormadminPassword(), "javacoder"));
        ResponseObj responseObj = new ResponseObj();
        String registerCode = (userService.getRegisterCode().getCode());
        if (userService.getDormAdminByName(dormAdmin) != null) {
            responseObj.setCode(ResponseObj.FAILED);
        }else if (userService.getDormAdminByPhone(dormAdmin) != null) {
            responseObj.setCode(ResponseObj.FAILED);
        }else if(!(registerCode.equals(code))){
            responseObj.setCode(ResponseObj.EMPUTY);
        } else{
            userService.addDormAdmin(dormAdmin);
            responseObj.setCode(ResponseObj.OK);
            responseObj.setMsg("注册成功！恭喜成为本站会员！");
        }
        return responseObj;
    }

    @RequestMapping("/getModifyProfitById")
    public String getModifyDormAdminById(Model model,int dormadminId){
        DormAdmin dormAdmin = userService.getDormAdminById(dormadminId);
        model.addAttribute("dormAdmin",dormAdmin);
        return "/admin/ModifyProfit";
    }

    @RequestMapping("/modifyProfit")
    @ResponseBody
    public ResponseObj modifyDormAdmin(DormAdmin dormAdmin,Model model){
        ResponseObj responseObj = new ResponseObj();
        dormAdmin.setDormadminPassword(CryptographyUtil.md5(dormAdmin.getDormadminPassword(), "javacoder"));
        userService.modifyDormAdmin(dormAdmin);
        responseObj.setCode(ResponseObj.OK);
        return responseObj;
    }

    @ResponseBody
    @RequestMapping(value = "/file/portrait", method = {RequestMethod.POST})
    public ResponseObj upload(HttpServletRequest request,HttpSession session) throws Exception {
        Integer x = Integer.parseInt(request.getParameter("x"));
        Integer y = Integer.parseInt(request.getParameter("y"));
        Integer w = Integer.parseInt(request.getParameter("w"));
        Integer h = Integer.parseInt(request.getParameter("h"));
        String scaleWidthString =request.getParameter("sw");
        int swIndex = scaleWidthString.indexOf("px");
        Integer sw = Integer.parseInt(scaleWidthString.substring(0, swIndex));
        String scaleHeightString =request.getParameter("sh");
        int shIndex = scaleHeightString.indexOf("px");
        Integer sh = Integer.parseInt(scaleHeightString.substring(0, shIndex));


        ResponseObj responseObj = new ResponseObj();
        DormAdmin dormAdmin = (DormAdmin) session.getAttribute("dormAdmin");
        //获取文件路径
        String webRootPath = request.getServletContext().getRealPath("/static/upload/userImage/");
        String filePath = FileTools.getPortraitPath(dormAdmin.getDormadminId(),webRootPath);

        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
                request.getSession().getServletContext());

        String path;
        //检查form中是否有enctype="multipart/form-data撒大苏打"
        if (multipartResolver.isMultipart(request)) {
            //将request变成多部分request
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
            //获取multiRequest 中所有的文件名
            Iterator iterator = multiRequest.getFileNames();
            while (iterator.hasNext()) {
                //一次遍历所有文件
                MultipartFile multipartFile = multiRequest.getFile(iterator.next().toString());
                if (multipartFile != null) {
                    String[] allowSuffix = {".jpg",".JPG"};
                    if (!FileTools.checkSuffix(multipartFile.getOriginalFilename(), allowSuffix)) {
                        throw new Exception("文件后缀名不符合要求！");
                    }

                    path = filePath + FileTools.getPortraitFileName(multipartFile.getOriginalFilename());
                    if(dormAdmin.getDormadminImage()!=null){
                        File file = new File(path);
                        file.delete();
                    }
                    //存入硬盘
                    multipartFile.transferTo(new File(path));
                    String saveUrl = "/static/upload/userImage/img/portrait/"+dormAdmin.getDormadminId()+"/"+FileTools.getPortraitFileName(multipartFile.getOriginalFilename());
                    dormAdmin.setDormadminImage(saveUrl);
                    //图片截取
                    if (FileTools.imgCut(path, x, y, w, h, sw, sh)) {
                        CompressTools compressTools = new CompressTools();
                        if (compressTools.simpleCompress(new File(path))) {
//                           responseObj.setMsg(FileTools.filePathToSRC(path, FileTools.IMG));
                            userService.modifyAdminImage(dormAdmin);
                            responseObj.setMsg("图片上传成功！");
                           return responseObj;
                        } else {
                            responseObj.setMsg("图片压缩失败！请重新上传！");
                            return responseObj;
                        }
                    } else {
                         responseObj.setMsg("图片截取失败！请重新上传！");
                         return responseObj;
                    }
                }
            }
        }
        responseObj.setMsg("图片获取失败！请重新上传！");
        return responseObj;
    }

    @RequestMapping("/user/addSit")
    @ResponseBody
    public ResponseObj addSit(Situation situation){
        ResponseObj responseObj = new ResponseObj();
        situationService.addSituation(situation);
        responseObj.setCode(ResponseObj.OK);
        return responseObj;
    }
    @RequestMapping("/user/getSitByNum")
    @ResponseBody
    public ResponseList getSitByNum(int studentNum,Model model){
        List<Situation> situationList = situationService.getSituationByNum(studentNum);
        ResponseList responseList = new ResponseList();
        responseList.setData(situationList);
        return responseList;

    }
    @RequestMapping("/user/getOneSit")
    public String getOneSit(int situationId,Model model){
        Situation situation = situationService.getOneSituation(situationId);
        model.addAttribute("situation",situation);
        return "/user/CheckSit";
    }

    @RequestMapping("/user/changeSit")
    @ResponseBody
    public ResponseObj changeSit(Situation situation){
        ResponseObj responseObj = new ResponseObj();
        situation.setEventStatus(3);
        situationService.updateSituation(situation);
        responseObj.setCode(ResponseObj.OK);
        return responseObj;
    }


    @RequestMapping("/user/addRepair")
    @ResponseBody
    public ResponseObj addRepair(Repair repair){
        ResponseObj responseObj = new ResponseObj();
        repairService.addRepair(repair);
        responseObj.setCode(ResponseObj.OK);
        return responseObj;
    }

    @RequestMapping("/user/getRepairByNum")
    @ResponseBody
    public ResponseList getRepair(int studentNum,Model model){
        List<Repair> repairList = repairService.getRepairByNum(studentNum);
        ResponseList responseList = new ResponseList();
        responseList.setData(repairList);
        responseList.setCode(ResponseList.OK);
        return responseList;
    }

    @RequestMapping("/user/getOneRepair")
    public String getOneRepair(int repairNum,Model model){
        Repair repair = repairService.getOneRepair(repairNum);
        model.addAttribute("repair",repair);
        return "/user/CheckRepair";
    }

}
