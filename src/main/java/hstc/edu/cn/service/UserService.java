package hstc.edu.cn.service;

import hstc.edu.cn.po.DormAdmin;
import hstc.edu.cn.po.RegisterCode;
import hstc.edu.cn.po.Student;

/**
 * Created by win8 on 2017/5/15.
 */
public interface UserService {
    public DormAdmin getDormAdminByNum(DormAdmin dormAdmin);

    public DormAdmin getDormAdminByName(DormAdmin dormAdmin);
    public DormAdmin getDormAdminByPhone(DormAdmin dormAdmin);
    public Student getStudentByNum(Student student);
    public void addDormAdmin(DormAdmin dormAdmin);
    //    获取注册码
    public RegisterCode getRegisterCode();
}
