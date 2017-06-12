package hstc.edu.cn.controller;

import hstc.edu.cn.po.Link;
import hstc.edu.cn.po.ResponseList;
import hstc.edu.cn.po.ResponseObj;
import hstc.edu.cn.service.LinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by win8 on 2017/6/12.
 */
@Controller
@RequestMapping("/admin/link")
public class LinkController {
    @Autowired
    private LinkService linkService;

    @RequestMapping("/getAllLink")
    @ResponseBody
    public ResponseList getAllLink(){
        ResponseList responseList = new ResponseList();
        Map<String, Object> map = new HashMap<String, Object>();
        responseList.setData(linkService.getLink(map));
        responseList.setCode(ResponseList.OK);
        return responseList;
    }

    @RequestMapping("/getModifyLink")
    public String getLink(Model model,int linkId){
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("linkId",linkId);
        Link link = linkService.getLink(map).get(0);
        model.addAttribute("link",link);
        return "/admin/ModifyLink";
    }

    @RequestMapping("/updateLink")
    @ResponseBody
    public ResponseObj updateLink(Link link){
        ResponseObj responseObj = new ResponseObj();
        linkService.updateLink(link);
        responseObj.setCode(ResponseObj.OK);
        return responseObj;
    }

    @RequestMapping("/addLink")
    @ResponseBody
    public ResponseObj addLink(Link link){
        ResponseObj responseObj = new ResponseObj();
        linkService.addLink(link);
        responseObj.setCode(ResponseObj.OK);
        return responseObj;
    }

    @RequestMapping("/deleteLink")
    @ResponseBody
    public ResponseObj deleteLink(int linkId){
        ResponseObj responseObj = new ResponseObj();
        linkService.deleteLink(linkId);
        responseObj.setCode(ResponseObj.OK);
        return responseObj;
    }
}
