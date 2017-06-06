package hstc.edu.cn.controller;

import hstc.edu.cn.po.*;
import hstc.edu.cn.realm.UsernamePasswordUsertypeToken;
import hstc.edu.cn.service.UserService;
import hstc.edu.cn.util.CryptographyUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;


/**
 * Created by win8 on 2017/5/15.
 */
@Controller
public class UserController {
    @Autowired
    private UserService userService;

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
    public ResponseObj saveDormAdmin(DormAdmin dormAdmin, Model model){
        dormAdmin.setDormadminPassword(CryptographyUtil.md5(dormAdmin.getDormadminPassword(), "javacoder"));
        ResponseObj responseObj = new ResponseObj();
        if (userService.getDormAdminByName(dormAdmin) != null) {
            responseObj.setCode(ResponseObj.FAILED);
        }else if (userService.getDormAdminByPhone(dormAdmin) != null) {
            responseObj.setCode(ResponseObj.FAILED);
        }else{
            userService.addDormAdmin(dormAdmin);
            responseObj.setCode(ResponseObj.OK);
            responseObj.setMsg("注册成功！恭喜成为本站会员！");
        }
        return responseObj;
    }
}
