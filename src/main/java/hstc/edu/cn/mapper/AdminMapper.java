package hstc.edu.cn.mapper;

import hstc.edu.cn.po.DormAdmin;

import java.util.List;

/**
 * Created by win8 on 2017/6/8.
 */
public interface AdminMapper {
//    获取所有管理员信息，超管除外
    public List<DormAdmin> getAllAdmin();
//    获取未分配的管理员信息
    public List<DormAdmin> getNoStaAdmin();
//    获取要进行操作的管理员
    public DormAdmin getOneAdmin(int dormadminId);
//    更新，分配
    public void modifyAdmin(DormAdmin dormAdmin);
//    删除
    public void deleteAdmin(int dormadminId);
//  获取信息通过员工号
    public DormAdmin getAdminByNum(String dormadminNum);

//    注册码生成
    public void updateCode(String code);
}
