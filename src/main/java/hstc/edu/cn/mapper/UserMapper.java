package hstc.edu.cn.mapper;

import hstc.edu.cn.po.DormAdmin;
import hstc.edu.cn.po.RegisterCode;
import hstc.edu.cn.po.Student;

/**
 * Created by win8 on 2017/5/15.
 */
public interface UserMapper {
    public DormAdmin getDormAdminByNum(DormAdmin dormAdmin);

    public DormAdmin getDormAdminByName(DormAdmin dormAdmin);
    public DormAdmin getDormAdminByPhone(DormAdmin dormAdmin);
    public Student getStudentByNum(Student student);
    public void addDormAdmin(DormAdmin dormAdmin);
//    获取注册码
    public RegisterCode getRegisterCode();
//    修改个人信息
    public void modifyDormAdmin(DormAdmin dormAdmin);
//    获取管理员信息通过id
    public DormAdmin getDormAdminById(int dormadminId);
//    修改用户头像
    public void modifyAdminImage(DormAdmin dormAdmin);
}
