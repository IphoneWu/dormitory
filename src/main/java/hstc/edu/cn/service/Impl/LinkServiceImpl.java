package hstc.edu.cn.service.Impl;

import hstc.edu.cn.mapper.LinkMapper;
import hstc.edu.cn.po.Link;
import hstc.edu.cn.service.LinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by win8 on 2017/6/12.
 */
@Service("linkService")
public class LinkServiceImpl implements LinkService {
    @Autowired
    LinkMapper linkMapper;

    public List<Link> getLink(Map<String, Object> map) {
        return linkMapper.getLink(map);
    }

    public void addLink(Link link) {
        linkMapper.addLink(link);
    }

    public void updateLink(Link link) {
        linkMapper.updateLink(link);
    }

    public void deleteLink(int linkId) {
        linkMapper.deleteLink(linkId);
    }
}
