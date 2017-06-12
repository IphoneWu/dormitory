package hstc.edu.cn.service;

import hstc.edu.cn.po.Link;

import java.util.List;
import java.util.Map;

/**
 * Created by win8 on 2017/6/12.
 */
public interface LinkService {
    public List<Link> getLink(Map<String,Object> map);
    public void addLink(Link link);
    public void updateLink(Link link);
    public void deleteLink(int linkId);
}
