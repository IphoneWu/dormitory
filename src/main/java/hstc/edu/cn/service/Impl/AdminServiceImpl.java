package hstc.edu.cn.service.Impl;

import hstc.edu.cn.mapper.AdminMapper;
import hstc.edu.cn.po.DormAdmin;
import hstc.edu.cn.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by win8 on 2017/6/8.
 */
@Service("adminService")
public class AdminServiceImpl implements AdminService {
    @Autowired
    AdminMapper adminMapper;
    public List<DormAdmin> getAllAdmin() {
        return adminMapper.getAllAdmin() ;
    }

    public List<DormAdmin> getNoStaAdmin() {
        return adminMapper.getNoStaAdmin();
    }

    public DormAdmin getOneAdmin(int dormadminId) {
        return adminMapper.getOneAdmin(dormadminId);
    }

    public void modifyAdmin(DormAdmin dormAdmin) {
        adminMapper.modifyAdmin(dormAdmin);
    }

    public void deleteAdmin(int dormadminId) {
        adminMapper.deleteAdmin(dormadminId);
    }

    public DormAdmin getAdminByNum(String dormadminNum) {
        return adminMapper.getAdminByNum(dormadminNum);
    }

    public void updateCode(String code) {
        adminMapper.updateCode(code);
    }
}
